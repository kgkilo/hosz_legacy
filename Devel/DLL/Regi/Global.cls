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

Const PERM_NULL = 0
Const PERM_RO = 1
Const PERM_RW = 2

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
Public Function Init(ByVal sConnect As String) As Boolean
    On Error GoTo errInit
    Init = False

    'If CDate(Now()) > "1999/12/31" Then
    '    MsgBox "A program nem mûködõképes mindaddig, amíg a Mininform Kft (06-62-489-167) ki nem fizeti a programozóknak az õket megilletõ vállalkozási díjat."
    '    Init = False
    '    Exit Function
    'End If
    
    oAdmin.Login sConnect   'Bejelentkezik az SQL szerverre
    m_sConnect = sConnect
    
    g_oKodszotar.Load "sp_Q271", Nothing, "271", "Szervezeti egység", 2  'Betöltjük a kódszótári elemeket
    g_oKodszotar.Load "sp_Q272", Nothing, "272", "Hõlépcsõ", 3
    g_oKodszotar.Load "sp_Q274", Nothing, "274", "Épület típusa", 3
    g_oKodszotar.Load "sp_Q275", Nothing, "275", "Fûtési mód", 3
    g_oKodszotar.Load "sp_Q276", Nothing, "276", "Légtelenítõ típusa", 3
    g_oKodszotar.Load "sp_Q277", Nothing, "277", "Fûtõtest típusa", 3
    g_oKodszotar.Load "sp_Q278", Nothing, "278", "Épület karbantartó", 3
    g_oKodszotar.Load "sp_Q279", Nothing, "279", "Mértékegység", 3
    g_oKodszotar.Load "sp_Q281", Nothing, "281", "Fûtési beszabályozás módja", 3
    g_oKodszotar.Load "sp_Q282", Nothing, "282", "Cirkulációs strang típusa", 3
    g_oKodszotar.Load "sp_Q283", Nothing, "283", "HMV rendszer típusa", 3
    g_oKodszotar.Load "sp_Q284", Nothing, "284", "Cirkulációs szabályozás módja", 3
    g_oKodszotar.Load "sp_Q285", Nothing, "285", "Közeg", 3
    g_oKodszotar.Load "sp_Q288", Nothing, "288", "Fûtõvíz elosztása", 3
    g_oKodszotar.Load "sp_Q289", Nothing, "289", "Város", 1
    g_oKodszotar.Load "sp_Q291", Nothing, "291", "Szolgáltatás jellege", 2
    g_oKodszotar.Load "sp_Q293", Nothing, "293", "Típus hiba", 3
    g_oKodszotar.Load "sp_Q296", Nothing, "296", "Objektum típus", 2
    g_oKodszotar.Load "sp_Q297", Nothing, "297", "Üzemállapot", 1
    g_oKodszotar.Load "sp_Q298", Nothing, "298", "Mûvelet típusa", 2
    g_oKodszotar.Load "sp_Q299", Nothing, "299", "Idõegység", 2
    g_oKodszotar.Load "sp_Q300", Nothing, "300", "Karbantartás típusa", 2
    g_oKodszotar.Load "sp_Q302", Nothing, "302", "Jegyzõkönyv típusa", 1
    g_oKodszotar.Load "sp_Q304", Nothing, "304", "Beosztás", 2
    g_oKodszotar.Load "sp_Q305", Nothing, "305", "Szolgáltatás típusa", 2
    g_oKodszotar.Load "sp_Q306", Nothing, "306", "Munkavégzés/javítás típusa", 2
    g_oKodszotar.Load "sp_Q307", Nothing, "307", "Végzendõ feladat típusa", 2
    g_oKodszotar.Load "sp_Q308", Nothing, "308", "Észlelt jelenség típusa", 2
    g_oKodszotar.Load "sp_Q309", Nothing, "309", "Szolgálat típusa", 2
    g_oKodszotar.Load "sp_Q310", Nothing, "310", "Fõkönyvi szám", 12
    g_oKodszotar.Load "sp_Q311", Nothing, "311", "Munkalap szervezeti egység", 1
    g_oKodszotar.Load "sp_Q312", Nothing, "312", "Gyártó cég", 3
    g_oKodszotar.Load "sp_Q313", Nothing, "313", "Veszélyességi osztály", 1
    g_oKodszotar.Load "sp_Q314", Nothing, "314", "Kulcs található", 3
    g_oKodszotar.Load "sp_Q315", Nothing, "315", "Aláírásra jogosult", 3
    g_oKodszotar.Load "sp_Q316", Nothing, "316", "Leolvasási mód", 2
    g_oKodszotar.Load "sp_Q317", Nothing, "317", "Kategória", 2
    g_oKodszotar.Load "sp_Q318", Nothing, "318", "Szabályozás módja", 2
    g_oKodszotar.Load "sp_Q319", Nothing, "319", "Szivattyú fokozat", 2
    g_oKodszotar.Load "sp_Q320", Nothing, "320", "Boyler típus", 2
    g_oKodszotar.Load "sp_Q321", Nothing, "321", "Töltési mód", 2
    g_oKodszotar.Load "sp_Q322", Nothing, "322", "Szûrõ típus", 2
    g_oKodszotar.Load "sp_Q323", Nothing, "323", "Kimenet típusa", 2
    g_oKodszotar.Load "sp_Q324", Nothing, "324", "Mûködési mód", 3
    g_oKodszotar.Load "sp_Q325", Nothing, "325", "Szelep típus", 3
    g_oKodszotar.Load "sp_Q326", Nothing, "326", "Felépítés", 2
    g_oKodszotar.Load "sp_Q327", Nothing, "327", "Ütem", 2
    g_oKodszotar.Load "sp_Q328", Nothing, "328", "Légtelenítõ elhelyezése", 3
    g_oKodszotar.Load "sp_Q329", Nothing, "329", "Épület üzemeltetõje", 3
    g_oKodszotar.Load "sp_Q330", Nothing, "330", "Fûtési fõelzáró elhelyezése", 3
    g_oKodszotar.Load "sp_Q331", Nothing, "331", "Fûtõmû lekérdezés típusa", 20
    g_oKodszotar.Load "sp_Q332", Nothing, "332", "Hõközpont lekérdezés típusa", 20
    g_oKodszotar.Load "sp_Q333", Nothing, "333", "Épület lekérdezés típusa", 20
    g_oKodszotar.Load "sp_Q334", Nothing, "334", "Dolgozó", 3
    g_oKodszotar.Load "sp_Q335", Nothing, "335", "Munkalap állapota", 3
    g_oKodszotar.Load "sp_Q336", Nothing, "336", "Mûvelet rövid leirása", 3
    g_oKodszotar.Load "sp_Q337", Nothing, "337", "Munkalap típusa", 1
    g_oKodszotar.Load "sp_Q338", Nothing, "338", "Szolgáltatás", 1
    g_oKodszotar.Load "sp_Q339", Nothing, "339", "Fizetési mód", 1
    g_oKodszotar.Load "sp_Q340", Nothing, "340", "Szolgáltatás jellege", 1
    g_oKodszotar.Load "sp_Q341", Nothing, "341", "ÁFA kulcs", 2
    g_oKodszotar.Load "sp_Q342", Nothing, "342", "Cikk", 2
    g_oKodszotar.Load "sp_Q343", Nothing, "343", "Szerzõdés típus", 1
    g_oKodszotar.Load "sp_Q344", Nothing, "344", "Szerzõdés jellege", 2
    g_oKodszotar.Load "sp_Q345", Nothing, "345", "Lekérdezés Vízórára", 20
    g_oKodszotar.Load "sp_Q346", Nothing, "346", "Lekérdezés Érzékelõpárra", 20
    g_oKodszotar.Load "sp_Q347", Nothing, "347", "Lekérdezés Hõösszegzõre", 20
    g_oKodszotar.Load "sp_Q348", Nothing, "348", "Szerzõdés jellege", 2
    g_oKodszotar.Load "sp_Q349", Nothing, "349", "Gáznyomás minimum", 2
    g_oKodszotar.Load "sp_Q350", Nothing, "350", "Gáznyomás maximum", 2
    g_oKodszotar.Load "sp_Q351", Nothing, "351", "Égési levegõnyomás minimum", 2
    g_oKodszotar.Load "sp_Q352", Nothing, "352", "Porlasztási olajnyomás minimum", 2
    g_oKodszotar.Load "sp_Q353", Nothing, "353", "Porlasztási levegõnyomás minimum", 2
    g_oKodszotar.Load "sp_Q354", Nothing, "354", "Porlasztási gõznyomás minimum", 2
    g_oKodszotar.Load "sp_Q355", Nothing, "355", "Gõznyomás maximum", 2
    g_oKodszotar.Load "sp_Q356", Nothing, "356", "Vízgõz hõmérséklet maximum", 2
    g_oKodszotar.Load "sp_Q357", Nothing, "357", "Vészvízszint minimum", 2
    g_oKodszotar.Load "sp_Q358", Nothing, "358", "Füstgázcsappantyú retesz", 2
    g_oKodszotar.Load "sp_Q359", Nothing, "359", "Egyéb technológiai reteszek", 2
    g_oKodszotar.Load "sp_Q360", Nothing, "360", "Kétpont szabályzás", 2
    g_oKodszotar.Load "sp_Q361", Nothing, "361", "Hárompont szabályzás", 2
    g_oKodszotar.Load "sp_Q362", Nothing, "362", "Folyamatos szabályozás érzékelõ", 2
    g_oKodszotar.Load "sp_Q363", Nothing, "363", "Egyéb érzékelõ", 2
    g_oKodszotar.Load "sp_Q364", Nothing, "364", "Füstoldali tömörség", 2
    
    Init = True
    Exit Function
    
errInit:
End Function    'Init

'   ObjTipFeltolt
'
'   Feltölti az objektum típusokat tartalmazó combobox-ot.
'
'   Paraméterek:    cmbOBJTIP As Object - a feltöltendõ combobox
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function ObjTipFeltolt(ByRef cmbOBJTIP As Object) As Boolean
    On Error GoTo errObjTipFeltolt
    ObjTipFeltolt = ComboBoxSet(cmbOBJTIP, Nothing) 'Feltöltjük az OBJTIP comboboxot a kódszótárból
    Exit Function
    
errObjTipFeltolt:
End Function    'ObjTipFeltolt

'   MegnevFeltolt
'
'   Feltölti az objektum neveket tartalmazó combobox-ot a választott objektumtípusnak megfelelõen.
'
'   Paraméterek:    cmbMegnev As Object -   a feltöltendõ combobox
'                   cmbOBJTIP As Object -   az objektumtípusok combobox-a
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function MegnevFeltolt(ByRef cmbMegnev As Object, ByRef cmbOBJTIP As Object, Optional ByVal zzz As String) As Boolean
    On Error GoTo errMegnevFeltolt
    MegnevFeltolt = False
    
    Dim sSectName As String
    If TypeName(zzz) = "Nothing" Then
        sSectName = "MEGNEV"
    Else
        sSectName = zzz
    End If
    
    g_oKodszotar.Remove sSectName    'Töröljük az ál-kódszótári MEGNEV szekciót
    
    Dim sOBJTIP As String
    If TypeName(cmbOBJTIP) = "Nothing" Then
        sOBJTIP = "01"
    Else
        sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)   'Lekérdezzük az objektumtípust
    End If
    
    g_oKodszotar.Load "sp_FillObjMegnev", Array("pObjTip", sOBJTIP), sSectName, "Objektum megnevezése", 100
    MegnevFeltolt = ComboBoxSet(cmbMegnev, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    cmbMegnev.ListWidth = 350
    Exit Function
    
errMegnevFeltolt:
End Function    'MegnevFeltolt

Public Function MegnevFeltolt2(ByRef cmbMegnev As Object, ByRef sOBJTIP As String) As Boolean
    On Error GoTo errMegnevFeltolt2
    MegnevFeltolt2 = False
    
    Dim sSectName As String
    sSectName = "MEGNEV"
    
    g_oKodszotar.Remove sSectName    'Töröljük az ál-kódszótári MEGNEV szekciót
    
    g_oKodszotar.Load "sp_FillObjMegnev", Array("pObjTip", sOBJTIP), sSectName, "Objektum megnevezése", 100
    MegnevFeltolt2 = ComboBoxSet(cmbMegnev, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    cmbMegnev.ListWidth = 350
    Exit Function
    
errMegnevFeltolt2:
End Function    'MegnevFeltolt2

'   RekordFeltolt
'
'   Feltölti a kiválasztott objektum adatival a képernyõt.
'
'   Paraméterek:    cmbMegnev As Object -   az objektum megnevezések combobox-a
'                   lstControls As Access.Controls  -   a képernyõn található kontrollok.
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function RekordFeltolt(ByRef cmbMegnev As Object, ByRef lstControls As Access.Controls, ByVal sKategoria As String) As Boolean
    On Error GoTo errRekordFeltolt
    RekordFeltolt = False
    
    Dim sID As String   'Lekérdezzük a választott objektum azonosítóját
    sID = ComboBoxGet(Nothing, cmbMegnev)
    
    Dim lstParams As New Collection 'Betesszük az azonosítót a lekérdezés paraméterei közé
    lstParams.Add sID, "pID"
    
    Dim sQuery As String
    Select Case sKategoria
        Case "Alt"
            sQuery = "sp_LoadObjAlt"
        Case "Epul"
            sQuery = "sp_LoadEpul"
        Case "Dolgozo"
            sQuery = "sp_LoadDolgozo"
        Case "MUNKALAP"
            sQuery = "sp_LoadMunkalap"
        Case "Kontir"
            sQuery = "sp_LoadKontir"
        Case "Kepvis"
            sQuery = "sp_LoadKepvis"
        Case "Szerzfej"
            sQuery = "sp_LoadSzerzfej"
        Case "SzlaEgyedi"
            sQuery = "sp_LoadSzlaEgyedi"
        Case Else
            sQuery = "sp_LoadObjEgyedi"
    End Select
       
    Dim rs As New ADODB.Recordset   'Betöltjük az azonosító alapján a rekordot
    If oAdmin.LoadFirstRecord(sQuery, lstParams, rs) = True Then
        If ControlsSet(rs, lstControls) Then    'Ha sikerült, feltöltjük a képernyõ kontrolljait adatokkal.
            RekordFeltolt = True
        End If
    End If
    
    Exit Function
    
errRekordFeltolt:
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
Public Function RekordInsert(ByRef cmbOBJTIP As Object, ByRef lstControls As Access.Controls, ByVal sKategoria As String) As String
    On Error GoTo errRekordInsert
    RekordInsert = "-1"
    
    Dim sOBJTIP As String   'Lekérdezzük a tárolandó objektum típusát
    Dim sQuery As String
    Dim lstParams As New Collection 'és átadjuk majd paraméterként
    
    Select Case sKategoria
        Case "Epul"
            sOBJTIP = "01"
            sQuery = "sp_InsEpul"
        Case "Dolgozo"
            sQuery = "sp_InsDolgozo"
        Case "MUNKALAP"
            sQuery = "sp_InsMunkalap"
        Case "Kontir"
            sQuery = "sp_InsKontir"
        Case "Telj"
            sQuery = "sp_InsTeljm"
            sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)
            lstParams.Add sOBJTIP, "MUNKALAP_ID"
        Case "Arvalt"
            sQuery = "sp_InsArvalt"
        Case "Kepvis"
            sQuery = "sp_InsKepvis"
        Case "Jegyz"
            sQuery = "sp_InsJegyz"
        Case "Szerzfej"
            sQuery = "sp_InsSzerzfej"
        Case "SzlaEgyedi"
            sQuery = "sp_InsSzlaEgyedi"
        Case Else
            sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)
            lstParams.Add sOBJTIP, "pOBJTIP"
            sQuery = "sp_InsObjAlt"
    End Select
    
    ControlsGet lstParams, lstControls  'Lekérdezzük az összes látható kontroll értékét
    
    'oAdmin.BeginTrans
    Dim rstResult As New ADODB.Recordset
    If oAdmin.ExecVal(sQuery, lstParams, rstResult) = True Then 'Végrehajtjuk az inzertet
        'oAdmin.CommitTrans
        RekordInsert = CStr(rstResult(0).Value)
    Else
        'oAdmin.RollbackTrans
    End If
    Exit Function
    
errRekordInsert:
    'oAdmin.RollbackTrans
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
Public Function RekordUpdate(ByRef cmbMegnev As Object, ByRef lstControls As Access.Controls, ByVal sKategoria As String) As Boolean
    On Error GoTo errRekordUpdate
    RekordUpdate = False
    
    'oAdmin.BeginTrans
    
    Dim sQuery As String
    Select Case sKategoria
        Case "Epul"
            sQuery = "sp_UpdEpul"
        Case "Dolgozo"
            sQuery = "sp_UpdDolgozo"
        Case "MUNKALAP"
            sQuery = "sp_UpdMunkalap"
        Case "Kontir"
            sQuery = "sp_UpdKontir"
        Case "Kepvis"
            sQuery = "sp_UpdKepvis"
        Case "Szerzfej"
            sQuery = "sp_UpdSzerzfej"
        Case "SzlaEgyedi"
            sQuery = "sp_UpdSzlaEgyedi"
        Case Else
            sQuery = "sp_UpdObj" & sKategoria
    End Select
    
    Dim sID As String   'Lekérdezzük a frissítendõ objektum azonosítóját
    sID = ComboBoxGet(Nothing, cmbMegnev)
    
    Dim lstParams As New Collection 'és átadjuk majd paraméterként
    lstParams.Add sID, "pID"
    
    ControlsGet lstParams, lstControls  'Lekérdezzük az összes látható kontroll értékét
    
    If oAdmin.Exec(sQuery, lstParams) = True Then 'Végrehajtjuk a frissítést
        'oAdmin.CommitTrans
        RekordUpdate = True
    Else
        'oAdmin.RollbackTrans
    End If
    Exit Function
    
errRekordUpdate:
    'oAdmin.RollbackTrans
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
Public Function RekordDel(ByRef cmbMegnev As Object, ByVal sKategoria As String) As Boolean
    On Error GoTo errRekordDel
    RekordDel = False
    
    Dim sID As String   'Lekérdezzük a törlendõ objektum azonosítóját
    sID = ComboBoxGet(Nothing, cmbMegnev)
    
    Dim lstParams As New Collection 'és átadjuk majd paraméterként
    lstParams.Add sID, "pID"
    
    Dim sQuery As String
    Select Case sKategoria
        Case "Dolgozo"
            sQuery = "sp_DelDolgozo"
        Case "MUNKALAP"
            sQuery = "sp_DelMunkalap"
        Case "Kontir"
            sQuery = "sp_DelKontir"
        Case "Telj"
            sQuery = "sp_DelTeljm"
        Case "Arvalt"
            sQuery = "sp_DelArvalt"
        Case "Kepvis"
            sQuery = "sp_DelKepvis"
        Case "Szerzfej"
            sQuery = "sp_DelSzerzfej"
        Case "SzlaEgyedi"
            sQuery = "sp_DelSzlaEgyedi"
        Case Else
            sQuery = "sp_DelObj"
    End Select
    
    If oAdmin.Exec(sQuery, lstParams) = True Then   'Végrehajtjuk a törlést
        'oAdmin.CommitTrans
        RekordDel = True
    Else
        'oAdmin.RollbackTrans
    End If
    Exit Function
    
errRekordDel:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "RekordDel"
End Function    'RekordDel

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

'   SetCombo
'
'   Feltölti a képernyõn található combobox-okat a kódszótár alapján.
'
'   Paraméterek:    lstControls As Access.Controls  -   a képernyõn található kontrollok
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function SetCombo(ByRef lstControls As Access.Controls) As Boolean
    On Error GoTo errSetCombo
    SetCombo = False
    
    Dim oControl As Access.Control
    For Each oControl In lstControls    'Végigmegyünk az összes kontrolon,
        If Left(oControl.Name, 3) = "cmb" Then  'és ha combobox, akkor
            SetCombo = ComboBoxSet(oControl, Nothing)   'feltöltjük.
        End If
    Next
    Exit Function
    
errSetCombo:
End Function    'SetCombo

Public Function SetCombo2(ByRef cmbCombo As Object) As Boolean
    SetCombo2 = ComboBoxSet(cmbCombo, Nothing)
End Function    'SetCombo2

Public Function SetComboVal(ByRef cmbCombo As Object, ByRef sID As String) As Boolean
    SetComboVal = ComboBoxSetBase(cmbCombo, sID)
End Function    'SetComboVal

Public Function SetPermis(ByRef cmbOBJTIP As Object, ByRef lstControls As Access.Controls, Optional ByVal enable As Integer) As Boolean
    On Error GoTo errSetPermis
    SetPermis = False
    
    Dim iEnable As Integer
    If TypeName(enable) = "Nothing" Then
        iEnable = 0
    Else
        iEnable = enable
    End If
    
    Dim sOBJTIP As String
    sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)   'Lekérdezzük a választott objektum típusát
    
    Dim lstParams As New Collection
    lstParams.Add sOBJTIP, "pOBJTIP"
    
    Dim rs As New ADODB.Recordset
    
    oAdmin.LoadFirstRecord "sp_GetPermis", lstParams, rs
    
    Dim sFieldName As String
    Dim sPrefix As String
    Dim oControl As Access.Control
    For Each oControl In lstControls
        sPrefix = Left(oControl.Name, 3)
        sFieldName = Mid(oControl.Name, 4)  'A kontroll neve tartalmazza a hozzá kapcsolt mezõ nevét
        If sPrefix = "txt" Or sPrefix = "cmb" Or sPrefix = "chk" Then ' Or sPrefix = "lbl" Then
            Select Case rs(sFieldName).Value
                Case 0  'nem látható, nem javítható
                    ''oControl.Locked = True  'nem javíthat bele
                    oControl.Enabled = False    'letiltjuk a kontrollt,
                    oControl.Visible = False
                
                Case 1  'látható, nem javítható
                    oControl.Visible = True
                    oControl.Enabled = iEnable 'False
                    
                Case 2 'látható, javítható
                    'oControl.Locked = False 'belejavíthat
                    oControl.Enabled = True 'engedélyezzük a kontrollt,
                    oControl.Visible = True
                    
                Case Else   'Csak fejlesztésre!!!
                    oControl.Visible = False
            End Select
        ElseIf sPrefix = "lbl" Then
            If Right(sFieldName, 2) = "_X" Then
                sFieldName = Mid(sFieldName, 1, Len(sFieldName) - 2)
            End If
            Select Case rs(sFieldName).Value
                Case 0
                    oControl.Visible = False
                    oControl.ForeColor = -2147483633
                    
                Case 1
                    oControl.Visible = True
                    oControl.ForeColor = 0  '9868950 * iEnable  'szürke
                    
                Case 2
                    oControl.Visible = True
                    oControl.ForeColor = 0  'Black is beautiful
            End Select
        End If
    Next
    
    SetPermis = True
    Exit Function
    
errSetPermis:
End Function    'SetPermis

Public Function CheckFields(ByRef cmbOBJTIP As Object, ByRef lstControls As Access.Controls) As String
    On Error GoTo errCheckFields
    CheckFields = ""
    
    Dim sOBJTIP As String
    sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)   'Lekérdezzük a választott objektum típusát
    
    Dim lstParams As New Collection
    lstParams.Add sOBJTIP, "pOBJTIP"
    
    Dim rs As New ADODB.Recordset
    
    oAdmin.LoadFirstRecord "sp_GetPermis", lstParams, rs
    
    Dim sFieldName As String
    Dim sPrefix As String
    Dim oControl As Access.Control
    For Each oControl In lstControls
        sPrefix = Left(oControl.Name, 3)
        sFieldName = Mid(oControl.Name, 4)  'A kontroll neve tartalmazza a hozzá kapcsolt mezõ nevét
        If sPrefix = "chk" Or sPrefix = "cmb" Or sPrefix = "txt" Then
            MsgBox sFieldName
            If rs(sFieldName).Value = 2 Then
                MsgBox "ketto", , oControl.Name
                Select Case sPrefix
                    Case "chk"
                    
                    Case "cmb"
                        MsgBox oControl.ListIndex, , oControl.Name
                        If oControl.ListIndex = -1 Then
                            CheckFields = oControl.Name
                            Exit Function
                        End If
                        
                    Case "txt"
                        If oControl.Value = Null Then
                            MsgBox "null", , oControl.Name
                        Else
                            MsgBox oControl.Value, , oControl.Name
                        End If
                        If oControl.Value = Null Or oControl.Value = "" Then
                            CheckFields = oControl.Name
                            Exit Function
                        End If
                End Select
            End If
        End If
    Next
    
    Exit Function
    
errCheckFields:
End Function    'CheckFields

'   GetInfo
'
'   Visszaadja az aktuálisan kiválasztott objektumhoz a kisegítõ információkat
'
'   Paraméterek:    cmbMegnev As Object -   az objektumokat tartalmazó combobox
'                   lstControls As Access.Controls  -   az info subform kontrolljai
'                   sKategoria As String    -   "Alt" vagy "Spec", melyik eljárást hívja meg...
'
'   Visszatérés:    Boolean -   True, ha minden OK
'
Public Function GetInfo(ByRef cmbMegnev As Object, ByRef lstControls As Access.Controls, sKategoria As String) As Boolean
    On Error GoTo errGetInfo
    GetInfo = False
    
    Dim sID As String   'Lekérdezzük a szóban forgó objektum azonosítóját
    sID = ComboBoxGet(Nothing, cmbMegnev)
    
    If sID <> "" Then
        GetInfo = GetInfoCommon(sID, lstControls, sKategoria)
    Else
        GetInfo = False
    End If
    Exit Function

errGetInfo:
End Function    'GetInfo

'   ElozoKapcsKiir
'
'   Visszaadja az aktuálisan kiválasztott objektumhoz megõrzött korábbi kapcsolatot
'
'   Paraméterek:    cmbMegnev As Object -   az objektumokat tartalmazó combobox
'                   lstControls As Access.Controls  -   az info subform kontrolljai
'                   sKategoria As String    -   "Alt" vagy "Spec", melyik eljárást hívja meg...
'
'   Visszatérés:    Boolean -   True, ha minden OK
'
Public Function ElozoKapcsKiir(ByRef lstControlsSub As Access.Controls, ByRef lstControls As Access.Controls) As Boolean
    On Error GoTo errElozoKapcsKiir
    ElozoKapcsKiir = False

    Dim sParam As String
    sParam = ComboBoxGet(Nothing, lstControls("cmbMEGNEV")) 'Lekérdezzük a szóban forgó objektum id-jét

    If sParam <> "" Then
        Dim lstParams As New Collection 'és átadjuk majd paraméterként
        lstParams.Add sParam, "pID"
        
        lstParams.Add ComboBoxGet(Nothing, lstControls("cmbOBJTIP")), "pOBJTIP"   'ilyen objektum alatt keresek
        lstParams.Add ComboBoxGet(Nothing, lstControls("cmbOBJTIP2")), "pOBJTIP2" 'ilyen objektum típusokból keresek

        Dim sQuery As String    'Ha a kategória "Alt", akkor csak a fûtõmû nevét adja majd vissza
        sQuery = "sp_GetElozoKapcs"
    
        Dim rs As New ADODB.Recordset   'Betöltjük az azonosító alapján a rekordot
        If oAdmin.LoadFirstRecord(sQuery, lstParams, rs) = True Then    'és ha sikerült
            ElozoKapcsKiir = ControlsSet(rs, lstControlsSub)  'feltöltjük a kontrollokat.
        End If
    Else
        ElozoKapcsKiir = False
    End If
    
    Exit Function

errElozoKapcsKiir:
End Function    'ElozoKapcsKiir

'   GetGridInfo
'
'   Visszaadja az aktuálisan kiválasztott gridsorban szereplõ objektumhoz a kisegítõ információkat
'
'   Paraméterek:    grd As Object   -   a grid
'                   lstControls As Access.Controls  -   az info subform kontrolljai
'                   sKategoria As String    -   "Alt" vagy "Spec", melyik eljárást hívja meg...
'
'   Visszatérés:    Boolean -   True, ha minden OK
'
Public Function GetGridInfo(ByRef grd As Object, ByRef lstControls As Access.Controls, sKategoria As String) As Boolean
    On Error GoTo errGetGridInfo
    GetGridInfo = False
    
    Dim sID As String   'Lekérdezzük a szóban forgó objektum azonosítóját
    sID = CStr(grd.TextMatrix(grd.RowSel, 1))
    
    GetGridInfo = GetInfoCommon(sID, lstControls, sKategoria)
    Exit Function

errGetGridInfo:
End Function    'GetGridInfo

Private Function GetInfoCommon(sID As String, ByRef lstControls As Access.Controls, sKategoria As String) As Boolean
    On Error GoTo errGetInfoCommon
    GetInfoCommon = False
    
    Dim lstParams As New Collection 'és átadjuk majd paraméterként
    lstParams.Add sID, "pID"
    
    Dim sQuery As String    'Ha a kategória "Alt", akkor csak a fûtõmû nevét adja majd vissza
    Select Case sKategoria
        Case "Alt"
            sQuery = "sp_GetInfoAlt"
        Case "Karb" 'Ha "Karb", akkor a jegyzõkönyv felvitelnél szükséges karbantartási adatokat
            sQuery = "sp_GetJegyzKarbInfo"
        Case "KarbLekerd"
            sQuery = "sp_GetKarbLekerdInfo"
        Case Else   'Ha viszont "Spec", akkor a kapcsolt fûtõmû nevét, illetve az obj. egyéb adatait is.
            sQuery = "sp_GetInfoSpec"
    End Select
    
    Dim rs As New ADODB.Recordset   'Betöltjük az azonosító alapján a rekordot
    If oAdmin.LoadFirstRecord(sQuery, lstParams, rs) = True Then    'és ha sikerült
        GetInfoCommon = ControlsSet(rs, lstControls)  'feltöltjük a kontrollokat.
    End If
    Exit Function
    
errGetInfoCommon:
End Function

Public Function Duplikal(ByRef cmbMegnev As Object, sKategoria As String) As Long
    On Error GoTo errDuplikal
    Duplikal = 0
    
    Dim sID As String
    sID = ComboBoxGet(Nothing, cmbMegnev)
    
    Dim lstParams As New Collection
    lstParams.Add sID, "pID"
    
    Dim sQuery As String
    Select Case sKategoria
        Case "Epul"
            sQuery = "sp_DuplikalEpul"
        Case "Dolgozo"
            sQuery = "sp_DuplikalDolgozo"
        Case Else
            sQuery = "sp_Duplikal"
    End Select
    
    Dim rst As New ADODB.Recordset
    If oAdmin.ExecVal(sQuery, lstParams, rst) = True Then
        Duplikal = rst(0).Value
    End If
    Exit Function
    
errDuplikal:
    Duplikal = 0
End Function

Public Function DuplUtanKivalaszt(ByRef cmbMegnev As Object, ByVal lMelyik As Long) As Boolean
    Dim i As Integer
    For i = 1 To g_oKodszotar.Section(cmbMegnev.Tag).KodList.Count
        If g_oKodszotar.Section(cmbMegnev.Tag).KodList.Item(i).Ertek = lMelyik Then Exit For
    Next i
    
    cmbMegnev.ListIndex = i - 1
End Function

Public Function KapcsoloListFeltolt(ByRef cmbOBJTIP As Object, ByRef cmbMegnev As Object, _
    ByRef grdNotConnected As Object, ByRef grdConnected As Object) As Boolean
    On Error GoTo errKapcsoloListFeltolt
    KapcsoloListFeltolt = False
    
    Dim lstParams As New Collection
    Dim sParam As String
    Dim sHeader As String
    Dim i As Integer
    
    sParam = ComboBoxGet(Nothing, cmbMegnev)
    lstParams.Add sParam, "pID"
    sParam = ComboBoxGet(Nothing, cmbOBJTIP)    'Lekérdezzük az objektumtípust
    lstParams.Add sParam, "pOBJTIP"
    
    Select Case sParam
        Case "01"
            sHeader = "<||Utca|Hsz|Epulsz|Helyr.sz."
        Case Else
            sHeader = "<||Megnevezés|Típus|Telep.hsz.|Gy.szám"
    End Select
    
    With grdNotConnected
        .FormatString = sHeader
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        FillGrid "sp_FillNotConnected", lstParams, grdNotConnected
    
        .AutoSize 2, .Cols - 1
        .ColWidth(1) = 0
        
        .MergeCells = flexMergeRestrictColumns
        For i = 1 To 4
            .MergeCol(i) = True
        Next i
    End With

    With grdConnected
        .FormatString = sHeader
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        FillGrid "sp_FillConnected", lstParams, grdConnected
    
        .AutoSize 2, .Cols - 1
        .ColWidth(1) = 0
        
        .MergeCells = flexMergeRestrictColumns
        For i = 1 To 4
            .MergeCol(i) = True
        Next i
    End With

    KapcsoloListFeltolt = True
    Exit Function
    
errKapcsoloListFeltolt:
End Function

Public Function Kapcsol(ByRef cmbMegnev As Object, ByRef grdNotConnected As Object) As Boolean
    On Error GoTo errKapcsol
    Kapcsol = False

    Dim sID1 As String
    Dim sID2 As String

    sID1 = ComboBoxGet(Nothing, cmbMegnev)
    sID2 = CStr(grdNotConnected.TextMatrix(grdNotConnected.RowSel, 1))

    Dim lstParams As New Collection
    lstParams.Add sID1, "pID1"
    lstParams.Add sID2, "pID2"

    Kapcsol = oAdmin.Exec("sp_Kapcsol", lstParams)
    Exit Function
    
errKapcsol:
End Function

Public Function Szetkapcsol(ByRef cmbMegnev As Object, ByRef grdConnected As Object) As Boolean
    On Error GoTo errSzetkapcsol
    Szetkapcsol = False
    
    Dim sID1 As String
    Dim sID2 As String
    
    sID1 = ComboBoxGet(Nothing, cmbMegnev)
    sID2 = CStr(grdConnected.TextMatrix(grdConnected.RowSel, 1))
    
    Dim lstParams As New Collection
    lstParams.Add sID1, "pID1"
    lstParams.Add sID2, "pID2"
    
    Szetkapcsol = oAdmin.Exec("sp_Szetkapcsol", lstParams)
    Exit Function
    
errSzetkapcsol:
End Function

Public Function Gridder(ByRef cmbOBJTIP As Object, ByRef cmbMegnev As Object, _
                        ByRef grd As Object, ByRef cmbPar As Object, _
                        ByRef objParTol As Object, ByRef objParIg As Object, _
                        ByRef sKateg As String) As Boolean
    On Error GoTo errGridder
    Gridder = False
        
    Dim sOBJTIP As String
    Dim sID As String
    Dim sParamName As String
    Dim sParamTol As String
    Dim sParamIg As String
    Dim sQry As String
    Dim sHeader As String
    
    If TypeName(cmbOBJTIP) = "Nothing" Or cmbOBJTIP = Null Then
        sOBJTIP = ""
    Else
        sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)   'Lekérdezzük az objektumtípust
    End If
    
    If TypeName(cmbMegnev) = "Nothing" Or cmbMegnev = Null Then
        sID = ""
    Else
        sID = ComboBoxGet(Nothing, cmbMegnev)
    End If
    
    If TypeName(cmbPar) <> "Nothing" Then
        sParamName = ComboBoxGet(Nothing, cmbPar)
        If TypeName(objParTol) <> "Nothing" And TypeName(objParIg) <> "Nothing" _
            And (Not IsNull(objParTol)) And (Not IsNull(objParIg)) Then
            If TypeName(objParTol) = "Textbox" Then
                sParamTol = objParTol.Value
                sParamIg = objParIg.Value
            Else
                sParamTol = ComboBoxGet(Nothing, objParTol)
                sParamIg = ""
            End If
        Else
            sParamTol = ""
            sParamIg = ""
        End If
    Else
        sParamName = ""
        sParamTol = ""
        sParamIg = ""
    End If
    
    Select Case sKateg
    Case "Dolgozo"
        sQry = "sp_LekerdDolgozo"
        sHeader = "<||Név|Szerv. egység|Beosztás"
    Case "Kontir"
        sQry = "sp_LekerdKontir"
        sHeader = "<||F. szám.|Név|Kijelölt"
    Case "TAB406"
        oAdmin.Exec "sp_MakeTAB406", Nothing
        sQry = "sp_UseTAB406"
        sHeader = "<||Név|EL|FO|GB|GT|LA|LE|LF|VT"
    Case Else
        If sID <> "" Then
            Gridder = Gridder4(grd, sOBJTIP, sID, sParamName, sParamTol, sParamIg)
            Exit Function
        Else
            sQry = "sp_LekerdAlt"
            sHeader = ""
        End If
    End Select
    
    Gridder = GridderBase(grd, sQry, sOBJTIP, sID, sParamName, sParamTol, sParamIg, sHeader)
    Exit Function
    
errGridder:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "Gridder"
End Function

Public Function Gridder2(ByRef cmbMegnev As Object, ByRef cmbOBJTIP As Object, ByRef grd As Object) As Boolean
    On Error GoTo errGridder2
    Gridder2 = False
    
    Dim sOBJTIP As String
    sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)   'Lekérdezzük az objektumtípust
    
    Dim sID As String
    sID = ComboBoxGet(Nothing, cmbMegnev)
  
    Dim lstParams As New Collection
    lstParams.Add sOBJTIP, "pOBJTIP"
    lstParams.Add sID, "pID"
    
    Dim rstHeader As New ADODB.Recordset
    Dim rstFirstRecord As New ADODB.Recordset
    oAdmin.ExecVal "sp_GetGridHeader", Nothing, rstHeader
    oAdmin.ExecVal "sp_GetKapcs", lstParams, rstFirstRecord
    
    Dim sHeader As String
    sHeader = "<"
    Dim i As ADODB.Field
    For Each i In rstFirstRecord.Fields
        If i.Name <> "ID" Then
            sHeader = sHeader & "|" & rstHeader.Fields.Item(i.Name).Value
        End If
    Next
    
    With grd
        .FormatString = sHeader
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        Dim lstID As New Collection
        FillGrid2 lstID, sID, sOBJTIP
        
        'itt van a tényleges fill
        Dim ActRows As Long
        Dim iCols As Integer
        Dim iCurCol As Integer
        Dim lCurRow As Long
        Dim vCellValue As Variant
        
        Dim rstRecordset As ADODB.Recordset
        
        .Redraw = False
        iCols = rstFirstRecord.Fields.Count
        .Cols = iCols + 1
        lCurRow = 0
        ActRows = 1
        .BackColor = &H80000005
        
        Dim z As Variant
        For Each z In lstID
            lstParams.Remove ("pID")
            lstParams.Add CStr(z), "pID"
            oAdmin.ExecVal "sp_GetKapcs", lstParams, rstRecordset
            If Not rstRecordset.EOF Then
                lCurRow = lCurRow + 1
                .Rows = lCurRow + 1
                For iCurCol = 0 To iCols - 1
                    vCellValue = rstRecordset.Fields(iCurCol).Value
                    If IsNull(vCellValue) Then
                        .TextMatrix(lCurRow, iCurCol + 1) = ""
                    Else
                        .TextMatrix(lCurRow, iCurCol + 1) = vCellValue
                    End If
                Next iCurCol
            End If
        Next
    
        If lCurRow > 0 Then
            .Select ActRows, IIf(iCols < 3, iCols, 3), ActRows, IIf(iCols < 3, iCols, 3) 'iCols
            .TopRow = ActRows
            .LeftCol = 1 'ActRows
        End If
   
        .Row = 1
        .Col = 1
        .ColSel = 2
        .Sort = flexSortStringAscending
    
        .AutoSize 0, grd.Cols - 1
        .MergeCells = flexMergeFree
        .MergeCol(1) = True
        
        .Redraw = True
    End With
    
    Gridder2 = True
    Exit Function
    
errGridder2:
End Function

Public Function Gridder4(ByRef grd As Object, ByRef sOBJTIP As String, _
                        ByRef sID As String, ByRef sParamName As String, _
                        ByRef sParamTol As String, ByRef sParamIg As String) As Boolean
    On Error GoTo errGridder4
    Gridder4 = False
    
    Dim lstParams As New Collection
    If sOBJTIP <> "" Then lstParams.Add sOBJTIP, "pOBJTIP"
    'If sID <> "" Then lstParams.Add sID, "pID"
    If sParamName <> "" Then
        If sParamIg <> "" Then
            lstParams.Add sParamTol, sParamName & "TOL"
            lstParams.Add sParamIg, sParamName & "IG"
        Else
            lstParams.Add sParamTol, sParamName
        End If
    End If
    
    Dim rstHeader As New ADODB.Recordset
    Dim rstFirstRecord As New ADODB.Recordset
    oAdmin.ExecVal "sp_GetGridHeader", Nothing, rstHeader
    oAdmin.ExecVal "sp_LekerdAlt", lstParams, rstFirstRecord
    
    Dim sHeader As String
    sHeader = "<"
    Dim i As ADODB.Field
    For Each i In rstFirstRecord.Fields
        If i.Name <> "ID" Then
            sHeader = sHeader & "|" & rstHeader.Fields.Item(i.Name).Value
        Else
            sHeader = sHeader & "|" & "ID"
        End If
    Next
    
    With grd
        .FormatString = sHeader
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        Dim lstID As New Collection
        FillGrid2 lstID, sID, sOBJTIP
        
        'itt van a tényleges fill
        Dim ActRows As Long
        Dim iCols As Integer
        Dim iCurCol As Integer
        Dim lCurRow As Long
        Dim vCellValue As Variant
        
        Dim rstRecordset As ADODB.Recordset
        
        .Redraw = False
        iCols = rstFirstRecord.Fields.Count
        .Cols = iCols + 1
        lCurRow = 0
        ActRows = 1
        .BackColor = &H80000005
        
        Dim z As Variant
        lstParams.Add "zzz", "pID"
        For Each z In lstID
            lstParams.Remove ("pID")
            lstParams.Add CStr(z), "pID"
            oAdmin.ExecVal "sp_LekerdAlt", lstParams, rstRecordset
            If Not rstRecordset.EOF Then
                lCurRow = lCurRow + 1
                .Rows = lCurRow + 1
                For iCurCol = 0 To iCols - 1
                    vCellValue = rstRecordset.Fields(iCurCol).Value
                    If IsNull(vCellValue) Then
                        .TextMatrix(lCurRow, iCurCol + 1) = ""
                    Else
                        .TextMatrix(lCurRow, iCurCol + 1) = vCellValue
                    End If
                Next iCurCol
            End If
        Next
    
        If lCurRow > 0 Then
            .Select ActRows, IIf(iCols < 3, iCols, 3), ActRows, IIf(iCols < 3, iCols, 3) 'iCols
            .TopRow = ActRows
            .LeftCol = 1 'ActRows
        End If
   
        .Row = 1
        .Col = 1
        .ColSel = 2
        .Sort = flexSortStringAscending
    
        .AutoSize 2, .Cols - 1
        .ColWidth(1) = 0
        '.MergeCells = flexMergeFree
        '.MergeCol(1) = True
        
        .Redraw = True
    End With
    
    Gridder4 = True
    Exit Function
    
errGridder4:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "Gridder4"
End Function

Private Function FillGrid2(ByRef lstID As Collection, ByVal sID As String, ByVal sOBJTIP As String) As Integer
    On Error GoTo errFillGrid2
    
    Dim lstParams As New Collection

    lstParams.Add sID, "pID"
    Dim rstID As New ADODB.Recordset
    
    oAdmin.ExecVal "sp_ListKapcsID", lstParams, rstID
    
    If sOBJTIP = "" Then    'Ha nem kell objektumtípusra szûrni,
        Do While Not rstID.EOF  'akkor egyszerûen felfûzzük az összes kapott ID-t
            lstID.Add rstID(0).Value    'az lstID collection-be.
            FillGrid2 lstID, rstID(0).Value, sOBJTIP
            rstID.MoveNext
        Loop
    Else    'Ha kell objektumtípsra szûrni,
        Do While Not rstID.EOF  'akkor megnézzük, hogy megfelelõ típusú-e
            If rstID(1).Value = sOBJTIP Then    'és csak akkor tesszük be az lstID collection-be
                lstID.Add rstID(0).Value
            End If
            FillGrid2 lstID, rstID(0).Value, sOBJTIP
            rstID.MoveNext
        Loop
    End If
    
    FillGrid2 = rstID.RecordCount
    Exit Function
    
errFillGrid2:
    FillGrid2 = -1
End Function

'   DolgozoFeltolt
'
'   Feltölti a dolgozói neveket tartalmazó combobox-ot
'
'   Paraméterek:    cmbDolgozo As Object    -   a feltöltendõ combobox
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function DolgozoFeltolt(ByRef cmbDolgozo As Object) As Boolean
    On Error GoTo errDolgozoFeltolt
    DolgozoFeltolt = False
    
    g_oKodszotar.Remove "DOLGOZO"   'Töröljük az ál-kódszótári DOLGOZO szekciót
    g_oKodszotar.Remove "334"
    
    g_oKodszotar.Load "sp_FillDolgozo", Nothing, "DOLGOZO", "Dolgozók", 100
    g_oKodszotar.Load "sp_Q334", Nothing, "334", "Dolgozó", 3
    DolgozoFeltolt = ComboBoxSet(cmbDolgozo, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    'cmbDolgozo.ListWidth = 350
    Exit Function
    
errDolgozoFeltolt:
End Function    'DolgozoFeltolt

'   MunkalapszamFeltolt
'
'   Feltölti a munkalapok számait tartalmazó combobox-ot
'
'   Paraméterek:    cmbMunkalapszam As Object   -   a feltöltendõ combobox
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function MunkalapszamFeltolt(ByRef cmbMunkalapszam As Object, ByRef sMtip As String, ByRef sID As String) As Boolean
    'On Error GoTo errMunkalapszamFeltolt
    MunkalapszamFeltolt = False
    
    g_oKodszotar.Remove "MUNKALAPSZAM"  'Töröljük az ál-kódszótári MUNKALAPSZAM szekciót
    g_oKodszotar.Load "sp_FillMunkalapszam", Array("pMTIP", sMtip), "MUNKALAPSZAM", "Munkalapok számai", 100
    
    If sID = "" Then
        MunkalapszamFeltolt = ComboBoxSet(cmbMunkalapszam, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    Else
        MunkalapszamFeltolt = ComboBoxSetBase(cmbMunkalapszam, sID) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    End If
    cmbMunkalapszam.ListWidth = 350
    Exit Function
    
errMunkalapszamFeltolt:
End Function    'MunkalapszamFeltolt

'   KontirFeltolt
'
'   Feltölti a kontírozó törzs neveket tartalmazó combobox-ot
'
'   Paraméterek:    cmbKontir As Object -   a feltöltendõ combobox
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function KontirFeltolt(ByRef cmbKontir As Object) As Boolean
    On Error GoTo errKontirFeltolt
    KontirFeltolt = False
    
    g_oKodszotar.Remove "310"   'Töröljük az ál-kódszótári 310 szekciót
    
    g_oKodszotar.Load "sp_Q310", Nothing, "310", "Kontír", 12
    KontirFeltolt = ComboBoxSet(cmbKontir, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    cmbKontir.ListWidth = 350
    Exit Function
    
errKontirFeltolt:
End Function    'KontirFeltolt

Public Function MunkalapObjFeltolt(ByRef cmbMunkalapszam As Object, ByRef cmbOBJTIP As Object, ByRef cmbOBJID As Object) As Boolean
    On Error GoTo errMunkalapObjFeltolt
    MunkalapObjFeltolt = False

    g_oKodszotar.Remove "MUNKALAP_OBJ"  'Töröljük az ál-kódszótári MUNKALAP_OBJ szekciót

    Dim sOBJTIP As String
    sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)   'Lekérdezzük az objektumtípust

    g_oKodszotar.Load "sp_MlapObjFeltolt", Array("pObjTip", sOBJTIP), "MUNKALAP_OBJ", "Munkalaphoz tartozó objektum megnevezése", 100

    Dim sID As String
    sID = ComboBoxGet(Nothing, cmbMunkalapszam)

    If sID <> "" Then
        Dim lstParams As New Collection
        lstParams.Add sID, "pID"

        Dim rst As New ADODB.Recordset
        If oAdmin.ExecVal("sp_LoadMunkalap", lstParams, rst) = True Then
            If IsNull(rst("OBJID").Value) Then
                ComboBoxSet cmbOBJID, Nothing
            Else
                If rst("OBJTIP").Value <> "01" And rst("OBJTIP").Value <> "02" Then
                    ComboBoxSet cmbOBJID, rst("OBJID")
                    cmbOBJID.ListWidth = 350
                    'cmbOBJID.BoundColumn = 2
                    MunkalapObjFeltolt = True
                Else
                    cmbOBJTIP.ListIndex = -1
                    cmbOBJID.Clear
                End If
            End If
        End If
    Else
        ComboBoxSet cmbOBJID, Nothing
        cmbOBJID.ListWidth = 350
        'cmbOBJID.BoundColumn = 2
        MunkalapObjFeltolt = True
    End If
    Exit Function

errMunkalapObjFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "MunkalapObjFeltolt"
End Function    'MunkalapObjFeltolt

Public Function MunkalapEpulFeltolt(ByRef cmbMunkalapszam As Object, ByRef cmbEPUL As Object) As Boolean
    On Error GoTo errMunkalapEpulFeltolt
    MunkalapEpulFeltolt = False
    
    g_oKodszotar.Remove "MUNKALAP_EPUL"  'Töröljük az ál-kódszótári MUNKALAP_EPUL szekciót
    
    g_oKodszotar.Load "sp_FillObjMegnev", Array("pObjTip", "37"), "MUNKALAP_EPUL", "Munkalaphoz tartozó épület megnevezése", 100
    
    Dim sID As String
    sID = ComboBoxGet(Nothing, cmbMunkalapszam)
    
    If sID <> "" Then
        Dim lstParams As New Collection
        lstParams.Add sID, "pID"
        
        Dim rst As New ADODB.Recordset
        If oAdmin.ExecVal("sp_LoadMunkalap", lstParams, rst) = True Then
            ComboBoxSet cmbEPUL, rst("OBJID")
            cmbEPUL.ListWidth = 350
            MunkalapEpulFeltolt = True
        End If
    Else
        ComboBoxSet cmbEPUL, Nothing
        MunkalapEpulFeltolt = True
    End If
    Exit Function
    
errMunkalapEpulFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "MunkalapEpuletFeltolt"
End Function    'MunkalapEpulFeltolt

Public Function MunkalapFszamValaszt(ByRef cmbFszam As Object, ByRef cmbOBJTIP As Object, ByRef cmbMegnev As Object) As Boolean
    'On Error GoTo errMunkalapFszamValaszt
    MunkalapFszamValaszt = False
    
    Dim sFszam As String
    sFszam = ComboBoxGet(Nothing, cmbFszam)
    
    Dim lstParams As New Collection
    lstParams.Add sFszam, "pFSZAM"
    
    Dim rst As New ADODB.Recordset
    If oAdmin.ExecVal("sp_GetFszamInfo", lstParams, rst) = True Then
        If Not rst.EOF Then
            ComboBoxSet cmbOBJTIP, rst("OBJTIP")
        
            g_oKodszotar.Remove "MUNKALAP_OBJ"  'Töröljük az ál-kódszótári MUNKALAP_OBJ szekciót
            g_oKodszotar.Load "sp_FillObjMegnev", Array("pObjTip", rst("OBJTIP")), "MUNKALAP_OBJ", "Munkalaphoz tartozó objektum megnevezése", 100
            
            ComboBoxSet cmbMegnev, rst("ID")
            cmbMegnev.ListWidth = 350
            MunkalapFszamValaszt = True
        End If  'Not rst.EOF
    End If  'ExecVal
    Exit Function

errMunkalapFszamValaszt:
End Function    'MunkalapFszamValaszt

Public Function Gridder3(ByRef cmbMegnev As Object, ByRef cmbOBJTIP As Object) As Boolean
    On Error GoTo errGridder3
    Gridder3 = False
    
    Dim sOBJTIP As String
    sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)   'Lekérdezzük az objektumtípust
    
    Dim sID As String
    sID = ComboBoxGet(Nothing, cmbMegnev)
  
    Dim lstID As New Collection
    FillGrid2 lstID, sID, sOBJTIP
    
    Dim lstParams As New Collection
    lstParams.Add sOBJTIP, "pOBJTIP"
    lstParams.Add sID, "pID"
    
    'oAdmin.BeginTrans
    oAdmin.Exec "sp_TruncKapcsTab", Nothing
    Dim z As Variant
    For Each z In lstID
        lstParams.Remove ("pID")
        lstParams.Add CStr(z), "pID"
        oAdmin.Exec "sp_WriteKapcsTab", lstParams
    Next
    'oAdmin.CommitTrans

    Gridder3 = True
    Exit Function
    
errGridder3:
End Function    'Gridder3

Public Function PrintMunkalap(ByVal sMtip As String, ByVal sID As String) As Boolean
    On Error GoTo errPrintMunkalap
    PrintMunkalap = False
    
    Dim lstParams As New Collection
    lstParams.Add sMtip, "pMTIP"
    lstParams.Add sID, "pID"
    
    'oAdmin.BeginTrans
    oAdmin.Exec "sp_WriteMlapTab", lstParams
    'oAdmin.CommitTrans
    
    PrintMunkalap = True
    Exit Function
    
errPrintMunkalap:
End Function    'PrintMunkalap

Public Function PrintMunossz(ByVal sTAB As String, _
        ByRef lstControls As Access.Controls) As Boolean
    On Error GoTo errPrintMunossz
    PrintMunossz = False

    Dim lstParams As New Collection
    lstParams.Add lstControls("txtDATUMTOL").Value, "DATUMTOL"
    lstParams.Add lstControls("txtDATUMIG").Value, "DATUMIG"

    Select Case sTAB
        Case "403"
            lstParams.Add ComboBoxGet(Nothing, lstControls("cmbSZOLGJELL")), "SZOLGJELL"
        Case "404"
        
        Case "406"
        
        Case "407"
            lstParams.Add ComboBoxGet(Nothing, lstControls("cmbDOLGID")), "DOLG_ID"
            lstParams.Add ComboBoxGet(Nothing, lstControls("cmbSZOLGJELL")), "SZOLGJELL"
            
        Case "408"
            lstParams.Add ComboBoxGet(Nothing, lstControls("cmbFUTOMU")), "FUTOMU"
    End Select

    oAdmin.Exec "sp_MakeTab" & sTAB, lstParams

    PrintMunossz = True
    Exit Function

errPrintMunossz:
End Function    'PrintMunossz

Public Function LekerdMunkalapAltalanos(ByRef lstControls As Access.Controls, _
        ByRef grd As Object) As Integer
    On Error GoTo errLekerdMunkalapAltalanos
    LekerdMunkalapAltalanos = 0
    
    Dim lstParams As New Collection
    Dim sParam As String
    
    lstParams.Add IIf(lstControls("txtDATUMTOL").Value = "", Null, Trim(lstControls("txtDATUMTOL").Value)), "DATUMTOL"
    lstParams.Add IIf(lstControls("txtDATUMIG").Value = "", Null, Trim(lstControls("txtDATUMIG").Value)), "DATUMIG"
    lstParams.Add IIf(lstControls("txtMUNDATTOL").Value = "", Null, Trim(lstControls("txtMUNDATTOL").Value)), "MUNDATTOL"
    lstParams.Add IIf(lstControls("txtMUNDATIG").Value = "", Null, Trim(lstControls("txtMUNDATIG").Value)), "MUNDATIG"
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbMLAPTIP"))
    lstParams.Add sParam, "MLAPTIP"
    sParam = ComboBoxGet(Nothing, lstControls("cmbSZEREGYS"))
    lstParams.Add sParam, "SZEREGYS"
    sParam = ComboBoxGet(Nothing, lstControls("cmbSZOLGJELL"))
    lstParams.Add sParam, "SZOLGJELL"
    sParam = ComboBoxGet(Nothing, lstControls("cmbTIPUSH"))
    lstParams.Add sParam, "TIPUSH"
    sParam = ComboBoxGet(Nothing, lstControls("cmbFSZAM"))
    lstParams.Add sParam, "FSZAM"
    sParam = ComboBoxGet(Nothing, lstControls("cmbOBJID"))
    lstParams.Add sParam, "OBJID"
    sParam = ComboBoxGet(Nothing, lstControls("cmbEPULID"))
    lstParams.Add sParam, "EPULID"
    sParam = ComboBoxGet(Nothing, lstControls("cmbDOLGID"))
    lstParams.Add sParam, "DOLGID"
    sParam = ComboBoxGet(Nothing, lstControls("cmbALLAPOT"))
    lstParams.Add sParam, "ALLAPOT"
        
' Lekérdezem a munkalap darabszámot
    Dim rs As New ADODB.Recordset   'A visszatérési rekordszett
    Dim iRet As Integer
    If oAdmin.ExecVal("sp_LoadMlapDb", lstParams, rs) = True Then
        rs.MoveFirst                 'A recordset elejére állunk
        iRet = CInt(rs.Fields("MLAPDB").Value)
    Else
        'Hiba
    End If
    
    With grd
        .FormatString = "<||Munkalap|Bejelentõ|Kiáll. dátum|Szolg. jellege|Helyszín|Berendezés|Telep. hsz.|Hiba leírása|Elvégzett munka|Dolgozó|Visszaírás|Munkaóra|"
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        FillGrid "sp_LekerdMlap", lstParams, grd
    
        .AutoSize 2, grd.Cols - 1
        .ColWidth(1) = 0
        
        .MergeCells = flexMergeRestrictColumns
        Dim i As Integer
        For i = 1 To 11
            .MergeCol(i) = True
        Next i
        '.ColWidth(14) = 0
    End With

    LekerdMunkalapAltalanos = iRet
    Exit Function
    
errLekerdMunkalapAltalanos:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "LekerdMunkalapAltalanos"
End Function    'LekerdMunkalapAltalanos

Public Function PrintMunkalapAltalanos(ByRef grd As Object, ByRef prt As Object, _
        ByRef lstControls As Access.Controls) As Boolean
    On Error GoTo errPrintMunkalapAltalanos
    PrintMunkalapAltalanos = False
    
    Dim lstParams As New Collection
    Dim sParam As String
    
    lstParams.Add lstControls("txtDATUMTOL").Value, "DATUMTOL"
    lstParams.Add lstControls("txtDATUMIG").Value, "DATUMIG"
    lstParams.Add lstControls("txtMUNOSZ").Value, "MUNOSZ"
    
    sParam = GetComboNev(lstControls("cmbSZEREGYS"))
    lstParams.Add sParam, "SZEREGYS"
    sParam = GetComboNev(lstControls("cmbSZOLGJELL"))
    lstParams.Add sParam, "SZOLGJELL"
    sParam = GetComboNev(lstControls("cmbTIPUSH"))
    lstParams.Add sParam, "TIPUSH"
    sParam = GetComboNev(lstControls("cmbFSZAM"))
    lstParams.Add sParam, "FSZAM"
    sParam = GetComboNev(lstControls("cmbOBJID"))
    lstParams.Add sParam, "OBJID"
    sParam = GetComboNev(lstControls("cmbEPULID"))
    lstParams.Add sParam, "EPULID"
    sParam = GetComboNev(lstControls("cmbOBJTIP"))
    lstParams.Add sParam, "OBJTIP"
    sParam = GetComboNev(lstControls("cmbDOLGID"))
    lstParams.Add sParam, "DOLGID"
    sParam = GetComboNev(lstControls("cmbALLAPOT"))
    lstParams.Add sParam, "ALLAPOT"
    
    With prt
        .Preview = False
        '.Preview = True
        .Zoom = 100
        .Orientation = 1    'orLandscape
        .StartDoc
        
        Dim S As String
        S = "{\rtf1\ansi\ansicpg1250\uc1\deff0\deflang1033\deflangfe1038{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose02020603050405020304}Times New Roman;}{\f1\fswiss\fcharset0\fprq2{\*\panose"
        S = S & "020b0604020202020204}Arial;}{\f16\froman\fcharset238\fprq2 Times New Roman CE;}{\f17\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f19\froman\fcharset161\fprq2 Times New Roman Greek;}{\f20\froman\fcharset162\fprq2 Times New Roman Tur;}"
        S = S & "{\f21\froman\fcharset186\fprq2 Times New Roman Baltic;}{\f22\fswiss\fcharset238\fprq2 Arial CE;}{\f23\fswiss\fcharset204\fprq2 Arial Cyr;}{\f25\fswiss\fcharset161\fprq2 Arial Greek;}{\f26\fswiss\fcharset162\fprq2 Arial Tur;}"
        S = S & "{\f27\fswiss\fcharset186\fprq2 Arial Baltic;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;"
        S = S & "\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{\qj\nowidctlpar\widctlpar\adjustright \lang1038\cgrid \snext0 Normal;}{\s1\qj\sb240\sa60\keepn\nowidctlpar\widctlpar\adjustright"
        S = S & "\b\f1\fs28\lang1038\kerning28\cgrid \sbasedon0 \snext0 heading 1;}{\*\cs10 \additive Default Paragraph Font;}}\paperw11906\paperh16838\margl1417\margr1417\margt1417\margb1417\deftab708\widowctrl\ftnbj\aenddoc\hyphhotz425\formshade\viewkind4\viewscale158\viewzk2\pgbrdrhead\pgbrdrfoot \fet0\sectd \linex0\headery709\footery709\colsx709\endnhere\sectdefaultcl"
        S = S & "{\*\pnseclvl1\pnucrm\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta )}}{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta"
        S = S & ")}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}\pard\plain \s1\qc\sb240\sa240\keepn\nowidctlpar\widctlpar\outlinelevel0\adjustright"
        S = S & "\b\f1\fs28\lang1038\kerning28\cgrid {Munkalapok list\'e1ja\par }\line\line\pard\plain \qj\li2268\nowidctlpar\widctlpar\tx4962\adjustright \lang1038\cgrid {\f16Id\'f5szak:\tab "
        S = S & lstParams("DATUMTOL") & "\endash  " & lstParams("DATUMIG") & "\par }{\f16 Munk\'e1t v\'e9gz\'f5 szervezet:\tab "
        S = S & lstParams("SZEREGYS") & "\par Szolg\'e1ltat\'e1s jellege:\tab "
        S = S & lstParams("SZOLGJELL") & "\par }{T\'edpus hiba:\tab "
        S = S & lstParams("TIPUSH") & "\par }{\f16 F\'f5k\'f6nyvi sz\'e1m:\tab "
        S = S & lstParams("FSZAM") & "\par \'c1llapot jelz\'f5:\tab "
        S = S & lstParams("ALLAPOT") & "\par }{Berendez\'e9s t\'edpus:\tab "
        S = S & lstParams("OBJTIP") & "\par Berendez\'e9s megnevez\'e9se:\tab "
        S = S & lstParams("OBJID") & "\par Helysz\'edn:\tab "
        S = S & lstParams("EPULID") & "\par Dolgoz\'f3:\tab "
        S = S & lstParams("DOLGID") & "\par Munka\'f3ra \'f6sszesen:\tab "
        S = S & lstParams("MUNOSZ") & "\par }\pard \qj\nowidctlpar\widctlpar\adjustright {\par }}"
        .TextRTF = S
        .NewPage
        
        .Footer = "|{\fs20 %d. oldal}|"
        .RenderControl = grd.hWnd
        .PrintDoc True
        .EndDoc
    End With
    
    PrintMunkalapAltalanos = True
    Exit Function
    
errPrintMunkalapAltalanos:
End Function    'PrintMunkalapAltalanos


Public Function PrintObjAltalanos(ByRef grd As Object, ByRef prt As Object, _
        ByRef cmbOBJTIP As Object, ByRef cmbFutomu_ID As Object, _
        ByRef sParamName As String, ByRef sParamValue As String) As Boolean
    On Error GoTo errPrintObjAltalanos
    PrintObjAltalanos = False

    
    Dim lstParams As New Collection
    Dim sParam As String
    
    sParam = ComboBoxGet(Nothing, cmbOBJTIP)
    lstParams.Add sParam, "OBJTIP"
    sParam = GetComboNev(cmbFutomu_ID)
    lstParams.Add sParam, "FUTOMU"
    
'    lstParams.Add sParamValue, sParamName
    
    With prt
        .Preview = False
        '.Preview = True
        .Zoom = 100
        .Orientation = 1    'orLandscape
        .StartDoc
        
        Dim S As String
        S = "{\rtf1\ansi\ansicpg1250\uc1\deff0\deflang1033\deflangfe1038{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose02020603050405020304}Times New Roman;}{\f1\fswiss\fcharset0\fprq2{\*\panose"
        S = S & "020b0604020202020204}Arial;}{\f16\froman\fcharset238\fprq2 Times New Roman CE;}{\f17\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f19\froman\fcharset161\fprq2 Times New Roman Greek;}{\f20\froman\fcharset162\fprq2 Times New Roman Tur;}"
        S = S & "{\f21\froman\fcharset186\fprq2 Times New Roman Baltic;}{\f22\fswiss\fcharset238\fprq2 Arial CE;}{\f23\fswiss\fcharset204\fprq2 Arial Cyr;}{\f25\fswiss\fcharset161\fprq2 Arial Greek;}{\f26\fswiss\fcharset162\fprq2 Arial Tur;}"
        S = S & "{\f27\fswiss\fcharset186\fprq2 Arial Baltic;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;"
        S = S & "\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{\qj\nowidctlpar\widctlpar\adjustright \lang1038\cgrid \snext0 Normal;}{\s1\qj\sb240\sa60\keepn\nowidctlpar\widctlpar\adjustright"
        S = S & "\b\f1\fs28\lang1038\kerning28\cgrid \sbasedon0 \snext0 heading 1;}{\*\cs10 \additive Default Paragraph Font;}}\paperw11906\paperh16838\margl1417\margr1417\margt1417\margb1417\deftab708\widowctrl\ftnbj\aenddoc\hyphhotz425\formshade\viewkind4\viewscale158\viewzk2\pgbrdrhead\pgbrdrfoot \fet0\sectd \linex0\headery709\footery709\colsx709\endnhere\sectdefaultcl"
        S = S & "{\*\pnseclvl1\pnucrm\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta )}}{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta"
        S = S & ")}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}\pard\plain \s1\qc\sb240\sa240\keepn\nowidctlpar\widctlpar\outlinelevel0\adjustright"
        S = S & "\b\f1\fs28\lang1038\kerning28\cgrid {T\'f6rzsadatok list\'e1ja\par }\line\line\pard\plain \qj\li2268\nowidctlpar\widctlpar\tx4962\adjustright \lang1038\cgrid "
        
        S = S & "{\f16 Berendez\'e9s t\'edpusa:\tab " & g_oKodszotar.Section("296").KodList(lstParams("OBJTIP")).Nev & "\par}"
        S = S & "{\f16 F\'fbt\'f5m\'fb:\tab " & lstParams("FUTOMU") & "\par}"
        S = S & "{\f16 " & sParamName & ":\tab " & sParamValue & "\par}"
        S = S & "\pard \qj\nowidctlpar\widctlpar\adjustright {\par }}"
        .TextRTF = S
        .NewPage
        
        .Footer = "|{\fs20 %d. oldal}|"
        .RenderControl = grd.hWnd
        .PrintDoc True
        .EndDoc
    End With
    
    PrintObjAltalanos = True
    Exit Function

errPrintObjAltalanos:
End Function    'PrintObjAltalanos

Public Function PrintSzerzList(ByRef grd As Object, ByRef prt As Object, _
        ByRef lstControls As Access.Controls) As Boolean

    On Error GoTo errPrintSzerzList
    PrintSzerzList = False

    Dim lstParams As New Collection
    Dim sParam As String
    
    lstParams.Add lstControls("txtUGYFN").Value, "UGYFN"
    lstParams.Add lstControls("txtPAZ").Value, "PAZ"
    lstParams.Add lstControls("txtSZLA_CIKL").Value, "SZLA_CIKL"
    lstParams.Add lstControls("txtDATUMTOL").Value, "DATUMTOL"
    lstParams.Add lstControls("txtDATUMIG").Value, "DATUMIG"
    
    sParam = GetComboNev(lstControls("cmbKEPVIS"))
    lstParams.Add sParam, "KEPVIS"
    sParam = GetComboNev(lstControls("cmbSZOLG"))
    lstParams.Add sParam, "SZOLG"
    
    If lstControls("grpERVENYES").Value = 1 Then
        lstParams.Add "Lejárt szerzõdések", "ERVENYES"
    Else
        lstParams.Add "Érvényes szerzõdések", "ERVENYES"
    End If
    
    With prt
        .Preview = False
        '.Preview = True
        .Zoom = 100
        .Orientation = 1    'orLandscape
        .StartDoc
        
        Dim S As String
        S = "{\rtf1\ansi\ansicpg1250\uc1\deff0\deflang1033\deflangfe1038{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose02020603050405020304}Times New Roman;}{\f1\fswiss\fcharset0\fprq2{\*\panose"
        S = S & "020b0604020202020204}Arial;}{\f16\froman\fcharset238\fprq2 Times New Roman CE;}{\f17\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f19\froman\fcharset161\fprq2 Times New Roman Greek;}{\f20\froman\fcharset162\fprq2 Times New Roman Tur;}"
        S = S & "{\f21\froman\fcharset186\fprq2 Times New Roman Baltic;}{\f22\fswiss\fcharset238\fprq2 Arial CE;}{\f23\fswiss\fcharset204\fprq2 Arial Cyr;}{\f25\fswiss\fcharset161\fprq2 Arial Greek;}{\f26\fswiss\fcharset162\fprq2 Arial Tur;}"
        S = S & "{\f27\fswiss\fcharset186\fprq2 Arial Baltic;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;"
        S = S & "\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{\qj\nowidctlpar\widctlpar\adjustright \lang1038\cgrid \snext0 Normal;}{\s1\qj\sb240\sa60\keepn\nowidctlpar\widctlpar\adjustright"
        S = S & "\b\f1\fs28\lang1038\kerning28\cgrid \sbasedon0 \snext0 heading 1;}{\*\cs10 \additive Default Paragraph Font;}}\paperw11906\paperh16838\margl1417\margr1417\margt1417\margb1417\deftab708\widowctrl\ftnbj\aenddoc\hyphhotz425\formshade\viewkind4\viewscale158\viewzk2\pgbrdrhead\pgbrdrfoot \fet0\sectd \linex0\headery709\footery709\colsx709\endnhere\sectdefaultcl"
        S = S & "{\*\pnseclvl1\pnucrm\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta )}}{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta"
        S = S & ")}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}\pard\plain \s1\qc\sb240\sa240\keepn\nowidctlpar\widctlpar\outlinelevel0\adjustright"
        S = S & "\b\f1\fs28\lang1038\kerning28\cgrid {T\'f6rzsadatok list\'e1ja\par }\line\line\pard\plain \qj\li2268\nowidctlpar\widctlpar\tx4962\adjustright \lang1038\cgrid "
        
        S = S & "{\f16 Közös kepvisel\'f5:\tab " & lstParams("KEPVIS") & "\par}"
        S = S & "{\f16 Szolgáltatás:\tab " & lstParams("SZOLG") & "\par}"
        S = S & "{\f16 Partner azonosító:\tab " & lstParams("PAZ") & "\par}"
        S = S & "{\f16 Szamlázási ciklus [hó]:\tab " & lstParams("SZLA_CIKL") & "\par}"
        S = S & "{\f16 Id\'f5szak:\tab " & lstParams("DATUMTOL") & "\endash  " & lstParams("DATUMIG") & "\par}"
        S = S & "{\f16 Megrendel\'f5 neve:\tab " & lstParams("UGYFN") & "\par}"
        S = S & "{\f16 Érvényesség:\tab " & lstParams("ERVENYES") & "\par}"
        S = S & "\pard \qj\nowidctlpar\widctlpar\adjustright {\par }}"
        .TextRTF = S
        .NewPage
        
        .Footer = "|{\fs20 %d. oldal}|"
        .RenderControl = grd.hWnd
        .PrintDoc True
        .EndDoc
    End With

    PrintSzerzList = True
    Exit Function

errPrintSzerzList:
End Function    'PrintSzerzList

Private Function GridderBase(ByRef grd As Object, ByRef sQry As String, _
        ByRef sOBJTIP As String, ByRef sID As String, ByRef sParamName As String, _
        ByRef sParamTol As String, ByRef sParamIg As String, _
        ByRef sHeader As String) As Boolean
    On Error GoTo errGridderBase
    GridderBase = False
    
    Dim lstParams As New Collection
    If sOBJTIP <> "" Then lstParams.Add sOBJTIP, "pOBJTIP"
    If sID <> "" Then lstParams.Add sID, "pID"
    
    If sParamName <> "" Then
        If sParamIg <> "" Then
            lstParams.Add sParamTol, sParamName & "TOL"
            lstParams.Add sParamIg, sParamName & "IG"
        Else
            lstParams.Add sParamTol, sParamName
        End If
    End If
    
    Dim rstHeader As New ADODB.Recordset
    Dim rstFirstRecord As New ADODB.Recordset
    oAdmin.ExecVal "sp_GetGridHeader", Nothing, rstHeader
    oAdmin.ExecVal sQry, lstParams, rstFirstRecord
    
    If rstFirstRecord.EOF Then
        grd.Rows = 1
    Else
        If sHeader = "" Then
            sHeader = "<"
            Dim i As ADODB.Field
            For Each i In rstFirstRecord.Fields
                If i.Name <> "ID" Then
                    sHeader = sHeader & "|" & rstHeader.Fields.Item(i.Name).Value
                Else
                    sHeader = sHeader & "|" & "ID"
                End If
            Next
        End If
        
        With grd
            .FormatString = sHeader
            .AllowUserResizing = flexResizeColumns
            .SelectionMode = flexSelectionByRow
            
            FillGrid sQry, lstParams, grd
        
            .AutoSize 2, .Cols - 1
            .ColWidth(1) = 0
        End With
    End If

    GridderBase = True
    Exit Function
    
errGridderBase:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "GridderBase"
    MsgBox i.Name
End Function    'GridderBase

'   TeljListFeltolt
'
'   Feltölti az üzemfenntartási munkalaphoz tartozó,
'       dolgozói munkavégzést és teljesítményadatokat kimutató listát.
'
'   Paraméterek:    cmbMUNKALAP As Object   -   a munkalapot meghatározó combobox
'                   lstTeljm As Object  -   a feltöltendõ lista
'                   spcMUNOSZ As Object -   munkaóra összesen textbox
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function TeljListFeltolt(ByRef cmbMUNKALAP As Object, ByRef lstTeljm As Object, ByRef spcMUNOSZ As Object) As Boolean
    On Error GoTo errTeljListFeltolt
    TeljListFeltolt = False
    
    g_oKodszotar.Remove "TELJ"  'Töröljük az ál-kódszótári TELJ szekciót
    
    Dim sMUNKALAP_ID As String
    sMUNKALAP_ID = ComboBoxGet(Nothing, cmbMUNKALAP) 'Lekérdezzük a munkalap azonosítóját
    
    g_oKodszotar.Load "sp_FillTeljm", Array("pMUNKALAP_ID", sMUNKALAP_ID), "TELJ", "Teljesítmény adatok", 100
    
    ComboBoxSet lstTeljm, Nothing   'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    
    Dim lstParams As New Collection
    lstParams.Add sMUNKALAP_ID, "pMUNKALAP_ID"
    Dim rstResult As New ADODB.Recordset
    If oAdmin.ExecVal("sp_GetTeljmSum", lstParams, rstResult) = True Then 'Végrehajtjuk az inzertet
        spcMUNOSZ.Value = CStr(rstResult(0).Value)
    End If
    
    TeljListFeltolt = True
    Exit Function
    
errTeljListFeltolt:
End Function    'TeljListFeltolt

Public Function MunkalapLekerdEpulFeltolt(ByRef cmbEPUL As Object) As Boolean
    On Error GoTo errMunkalapLekerdEpulFeltolt
    MunkalapLekerdEpulFeltolt = False
    
    g_oKodszotar.Remove "EPUL"  'Töröljük az ál-kódszótári EPUL szekciót
    
    g_oKodszotar.Load "sp_FillObjMegnev", Array("pObjTip", "37"), "EPUL", "Munkalaphoz tartozó épület megnevezése", 100
    
    ComboBoxSet cmbEPUL, Nothing
    cmbEPUL.ListWidth = 350
    MunkalapLekerdEpulFeltolt = True
    Exit Function
    
errMunkalapLekerdEpulFeltolt:
End Function    'MunkalapLekerdEpulFeltolt

Public Function MunkalapLakasFeltolt(ByRef cmbMunkalapszam As Object, _
        ByRef cmbEPUL As Object, ByRef cmbLAKAS As Object) As Boolean
    'On Error GoTo errMunkalapLakasFeltolt
    MunkalapLakasFeltolt = False
    
    g_oKodszotar.Remove "MUNKALAP_EPUL"  'Töröljük az ál-kódszótári MUNKALAP_EPUL szekciót
    g_oKodszotar.Remove "MUNKALAP_LAKAS"    'Töröljük az ál-kódszótári MUNKALAP_LAKAS szekciót
    
    Dim sEPULID As String
    sEPULID = ComboBoxGet(Nothing, cmbEPUL) 'Lekérdezzük az épület azonosítóját
    
    g_oKodszotar.Load "sp_FillObjMegnev", Array("pObjTip", "01"), "MUNKALAP_EPUL", "Munkalaphoz tartozó épület megnevezése", 100
    g_oKodszotar.Load "sp_FillLakasByEpulet", Array("pEPULID", sEPULID), "MUNKALAP_LAKAS", "Munkalaphoz tartozó lakás", 100
    
    Dim sID As String
    sID = ComboBoxGet(Nothing, cmbMunkalapszam)
    
    If sID <> "" Then
        Dim lstParams As New Collection
        lstParams.Add sID, "pID"
        
        Dim rst As New ADODB.Recordset
        If oAdmin.ExecVal("sp_LoadMunkalap", lstParams, rst) = True Then
            ComboBoxSet cmbEPUL, rst("EPULID")
            ComboBoxSet cmbLAKAS, rst("OBJID")
            cmbLAKAS.ListWidth = 350
            MunkalapLakasFeltolt = True
        End If
    Else
        ComboBoxSet cmbLAKAS, Nothing
        MunkalapLakasFeltolt = True
    End If
    Exit Function
    
errMunkalapLakasFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "MunkalapLakasFeltolt"
End Function    'MunkalapLakasFeltolt

Public Function MunkalapAllapot(ByRef sID As String, ByVal iAllapot As Integer) As Boolean
    On Error GoTo errMunkalapAllapot
    MunkalapAllapot = False
    
    Dim lstParams As New Collection 'és átadjuk majd paraméterként
    
    lstParams.Add sID, "pID"
    lstParams.Add iAllapot, "pALLAPOT"
    
    'oAdmin.BeginTrans
    If oAdmin.Exec("sp_SetMunkalapAllapot", lstParams) = True Then   'Végrehajtjuk az inzertet
        'oAdmin.CommitTrans
        MunkalapAllapot = True
    Else
        'oAdmin.RollbackTrans
    End If
    Exit Function
    
errMunkalapAllapot:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "MunkalapAllapot"
End Function    'MunkalapAllapot

Public Function KarbtervListFeltolt(ByRef cmbOBJTIP As Object, ByRef cmbMuvel As Object, _
    ByRef grdNincsKarbterv As Object, ByRef grdVanKarbterv As Object) As Boolean
    On Error GoTo errKarbtervListFeltolt
    KarbtervListFeltolt = False
    
    Dim lstParams As New Collection
    Dim sParam As String
    Dim sHeader As String
    Dim i As Integer
    
    sParam = ComboBoxGet(Nothing, cmbMuvel)
    lstParams.Add sParam, "pMUVEL"
    sParam = ComboBoxGet(Nothing, cmbOBJTIP)
    lstParams.Add sParam, "pOBJTIP"
    
    Select Case sParam
        Case "01"
            sHeader = "<||Utca|Hsz|Épülsz.|Helyr.sz."
        Case Else
            sHeader = "<||Megnevezés|Típus|Telep.hsz.|Gy.szám"
    End Select
    
    With grdNincsKarbterv
        .FormatString = sHeader
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        FillGrid "sp_FillNincsKarbterv", lstParams, grdNincsKarbterv
    
        .AutoSize 2, .Cols - 1
        .ColWidth(1) = 0
        
        .MergeCells = flexMergeRestrictColumns
        'For i = 1 To 3
        '    .MergeCol(i) = True
        'Next i
    End With

    With grdVanKarbterv
        .FormatString = "<||Megnevezés|Típus|Telep.hsz.|Gy.szám|Idõ|Idõegység"
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        FillGrid "sp_FillVanKarbterv", lstParams, grdVanKarbterv
    
        .AutoSize 2, .Cols - 1
        .ColWidth(1) = 0
        
        .MergeCells = flexMergeRestrictColumns
        'For i = 1 To 3
        '    .MergeCol(i) = True
        'Next i
    End With

    KarbtervListFeltolt = True
    Exit Function
    
errKarbtervListFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "KarbtervListFeltolt"
End Function

Public Function KarbtervKapcsol(ByRef lstControls As Access.Controls) As Boolean
    On Error GoTo errKarbtervKapcsol
    KarbtervKapcsol = False

    Dim sParam As String
    Dim lstParams As New Collection
    
    sParam = lstControls("txtIDO").Value
    lstParams.Add sParam, "IDO"
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbMUVEL"))
    lstParams.Add sParam, "MUVEL"
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbIDOE"))
    lstParams.Add sParam, "IDOE"
    
    sParam = CStr(lstControls("grdNEMKAPCSOLT").TextMatrix(lstControls("grdNEMKAPCSOLT").RowSel, 1))
    If lstControls("cmbOBJTIP").ListIndex = -1 Then
        lstParams.Add sParam, "OBJTIP"
        lstParams.Add "", "OBJID"
    Else
        lstParams.Add sParam, "OBJID"
        sParam = ComboBoxGet(Nothing, lstControls("cmbOBJTIP"))
        lstParams.Add sParam, "OBJTIP"
    End If
    
    KarbtervKapcsol = oAdmin.Exec("sp_InsKarbterv", lstParams)
    Exit Function

errKarbtervKapcsol:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "KarbtervKapcsol"
End Function

Public Function KarbtervSzetkapcsol(ByRef grdVanKarbterv As Object) As Boolean
    On Error GoTo errKarbtervSzetkapcsol
    KarbtervSzetkapcsol = False
    
    Dim sID As String
    
    sID = CStr(grdVanKarbterv.TextMatrix(grdVanKarbterv.RowSel, 1))
    
    Dim lstParams As New Collection
    lstParams.Add sID, "pID"
    
    KarbtervSzetkapcsol = oAdmin.Exec("sp_DelKarbterv", lstParams)
    Exit Function
    
errKarbtervSzetkapcsol:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "KarbtervSzetkapcsol"
End Function

Public Function KarbtervLekerd(ByRef lstControls As Access.Controls, _
        ByRef grd As Object) As Boolean
    On Error GoTo errKarbtervLekerd
    KarbtervLekerd = False
    
    Dim lstParams As New Collection
    Dim sParam As String
    
    lstParams.Add IIf(lstControls("txtDATUMTOL").Value = "", Null, Trim(lstControls("txtDATUMTOL").Value)), "pDATUMTOL"
    lstParams.Add IIf(lstControls("txtDATUMIG").Value = "", Null, Trim(lstControls("txtDATUMIG").Value)), "pDATUMIG"
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbMUVEL"))
    lstParams.Add sParam, "pMUVEL"
    sParam = ComboBoxGet(Nothing, lstControls("cmbOBJTIP"))
    lstParams.Add sParam, "pOBJTIP"
    sParam = ComboBoxGet(Nothing, lstControls("cmbOBJID"))
    lstParams.Add sParam, "pOBJID"
        
    With grd
        '.FormatString = "<||Ber.típus|Berendezés|Típus|Telep.hsz.|Gy.szám|Cím|Mûvelet|Terv. karb. dátum|Karb. dátum|Lépcsõház"
        .FormatString = "<||Fûtõmû|Lépcsõház/Épület|Ber.típus|Berendezés|Típus|Telep.hsz.|Gy.szám|Cím|Mûvelet|Terv. karb. dátum|Karb. dátum|Átmérõ|Impulzus|Vezhossz.|Benyhossz.|Megjegyzés"
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        FillGrid "sp_LekerdKarbterv", lstParams, grd
    
        .AutoSize 2, grd.Cols - 1
        .ColWidth(1) = 0
        
        .MergeCells = flexMergeRestrictColumns
        Dim i As Integer
        For i = 1 To 2
            .MergeCol(i) = True
        Next i
    End With

    KarbtervLekerd = True
    Exit Function
    
errKarbtervLekerd:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "KarbtervLekerd"
End Function    'KarbtervLekerd

Public Function PrintKarbterv(ByRef grd As Object, ByRef prt As Object, _
        ByRef lstControls As Access.Controls) As Boolean
    On Error GoTo errPrintKarbterv
    PrintKarbterv = False

    Dim lstParams As New Collection
    Dim sParam As String
    
    lstParams.Add lstControls("txtDATUMTOL").Value, "DATUMTOL"
    lstParams.Add lstControls("txtDATUMIG").Value, "DATUMIG"
    
    sParam = GetComboNev(lstControls("cmbMUVEL"))
    lstParams.Add sParam, "MUVEL"
    sParam = GetComboNev(lstControls("cmbOBJTIP"))
    lstParams.Add sParam, "OBJTIP"
    sParam = GetComboNev(lstControls("cmbOBJID"))
    lstParams.Add sParam, "OBJID"
    
    With prt
        .Preview = False
        '.Preview = True
        .Zoom = 100
        .Orientation = 1    'orLandscape
        .StartDoc
        
        Dim S As String
        S = "{\rtf1\ansi\ansicpg1250\uc1\deff0\deflang1033\deflangfe1038{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose02020603050405020304}Times New Roman;}{\f1\fswiss\fcharset0\fprq2{\*\panose"
        S = S & "020b0604020202020204}Arial;}{\f16\froman\fcharset238\fprq2 Times New Roman CE;}{\f17\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f19\froman\fcharset161\fprq2 Times New Roman Greek;}{\f20\froman\fcharset162\fprq2 Times New Roman Tur;}"
        S = S & "{\f21\froman\fcharset186\fprq2 Times New Roman Baltic;}{\f22\fswiss\fcharset238\fprq2 Arial CE;}{\f23\fswiss\fcharset204\fprq2 Arial Cyr;}{\f25\fswiss\fcharset161\fprq2 Arial Greek;}{\f26\fswiss\fcharset162\fprq2 Arial Tur;}"
        S = S & "{\f27\fswiss\fcharset186\fprq2 Arial Baltic;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;"
        S = S & "\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{\qj\nowidctlpar\widctlpar\adjustright \lang1038\cgrid \snext0 Normal;}{\s1\qj\sb240\sa60\keepn\nowidctlpar\widctlpar\adjustright"
        S = S & "\b\f1\fs28\lang1038\kerning28\cgrid \sbasedon0 \snext0 heading 1;}{\*\cs10 \additive Default Paragraph Font;}}\paperw11906\paperh16838\margl1417\margr1417\margt1417\margb1417\deftab708\widowctrl\ftnbj\aenddoc\hyphhotz425\formshade\viewkind4\viewscale158\viewzk2\pgbrdrhead\pgbrdrfoot \fet0\sectd \linex0\headery709\footery709\colsx709\endnhere\sectdefaultcl"
        S = S & "{\*\pnseclvl1\pnucrm\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta )}}{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta"
        S = S & ")}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}\pard\plain \s1\qc\sb240\sa240\keepn\nowidctlpar\widctlpar\outlinelevel0\adjustright"
        S = S & "\b\f1\fs28\lang1038\kerning28\cgrid {Karbantart\'e1si terv lista\par }\line\line\pard\plain \qj\li2268\nowidctlpar\widctlpar\tx4962\adjustright \lang1038\cgrid {\f16Id\'f5szak:\tab "
        S = S & lstParams("DATUMTOL") & "\endash  " & lstParams("DATUMIG") & "\par Berendez\'e9s t\'edpus:\tab "
        S = S & lstParams("OBJTIP") & "\par Berendez\'e9s megnevez\'e9se:\tab "
        S = S & lstParams("OBJID") & "\par Muvelet t\'edpusa:\tab "
        S = S & lstParams("MUVEL") & "\par }\pard \qj\nowidctlpar\widctlpar\adjustright {\par }}"
        .TextRTF = S
        .NewPage
        
        .Footer = "|{\fs20 %d. oldal}|"
        .RenderControl = grd.hWnd
        .PrintDoc True
        .EndDoc
    End With

    PrintKarbterv = True
    Exit Function

errPrintKarbterv:
End Function    'PrintKarbterv

Public Function KarbanFelvitel(ByRef strMUNKALAP_ID As String) As Boolean
    On Error GoTo errKarbanFelvitel
    KarbanFelvitel = False
    
    Dim lstParams As New Collection
    
    lstParams.Add strMUNKALAP_ID, "MUN_ID"
    
    KarbanFelvitel = oAdmin.Exec("sp_InsKarban", lstParams)
    Exit Function
    
errKarbanFelvitel:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "KarbanFelvitel"
End Function

Public Function KarbanLekerd(ByRef lstControls As Access.Controls, _
        ByRef grd As Object) As Boolean
    On Error GoTo errKarbanLekerd
    KarbanLekerd = False
    
    Dim lstParams As New Collection
    Dim sParam As String
    
    lstParams.Add IIf(lstControls("txtDATUMTOL").Value = "", Null, Trim(lstControls("txtDATUMTOL").Value)), "pDATUMTOL"
    lstParams.Add IIf(lstControls("txtDATUMIG").Value = "", Null, Trim(lstControls("txtDATUMIG").Value)), "pDATUMIG"
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbMUVEL"))
    lstParams.Add sParam, "pMUVEL"
    sParam = ComboBoxGet(Nothing, lstControls("cmbOBJTIP"))
    lstParams.Add sParam, "pOBJTIP"
    sParam = ComboBoxGet(Nothing, lstControls("cmbOBJID"))
    lstParams.Add sParam, "pOBJID"
    sParam = ComboBoxGet(Nothing, lstControls("cmbSZOLGJ"))
    lstParams.Add sParam, "pSZOLGJ"
        
    With grd
        .FormatString = "<||Fûtõmû|Lépcsõház|Ber.típus|Berendezés|Típus|Telep.hsz.|Gy.szám|Szolg.jell|Mûvelet|Karb. dátuma|Munkalap|Mûvelet"
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        FillGrid "sp_LekerdKarban", lstParams, grd
    
        .AutoSize 2, grd.Cols - 1
        .ColWidth(1) = 0
        
        .MergeCells = flexMergeRestrictColumns
        Dim i As Integer
        For i = 1 To 12
            .MergeCol(i) = True
        Next i
    End With

    KarbanLekerd = True
    Exit Function
    
errKarbanLekerd:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "KarbanLekerd"
End Function    'KarbanLekerd

Public Function PrintKarban(ByRef grd As Object, ByRef prt As Object, _
        ByRef lstControls As Access.Controls) As Boolean
    On Error GoTo errPrintKarban
    PrintKarban = False
    
    Dim lstParams As New Collection
    Dim sParam As String
    
    lstParams.Add lstControls("txtDATUMTOL").Value, "DATUMTOL"
    lstParams.Add lstControls("txtDATUMIG").Value, "DATUMIG"
    
    sParam = GetComboNev(lstControls("cmbSZOLGJ"))
    lstParams.Add sParam, "SZOLGJ"
    sParam = GetComboNev(lstControls("cmbMUVEL"))
    lstParams.Add sParam, "MUVEL"
    sParam = GetComboNev(lstControls("cmbOBJTIP"))
    lstParams.Add sParam, "OBJTIP"
    sParam = GetComboNev(lstControls("cmbOBJID"))
    lstParams.Add sParam, "OBJID"
    
    With prt
        .Preview = False
        '.Preview = True
        .Zoom = 100
        .Orientation = 1    'orLandscape
        .StartDoc
        
        Dim S As String
        S = "{\rtf1\ansi\ansicpg1250\uc1\deff0\deflang1033\deflangfe1038{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose02020603050405020304}Times New Roman;}{\f1\fswiss\fcharset0\fprq2{\*\panose"
        S = S & "020b0604020202020204}Arial;}{\f16\froman\fcharset238\fprq2 Times New Roman CE;}{\f17\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f19\froman\fcharset161\fprq2 Times New Roman Greek;}{\f20\froman\fcharset162\fprq2 Times New Roman Tur;}"
        S = S & "{\f21\froman\fcharset186\fprq2 Times New Roman Baltic;}{\f22\fswiss\fcharset238\fprq2 Arial CE;}{\f23\fswiss\fcharset204\fprq2 Arial Cyr;}{\f25\fswiss\fcharset161\fprq2 Arial Greek;}{\f26\fswiss\fcharset162\fprq2 Arial Tur;}"
        S = S & "{\f27\fswiss\fcharset186\fprq2 Arial Baltic;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;"
        S = S & "\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{\qj\nowidctlpar\widctlpar\adjustright \lang1038\cgrid \snext0 Normal;}{\s1\qj\sb240\sa60\keepn\nowidctlpar\widctlpar\adjustright"
        S = S & "\b\f1\fs28\lang1038\kerning28\cgrid \sbasedon0 \snext0 heading 1;}{\*\cs10 \additive Default Paragraph Font;}}\paperw11906\paperh16838\margl1417\margr1417\margt1417\margb1417\deftab708\widowctrl\ftnbj\aenddoc\hyphhotz425\formshade\viewkind4\viewscale158\viewzk2\pgbrdrhead\pgbrdrfoot \fet0\sectd \linex0\headery709\footery709\colsx709\endnhere\sectdefaultcl"
        S = S & "{\*\pnseclvl1\pnucrm\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta )}}{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta"
        S = S & ")}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}\pard\plain \s1\qc\sb240\sa240\keepn\nowidctlpar\widctlpar\outlinelevel0\adjustright"
        S = S & "\b\f1\fs28\lang1038\kerning28\cgrid {Karbantart\'e1s lista\par }\line\line\pard\plain \qj\li2268\nowidctlpar\widctlpar\tx4962\adjustright \lang1038\cgrid {\f16Id\'f5szak:\tab "
        S = S & lstParams("DATUMTOL") & "\endash  " & lstParams("DATUMIG") & "\par Berendez\'e9s t\'edpus:\tab "
        S = S & lstParams("OBJTIP") & "\par Berendez\'e9s megnevez\'e9se:\tab "
        S = S & lstParams("OBJID") & "\par Szolg\'e1ltat\'e1s jellege:\tab "
        S = S & lstParams("SZOLGJ") & "\par Muvelet t\'edpusa:\tab "
        S = S & lstParams("MUVEL") & "\par }\pard \qj\nowidctlpar\widctlpar\adjustright {\par }}"
        .TextRTF = S
        .NewPage
        
        .Footer = "|{\fs20 %d. oldal}|"
        .RenderControl = grd.hWnd
        .PrintDoc True
        .EndDoc
    End With

    PrintKarban = True
    Exit Function

errPrintKarban:
End Function    'PrintKarban

'   ArvaltListFeltolt
'
'   Feltölti a szolgáltatások árváltozásait kimutató listát.
'
'   Paraméterek:    cmbSZOLG As Object  -   Szolgáltatás megnevezése
'                   lstArvalt As Object -   a feltöltendõ lista
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function ArvaltListFeltolt(ByRef cmbSZOLG As Object, ByRef lstArvalt As Object) As Boolean
    On Error GoTo errArvaltListFeltolt
    ArvaltListFeltolt = False
    
    g_oKodszotar.Remove "ARVALT"    'Töröljük az ál-kódszótári ARVALT szekciót
    
    Dim sSzolg As String
    sSzolg = ComboBoxGet(Nothing, cmbSZOLG) 'Lekérdezzük a szolgáltatás megnevezését
    
    g_oKodszotar.Load "sp_FillArvalt", Array("pSZOLG", sSzolg), "ARVALT", "Szolgáltatás árak", 100
    
    ComboBoxSet lstArvalt, Nothing   'Betöltjük a kódszótárba az árakat, majd feltöltjük a combobox-ot
    
    ArvaltListFeltolt = True
    Exit Function
    
errArvaltListFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "ArvaltListFeltolt"
End Function    'ArvaltListFeltolt

Public Function JegyzKarbFeltolt(ByRef cmbOBJTIP As Object, ByRef cmbOBJID As Object, ByRef cmbKARB_ID As Object) As Boolean
    On Error GoTo errJegyzKarbFeltolt
    JegyzKarbFeltolt = False
    
    Dim sOBJTIP As String
    Dim sOBJID As String
    
    sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)
    sOBJID = ComboBoxGet(Nothing, cmbOBJID)
    
    g_oKodszotar.Remove "JEGYZKARB"
    
    g_oKodszotar.Load "sp_FillKarb", Array("pOBJTIP", sOBJTIP, "pOBJID", sOBJID), "JEGYZKARB", "Jegyzõkönyvhöz kapcsolódó karbantartás", 100
    JegyzKarbFeltolt = ComboBoxSet(cmbKARB_ID, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    Exit Function
    
errJegyzKarbFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "JegyzKarbFeltolt"
End Function    'JegyzKarbFeltolt

Public Function Jegyzokonyv(ByRef cmbJTIP As Object, ByVal iJEGYZSZ As Integer, ByRef sDocPath As String) As Boolean
    On Error GoTo errJegyzokonyv
    Jegyzokonyv = False
    
    Dim objWord As Object
    Dim sDocSavePath As String
    
    Dim sJTIP As String 'Lekérdezzük a választott jegyzõkönyv típusát
    sJTIP = ComboBoxGet(Nothing, cmbJTIP)
    
    Dim lstParams As New Collection
    lstParams.Add iJEGYZSZ, "pID"
    lstParams.Add sJTIP, "pJTIP"
    Dim rstJEGYZ As New ADODB.Recordset
    oAdmin.ExecVal "sp_Jegyzokonyv", lstParams, rstJEGYZ
    
    Dim lstReplace As New Collection
    Dim a As ADODB.Field
    For Each a In rstJEGYZ.Fields
        lstReplace.Add a, a.Name
    Next
    
    Dim sDat As String
    sDat = CStr(rstJEGYZ("JDAT").Value)
    sDat = Replace(sDat, "/", ".")
    
    Dim sDotName As String
    Select Case sJTIP
        Case "1"
            sDotName = "homell"
            sDocSavePath = sDocPath + "Gepesz\Hom_ell\" + sDat + "_"
        Case "2"
            sDotName = "bizbe"
            sDocSavePath = sDocPath + "Gepesz\Bizt_sze\" + sDat + "_" + CStr(rstJEGYZ("CIM").Value) + "_"
        Case "3"
            sDotName = "himel"
            sDocSavePath = sDocPath + "Elektro\" + sDat + "_" + CStr(rstJEGYZ("TELEPHSZ").Value) + "_"
        Case "4"
            sDotName = "haziviz"
            sDocSavePath = sDocPath + "Gepesz\Hazi_viz\" + sDat + "_" + CStr(rstJEGYZ("CIM").Value) + "_"
    End Select
    
    Set objWord = WordAppNewDoc(sDocPath, sDotName, CStr(iJEGYZSZ), ".doc", sDocSavePath)  'Word indítása

    InsTextToWord objWord, lstReplace   'Word dokumentumon belül cseréket végrehajtjuk
    Set lstReplace = Nothing
    Jegyzokonyv = True
    Exit Function
    
errJegyzokonyv:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "Jegyzokonyv"
End Function    'Jegyzokonyv

Public Function JegyzLekerd(ByRef lstControls As Access.Controls, _
        ByRef grd As Object) As Boolean
    On Error GoTo errJegyzLekerd
    JegyzLekerd = False
    
    Dim lstParams As New Collection
    Dim sParam As String
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbMUVEL"))
    lstParams.Add sParam, "pMUVEL"
    sParam = ComboBoxGet(Nothing, lstControls("cmbOBJTIP"))
    lstParams.Add sParam, "pOBJTIP"
    sParam = ComboBoxGet(Nothing, lstControls("cmbOBJID"))
    lstParams.Add sParam, "pOBJID"
    sParam = ComboBoxGet(Nothing, lstControls("cmbJTIP"))
    lstParams.Add sParam, "pJTIP"
        
    With grd
        .FormatString = "<||Jegyz. száma|Jegyz. dátuma|Karbant. típ.|Mûvelet|Ber.típus|Berendezés|Gy. típ.|Telep.hsz.|Gy.szám"
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        FillGrid "sp_LekerdJegyz", lstParams, grd
    
        .AutoSize 2, grd.Cols - 1
        .ColWidth(1) = 0
        
        .MergeCells = flexMergeRestrictColumns
        Dim i As Integer
        For i = 1 To 9
            .MergeCol(i) = True
        Next i
    End With

    JegyzLekerd = True
    Exit Function
    
errJegyzLekerd:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "JegyzLekerd"
End Function    'JegyzLekerd

Public Function KepvisFeltolt(ByRef cmbKepvis As Object) As Boolean
    On Error GoTo errKepvisFeltolt
    KepvisFeltolt = False
    
    g_oKodszotar.Remove "KEPVIS"    'Töröljük az ál-kódszótári KEPVIS szekciót
    
    g_oKodszotar.Load "sp_FillKepvis", Nothing, "KEPVIS", "Közös képviselõk", 100
    KepvisFeltolt = ComboBoxSet(cmbKepvis, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    Exit Function
    
errKepvisFeltolt:
End Function    'KepvisFeltolt

Public Function KepvisLekerd(ByRef lstControls As Access.Controls, _
        ByRef grd As Object) As Boolean
    On Error GoTo errKepvisLekerd
    KepvisLekerd = False
    
    Dim lstParams As New Collection
    Dim sParam As String
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbEPUL"))
    lstParams.Add sParam, "pEPULID"
    sParam = ComboBoxGet(Nothing, lstControls("cmbKEPVIS"))
    lstParams.Add sParam, "pKEPVIS_ID"
    lstParams.Add lstControls("txtDATUMTOL").Value, "pDATUMTOL"
    lstParams.Add lstControls("txtDATUMIG").Value, "pDATUMIG"
        
    With grd
        .FormatString = "<||Lépcsõház|Szerz.sz.|Képviselõ|Képviselõ címe|Szolgáltatás|Kezdés|Befejezés"
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        FillGrid "sp_LekerdKepvis", lstParams, grd
    
        .AutoSize 2, grd.Cols - 1
        .ColWidth(1) = 0
        
        .MergeCells = flexMergeRestrictColumns
        Dim i As Integer
        For i = 1 To 6
            .MergeCol(i) = True
        Next i
    End With

    KepvisLekerd = True
    Exit Function
    
errKepvisLekerd:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "KepvisLekerd"
End Function    'KepvisLekerd

Public Function PrintKepvisLekerd(ByRef grd As Object, ByRef prt As Object, _
        ByRef lstControls As Access.Controls) As Boolean
    
    On Error GoTo errPrintKepvisLekerd
    PrintKepvisLekerd = False

    Dim lstParams As New Collection
    Dim sParam As String
    
    sParam = GetComboNev(lstControls("cmbEPUL"))
    lstParams.Add sParam, "pEPULET"
    sParam = GetComboNev(lstControls("cmbKEPVIS"))
    lstParams.Add sParam, "pKEPVIS"
    lstParams.Add lstControls("txtDATUMTOL").Value, "pDATUMTOL"
    lstParams.Add lstControls("txtDATUMIG").Value, "pDATUMIG"
    
    With prt
        .Preview = False
        '.Preview = True
        .Zoom = 100
        .Orientation = 1    'orLandscape
        .StartDoc

        Dim S As String
        
        S = "{\rtf1\ansi\ansicpg1250\uc1\deff0\deflang1033\deflangfe1038{\fonttbl{\f0\froman\fcharset0\fprq2{\*\panose02020603050405020304}Times New Roman;}{\f1\fswiss\fcharset0\fprq2{\*\panose"
        S = S & "020b0604020202020204}Arial;}{\f16\froman\fcharset238\fprq2 Times New Roman CE;}{\f17\froman\fcharset204\fprq2 Times New Roman Cyr;}{\f19\froman\fcharset161\fprq2 Times New Roman Greek;}{\f20\froman\fcharset162\fprq2 Times New Roman Tur;}"
        S = S & "{\f21\froman\fcharset186\fprq2 Times New Roman Baltic;}{\f22\fswiss\fcharset238\fprq2 Arial CE;}{\f23\fswiss\fcharset204\fprq2 Arial Cyr;}{\f25\fswiss\fcharset161\fprq2 Arial Greek;}{\f26\fswiss\fcharset162\fprq2 Arial Tur;}"
        S = S & "{\f27\fswiss\fcharset186\fprq2 Arial Baltic;}}{\colortbl;\red0\green0\blue0;\red0\green0\blue255;\red0\green255\blue255;\red0\green255\blue0;\red255\green0\blue255;\red255\green0\blue0;\red255\green255\blue0;\red255\green255\blue255;\red0\green0\blue128;"
        S = S & "\red0\green128\blue128;\red0\green128\blue0;\red128\green0\blue128;\red128\green0\blue0;\red128\green128\blue0;\red128\green128\blue128;\red192\green192\blue192;}{\stylesheet{\qj\nowidctlpar\widctlpar\adjustright \lang1038\cgrid \snext0 Normal;}{\s1\qj\sb240\sa60\keepn\nowidctlpar\widctlpar\adjustright"
        S = S & "\b\f1\fs28\lang1038\kerning28\cgrid \sbasedon0 \snext0 heading 1;}{\*\cs10 \additive Default Paragraph Font;}}\paperw11906\paperh16838\margl1417\margr1417\margt1417\margb1417\deftab708\widowctrl\ftnbj\aenddoc\hyphhotz425\formshade\viewkind4\viewscale158\viewzk2\pgbrdrhead\pgbrdrfoot \fet0\sectd \linex0\headery709\footery709\colsx709\endnhere\sectdefaultcl"
        S = S & "{\*\pnseclvl1\pnucrm\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl2\pnucltr\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl3\pndec\pnstart1\pnindent720\pnhang{\pntxta.}}{\*\pnseclvl4\pnlcltr\pnstart1\pnindent720\pnhang{\pntxta )}}{\*\pnseclvl5\pndec\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta"
        S = S & ")}}{\*\pnseclvl6\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}{\*\pnseclvl7\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}{\*\pnseclvl8\pnlcltr\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta )}}{\*\pnseclvl9\pnlcrm\pnstart1\pnindent720\pnhang{\pntxtb (}{\pntxta)}}\pard\plain \s1\qc\sb240\sa240\keepn\nowidctlpar\widctlpar\outlinelevel0\adjustright"
        S = S & "\b\f1\fs28\lang1038\kerning28\cgrid {Közös képviselõk lekérdezése\par }\line\line\pard\plain \qj\li2268\nowidctlpar\widctlpar\tx4962\adjustright \lang1038\cgrid {\f16Id\'f5szak:\tab "
        S = S & lstParams("pDATUMTOL") & "\endash  " & lstParams("pDATUMIG")
        S = S & "\par Épület \tab " & lstParams("pEPULET")
        S = S & "\par Képviselõ \tab " & lstParams("pKEPVIS") & "\par }\pard \qj\nowidctlpar\widctlpar\adjustright {\par }}"

        .TextRTF = S
        .NewPage
        
        .Footer = "|{\fs20 %d. oldal}|"
        .RenderControl = grd.hWnd
        .PrintDoc True
        .EndDoc
    End With
    
    PrintKepvisLekerd = True
    Exit Function

errPrintKepvisLekerd:
End Function    'PrintKepvisLekerd


Public Function SzerzfejFeltolt(ByRef cmbSzerzfej As Object) As Boolean
    On Error GoTo errSzerzfejFeltolt
    SzerzfejFeltolt = False
    
    g_oKodszotar.Remove "SZERZFEJ"    'Töröljük az ál-kódszótári SZERZFEJ szekciót
    
    g_oKodszotar.Load "sp_FillSzerzfej", Nothing, "SZERZFEJ", "Szerzõdések", 100
    SzerzfejFeltolt = ComboBoxSet(cmbSzerzfej, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    Exit Function
    
errSzerzfejFeltolt:
End Function    'SzerzfejFeltolt

Public Function SzerTetListFeltolt(ByRef cmbSzerzfej As Object, ByRef lstTetelek As Object) As Boolean
    SzerTetListFeltolt = False
    
    g_oKodszotar.Remove "SZERTET"   'Töröljük az ál-kódszótári SZERTET szekciót
    On Error GoTo errSzerTetListFeltolt
    
    Dim sSZERZ_ID As String
    sSZERZ_ID = ComboBoxGet(Nothing, cmbSzerzfej)   'Lekérdezzük a szerzõdés azonosítóját
    
    g_oKodszotar.Load "sp_FillSzerTet", Array("pSZERZ_ID", sSZERZ_ID), "SZERTET", "Szerzõdött lépcsõházak", 100
    
    ComboBoxSet lstTetelek, Nothing    'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    SzerTetListFeltolt = True
    Exit Function
    
errSzerTetListFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "SzerTetListFeltolt"
End Function    'SzerTetListFeltolt

Public Function SzerTetKapcsol(ByRef cmbMegnev As Object, ByRef lstControls As Access.Controls) As Boolean
    On Error GoTo errSzerTetKapcsol
    SzerTetKapcsol = False
    
    Dim sParam As String
    Dim lstParams As New Collection
    
    sParam = ComboBoxGet(Nothing, cmbMegnev)
    lstParams.Add sParam, "SZER_ID"
    
    'sParam = lstControls("txtSZERTET").Value
    'lstParams.Add sParam, "SZERTET"
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbOBJ_ID"))
    lstParams.Add sParam, "OBJ_ID"
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbCIKK"))
    lstParams.Add sParam, "CIKK"
    
    sParam = lstControls("txtCIKK_MENNY").Value
    lstParams.Add sParam, "CIKK_MENNY"
    
    sParam = lstControls("txtSZ_MENNY").Value
    lstParams.Add sParam, "SZ_MENNY"
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbMENNY_ME"))
    'sParam = lstControls("txtMENNY_ME").Value
    lstParams.Add sParam, "MENNY_ME"
    
    sParam = lstControls("txtOSSZEG").Value
    lstParams.Add sParam, "OSSZEG"
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbAFA"))
    lstParams.Add sParam, "AFA"
    
    SzerTetKapcsol = oAdmin.Exec("sp_InsSzerztet", lstParams)
    Exit Function
    
errSzerTetKapcsol:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "SzerTetKapcsol"
End Function    'SzerTetKapcsol

Public Function SzerTetSzetkapcsol(ByRef lstSzerTet As Object) As Boolean
    On Error GoTo errSzerTetSzetkapcsol
    SzerTetSzetkapcsol = False
    
    Dim sID As String
    
    sID = ComboBoxGet(Nothing, lstSzerTet)
    
    Dim lstParams As New Collection
    lstParams.Add sID, "pID"
    
    SzerTetSzetkapcsol = oAdmin.Exec("sp_DelSzerztet", lstParams)
    Exit Function

errSzerTetSzetkapcsol:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "SzerTetSzetkapcsol"
End Function    'SzerTetKapcsol

Public Function SzerTetOsszegSzamol(ByRef lstControls As Access.Controls) As Double
    Dim lstParams As New Collection
    
    Dim sSzolg As String
    sSzolg = ComboBoxGet(Nothing, lstControls("cmbSZOLG"))
    lstParams.Add sSzolg, "SZOLG"
    
    Dim dMenny As Double
    dMenny = CDbl(lstControls("txtSZ_MENNY").Value)
    
    Dim rstResult As New ADODB.Recordset
    If oAdmin.ExecVal("sp_GetSzertetOsszeg", lstParams, rstResult) = True Then
        SzerTetOsszegSzamol = Round(CDbl(rstResult(0).Value) * dMenny / 12, 2)
    Else
        SzerTetOsszegSzamol = 0
    End If
    
End Function    'SzerTetOsszegSzamol

Public Function SzerzFejLekerd(ByRef lstControls As Access.Controls, _
        ByRef grd As Object) As Boolean
    On Error GoTo errSzerzFejLekerd
    SzerzFejLekerd = False
    
    Dim lstParams As New Collection
    Dim sParam As String
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbKEPVIS"))
    lstParams.Add sParam, "KEPVIS_ID"
    sParam = ComboBoxGet(Nothing, lstControls("cmbSZOLG"))
    lstParams.Add sParam, "SZOLG"
    lstParams.Add lstControls("txtPAZ").Value, "PAZ"
    lstParams.Add lstControls("txtSZLA_CIKL").Value, "SZLA_CIKL"
    lstParams.Add lstControls("txtUGYFN").Value, "UGYFN"
    lstParams.Add lstControls("grpERVENYES").Value, "ERVENYES"
    lstParams.Add lstControls("txtDATUMTOL").Value, "DATUMTOL"
    lstParams.Add lstControls("txtDATUMIG").Value, "DATUMIG"
        
    With grd
        .FormatString = "<||Képviselõ|Szerz. azonosító|Lépcsõház|Szolgáltatás|Összeg|Száml. ciklus|Megrendelõ|Légköbméter|Me"
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        FillGrid "sp_LekerdSzerz", lstParams, grd
    
        .AutoSize 2, grd.Cols - 1
        .ColWidth(1) = 0
        
        .MergeCells = flexMergeRestrictColumns
        Dim i As Integer
        For i = 1 To 6
            .MergeCol(i) = True
        Next i
    End With

    SzerzFejLekerd = True
    Exit Function

errSzerzFejLekerd:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "SzerzFejLekerd"
End Function    'SzerzFejLekerd

Public Function SzolgLekerd(ByRef lstControls As Access.Controls, _
        ByRef grd As Object) As Boolean
    On Error GoTo errSzolgLekerd
    SzolgLekerd = False
    
    Dim lstParams As New Collection
    Dim sParam As String
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbSZOLG"))
    lstParams.Add sParam, "SZOLG"
    sParam = ComboBoxGet(Nothing, lstControls("cmbLEPCSOHAZ"))
    lstParams.Add sParam, "LEPCSOHAZ"
    sParam = ComboBoxGet(Nothing, lstControls("cmbFUTOMU"))
    lstParams.Add sParam, "FUTOMU"
        
    With grd
        .FormatString = "<||Fûtõmû|Lépcsõház|Szolgáltatás|Egységár|Érv. kezdete"
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        FillGrid "sp_LekerdSzolg", lstParams, grd
    
        .AutoSize 2, grd.Cols - 1
        .ColWidth(1) = 0
        
        .MergeCells = flexMergeRestrictColumns
        Dim i As Integer
        For i = 1 To 6
            .MergeCol(i) = True
        Next i
    End With

    SzolgLekerd = True
    Exit Function

errSzolgLekerd:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "SzolgLekerd"
End Function    'Szolglekerd

Public Function SzolgLekerdFutomuFeltolt(ByRef cmbMegnev As Object) As Boolean
    On Error GoTo errSzolgLekerdFutomuFeltolt
    SzolgLekerdFutomuFeltolt = False
    
    Dim sSectName As String
    sSectName = "FUTOMUMEGNEV"
    
    g_oKodszotar.Remove sSectName    'Töröljük az ál-kódszótári MEGNEV szekciót
    
    g_oKodszotar.Load "sp_FillObjMegnev", Array("pObjTip", "03"), sSectName, "Objektum megnevezése", 100
    SzolgLekerdFutomuFeltolt = ComboBoxSet(cmbMegnev, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    Exit Function
    
errSzolgLekerdFutomuFeltolt:
End Function    'SzolgLekerdFutomuFeltolt

Public Function SzlaGenAlt(ByRef txtTDAT As Object, ByRef txtFDAT As Object, ByRef txtSZLA_CIKL As Object) As Integer
    On Error GoTo errSzlaGenAlt
    SzlaGenAlt = 0
    
    Dim lstParams As New Collection
    lstParams.Add txtTDAT.Value, "TDAT"
    lstParams.Add txtFDAT.Value, "FDAT"
    lstParams.Add txtSZLA_CIKL.Value, "SZLA_CIKL"
    
    Dim rst As New ADODB.Recordset
    oAdmin.ExecVal "sp_GeneralAlt", lstParams, rst
    
    SzlaGenAlt = rst(0)
    
    Dim oConn As New ADODB.Connection
    oConn.Open m_sConnect
    Dim rst2 As New ADODB.Recordset
    
    With rst2
        .Open "SELECT ID,OSSZ_BRUTTO,OSSZ_TEXT FROM SZLA_ALT WHERE EGYEDI = 0 AND ZAROLT = 0", oConn
        If Not .BOF And Not .EOF Then
            .MoveFirst
            Do Until .EOF
                If Not IsNull(.Fields("OSSZ_BRUTTO").Value) Then
                    oConn.Execute "UPDATE SZLA_ALT SET OSSZ_TEXT = '" & ForintBetuvelKiir(Round(.Fields("OSSZ_BRUTTO").Value, 0)) & "' WHERE ID = " & .Fields("ID")
                    MsgBox ForintBetuvelKiir(Round(.Fields("OSSZ_BRUTTO").Value, 0))
                    '.Fields("OSSZ_TEXT").Value = ForintBetuvelKiir(Round(.Fields("OSSZ_BRUTTO").Value, 0))
                End If
            .MoveNext
            Loop
        End If
        .Close
    End With
    Set rst2 = Nothing
    oConn.Close
    Set oConn = Nothing
    Exit Function
    
errSzlaGenAlt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "SzlaGenAlt"
End Function

Public Function SzamlaMegtekint(ByRef lstControls As Access.Controls, _
        ByRef grd As Object, ByVal iZarolt As Integer, ByVal iEgyedi As Integer) As Boolean
    On Error GoTo errSzamlaMegtekint
    SzamlaMegtekint = False
    
    Dim lstParams As New Collection
    Dim sParam As String
    Dim sFormatString As String
    
    grd.Clear
        
    If iZarolt = 1 Then
        lstParams.Add lstControls("txtKEPVIS").Value, "KEPVIS"
        sParam = ComboBoxGet(Nothing, lstControls("cmbSZOLG"))
        lstParams.Add sParam, "SZOLG"
        lstParams.Add lstControls("txtPAZ").Value, "PAZ"
        lstParams.Add lstControls("txtDATUMTOL").Value, "DATUMTOL"
        lstParams.Add lstControls("txtDATUMIG").Value, "DATUMIG"
        lstParams.Add 1, "ZAROLT"
    Else
        lstParams.Add 0, "ZAROLT"
    End If
    lstParams.Add iEgyedi, "EGYEDI"
    
    If iEgyedi = 1 Then
        sFormatString = "<||Számlaszám|Megrendelõ|Megrendelõ címe|Teljesítés dátuma|Fiz. határidõ|Mennyiség|ME|Szolgáltatás|Egységár|Összeg"
    Else
        sFormatString = "<||Számlaszám|Partner|Közös képviselõ|Ügyfél|Teljesítés dátuma|Fiz. határidõ|Mennyiség|ME|Szolgáltatás|Egységár|Összeg"
    End If
    
    With grd
        .FormatString = sFormatString
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        FillGrid "sp_LekerdSzlaAlt", lstParams, grd
    
        .AutoSize 2, grd.Cols - 1
        .ColWidth(1) = 0
        
        .MergeCells = flexMergeRestrictColumns
        Dim i As Integer
        For i = 1 To grd.Cols - 1
            .MergeCol(i) = True
        Next i
    End With

    SzamlaMegtekint = True
    Exit Function

errSzamlaMegtekint:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "SzamlaMegtekint"
End Function    'SzamlaMegtekint

Public Function Zarol(iEgyedi As Integer) As Boolean
    On Error GoTo errZarol
    Zarol = False
    
    Dim lstParams As New Collection
    lstParams.Add iEgyedi, "EGYEDI"
    oAdmin.Exec "sp_Zarol", lstParams
    Zarol = True
    Exit Function
    
errZarol:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "Zarol"
End Function    'Zarol

Public Function PrintSzlaOssz() As Boolean
    On Error GoTo errPrintSzlaOssz
    PrintSzlaOssz = False

    'Dim lstParams As New Collection
    'lstParams.Add lstControls("txtDATUMTOL").Value, "DATUMTOL"
    'lstParams.Add lstControls("txtDATUMIG").Value, "DATUMIG"

    oAdmin.Exec "sp_MakeTAB413", Nothing

    PrintSzlaOssz = True
    Exit Function

errPrintSzlaOssz:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "PrintSzlaOssz"
End Function    'PrintSzlaOssz

Public Function PrintCsekk(ByVal iEgyedi As Integer) As Boolean
    On Error GoTo errPrintCsekk
    PrintCsekk = False

    Dim lstParams As New Collection
    lstParams.Add iEgyedi, "EGYEDI"
    oAdmin.Exec "sp_MakeCsekk", lstParams

    PrintCsekk = True
    Exit Function

errPrintCsekk:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "PrintCsekk"
End Function    'PrintCsekk

Public Function LekerdHierarchia(ByRef lstControls As Access.Controls, _
        ByRef grd As Object) As Boolean
    On Error GoTo errLekerdHierarchia
    LekerdHierarchia = False
    
    Dim lstParams As New Collection
    Dim sParam As String
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbMEGNEV"))
    lstParams.Add sParam, "pID"
    
    With grd
        .FormatString = "<||Berendezés típus|Megnevezés|Telepítési helyszám|Gyári szám"
        .AllowUserResizing = flexResizeColumns
        .SelectionMode = flexSelectionByRow
    
        If FillGrid("sp_LekerdHierarchia", lstParams, grd) > 0 Then
            .AutoSize 2, grd.Cols - 1
            .ColWidth(1) = 0
        
            .MergeCells = flexMergeRestrictColumns
            Dim i As Integer
            For i = 1 To 4
                .MergeCol(i) = True
            Next i
        End If
    End With

    LekerdHierarchia = True
    Exit Function

errLekerdHierarchia:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "LekerdHierarchia"
End Function    'LekerdHierarchia

Public Function EgyediSzlaFeltolt(ByRef cmbSZLA As Object) As Boolean
    On Error GoTo errEgyediSzlaFeltolt
    EgyediSzlaFeltolt = False
    
    g_oKodszotar.Remove "EGYEDISZLA"
    
    g_oKodszotar.Load "sp_FillSzlaEgyedi", Nothing, "EGYEDISZLA", "Egyedi számla", 100
    EgyediSzlaFeltolt = ComboBoxSet(cmbSZLA, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    Exit Function
    
errEgyediSzlaFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "EgyediSzlaFeltolt"
End Function    'EgyediSzlaFeltolt

Public Function EgyediSzlaTetListFeltolt(ByRef cmbSzlafej As Object, ByRef lstTetelek As Object) As Boolean
    EgyediSzlaTetListFeltolt = False
    
    g_oKodszotar.Remove "SZLATET"   'Töröljük az ál-kódszótári SZLATET szekciót
    On Error GoTo errEgyediSzlaTetListFeltolt
    
    Dim sSZLA_ID As String
    sSZLA_ID = ComboBoxGet(Nothing, cmbSzlafej) 'Lekérdezzük a számla azonosítóját
    
    g_oKodszotar.Load "sp_FillEgyediSzlaTet", Array("pSZLA_ID", sSZLA_ID), "SZLATET", "Egyedi számla tételei", 100
    
    ComboBoxSet lstTetelek, Nothing    'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    EgyediSzlaTetListFeltolt = True
    Exit Function
    
errEgyediSzlaTetListFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "EgyediSzlaTetListFeltolt"
End Function    'EgyediSzlaTetListFeltolt

Public Function EgyediSzlaTetKapcsol(ByRef cmbMegnev As Object, ByRef lstControls As Access.Controls) As Boolean
    On Error GoTo errEgyediSzlaTetKapcsol
    EgyediSzlaTetKapcsol = False
    
    Dim sParam As String
    Dim lstParams As New Collection
    
    sParam = ComboBoxGet(Nothing, cmbMegnev)
    lstParams.Add sParam, "SZLA_ID"
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbSZOLG"))
    lstParams.Add sParam, "CIKK"
    
    sParam = lstControls("txtSZ_MENNY").Value
    lstParams.Add sParam, "SZ_MENNY"
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbMENNY_ME"))
    lstParams.Add sParam, "MENNY_ME"
    
    sParam = lstControls("txtNOTERT").Value
    lstParams.Add sParam, "NOTERT"
    
    sParam = lstControls("txtOSSZEG").Value
    lstParams.Add sParam, "OSSZEG"
    
    sParam = ComboBoxGet(Nothing, lstControls("cmbAFA"))
    lstParams.Add sParam, "AFA"
    
    EgyediSzlaTetKapcsol = oAdmin.Exec("sp_InsEgyediSzlatet", lstParams)
    Exit Function
    
errEgyediSzlaTetKapcsol:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "EgyediSzlaTetKapcsol"
End Function    'EgyediSzlaTetKapcsol

Public Function EgyediSzlaTetSzetkapcsol(ByRef lstSzlaTet As Object) As Boolean
    On Error GoTo errEgyediSzlaTetSzetkapcsol
    EgyediSzlaTetSzetkapcsol = False
    
    Dim sID As String
    sID = ComboBoxGet(Nothing, lstSzlaTet)
    
    Dim lstParams As New Collection
    lstParams.Add sID, "pID"
    
    EgyediSzlaTetSzetkapcsol = oAdmin.Exec("sp_DelEgyediSzlatet", lstParams)
    Exit Function

errEgyediSzlaTetSzetkapcsol:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "EgyediSzlaTetSzetkapcsol"
End Function    'EgyediSzlaTetSzetkapcsol

Public Function EgyediSzlaTetOsszegSzamol(ByRef lstControls As Access.Controls) As Double
    On Error GoTo errEgyediSzlaTetOsszegSzamol
    EgyediSzlaTetOsszegSzamol = 0#
    
    Dim dEgysegar As Double
    dEgysegar = CDbl(lstControls("txtNOTERT").Value)
    
    Dim dMenny As Double
    dMenny = CDbl(lstControls("txtSZ_MENNY").Value)
    
    EgyediSzlaTetOsszegSzamol = Round(dEgysegar * dMenny, 2)
    Exit Function
    
errEgyediSzlaTetOsszegSzamol:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "EgyediSzlaTetOsszegSzamol"
End Function    'EgyediSzlaTetOsszegSzamol

Public Function ForintBetuvelKiir(Ft As Currency)
Static Szam(127)
Static Szov(127) As String
Dim Bft
Dim i, j As Long
Dim S As String, s1 As String, S2 As String
    i = 1
    For j = 1 To 30
        Szam(i) = j
        i = i + 1
    Next j
    For j = 40 To 100 Step 10
        Szam(i) = j
        i = i + 1
    Next j
    For j = 200 To 1000 Step 100
        Szam(i) = j
        i = i + 1
    Next j
    For j = 2000 To 30000 Step 1000
        Szam(i) = j
        i = i + 1
    Next j
    For j = 40000 To 100000 Step 10000
        Szam(i) = j
        i = i + 1
    Next j
    For j = 200000 To 1000000 Step 100000
        Szam(i) = j
        i = i + 1
    Next j
    For j = 2000000 To 30000000 Step 1000000
        Szam(i) = j
        i = i + 1
    Next j
    For j = 40000000 To 90000000 Step 10000000
        Szam(i) = j
        i = i + 1
    Next j
    Szov(1) = "egy"
    Szov(2) = "kettô"
    Szov(3) = "három"
    Szov(4) = "négy"
    Szov(5) = "öt"
    Szov(6) = "hat"
    Szov(7) = "hét"
    Szov(8) = "nyolc"
    Szov(9) = "kilenc"
    Szov(10) = "tiz"
    Szov(11) = "tizenegy"
    Szov(12) = "tizenkettô"
    Szov(13) = "tizenhárom"
    Szov(14) = "tizennégy"
    Szov(15) = "tizenöt"
    Szov(16) = "tizenhat"
    Szov(17) = "tizenhét"
    Szov(18) = "tizennyolc"
    Szov(19) = "tizenkilenc"
    Szov(20) = "húsz"
    Szov(21) = "huszonegy"
    Szov(22) = "huszonkettô"
    Szov(23) = "huszonhárom"
    Szov(24) = "huszonnégy"
    Szov(25) = "huszonöt"
    Szov(26) = "huszonhat"
    Szov(27) = "huszonhét"
    Szov(28) = "huszonnyolc"
    Szov(29) = "huszonkilenc"
    Szov(30) = "harminc"
    Szov(31) = "negyven"
    Szov(32) = "ötven"
    Szov(33) = "hatvan"
    Szov(34) = "hetven"
    Szov(35) = "nyolcvan"
    Szov(36) = "kilencven"
    Szov(37) = "egyszáz"
    Szov(38) = "kettôszáz"
    Szov(39) = "háromszáz"
    Szov(40) = "négyszáz"
    Szov(41) = "ötszáz"
    Szov(42) = "hatszáz"
    Szov(43) = "hétszáz"
    Szov(44) = "nyolcszáz"
    Szov(45) = "kilencszáz"
    Szov(46) = "egyezer"
    Szov(47) = "kettôezer"
    Szov(48) = "háromezer"
    Szov(49) = "négyezer"
    Szov(50) = "ötezer"
    Szov(51) = "hatezer"
    Szov(52) = "hétezer"
    Szov(53) = "nyolcezer"
    Szov(54) = "kilencezer"
    Szov(55) = "tizezer"
    Szov(56) = "tizenegyezer"
    Szov(57) = "tizenkettôezer"
    Szov(58) = "tizenháromezer"
    Szov(59) = "tizennégyezer"
    Szov(60) = "tizenötezer"
    Szov(61) = "tizenhatezer"
    Szov(62) = "tizenhétezer"
    Szov(63) = "tizennyolcezer"
    Szov(64) = "tizenkilencezer"
    Szov(65) = "húszezer"
    Szov(66) = "huszonegyezer"
    Szov(67) = "huszonkettôezer"
    Szov(68) = "huszonháromezer"
    Szov(69) = "huszonnégyezer"
    Szov(70) = "huszonötezer"
    Szov(71) = "huszonhatezer"
    Szov(72) = "huszonhétezer"
    Szov(73) = "huszonnyolcezer"
    Szov(74) = "huszonkilencezer"
    Szov(75) = "harmincezer"
    Szov(76) = "negyvenezer"
    Szov(77) = "ötvenezer"
    Szov(78) = "hatvanezer"
    Szov(79) = "hetvenezer"
    Szov(80) = "nyolcvanezer"
    Szov(81) = "kilencvenezer"
    Szov(82) = "egyszázezer"
    Szov(83) = "kettôszázezer"
    Szov(84) = "háromszázezer"
    Szov(85) = "négyszázezer"
    Szov(86) = "ötszázezer"
    Szov(87) = "hatszázezer"
    Szov(88) = "hétszázezer"
    Szov(89) = "nyolcszázezer"
    Szov(90) = "kilencszázezer"
    Szov(91) = "egymillió"
    Szov(92) = "kettômillió"
    Szov(93) = "hárommillió"
    Szov(94) = "négymillió"
    Szov(95) = "ötmillió"
    Szov(96) = "hatmillió"
    Szov(97) = "hétmillió"
    Szov(98) = "nyolcmillió"
    Szov(99) = "kilencmillió"
    Szov(100) = "tizmillió"
    Szov(101) = "tizenegymillió"
    Szov(102) = "tizenkettômillió"
    Szov(103) = "tizenhárommillió"
    Szov(104) = "tizennégymillió"
    Szov(105) = "tizenötmillió"
    Szov(106) = "tizenhatmillió"
    Szov(107) = "tizenhétmillió"
    Szov(108) = "tizennyolcmillió"
    Szov(109) = "tizenkilencmillió"
    Szov(110) = "húszmillió"
    Szov(111) = "huszonegymillió"
    Szov(112) = "huszonkettômillió"
    Szov(113) = "huszonhárommillió"
    Szov(114) = "huszonnégymillió"
    Szov(115) = "huszonötmillió"
    Szov(116) = "huszonhatmillió"
    Szov(117) = "huszonhétmillió"
    Szov(118) = "huszonnyolcmillió"
    Szov(119) = "huszonkilencmillió"
    Szov(120) = "harmincmillió"
    Szov(121) = "negyvenmillió"
    Szov(122) = "ötvenmillió"
    Szov(123) = "hatvanmillió"
    Szov(124) = "hetvenmillió"
    Szov(125) = "nyolcvanmillió"
    Szov(126) = "kilencvenmillió"
    S = ""
    Bft = Ft
    If Bft > 2000 Then
        S2 = "-"
                  Else
        S2 = ""
    End If
    Do While Bft > 0
        j = 1
        Do While Bft >= Szam(j)
            j = j + 1
        Loop
        j = j - 1
        s1 = Szov(j)
        If Right(S, 4) = Right(s1, 4) Then
            i = Len(S) - 4
            S = Left(S, i)
        End If
        If Bft < 1000 Then
            s1 = S2 & s1
            S2 = ""
        End If
        S = S & s1
        Bft = Bft - Szam(j)
    Loop
    i = Len(S) - 1
    Bft = Ft
    If Bft > 0 Then
        s1 = UCase(Left(S, 1)) & Right(S, i) & " Ft"
               Else
        s1 = ""
    End If
    
    ForintBetuvelKiir = s1
End Function


'   CheckPermis
'
'   Ellenõrzi, hogy az adott usernek milyen jogai vannak
'   az adott formra nézve
'
'   Paraméterek:    strForm As String   -   a form neve
'                   strLogin As String  -   a user loginja
'
'   Visszatérés:    Integer
'                   PERM_NULL, PERM_RO, PERM_RW
'
Public Function CheckPermis(ByRef strForm As String, ByRef strLogin As String)
    On Error GoTo errCheckPermis
    CheckPermis = PERM_NULL
    
    Dim lstParams As New Collection
    lstParams.Add strForm, "sForm"
    lstParams.Add strLogin, "sLogin"
    
    Dim sQuery As String
    sQuery = "sp_CheckPermis"
    Dim rs As New ADODB.Recordset
    If oAdmin.LoadFirstRecord(sQuery, lstParams, rs) = True Then
        CheckPermis = rs(0).Value
    End If
    Exit Function

errCheckPermis:
End Function

