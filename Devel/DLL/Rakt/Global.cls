VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "Global"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Const HOOSSZEGZO = "18"
Const VIZORA = "19"
Const ERZEKELO = "20"

Private m_sConnect As String

Private Sub Class_Initialize()
    Set oAdmin = New CadminADO
    Set g_oKodszotar = New CKodSzotar
End Sub

Private Sub Class_Terminate()
    Set oAdmin = Nothing
    Set g_oKodszotar = Nothing
End Sub

'   Init
'
'   Inicializ�c�t v�gzi el.
'   Szerverre bejelentkezik, be�ll�tja a d�tum form�tumot, felt�lti a k�dsz�t�rat
'   Param�terek:    -
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
Public Function Init(ByRef sReportDir As String) As Boolean
    On Error GoTo errInit
    Init = False

    'A formel.ini file-b�l a sz�ks�ges adatok bet�lt�se
    Dim FileNum, iCount As Integer
    Dim sInputLine, sDriver, sServer, sDatabase As String
    
    FileNum = FreeFile              'egy �res file sorsz�m k�r�se
    
    Open "formel.ini" For Input As FileNum     'File nyit�s olvas�sra
    While Not EOF(FileNum)
        Line Input #FileNum, sInputLine
        iCount = InStr(1, sInputLine, "=", 0)
        Select Case Left(sInputLine, IIf(iCount = 0, 0, iCount - 1))
            Case "driver"
                sDriver = sInputLine
            Case "server"
                sServer = sInputLine
            Case "database"
                sDatabase = sInputLine
            Case "sReportDir"
                sReportDir = Right(Trim(sInputLine), Len(sInputLine) - iCount)
        End Select
    Wend
    Close #FileNum                              'File z�r�s

    m_sConnect = sDriver & "; " & sServer & ";uid=sa;pwd=;" & sDatabase
    oAdmin.Login m_sConnect   'Bejelentkezik az SQL szerverre
    
    g_oKodszotar.Load "sp_Q316", Nothing, "316", "Leolvas�si m�d", 2
    g_oKodszotar.Load "sp_Q365", Nothing, "365", "H��sszegz� helyzet", 2
    g_oKodszotar.Load "sp_Q366", Nothing, "366", "Elektronika", 2
    g_oKodszotar.Load "sp_Q367", Nothing, "367", "Rakt�r �llapot", 2
    
    Init = True
    Exit Function
    
errInit:
End Function    'Init

'   LoadInfo
'
'   Felt�lti a kiv�lasztott objektum adataival a k�perny�t.
'   Param�terek:    frm as Object   -   a felt�ltend� k�perny�
'                   sID as String   -   a rakt�r/felszerelt/sz�ll�t� rekord id-je
'                   sOBJTIP as String   -   az akt�v objektumt�pus
'                   sHonnan as String   -   melyik gridb�l �rkezett a k�r�s
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
Public Function LoadInfo(ByRef frm As Object, ByVal sID As Long, _
        ByRef sOBJTIP As String, ByRef sHonnan As String) As Boolean
    On Error GoTo errLoadInfo
    LoadInfo = False
    
    Dim sQuery As String
    Dim lstParams As New Collection 'Betessz�k az azonos�t�t a lek�rdez�s param�terei k�z�
    
    sQuery = "sp_LoadRaktarInfo"
    
    lstParams.Add sID, "pID"
    lstParams.Add sOBJTIP, "pOBJTIP"
    lstParams.Add UCase(Left(sHonnan, 1)), "pFROM"
    
    Dim rs As New ADODB.Recordset   'Bet�ltj�k az azonos�t� alapj�n a rekordot
    If oAdmin.LoadFirstRecord(sQuery, lstParams, rs) = True Then
        If ControlsSet(rs, frm) Then    'Ha siker�lt, felt�ltj�k a k�perny� kontrolljait adatokkal.
            LoadInfo = True
        End If
    End If
    Exit Function
    
errLoadInfo:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "LoadInfo"
End Function    'RekordFeltolt

'   SetCombo
'
'   Felt�lti a k�perny�n tal�lhat� combobox-okat a k�dsz�t�r alapj�n.
'   Param�terek:    lstControls As Access.Controls  -   a k�perny�n tal�lhat� kontrollok
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
Public Function SetCombo(ByRef frm As Object) As Boolean
    On Error GoTo errSetCombo
    SetCombo = False
    
    Dim oControl As Control
    For Each oControl In frm.Controls     'V�gigmegy�nk az �sszes kontrolon,
        If Left(oControl.Name, 3) = "cmb" Then  '�s ha combobox, akkor
            SetCombo = ComboBoxSet(oControl, Nothing)   'felt�ltj�k.
        End If
    Next
    Exit Function
    
errSetCombo:
End Function    'SetCombo

Public Function SetComboVal(ByRef cmbCombo As Object, ByRef sID As String) As Boolean
    SetComboVal = ComboBoxSetBase(cmbCombo, sID)
End Function    'SetComboVal

'   GetComboNev
'
'   Visszaadja az �tadott combobox kiv�lasztott sor�nak sz�veg�t (ami l�tszik...)
'   Param�terek:    cmbCombo as Object  -   a lek�rdezend� combobox
'   Visszat�r�s:    String, a sz�veg. Hiba eset�n �res string.
Public Function GetComboNev(ByRef cmbCombo As Object) As String
    On Error GoTo errGetComboNev
    GetComboNev = ""
    
    If cmbCombo.ListIndex <> -1 Then
        GetComboNev = g_oKodszotar.Section(cmbCombo.Tag).KodList.Item(cmbCombo.ListIndex + 1).Nev
    End If
    Exit Function
    
errGetComboNev:
End Function    'GetComboNev

'   GetComboErtek
'
'   Visszaadja az �tadott combobox kiv�lasztott sor�nak �rt�k�t (ami nem l�tszik...)
'   Param�terek:    cmbCombo as Object  -   a lek�rdezend� combobox
'   Visszat�r�s:    String, az �rt�k. Hiba eset�n �res string.
Public Function GetComboErtek(ByRef cmbCombo As Object) As String
    GetComboErtek = ComboBoxGet(Nothing, cmbCombo)
End Function    'GetComboErtek

Public Function Gridder(ByRef oGrid As Object, ByRef sKateg As String, _
        ByRef sOBJTIP As String, Optional ByRef sAllapot As String) As Boolean
    Dim sFormatstring As String
    Dim sQuery As String
    Dim iMerge As Integer
    Dim sParam As String
    Dim lstParams As New Collection
    
    lstParams.Add sOBJTIP, "pOBJTIP"
    If sKateg = "RAKTAR" Then
        lstParams.Add sAllapot, "pALLAPOT"
    End If
    iMerge = 2
    sFormatstring = "<||Gy.sz.|Tip.|D�tum"
    sQuery = "sp_Fill" + sKateg
    
    FillGrid sQuery, lstParams, oGrid, sFormatstring, iMerge
End Function    'Gridder

' �thelyez egy rekordot a RAKTAR, SZALLITONAL, FELSZERELT t�bl�k k�z�tt
Public Function Athelyez(ByRef sHonnan As String, ByRef sHova As String, _
    ByRef sID As String) As Boolean
    On Error GoTo errAthelyez
    Athelyez = False
    
    Dim sQuery As String
    Dim lstParams As New Collection
    
    sQuery = "sp_" + sHonnan + "2" + sHova
    lstParams.Add sID, "pID"
    
    Athelyez = oAdmin.Exec(sQuery, lstParams)
    Exit Function
    
errAthelyez:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "Athelyez"
End Function    'Athelyez

Public Function Save(ByRef frm As Object, ByVal sKategoria As String) As Boolean
    On Error GoTo errSave
    Save = False
    
    Dim lstParams As New Collection '�s �tadjuk majd param�terk�nt
    
    ControlsGet lstParams, frm  'Lek�rdezz�k az �sszes l�that� kontroll �rt�k�t
    lstParams.Add sKategoria, "pOBJTIP"
    
    If oAdmin.Exec("sp_UpdRaktarObj", lstParams) = True Then 'V�grehajtjuk a friss�t�st
        Save = True
    End If
    Exit Function
    
errSave:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "Save"
End Function    'Save

Public Function PrepareTAB(ByRef sTAB As String, Optional ByRef sOBJTIP As String) As Boolean
    On Error GoTo errPrepareTab
    PrepareTAB = False
    
    Dim sQuery As String
    Dim lstParams As New Collection
    
    sQuery = "sp_MakeTAB_" & sTAB
    Select Case sTAB
        Case "R01"  'Rakt�r lista objektum t�pusonk�nt csoportos�tva

        Case "R02"
        
        Case "R03"  'Sz�ll�t�lev�l objektum t�pusra sz�rve
            lstParams.Add sOBJTIP, "pOBJTIP"
    End Select
    
    PrepareTAB = oAdmin.Exec(sQuery, lstParams)
    Exit Function
    
errPrepareTab:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "PrepareTAB"
End Function