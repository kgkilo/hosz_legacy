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
'   Inicializácót végzi el.
'   Szerverre bejelentkezik, beállítja a dátum formátumot, feltölti a kódszótárat
'   Paraméterek:    -
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
Public Function Init(ByRef sReportDir As String) As Boolean
    On Error GoTo errInit
    Init = False

    'A formel.ini file-ból a szükséges adatok betöltése
    Dim FileNum, iCount As Integer
    Dim sInputLine, sDriver, sServer, sDatabase As String
    
    FileNum = FreeFile              'egy üres file sorszám kérése
    
    Open "formel.ini" For Input As FileNum     'File nyitás olvasásra
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
    Close #FileNum                              'File zárás

    m_sConnect = sDriver & "; " & sServer & ";uid=sa;pwd=;" & sDatabase
    oAdmin.Login m_sConnect   'Bejelentkezik az SQL szerverre
    
    g_oKodszotar.Load "sp_Q316", Nothing, "316", "Leolvasási mód", 2
    g_oKodszotar.Load "sp_Q365", Nothing, "365", "Hõösszegzõ helyzet", 2
    g_oKodszotar.Load "sp_Q366", Nothing, "366", "Elektronika", 2
    g_oKodszotar.Load "sp_Q367", Nothing, "367", "Raktár állapot", 2
    g_oKodszotar.Load "sp_Q334", Nothing, "334", "Dolgozó", 3
     
    Init = True
    Exit Function
    
errInit:
End Function    'Init

'   MegnevFeltolt
'
'   Feltölti az objektum neveket tartalmazó combobox-ot a választott objektumtípusnak megfelelõen.
'
'   Paraméterek:    cmbMegnev As Object -   a feltöltendõ combobox
'                   cmbOBJTIP As Object -   az objektumtípusok combobox-a
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function MegnevFeltolt(ByRef cmbMegnev As Object, ByRef sOBJTIP As String) As Boolean
    On Error GoTo errMegnevFeltolt
    MegnevFeltolt = False
    
    Dim sSectName As String
    sSectName = "MEGNEV" + sOBJTIP
    
    g_oKodszotar.Remove sSectName    'Töröljük az ál-kódszótári MEGNEV szekciót
    
    g_oKodszotar.Load "sp_FillObjMegnev", Array("pObjTip", sOBJTIP), sSectName, "Objektum megnevezése", 100
    MegnevFeltolt = ComboBoxSet(cmbMegnev, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    cmbMegnev.ListWidth = 350
    Exit Function
    
errMegnevFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "MegnevFeltolt"
End Function    'MegnevFeltolt

'   SetCombo
'
'   Feltölti a képernyõn található combobox-okat a kódszótár alapján.
'   Paraméterek:    lstControls As Access.Controls  -   a képernyõn található kontrollok
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
Public Function SetCombo(ByRef frm As Object) As Boolean
    On Error GoTo errSetCombo
    SetCombo = False
    
    Dim oControl As Control
    For Each oControl In frm.Controls     'Végigmegyünk az összes kontrolon,
        If Left(oControl.Name, 3) = "cmb" Then  'és ha combobox, akkor
            SetCombo = ComboBoxSet(oControl, Nothing)   'feltöltjük.
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
'   Visszaadja az átadott combobox kiválasztott sorának szövegét (ami látszik...)
'   Paraméterek:    cmbCombo as Object  -   a lekérdezendõ combobox
'   Visszatérés:    String, a szöveg. Hiba esetén üres string.
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
'   Visszaadja az átadott combobox kiválasztott sorának értékét (ami nem látszik...)
'   Paraméterek:    cmbCombo as Object  -   a lekérdezendõ combobox
'   Visszatérés:    String, az érték. Hiba esetén üres string.
Public Function GetComboErtek(ByRef cmbCombo As Object) As String
    GetComboErtek = ComboBoxGet(Nothing, cmbCombo)
End Function    'GetComboErtek

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
    sParam = GetComboErtek(frm.Controls("cmbDOLG_ID"))
    lstParams.Add sParam, "pDOLG_ID"
    sParam = frm.Controls("txtSZLEVEL_SZAM").Text
    lstParams.Add sParam, "pSZLEVEL_SZAM"
    sParam = IIf(IsNull(frm.Controls("datSZLEVEL_DAT").Value), "", frm.Controls("datSZLEVEL_DAT").Value)
    lstParams.Add sParam, "pSZLEVEL_DAT"
    
    iMerge = 5
    If sOBJTIP = "00" Then
        sFormatstring = "<||Berendezés|"
    Else
        sFormatstring = "<||"
    End If
    sFormatstring = sFormatstring + "Gy.sz.|Tip.|Dátum|Állapot|Épület|Fûtõmû|Dolgozó|Sz.levél száma|Sz.levél dátuma|"
    'If sALLAPOT <> "" Then sFormatstring = sFormatstring + "Állapot|"
    'If lstParams("pEPULET_ID") <> "" Then sFormatstring = sFormatstring + "Épület|"
    'If lstParams("pFUTOMU_ID") <> "" Then sFormatstring = sFormatstring + "Fûtõmû|"
    'If lstParams("pDOLG_ID") <> "" Then sFormatstring = sFormatstring + "Dolgozó|"
    ''If lstParams("pSZLEVEL_SZAM") <> "" Then sFormatstring = sFormatstring + "Sz.levél száma|"
    'sFormatstring = sFormatstring + "Sz.levél száma|"
    'If lstParams("pSZLEVEL_DAT") <> "" Then sFormatstring = sFormatstring + "Sz.levél dátuma|"
    
    sQuery = "sp_LekerdRaktar"
    FillGrid sQuery, lstParams, oGrid, sFormatstring, iMerge
End Function    'Gridder

Public Function Save(ByRef frm As Object, ByVal sKategoria As String) As Boolean
    On Error GoTo errSave
    Save = False
    
    Dim lstParams As New Collection 'és átadjuk majd paraméterként
    
    ControlsGet lstParams, frm  'Lekérdezzük az összes látható kontroll értékét
    lstParams.Add sKategoria, "pOBJTIP"
    
    If oAdmin.Exec("sp_UpdRaktarObj", lstParams) = True Then 'Végrehajtjuk a frissítést
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
        Case "R01"  'Raktár lista objektum típusonként csoportosítva

        Case "R02"
        
        Case "R03"  'Szállítólevél objektum típusra szûrve
            lstParams.Add sOBJTIP, "pOBJTIP"
    End Select
    
    PrepareTAB = oAdmin.Exec(sQuery, lstParams)
    Exit Function
    
errPrepareTab:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "PrepareTAB"
End Function

' Egy rekord állapotát változtatja (Aktív, selejt, nem felszerelhetõ) a RAKTAR táblában
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

'   LoadInfo
'
'   Feltölti a kiválasztott objektum adataival a képernyõt.
'   Paraméterek:    frm as Object   -   a feltöltendõ képernyõ
'                   sID as String   -   a raktár rekord id-je
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
Public Function LoadInfo(ByRef frm As Object, ByVal sID As Long) As Boolean
    On Error GoTo errLoadInfo
    LoadInfo = False
    
    Dim sQuery As String
    Dim lstParams As New Collection 'Betesszük az azonosítót a lekérdezés paraméterei közé
    
    sQuery = "sp_LoadRaktarInfo"
    
    lstParams.Add sID, "pID"
    
    Dim rs As New ADODB.Recordset   'Betöltjük az azonosító alapján a rekordot
    If oAdmin.LoadFirstRecord(sQuery, lstParams, rs) = True Then
        If ControlsSet(rs, frm) Then    'Ha sikerült, feltöltjük a képernyõ kontrolljait adatokkal.
            LoadInfo = True
        End If
    End If
    Exit Function
    
errLoadInfo:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "LoadInfo"
End Function    'LoadInfo

