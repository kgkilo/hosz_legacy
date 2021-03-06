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
' $Id$

Option Explicit

'Adattagok
Public sConnectString As String
Private m_cnn As ADODB.Connection
Private m_cmdCommand As ADODB.Command
Private m_sLoginName As String  'Login n�v

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

Public Function Login(ByVal sConnect As String) As Boolean
    On Error GoTo errLogin
    Login = False
    
    If sConnect = "" Then
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
    
    Login = True
    Exit Function

errLogin:
    ProcessError
End Function

Public Function Permis(ByVal sObject As String) As Byte
    'Permis = ObjPermis(sObject)
    Permis = P_READ Or P_INSERT Or P_UPDATE Or P_DELETE
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
    
    Dim i As Integer    'seg�d
    Dim j As Integer    'seg�d
    
    i = 1   'Ha van benne "adatb�zis.dbo." hivatkoz�s, akkor meg�llap�tjuk, hogy meddig tart
    j = -1  'az adatb�zis neve (ez lesz = j)
    Do Until i = Len(sQry) Or j >= 0
        If Mid(sQry, i, 2) = ".." Then
            j = i + 1
            Exit Do
        End If  'Mid
        i = i + 1
    Loop    'i = Len
    
    Dim cmdParamQuery As New ADODB.Command  'sp_QueryParams v�grehajt�s�hoz
    Dim prmQRY As New ADODB.Parameter   'sp_QueryParams param�tere (a t�rolt elj�r�s neve)
    Dim rstParameter As ADODB.Recordset 'sp_QueryParams kimenete
    Dim prmParam As ADODB.Parameter
    Dim varParamValue As Variant
    Dim lstCommandParams As New Collection  '�tmeneti param�ter-t�rol�
    
    With cmdParamQuery
        Set .ActiveConnection = m_cnn  'R�l�gunk a m�r �l� connection-re
    
        If j = -1 Then  'Ha nincs k�l�n megadva adatb�zisn�v,
            .CommandText = "sp_QueryParams"    'akkor egyszer�en lehet h�vni a QueryParams elj�r�st.
        Else    'Ha viszont van adatb�zisn�v, akkor azt is el� kell tenni a QueryParamsnak.
            .CommandText = Left(sQry, j) & "sp_QueryParams"
        End If  'j = -1
    
        .CommandTimeout = 60
        .CommandType = ADODB.adCmdStoredProc
    End With
    
    With prmQRY
        .Direction = ADODB.adParamInput   'A QueryParams egy param�tert v�r, ami
        .Value = sQry                     'a t�rolt elj�r�s neve
        .Type = ADODB.adBSTR
        .Size = 92
    End With
    
    cmdParamQuery.Parameters.Append prmQRY  'Betessz�k a param�terek k�z�...
    
    Set rstParameter = cmdParamQuery.Execute    'V�grehajtjuk
    
    Do While Not rstParameter.EOF   'Elmegy�nk a visszaadott recordset v�g�ig
        Set prmParam = New ADODB.Parameter  'L�trehozunk egy �j param�tert,
        With prmParam
            .Direction = ADODB.adParamInput 'ami input param, teh�t nem lehet benne visszaadni �rt�ket.
                
            Select Case rstParameter.Fields(1).Value    'A param�ter t�pus�t�l f�gg�en
            Case "varchar", "text", "char", "datetime"  'm�s*m�s t�pust �ll�tunk be
                .Type = ADODB.adBSTR
            Case "real"
                .Type = ADODB.adDouble
            Case Else
                .Type = ADODB.adInteger
            End Select
        
            On Error Resume Next
            ' a varParamValue-ba ker�l a majd �tadand� param�ter �rt�ke
            varParamValue = Null
            varParamValue = lstParameters(Mid(rstParameter.Fields(0).Value, 2, 14))
            If varParamValue = Null Or varParamValue = "" Then  'Ha �res vagy Null,
                .Value = Null   'akkor Nullnak �ll�tjuk be.
            Else    'Egy�bk�nt arra, ami kell.
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
            
                If rstParameter.Fields(1).Value = "datetime" Then   'datetime t�pusn�l a param�ter hossza fixen 20 karakter,
                    .Size = 20
                Else    'm�g egy�b esetekben annyi, amit az SQL visszaadott.
                    .Size = IIf(rstParameter.Fields(2).Value < Len(varParamValue), rstParameter.Fields(2).Value, Len(varParamValue))
                End If
            
                .Value = varParamValue
            End If
            On Error GoTo errMakeCommand
        End With
        
        lstCommandParams.Add prmParam   'Hozz�f�zz�k a param�terekhez
        Set prmParam = Nothing
        rstParameter.MoveNext   '�s megy�nk a k�vetkez� sorra, amit a QueryParam visszaadott.
    Loop
    
    rstParameter.Close  'Ha el�rt�k az EOF-ot, akkor lez�rjuk.
    Set cmdParamQuery = Nothing 'Ez sem kell tov�bb.
        
    Set m_cmdCommand = Nothing
    Set m_cmdCommand = New ADODB.Command
    With m_cmdCommand
        Set .ActiveConnection = m_cnn 'Ezt az objektumot fogjuk majd visszaadni
    
        .CommandText = sQry   'Be�ll�tjuk mindenf�le jellemz�it
        .CommandTimeout = 60
        .CommandType = ADODB.adCmdStoredProc
    
        For Each prmParam In lstCommandParams   '�s beletessz�k a param�terek sokas�g�t...
            .Parameters.Append prmParam
        Next prmParam
    End With
    
    MakeCommand = True
    Exit Function

errMakeCommand:
    ProcessError
End Function

Public Function FillSection(ByVal sQry As String, ByVal lstParams As Collection, ByVal oSection As Object) As Boolean
    On Error GoTo errFillSection
    FillSection = False
    
    MakeCommand sQry, lstParams '�ssze�ll�tjuk param�terest�l a query-t.
    
    Dim rstRecordset As ADODB.Recordset
    Set rstRecordset = m_cmdCommand.Execute 'V�grehajtjuk
    
    With rstRecordset
        If .Fields.Count <= 2 Then  'Ha kett�n�l t�bb oszlopa van, akkor g�z van.
            Do While Not .EOF   'V�gigmegy�nk az eredm�nyhalmazon
                Dim oKOD As New CKod    'Csin�lunk egy �j k�dsz�t�ri elemet.
                oKOD.Ertek = .Fields(0).Value  'Felt�ltj�k
                oKOD.Nev = IIf(IsNull(.Fields(1).Value), "", .Fields(1).Value)
                oSection.Add oKOD, oKOD.Ertek   '�s betessz�k a seg�d collection-be
                Set oKOD = Nothing  'Ha betett�k, nem kell tov�bb
                .MoveNext   'Megy�nk a k�vetkez� rekordra.
            Loop
            FillSection = True
        End If
    End With
    
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

Public Function LoadFirstRecord(ByVal sQry As String, lstParams As Collection, ByRef rstRecordset As ADODB.Recordset) As Boolean
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
    
    With m_cmdCommand
        Set .ActiveConnection = m_cnn
        .CommandText = "BEGIN TRAN " & Name
        .CommandTimeout = 60
        .CommandType = ADODB.adCmdText
        .Execute
    End With
    
    BeginTrans = True
    Exit Function
    
errBeginTrans:
End Function

Public Function CommitTrans(Name As String) As Boolean
    On Error GoTo errCommitTrans
    CommitTrans = False
    
    With m_cmdCommand
        Set .ActiveConnection = m_cnn
        .CommandText = "COMMIT TRAN " & Name
        .CommandTimeout = 60
        .CommandType = ADODB.adCmdText
        .Execute
    End With
    
    CommitTrans = True
    Exit Function
    
errCommitTrans:
End Function

Public Function RollbackTrans(Name As String) As Boolean
    On Error GoTo errRollBack
    RollbackTrans = False
    
    Dim m_cmdCommand As New ADODB.Command
    With m_cmdCommand
        Set .ActiveConnection = m_cnn
        .CommandText = "ROLLBACK TRAN " & Name
        .CommandTimeout = 60
        .CommandType = ADODB.adCmdText
        .Execute
    End With
    
    RollbackTrans = True
    Exit Function

errRollBack:
    MsgBox "'" & Name & "' nev� rollback nem t�rt�nt meg!" _
        & vbCr & "Nincs ilyen vagy nem t�rt�nt tranzakci�.", vbCritical, "Adatb�zis hiba�zemet"
End Function

Private Sub ProcessError()
    Dim errLoop As ADODB.Error
    
    For Each errLoop In m_cnn.Errors
        MsgBox errLoop.Description & "; code=" & CStr(errLoop.NativeError), vbExclamation, "Admin/ADO error"
        'If errLoop.Number = -2147217911 Then
        '    MsgBox "Bingo"
        'End If
    Next
End Sub

