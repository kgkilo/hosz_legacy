VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CadminADO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'Adattagok
Public sConnectString As String
Private m_cnn As ADODB.Connection
Private m_cmdCommand As ADODB.Command
Private m_sLoginName As String  'Login név

'   Konstruktor
Private Sub Class_Initialize()
    Set m_cnn = New ADODB.Connection
    Set m_cmdCommand = New ADODB.Command
End Sub

'   Destruktor
Private Sub Class_Terminate()
    Set m_cnn = Nothing
    Set m_cmdCommand = Nothing
End Sub

Public Property Get Connect()
    Connect = m_cnn
End Property

Public Function Login(ByVal sConnect As String) As Integer
    On Error GoTo errLogin
    Login = vbOK
    
    If sConnect = "" Then
        'sConnectString = "DRIVER=" & g_oIni.IniGet("Connect", "DRIVER", "{SQL Server}")
        'sConnectString = sConnectString & ";Server=" & g_oIni.IniGet("Connect", "SQLSERVER_NAME", G_SQLSERVERNAME)
        'sConnectString = sConnectString & ";uid=" & g_sUID 'g_oLogin.Name
        'sConnectString = sConnectString & ";pwd=" & g_sPWD 'g_oLogin.Pwd
        'sConnectString = sConnectString & ";database=" & g_sDefaultDBName
        sConnectString = "DRIVER={SQL Server};Server=NTSERVER;uid=sa;pwd=;database=SZETAV"
    Else
        sConnectString = sConnect
    End If
    
    m_cnn.Open sConnectString
    Set m_cmdCommand.ActiveConnection = m_cnn
    
    'm_cmdCommand.CommandText = "SET DATEFORMAT YMD"
    'm_cmdCommand.CommandTimeout = 15
    'm_cmdCommand.CommandType = ADODB.adCmdText
    'm_cmdCommand.Execute
    
    Login = 0
    Exit Function

errLogin:
    ProcessError
End Function

Public Function Permis(ByVal sObject As String) As Byte
    'Permis = ObjPermis(sObject)
    Permis = P_READ Or P_INSERT Or P_UPDATE Or P_DELETE
End Function

Public Function ExecVal(ByVal sQry As String, ByVal lstParams As Collection, ByRef rst As ADODB.Recordset) As Boolean
    On Error GoTo errExecVal
    ExecVal = False
    
    MakeCommand sQry, lstParams
    
    Set rst = m_cmdCommand.Execute
    
    ExecVal = True
    Exit Function
    
errExecVal:
    ProcessError
End Function

Public Function Exec(ByVal sQry As String, ByVal lstParams As Collection) As Boolean
    On Error GoTo errExec
    Exec = False
    
    MakeCommand sQry, lstParams
    m_cmdCommand.Execute
    
    Exec = True
    Exit Function
    
errExec:
    ProcessError
End Function

Public Function MakeCommand(ByVal sQry As String, ByVal lstParameters As Collection) As Boolean
    On Error GoTo errMakeCommand
    MakeCommand = False
    
    Dim i As Integer    'segéd
    Dim j As Integer    'segéd
    
    i = 1   'Ha van benne "adatbázis.dbo." hivatkozás, akkor megállapítjuk, hogy meddig tart
    j = -1  'az adatbázis neve (ez lesz = j)
    Do Until i = Len(sQry) Or j >= 0
        If Mid(sQry, i, 2) = ".." Then
            j = i + 1
            Exit Do
        End If  'Mid
        i = i + 1
    Loop    'i = Len
    
    Dim cmdParamQuery As New ADODB.Command  'sp_QueryParams végrehajtásához
    Dim prmQRY As New ADODB.Parameter   'sp_QueryParams paramétere (a tárolt eljárás neve)
    Dim rstParameter As ADODB.Recordset 'sp_QueryParams kimenete
    Dim prmParam As ADODB.Parameter
    Dim varParamValue As Variant
    Dim lstCommandParams As New Collection  'átmeneti paraméter-tároló
    
    Set cmdParamQuery.ActiveConnection = m_cnn  'Rálógunk a már élõ connection-re
    
    If j = -1 Then  'Ha nincs külön megadva adatbázisnév,
        cmdParamQuery.CommandText = "sp_QueryParams"    'akkor egyszerûen lehet hívni a QueryParams eljárást.
    Else    'Ha viszont van adatbázisnév, akkor azt is elé kell tenni a QueryParamsnak.
        cmdParamQuery.CommandText = Left(sQry, j) & "sp_QueryParams"
    End If  'j = -1
    
    cmdParamQuery.CommandTimeout = 60
    cmdParamQuery.CommandType = ADODB.adCmdStoredProc
    
    prmQRY.Direction = ADODB.adParamInput   'A QueryParams egy paramétert vár, ami
    prmQRY.Value = sQry                     'a tárolt eljárás neve
    prmQRY.Type = ADODB.adBSTR
    prmQRY.Size = 92
    
    cmdParamQuery.Parameters.Append prmQRY  'Betesszük a paraméterek közé...
    
    Set rstParameter = cmdParamQuery.Execute    'Végrehajtjuk
    
    Do While Not rstParameter.EOF   'Elmegyünk a visszaadott recordset végéig
        Set prmParam = New ADODB.Parameter  'Létrehozunk egy új paramétert,
        prmParam.Direction = ADODB.adParamInput 'ami input param, tehát nem lehet benne visszaadni értéket.
                
        Select Case rstParameter.Fields(1).Value    'A paraméter típusától függõen
        Case "varchar", "text", "char", "datetime"  'más*más típust állítunk be
            prmParam.Type = ADODB.adBSTR
        Case "real"
            prmParam.Type = ADODB.adDouble
        Case Else
            prmParam.Type = ADODB.adInteger
        End Select
        
        On Error Resume Next
        ' a varParamValue-ba kerül a majd átadandó paraméter értéke
        varParamValue = Null
        varParamValue = lstParameters(Mid(rstParameter.Fields(0).Value, 2, 14))
        If varParamValue = Null Or varParamValue = "" Then  'Ha üres vagy Null,
            prmParam.Value = Null   'akkor Nullnak állítjuk be.
        Else    'Egyébként arra, ami kell.
            'If prmParam.Type = adDouble Then
            '    Dim s As String
            '    Dim o As Integer
            '    For o = 1 To Len(varParamValue)
            '        If Mid(varParamValue, o, 1) <> "," Then
            '            s = s & Mid(varParamValue, o, 1)
            '        Else
            '            s = s & "."
            '        End If
            '    Next
            'End If
            
            If rstParameter.Fields(1).Value = "datetime" Then   'datetime típusnál a paraméter hossza fixen 20 karakter,
                prmParam.Size = 20
            Else    'míg egyéb esetekben annyi, amit az SQL visszaadott.
                prmParam.Size = IIf(rstParameter.Fields(2).Value < Len(varParamValue), rstParameter.Fields(2).Value, Len(varParamValue))
            End If
            
            prmParam.Value = varParamValue
        End If
        On Error GoTo errMakeCommand
        
        lstCommandParams.Add prmParam   'Hozzáfûzzük a paraméterekhez
        Set prmParam = Nothing
        rstParameter.MoveNext   'és megyünk a következõ sorra, amit a QueryParam visszaadott.
    Loop
    
    rstParameter.Close  'Ha elértük az EOF-ot, akkor lezárjuk.
    Set cmdParamQuery = Nothing 'Ez sem kell tovább.
        
    Set m_cmdCommand = Nothing
    Set m_cmdCommand = New ADODB.Command
    Set m_cmdCommand.ActiveConnection = m_cnn 'Ezt az objektumot fogjuk majd visszaadni
    
    m_cmdCommand.CommandText = sQry   'Beállítjuk mindenféle jellemzõit
    m_cmdCommand.CommandTimeout = 60
    m_cmdCommand.CommandType = ADODB.adCmdStoredProc
    
    For Each prmParam In lstCommandParams   'és beletesszük a paraméterek sokaságát...
        m_cmdCommand.Parameters.Append prmParam
    Next prmParam
    
    MakeCommand = True
    Exit Function

errMakeCommand:
    ProcessError
End Function

Public Function FillSection(ByVal sQry As String, ByVal lstParams As Collection, ByVal oSection As Object) As Boolean
    On Error GoTo errFillSection
    FillSection = False
    
    MakeCommand sQry, lstParams 'Összeállítjuk paraméterestül a query-t.
    
    Dim rstRecordset As ADODB.Recordset
    Set rstRecordset = m_cmdCommand.Execute 'Végrehajtjuk
    
    If rstRecordset.Fields.Count <= 2 Then  'Ha kettõnél több oszlopa van, akkor gáz van.
        Do While Not rstRecordset.EOF   'Végigmegyünk az eredményhalmazon
            Dim oKOD As New CKod    'Csinálunk egy új kódszótári elemet.
            oKOD.Ertek = rstRecordset.Fields(0).Value  'Feltöltjük
            oKOD.Nev = IIf(IsNull(rstRecordset.Fields(1).Value), "", rstRecordset.Fields(1).Value)
            oSection.Add oKOD, oKOD.Ertek   'és betesszük a segéd collection-be
            Set oKOD = Nothing  'Ha betettük, nem kell tovább
            rstRecordset.MoveNext   'Megyünk a következõ rekordra.
        Loop
        FillSection = True
    End If
    
    Exit Function

errFillSection:
    ProcessError
End Function

Public Function FillArray(ByVal sQry As String, ByVal lstParams As Collection, ByRef sOut As Variant) As Integer
    On Error GoTo errFillArray
    FillArray = -1
    
    Dim rstRecordset As ADODB.Recordset
    
    MakeCommand sQry, lstParams
    
    Set rstRecordset = m_cmdCommand.Execute
        
    If Not (rstRecordset.EOF And rstRecordset.BOF) Then
        sOut = rstRecordset.GetRows
        FillArray = UBound(sOut, 2) + 1
    Else
        FillArray = 0
    End If
    
    Exit Function

errFillArray:
    ProcessError
End Function

Public Function LoadFirstRecord(ByVal sQry As String, lstParams As Collection, ByRef rstRecordset) As Boolean
    On Error GoTo errLoadFirstRecord
    LoadFirstRecord = False
    
    MakeCommand sQry, lstParams
    Set rstRecordset = m_cmdCommand.Execute
    
    LoadFirstRecord = True
    Exit Function

errLoadFirstRecord:
    ProcessError
End Function

Public Function BeginTrans(Name As String) As Boolean
    On Error GoTo errBeginTrans
    BeginTrans = False
    
    Set m_cmdCommand.ActiveConnection = m_cnn
    
    m_cmdCommand.CommandText = "BEGIN TRAN " & Name
    m_cmdCommand.CommandTimeout = 60
    m_cmdCommand.CommandType = ADODB.adCmdText
    m_cmdCommand.Execute
    
    BeginTrans = True
    Exit Function
    
errBeginTrans:
End Function

Public Function CommitTrans(Name As String) As Boolean
    On Error GoTo errCommitTrans
    CommitTrans = False
    
    Set m_cmdCommand.ActiveConnection = m_cnn
    
    m_cmdCommand.CommandText = "COMMIT TRAN " & Name
    m_cmdCommand.CommandTimeout = 60
    m_cmdCommand.CommandType = ADODB.adCmdText
    m_cmdCommand.Execute
    
    CommitTrans = True
    Exit Function
    
errCommitTrans:
End Function

Public Function RollbackTrans(Name As String) As Boolean
    On Error GoTo errRollBack
    RollbackTrans = False
    
    Dim m_cmdCommand As New ADODB.Command
    Set m_cmdCommand.ActiveConnection = m_cnn
    
    m_cmdCommand.CommandText = "ROLLBACK TRAN " & Name
    m_cmdCommand.CommandTimeout = 60
    m_cmdCommand.CommandType = ADODB.adCmdText
    m_cmdCommand.Execute
    
    RollbackTrans = True
    Exit Function

errRollBack:
    MsgBox "'" & Name & "' nevü rollback nem történt meg!" _
        & vbCr & "Nincs ilyen vagy nem történt tranzakció.", vbCritical, "Adatbázis hibaüzemet"
End Function

Private Sub ProcessError()
    Dim errLoop As ADODB.Error
    Dim strError As String
    
    For Each errLoop In m_cnn.Errors
        MsgBox errLoop.Description & "; code=" & CStr(errLoop.Number), vbExclamation, "Admin/ADO error"
    Next
End Sub

