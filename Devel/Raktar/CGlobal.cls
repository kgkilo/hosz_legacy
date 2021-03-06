VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CGlobal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

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
Public Function Init(ByRef sReportDir As String) As String
    On Error GoTo errInit
    Init = ""

    'A formel.ini file-b�l a sz�ks�ges adatok bet�lt�se
    Dim FileNum, iCount As Integer
    Dim sInputLine, sDriver, sServer, sDatabase As String
    
    FileNum = FreeFile              'egy �res file sorsz�m k�r�se
    
    Open "c:\formel.ini" For Input As FileNum     'File nyit�s olvas�sra
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
    g_oKodszotar.Load "sp_Q368", Nothing, "368", "Szolg�ltat�i tulajdon", 1
    g_oKodszotar.Load "sp_Q334", Nothing, "334", "Dolgoz�", 3
    g_oKodszotar.Load "sp_FillRaktarKepv", Nothing, "KEPVIS", "K�z�s k�pvisel�", 4
    Init = m_sConnect
    Exit Function
    
errInit:
End Function    'Init

'   MegnevFeltolt
'
'   Felt�lti az objektum neveket tartalmaz� combobox-ot a v�lasztott objektumt�pusnak megfelel�en.
'
'   Param�terek:    cmbMegnev As Object -   a felt�ltend� combobox
'                   cmbOBJTIP As Object -   az objektumt�pusok combobox-a
'
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
'
Public Function MegnevFeltolt(ByRef cmbMegnev As Object, ByRef sOBJTIP As String) As Boolean
    On Error GoTo errMegnevFeltolt
    MegnevFeltolt = False
    
    Dim sSectName As String
    sSectName = "MEGNEV" + sOBJTIP
    
    g_oKodszotar.Remove sSectName    'T�r�lj�k az �l-k�dsz�t�ri MEGNEV szekci�t
    
    g_oKodszotar.Load "sp_FillObjMegnev", Array("pObjTip", sOBJTIP), sSectName, "Objektum megnevez�se", 100
    MegnevFeltolt = ComboBoxSet(cmbMegnev, Nothing) 'Bet�ltj�k a k�dsz�t�rba a megnevez�seket, majd felt�ltj�k a combobox-ot
    cmbMegnev.ListWidth = 350
    Exit Function
    
errMegnevFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "MegnevFeltolt"
End Function    'MegnevFeltolt

'   EpuletFeltolt
'
'   Felt�lti az �p�let neveket tartalmaz� combobox-ot a v�lasztott f�t�m�nek megfelel�en.
'
'   Param�terek:    cmbMegnev As Object -   a felt�ltend� combobox
'                   cmbFutomu As Object -   a f�t�m�vek combobox-a
'
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
'
Public Function EpuletFeltolt(ByRef cmbEPUL As Object, Optional ByRef cmbFUTOMU As Object) As Boolean
    On Error GoTo errEpuletFeltolt
    EpuletFeltolt = False
    
    Dim sSectName As String
    sSectName = "MEGNEV01"
    
    g_oKodszotar.Remove sSectName    'T�r�lj�k az �l-k�dsz�t�ri MEGNEV szekci�t
    
    Dim sFutomu As String
    If TypeName(cmbFUTOMU) = "Nothing" Then
        sFutomu = "NULL"
    Else
        sFutomu = ComboBoxGet(Nothing, cmbFUTOMU)
    End If
    
    g_oKodszotar.Load "sp_FillEpuletByFutomu", Array("pFUTOMU_ID", sFutomu), sSectName, "Objektum megnevez�se", 100
    EpuletFeltolt = ComboBoxSet(cmbEPUL, Nothing) 'Bet�ltj�k a k�dsz�t�rba a megnevez�seket, majd felt�ltj�k a combobox-ot
    cmbEPUL.ListWidth = 350
    Exit Function
    
errEpuletFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "EpuletFeltolt"
End Function    'MegnevFeltolt

Public Function Gridder(ByRef oGrid As Object, ByRef sOBJTIP As String, _
        ByRef sALLAPOT As String, ByRef frm As Object) As Boolean
    Dim sFormatstring As String
    Dim sQuery As String
    Dim iMerge As Integer
    Dim sParam As String
    Dim lstParams As New Collection
    
    lstParams.Add sOBJTIP, "pOBJTIP"
    lstParams.Add sALLAPOT, "pALLAPOT"
    sParam = GetComboErtek(frm.Controls("cmbEPUL"))
    lstParams.Add sParam, "pEPULET_ID"
    sParam = GetComboErtek(frm.Controls("cmbFUTOMU"))
    lstParams.Add sParam, "pFUTOMU_ID"
    sParam = IIf(IsNull(frm.Controls("datHITIDO").Value), "", frm.Controls("datHITIDO").Value)
    lstParams.Add sParam, "pHITIDO"
    sParam = GetComboErtek(frm.Controls("cmbDOLG_ID"))
    lstParams.Add sParam, "pDOLG_ID"
    sParam = frm.Controls("txtSZLEVEL_SZAM").Text
    lstParams.Add sParam, "pSZLEVEL_SZAM"
    sParam = IIf(IsNull(frm.Controls("datSZLEVEL_DAT").Value), "", frm.Controls("datSZLEVEL_DAT").Value)
    lstParams.Add sParam, "pSZLEVEL_DAT"
    sParam = frm.Controls("txtTIPUS").Text
    lstParams.Add sParam, "pTIPUS"
    sParam = frm.Controls("txtATMERO").Text
    lstParams.Add sParam, "pATMERO"
    sParam = frm.Controls("txtBENYHOSSZ").Text
    lstParams.Add sParam, "pBENYHOSSZ"
    sParam = frm.Controls("txtVEZHOSSZ").Text
    lstParams.Add sParam, "pVEZHOSSZ"
    sParam = frm.Controls("txtSZUKSHOSSZ").Text
    lstParams.Add sParam, "pSZUKSHOSSZ"
    
    iMerge = 5
    If sOBJTIP = "00" Then
        sFormatstring = "<||Berendez�s|"
    Else
        sFormatstring = "<||"
    End If
    sFormatstring = sFormatstring + "Gy.sz.|Tip.|D�tum|�llapot|�p�let|F�t�m�|Hit.id�|Dolgoz�|Sz.lev�l sz�ma|Sz.lev�l d�tuma|"
    'If sALLAPOT <> "" Then sFormatstring = sFormatstring + "�llapot|"
    'If lstParams("pEPULET_ID") <> "" Then sFormatstring = sFormatstring + "�p�let|"
    'If lstParams("pFUTOMU_ID") <> "" Then sFormatstring = sFormatstring + "F�t�m�|"
    'If lstParams("pDOLG_ID") <> "" Then sFormatstring = sFormatstring + "Dolgoz�|"
    ''If lstParams("pSZLEVEL_SZAM") <> "" Then sFormatstring = sFormatstring + "Sz.lev�l sz�ma|"
    'sFormatstring = sFormatstring + "Sz.lev�l sz�ma|"
    'If lstParams("pSZLEVEL_DAT") <> "" Then sFormatstring = sFormatstring + "Sz.lev�l d�tuma|"
    
    sQuery = "sp_LekerdRaktar"
    FillGrid sQuery, lstParams, oGrid, sFormatstring, iMerge
End Function    'Gridder

Public Function Save(ByRef frm As Object, ByRef sKategoria As String) As Boolean
    On Error GoTo errSave
    Save = False
    
    Dim sQuery As String
    Select Case sKategoria
        Case "BER":
            sQuery = "sp_UpdRaktarObj"
        Case "KEP"
            sQuery = "sp_InsRaktarKepv"
    End Select
    
    Dim lstParams As New Collection
    ControlsGet lstParams, frm  'Lek�rdezz�k az �sszes l�that� kontroll �rt�k�t
    
    If oAdmin.Exec(sQuery, lstParams) = True Then 'V�grehajtjuk a friss�t�st
        Save = True
    End If
    Exit Function
    
errSave:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "Save"
End Function    'Save

Public Function PrepareTAB(ByRef sTAB As String, Optional ByRef sParam As String) As Boolean
    On Error GoTo errPrepareTab
    PrepareTAB = False
    
    Dim sQuery As String
    Dim lstParams As New Collection
    
    sQuery = "sp_MakeTAB_" & sTAB
    Select Case sTAB
        Case "R01"  'Rakt�r lista objektum t�pusonk�nt csoportos�tva

        Case "R02"
        
        Case "R03"  'Sz�ll�t�lev�l objektum t�pusra sz�rve
            lstParams.Add sParam, "pOBJTIP"
            
        Case "R04"  'H�menyis�gm�r�k adatai
            lstParams.Add sParam, "pID"
    End Select
    
    PrepareTAB = oAdmin.Exec(sQuery, lstParams)
    Exit Function
    
errPrepareTab:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "PrepareTAB"
End Function

' Egy rekord �llapot�t v�ltoztatja (Akt�v, selejt, nem felszerelhet�) a RAKTAR t�bl�ban
Public Function setAllapot(ByRef sID As String, ByRef sALLAPOT As String, Optional ByRef lDOLG_ID As Long, _
                        Optional ByRef sSZLEVEL_SZAM As String, Optional ByRef sSZLEVEL_DAT As String, _
                        Optional ByRef sMEGJ As String) As Boolean
    On Error GoTo errsetAllapot
    setAllapot = False
    
    Dim lstParams As New Collection
    
    lstParams.Add sID, "pID"
    lstParams.Add sALLAPOT, "pALLAPOT"
    lstParams.Add lDOLG_ID, "pDOLG_ID"
    lstParams.Add sSZLEVEL_SZAM, "pSZLEVEL_SZAM"
    lstParams.Add sSZLEVEL_DAT, "pSZLEVEL_DATUM"
    lstParams.Add sMEGJ, "pMEGJ"
    setAllapot = oAdmin.Exec("sp_UpdRaktarAllapot", lstParams)
    Exit Function
    
errsetAllapot:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "setAllapot"
End Function    'setAllapot

'   Load
'
'   Felt�lti a kiv�lasztott objektum adataival a k�perny�t.
'   Param�terek:    frm as Object   -   a felt�ltend� k�perny�
'                   sID as String   -   a rakt�r rekord id-je
'                   sKategoria      -   BER, ha berendez�s, KEP ha k�pvisel�
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
Public Function Load(ByRef frm As Object, ByVal sID As Long, ByVal sKategoria As String) As Boolean
    On Error GoTo errLoad
    Load = False
    
    Dim sQuery As String
    Select Case sKategoria
        Case "BER":
            sQuery = "sp_LoadRaktarInfo"
        Case "KEP"
            sQuery = "sp_LoadRaktarKepv"
    End Select
    
    Dim lstParams As New Collection 'Betessz�k az azonos�t�t a lek�rdez�s param�terei k�z�
    lstParams.Add sID, "pID"
    
    Dim rs As New ADODB.Recordset   'Bet�ltj�k az azonos�t� alapj�n a rekordot
    If oAdmin.LoadFirstRecord(sQuery, lstParams, rs) = True Then
        If ControlsSet(rs, frm) Then    'Ha siker�lt, felt�ltj�k a k�perny� kontrolljait adatokkal.
            Load = True
        End If
    End If
    Exit Function
    
errLoad:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "Load"
End Function    'Load

Public Function RefreshCombo(ByRef cmbCombo As Object) As Boolean
    On Error GoTo errRefreshCombo
    RefreshCombo = False
    
    Dim sTag As String
    sTag = cmbCombo.Tag
    
    Dim sSql As String
    Dim sName As String
    Dim sLongName As String
    Dim iSize As Byte
    
    With g_oKodszotar
        With .Section(sTag)
            sSql = .SQL
            sName = .Name
            sLongName = .LongName
            iSize = .Size
        End With
        
        .Remove sTag
        .Load sSql, Nothing, sName, sLongName, iSize
    End With
    RefreshCombo = True
    Exit Function
    
errRefreshCombo:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "RefreshCombo"
End Function    'RefreshCombo
