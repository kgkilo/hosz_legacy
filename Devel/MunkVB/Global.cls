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
    g_oKodszotar.Load "sp_Q298", Nothing, "298", "Mûvelet típusa", 3
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

'   RekordFeltolt
'
'   Feltölti a kiválasztott objektum adatival a képernyõt.
'
'   Paraméterek:    cmbMegnev As Object -   az objektum megnevezések combobox-a
'                   lstControls As Access.Controls  -   a képernyõn található kontrollok.
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function RekordFeltolt(ByRef frm As Object, ByVal sKategoria As String, ByVal sID As Integer) As Boolean
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
Public Function RekordUpdate(ByRef frm As Object, ByVal sKategoria As String, ByVal sID As Integer) As Boolean
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
Public Function RekordDel(ByVal sKategoria As String, ByVal sID As Integer) As Boolean
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

Public Function GridderX(ByRef oGrid As Object, ByRef sKateg As String, ByRef frm As Object) As Boolean
    Dim sFormatstring As String
    Dim sQuery As String
    Dim iMerge As Integer
    Dim sParam As String
    Dim lstParams As New Collection
    
    Select Case sKateg
        Case "MUNKALAP"
            sFormatstring = "<||Munkalap|Bejelentõ|Kiáll. dátum|Szolg. jellege|Helyszín|Berendezés|Telep. hsz.|Hiba leírása|Elvégzett munka|Dolgozó|Visszaírás|Munkaóra"
            sQuery = "sp_LekerdMlap"
            iMerge = 2
            sParam = GetComboErtek(frm.Controls("cmbMLAPTIP"))
            lstParams.Add sParam, "MLAPTIP"
            sParam = GetComboErtek(frm.Controls("cmbSZOLGJELL"))
            lstParams.Add sParam, "SZOLGJELL"
            sParam = GetComboErtek(frm.Controls("cmbTIPUSH"))
            lstParams.Add sParam, "TIPUSH"
            sParam = GetComboErtek(frm.Controls("cmbFSZAM"))
            lstParams.Add sParam, "FSZAM"
            sParam = GetComboErtek(frm.Controls("cmbALLAPOT"))
            lstParams.Add sParam, "ALLAPOT"
            sParam = GetComboErtek(frm.Controls("cmbOBJID"))
            lstParams.Add sParam, "OBJID"
            sParam = GetComboErtek(frm.Controls("cmbDOLGID"))
            lstParams.Add sParam, "DOLGID"
            sParam = frm.Controls("txtDATUMTOL").Text
            lstParams.Add sParam, "DATUMTOL"
            sParam = frm.Controls("txtDATUMIG").Text
            lstParams.Add sParam, "DATUMIG"
            sParam = frm.Controls("txtMUNDATTOL").Text
            lstParams.Add sParam, "MUNDATTOL"
            sParam = frm.Controls("txtMUNDATIG").Text
            lstParams.Add sParam, "MUNDATIG"
        
        Case "TELJ"
            sFormatstring = "<||Dolgozó|Munkavégzés dátuma|Munkaóra"
            sQuery = "sp_FillTeljm"
            iMerge = 1
            sParam = frm.Controls("txtID").Text
            lstParams.Add sParam, "pMUNKALAP_ID"
        
        Case Else
            
    End Select
    
    FillGrid sQuery, lstParams, oGrid, sFormatstring, iMerge
End Function    'GridderX

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
Public Function TeljListFeltolt(ByRef sMUNKALAP_ID As String, ByRef frm As Object) As Boolean
    On Error GoTo errTeljListFeltolt
    TeljListFeltolt = False
    
    Dim lstParams As New Collection
    lstParams.Add sMUNKALAP_ID, "pMUNKALAP_ID"
    Dim rstResult As New ADODB.Recordset
    If oAdmin.ExecVal("sp_GetTeljmSum", lstParams, rstResult) = True Then 'Végrehajtjuk az inzertet
        frm.Controls("spcMUNOSZ") = CStr(rstResult(0).Value)
    End If
    
    TeljListFeltolt = True
    Exit Function
    
errTeljListFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "TeljListFeltolt"
End Function    'TeljListFeltolt

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

Public Function MunkalapObjKiir(ByRef frm As Object) As Boolean
    On Error GoTo errMunkalapObjKiir
    MunkalapObjKiir = False
    
    Dim lstParams As New Collection 'és átadjuk majd paraméterként
    Dim sID As String
    sID = frm.Controls("txtOBJID").Text
    
    lstParams.Add sID, "OBJID"
        
    Dim sQuery As String
    sQuery = "sp_GetMunkalapObj"
    
    Dim rs As New ADODB.Recordset   'Betöltjük az azonosító alapján a rekordot
    
    If oAdmin.ExecVal(sQuery, lstParams, rs) = True Then
    'If oAdmin.LoadFirstRecord("sp_GetTulajInfo", lstParams, rs) = True Then    'és ha sikerült
        frm.Controls("txt1") = IIf(IsNull(rs("OBJTIP").Value), "", rs("OBJTIP").Value)
        frm.Controls("txt2") = IIf(IsNull(rs("MEGNEV").Value), "", rs("MEGNEV").Value)
        frm.Controls("txt3") = IIf(IsNull(rs("INFO").Value), "", rs("INFO").Value)
        MunkalapObjKiir = True
    End If
    Exit Function
    
errMunkalapObjKiir:
    MsgBox Err.Description & ", No:" & Err.Number, , "MunkalapObjKiir"
End Function

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
















'--------------------------

