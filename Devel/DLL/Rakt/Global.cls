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
'
'   Paraméterek:    -
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
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
    
    Init = True
    Exit Function
    
errInit:
End Function    'Init

'   RekordFeltolt
'
'   Feltölti a kiválasztott objektum adatival a képernyõt.
'
'   Paraméterek:    cmbMegnev As Object -   az objektum megnevezések combobox-a
'                   lstControls As Access.Controls  -   a képernyõn található kontrollok.
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function RekordFeltolt(ByRef frm As Object, ByVal sKategoria As String, ByVal sID As Long) As Boolean
    On Error GoTo errRekordFeltolt
    RekordFeltolt = False
    
    Dim lstParams As New Collection 'Betesszük az azonosítót a lekérdezés paraméterei közé
    lstParams.Add sID, "pID"
    
    Dim sQuery As String
    Select Case sKategoria
        Case "MUNKALAP"
            sQuery = "sp_LoadMunkalap"
        Case Else
            sQuery = "sp_LoadObjEgyedi"
    End Select
       
    Dim rs As New ADODB.Recordset   'Betöltjük az azonosító alapján a rekordot
    If oAdmin.LoadFirstRecord(sQuery, lstParams, rs) = True Then
        If ControlsSet(rs, frm) Then    'Ha sikerült, feltöltjük a képernyõ kontrolljait adatokkal.
            RekordFeltolt = True
        End If
    End If
    
    Exit Function
    
errRekordFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "RekordFeltolt"
End Function    'RekordFeltolt

'   RekordInsert
'
'   Rögzít egy rekordot a képernyõn látható adatok alapján
'
'   Paraméterek:    cmbOBJTIP As Object -   az objektumtípust meghatározó combobox
'                   lstControls as Access.Controls  -   a képernyõn található kontrollok
'
'   Visszatérés:    String, a tárolt eljárástól visszakapott érték
'
Public Function RekordInsert(ByRef frm As Object, ByVal sKategoria As String) As String
    On Error GoTo errRekordInsert
    RekordInsert = "-1"
    
    Dim sQuery As String
    Dim lstParams As New Collection 'és átadjuk majd paraméterként
    Dim sMLAPID As String
    
    Select Case sKategoria
        Case "MUNKALAP"
            sQuery = "sp_InsMunkalap"
        Case "Telj"
            sQuery = "sp_InsTeljm"
            sMLAPID = frm.Controls("txtOBJID").Text
            lstParams.Add sMLAPID, "MUNKALAP_ID"
        Case Else
            'sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)
            'lstParams.Add sOBJTIP, "pOBJTIP"
            sQuery = "sp_InsObjAlt"
    End Select
    
    ControlsGet lstParams, frm 'Lekérdezzük az összes látható kontroll értékét
    
    Dim rstResult As New ADODB.Recordset
    If oAdmin.ExecVal(sQuery, lstParams, rstResult) = True Then 'Végrehajtjuk az inzertet
        RekordInsert = CStr(rstResult(0).Value)
    End If
    Exit Function
    
errRekordInsert:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "RekordInsert"
End Function    'RekordInsert

'   RekordUpdate
'
'   Frissít egy rekordot a képernyõn látható adatok alapján
'
'   Paraméterek:    cmbMegnev As Object -   a frissítendõ objektumot meghatározó combobox
'                   lstControls As Access.Controls  -   a képernyõn található kontrollok
'                   sKategoria As String    -   meghatározza a frissítendõ adatok körét.
'                       Lehetséges értékek: "Alt", "Gep", "Vill", "Uzem"
'                       (Általános, Gépészeti, Villamos, Üzemeltetési)
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function RekordUpdate(ByRef frm As Object, ByVal sKategoria As String, ByVal sID As Long) As Boolean
    On Error GoTo errRekordUpdate
    RekordUpdate = False
    
    Dim sQuery As String
    Select Case sKategoria
        Case "MUNKALAP"
            sQuery = "sp_UpdMunkalap"
        Case "VISSZAIR"
            sQuery = "sp_UpdMunkalapVisszair"
        Case Else
            sQuery = "sp_UpdObj" & sKategoria
    End Select
    
    Dim lstParams As New Collection 'és átadjuk majd paraméterként
    lstParams.Add sID, "pID"
    
    ControlsGet lstParams, frm  'Lekérdezzük az összes látható kontroll értékét
    
    If oAdmin.Exec(sQuery, lstParams) = True Then 'Végrehajtjuk a frissítést
        RekordUpdate = True
    Else
    End If
    Exit Function
    
errRekordUpdate:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "RekordUpdate"
End Function    'RekordUpdate

'   RekordDel
'
'   Törli a kijelölt rekordot.
'
'   Paraméterek:    cmbMegnev As Object -   a törlendõ objektumot meghatározó combobox
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function RekordDel(ByVal sKategoria As String, ByVal sID As Long) As Boolean
    On Error GoTo errRekordDel
    RekordDel = False
    
    Dim lstParams As New Collection 'és átadjuk majd paraméterként
    lstParams.Add sID, "pID"
    
    Dim sQuery As String
    Select Case sKategoria
        Case "MUNKALAP"
            sQuery = "sp_DelMunkalap"
        Case "TELJ"
            sQuery = "sp_DelTeljm"
        Case Else
            sQuery = "sp_DelObj"
    End Select
    If oAdmin.Exec(sQuery, lstParams) = True Then   'Végrehajtjuk a törlést
        RekordDel = True
    End If
    Exit Function
    
errRekordDel:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "RekordDel"
End Function    'RekordDel

'   SetCombo
'
'   Feltölti a képernyõn található combobox-okat a kódszótár alapján.
'
'   Paraméterek:    lstControls As Access.Controls  -   a képernyõn található kontrollok
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
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
'
'   Paraméterek:    cmbCombo as Object  -   a lekérdezendõ combobox
'
'   Visszatérés:    String, a szöveg. Hiba esetén üres string.
'
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
'
'   Paraméterek:    cmbCombo as Object  -   a lekérdezendõ combobox
'
'   Visszatérés:    String, az érték. Hiba esetén üres string.
'
Public Function GetComboErtek(ByRef cmbCombo As Object) As String
    GetComboErtek = ComboBoxGet(Nothing, cmbCombo)
End Function    'GetComboErtek

Public Function Gridder(ByRef oGrid As Object, ByRef sKateg As String, _
        ByRef sOBJTIP As String, ByRef frm As Object) As Boolean
    Dim sFormatstring As String
    Dim sQuery As String
    Dim iMerge As Integer
    Dim sParam As String
    Dim lstParams As New Collection
    
    lstParams.Add sOBJTIP, "pOBJTIP"
    iMerge = 2
    Select Case sOBJTIP
        Case HOOSSZEGZO
            sFormatstring = "<||Gy.sz.|Hit.|Tip.|Elh.|Imp.|Leolv.|Fesz.|Plomba"
        Case VIZORA
            sFormatstring = "<||Gy.sz.|Hit.|Tip.|Elh.|Imp.|Átm.|Plomba"
        Case ERZEKELO
            sFormatstring = "<||Gy.sz.|Hit.|Elh.|Szonda|Hossz|Plomba"
    End Select
    
    Select Case sKateg
        Case "FELSZERELVE"
            sQuery = "sp_FillFelszerelve"
    
        Case "RAKTAR"
            sQuery = "sp_FillRaktaron"
    
        Case "SZALLITONAL"
            sQuery = "sp_FillSzallitonal"
    End Select
    
    FillGrid sQuery, lstParams, oGrid, sFormatstring, iMerge
End Function    'GridderX

