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
' $Id$

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
Public Function Init(ByRef sReportDir As String, ByRef sANTSZDir As String, ByRef iWorkMode As Integer) As Boolean
'Public Function Init(ByRef sReportDir As String) As Boolean
    'On Error GoTo errInit
    Init = False

    'A formel.ini file-ból a szükséges adatok betöltése
    Dim FileNum, iCount As Integer
    Dim sInputLine, sDriver, sServer, sDatabase As String
    
    iWorkMode = NORMAL
    
    FileNum = FreeFile              'egy üres file sorszám kérése
    
    Open "C:\formel.ini" For Input As FileNum     'File nyitás olvasásra
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
            Case "sANTSZDir"
                sANTSZDir = Right(Trim(sInputLine), Len(sInputLine) - iCount)
            Case "mode"
                iWorkMode = CInt(Right(Trim(sInputLine), Len(sInputLine) - iCount))
        End Select
    Wend
    Close #FileNum                              'File zárás

    m_sConnect = sDriver & "; " & sServer & ";uid=sa;pwd=;" & sDatabase
    oAdmin.Login m_sConnect   'Bejelentkezik az SQL szerverre
    
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
    g_oKodszotar.Load "sp_Q345", Nothing, "345", "Lekérdezés vízórára", 11
    g_oKodszotar.Load "sp_Q346", Nothing, "346", "Lekérdezés érzékelõpárra", 11
    g_oKodszotar.Load "sp_Q347", Nothing, "347", "Lekérdezés hõösszegzõre", 11
    g_oKodszotar.Load "sp_Q348", Nothing, "348", "Plombázás", 1
    
    Select Case iWorkMode
        Case DISZPECSER
            g_oKodszotar.Load "sp_Q291D", Nothing, "291", "Szolgáltatás jellege", 2
            'g_oKodszotar.Load "sp_Q369", Nothing, "369", "Diszp.típushiba", 3
            g_oKodszotar.Load "sp_Q369", Nothing, "293", "Diszp.típushiba", 3
            g_oKodszotar.Load "sp_Q296_Diszp", Nothing, "296", "Objektum típus", 2
            g_oKodszotar.Load "sp_Q310D", Nothing, "310A", "Aktív fõkönyvi szám", 12
        Case NORMAL, MLAP
            g_oKodszotar.Load "sp_Q291", Nothing, "291", "Szolgáltatás jellege", 2
            g_oKodszotar.Load "sp_Q293", Nothing, "293", "Típus hiba", 3
            g_oKodszotar.Load "sp_Q296", Nothing, "296", "Objektum típus", 2
            g_oKodszotar.Load "sp_Q310A", Nothing, "310A", "Aktív fõkönyvi szám", 12
            g_oKodszotar.Load "sp_Q370", Nothing, "370", "Labor.jegyz.típus", 1
            g_oKodszotar.Load "sp_Q371", Nothing, "371", "Nyomtatás típusa", 5
            
        Case LABOR
            g_oKodszotar.Load "sp_Q296", Nothing, "296", "Objektum típus", 2
            g_oKodszotar.Load "sp_Q370", Nothing, "370", "Labor.jegyz.típus", 1
    End Select
    
    'ReDim gIdTable(24)
    'gIdTable = Array( _
    '27, _
    '28, _
    '29, _
    '30, _
    '31, _
    '32, _
    '9, _
    '26, _
    '34, _
    '38, _
    '20, _
    '39, _
    '24, _
    '43, _
    '41, _
    '45, _
    '40, _
    '46, _
    '915, _
    '47, _
    '674, _
    '44, _
    '1722)

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

'   MegnevFelt
'
'   Feltölti az objektum neveket tartalmazó combobox-ot a választott objektumtípusnak megfelelõen.
'
'   Paraméterek:    cmbMegnev As Object -   a feltöltendõ combobox
'                   cmbOBJTIP As Object -   az objektumtípusok combobox-a
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function MegnevFelt(ByRef cmbMegnev As Object, ByRef cmbOBJTIP As Object, ByVal sElsoOszlop As String, Optional ByVal zzz As String) As Boolean
    On Error GoTo errMegnevFelt
    MegnevFelt = False
    
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

    g_oKodszotar.Load "sp_FillObjMegnev", Array("pObjTip", sOBJTIP, "ELSOOSZLOP", sElsoOszlop), sSectName, "Objektum megnevezése", 100
    MegnevFelt = ComboBoxSet(cmbMegnev, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    cmbMegnev.ListWidth = 350
    Exit Function
    
errMegnevFelt:
End Function    'MegnevFelt

'   TelephszFeltolt
'
'   Feltölti a telepítési helyszámokat tartalmazó combobox-ot a választott objektumtípusnak megfelelõen.
'
'   Paraméterek:    cmbTelephsz As Object   -   a feltöltendõ combobox
'                   cmbOBJTIP As Object -   az objektumtípusok combobox-a
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function TelephszFeltolt(ByRef cmbTELEPHSZ As Object, ByRef cmbOBJTIP As Object, Optional ByVal zzz As String) As Boolean
    On Error GoTo errTelephszFeltolt
    TelephszFeltolt = False
    
    Dim sSectName As String
    If TypeName(zzz) = "Nothing" Then
        sSectName = "TELEPHSZ"
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
    
    g_oKodszotar.Load "sp_FillObjTelephsz", Array("pObjTip", sOBJTIP), sSectName, "Objektum telepítési helyszáma", 100
    TelephszFeltolt = ComboBoxSet(cmbTELEPHSZ, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    cmbTELEPHSZ.ListWidth = 350
    Exit Function
    
errTelephszFeltolt:
End Function    'TelephszFeltolt

'   MunkalapszamFeltolt
'
'   Feltölti a munkalapszámokat tartalmazó combobox-ot.
'
'   Paraméterek:    cmbMunkalap As Object   -   a feltöltendõ combobox
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function MunkalapszamFeltolt(ByRef cmbMunkalap As Object) As Boolean
    On Error GoTo errMunkalapszamFeltolt
    MunkalapszamFeltolt = False
    
    Dim sSectName As String
    sSectName = "MUNKALAP"
    
    g_oKodszotar.Remove sSectName    'Töröljük az ál-kódszótári MUNKALAP szekciót
    
    g_oKodszotar.Load "sp_FillMunkalapJegyz", Nothing, sSectName, "Munkalap száma", 100
    MunkalapszamFeltolt = ComboBoxSet(cmbMunkalap, Nothing) 'Betöltjük a kódszótárba a megnevezéseket, majd feltöltjük a combobox-ot
    cmbMunkalap.ListWidth = 350
    Exit Function
    
errMunkalapszamFeltolt:
End Function    'MunkalapszamFeltolt

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
        Case "LABOR"
            sQuery = "sp_LoadLabor"
        Case "JEGYZ"
            sQuery = "sp_LoadJegyz"
        Case "RAKTAR"
            sQuery = "sp_LoadRaktar"
        Case "RAKTARSZ"
            sQuery = "sp_LoadRaktarSz"
        Case Else
            sQuery = "sp_LoadObjEgyedi"
    End Select
       
    Dim rs As New ADODB.Recordset   'Betöltjük az azonosító alapján a rekordot
    If oAdmin.LoadFirstRecord(sQuery, lstParams, rs) = True Then
        If ControlsSet(rs, frm) Then    'Ha sikerült, feltöltjük a képernyõ kontrolljait adatokkal.
            RekordFeltolt = True
        End If
        
        If sKategoria = "LABOR" Then
            Dim oControl As Control
            On Error Resume Next
            For Each oControl In frm.Controls
                If Left(oControl.Name, 3) = "spc" Then
                    oControl = rs(Mid(oControl.Name, 4)).Value
                ElseIf oControl.Name = "cmbMUN_SORSZ" Then
                    MsgBox rs("MUN_SORSZ").Value
                    SetComboVal oControl, rs("MUN_SORSZ").Value
                End If
            Next
            On Error GoTo errRekordFeltolt
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
        Case "LABOR"
            sQuery = "sp_InsLabor"
        Case "BERRAKTARBA"
            sQuery = "sp_BerRaktMozgat"
            lstParams.Add "RAKTARBA", "pIRANY"
        Case "BERRAKTARBOL"
            sQuery = "sp_BerRaktMozgat"
            lstParams.Add "RAKTARBOL", "pIRANY"
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

Public Function GridderX(ByRef oGrid As Object, ByRef sKateg As String, ByRef frm As Object) As Boolean
    Dim sFormatstring As String
    Dim sQuery As String
    Dim iMerge As Integer
    Dim sParam As String
    Dim lstParams As New Collection
    Dim rs As New ADODB.Recordset   'A darabszam lekerdezeshez
    
    Select Case sKateg
        Case "MUNKALAP"
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
            sParam = GetComboErtek(frm.Controls("cmbOBJTIP"))
            lstParams.Add sParam, "OBJTIP"
            sParam = GetComboErtek(frm.Controls("cmbOBJID"))
            lstParams.Add sParam, "OBJID"
            sParam = GetComboErtek(frm.Controls("cmbDOLGID"))
            lstParams.Add sParam, "DOLGID"
            sParam = IIf(IsNull(frm.Controls("datDATUMTOL").Value), "", frm.Controls("datDATUMTOL").Value)
            lstParams.Add sParam, "DATUMTOL"
            sParam = IIf(IsNull(frm.Controls("datDATUMIG").Value), "", frm.Controls("datDATUMIG").Value)
            lstParams.Add sParam, "DATUMIG"
            sParam = IIf(IsNull(frm.Controls("datMUNDATTOL").Value), "", frm.Controls("datMUNDATTOL").Value)
            lstParams.Add sParam, "MUNDATTOL"
            sParam = IIf(IsNull(frm.Controls("datMUNDATIG").Value), "", frm.Controls("datMUNDATIG").Value)
            lstParams.Add sParam, "MUNDATIG"
            sParam = frm.Controls("txtMUNKALAPID").Text
            lstParams.Add sParam, "MUNKALAPID"
            sParam = GetComboNev(frm.Controls("cmbTELEPHSZ"))
            lstParams.Add sParam, "TELEPHSZ"
            sParam = IIf(IsNull(frm.Controls("datMUNELV").Value), "", frm.Controls("datMUNELV").Value)
            lstParams.Add sParam, "MUNELV"

' Lekérdezem a munkalap darabszámot
            sQuery = "sp_LoadMlapDb"
            If oAdmin.ExecVal(sQuery, lstParams, rs) = True Then
                rs.MoveFirst                 'A recordset elejére állunk
                frm.Controls("txtTALALAT").Text = CInt(rs.Fields("MLAPDB").Value)
            Else
                frm.Controls("txtTALALAT").Text = ""
            End If
' Elkészítem a grid-et
            sFormatstring = "<||Munkalap|Bejelentõ|Kiáll. dátum|Végezhetõ|Szolg. jellege|Helyszín|Berendezés|Telep. hsz.|Hiba leírása|Elvégzett munka|Dolgozó|Visszaírás|Munkaóra"
            sQuery = "sp_LekerdMlap"
            iMerge = 5
        
        Case "TELJ"
            sFormatstring = "<||Dolgozó|Munkavégzés dátuma|Munkaóra"
            sQuery = "sp_FillTeljm"
            iMerge = 1
            sParam = frm.Controls("txtID").Text
            lstParams.Add sParam, "pMUNKALAP_ID"
        
        Case "JEGYZ"
            sParam = GetComboErtek(frm.Controls("cmbMUVEL"))
            lstParams.Add sParam, "pMUVEL"
            sParam = GetComboErtek(frm.Controls("cmbOBJTIP"))
            lstParams.Add sParam, "pOBJTIP"
            sParam = GetComboErtek(frm.Controls("cmbOBJID"))
            lstParams.Add sParam, "pOBJID"
            sParam = GetComboErtek(frm.Controls("cmbJTIP"))
            lstParams.Add sParam, "pJTIP"
            sParam = IIf(IsNull(frm.Controls("datDATUMTOL").Value), "", frm.Controls("datDATUMTOL").Value)
            lstParams.Add sParam, "pDATUMTOL"
            sParam = IIf(IsNull(frm.Controls("datDATUMIG").Value), "", frm.Controls("datDATUMIG").Value)
            lstParams.Add sParam, "pDATUMIG"
        
' Lekérdezem a munkalap darabszámot
            sQuery = "sp_LoadJegyzDb"
            If oAdmin.ExecVal(sQuery, lstParams, rs) = True Then
                rs.MoveFirst                 'A recordset elejére állunk
                frm.Controls("txtTALALAT").Text = CInt(rs.Fields("JEGYZDB").Value)
            Else
                frm.Controls("txtTALALAT").Text = ""
            End If
' Elkészítem a grid-et

            Select Case lstParams("pJTIP")
                Case "1", "2", "3", "4", "5", "6", "7"
                    sFormatstring = "<||Jegyz. száma|Jegyz. dátuma|Karbant. típ.|Mûvelet|Ber.típus|Berendezés|Gy. típ.|Telep.hsz.|Gy.szám"
                    iMerge = 9
                Case "8"
                    sFormatstring = "<||Jegyz. száma|Jegyz. dátuma|Jegyz. típusa|Fûtõmû|Munkalap"
                    iMerge = 2
                Case Else
                    sFormatstring = "<||Jegyz. száma|Jegyz. dátuma|Jegyz. típusa|Berendezés|Ber.típus|Gy.szám"
                    iMerge = 3
            End Select
            sQuery = "sp_LekerdJegyz"
        
        Case "RAKTAR"
            sParam = GetComboErtek(frm.Controls("cmbOBJTIP"))
            lstParams.Add sParam, "pOBJTIP"
            sParam = GetComboErtek(frm.Controls("cmbOBJID"))
            lstParams.Add sParam, "pOBJID"
            sParam = IIf(IsNull(frm.Controls("datDATUMTOL").Value), "", frm.Controls("datDATUMTOL").Value)
            lstParams.Add sParam, "pDATUMTOL"
            sParam = IIf(IsNull(frm.Controls("datDATUMIG").Value), "", frm.Controls("datDATUMIG").Value)
            lstParams.Add sParam, "pDATUMIG"
            'Találatszám lekérdezése
            sQuery = "sp_LoadBerRaktarDb"
            If oAdmin.ExecVal(sQuery, lstParams, rs) = True Then
                rs.MoveFirst                 'A recordset elejére állunk
                frm.Controls("txtR_TALALAT").Text = CLng(rs.Fields("TALALAT").Value)
            Else
                frm.Controls("txtR_TALALAT").Text = "0"
            End If
            
            sFormatstring = "<||Ber.típ.|Megnev|Bekerülés|Típus|Telep.hsz.|Gy.szám"
            sQuery = "sp_LekerdBerraktar"
            iMerge = 1
        
        Case "RAKTARSZ"
            sParam = GetComboErtek(frm.Controls("cmbOBJTIP"))
            lstParams.Add sParam, "pOBJTIP"
            sParam = GetComboErtek(frm.Controls("cmbOBJID"))
            lstParams.Add sParam, "pOBJID"
            'Találatszám lekérdezése
            sQuery = "sp_LoadBerRaktarSzDb"
            If oAdmin.ExecVal(sQuery, lstParams, rs) = True Then
                rs.MoveFirst                 'A recordset elejére állunk
                frm.Controls("txtSZ_TALALAT").Text = CLng(rs.Fields("TALALAT").Value)
            Else
                frm.Controls("txtSZ_TALALAT").Text = "0"
            End If
            
            sFormatstring = "<||Ber.típ.|Megnev.|Típus|Telep.hsz.|Gy.szám"
            sQuery = "sp_LekerdBerraktarSz"
            iMerge = 1
        
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
        On Error Resume Next
        frm.Controls("txt1") = IIf(IsNull(rs("OBJTIP").Value), "", rs("OBJTIP").Value)
        frm.Controls("txt2") = IIf(IsNull(rs("MEGNEV").Value), "", rs("MEGNEV").Value)
        frm.Controls("txt3") = IIf(IsNull(rs("INFO").Value), "", rs("INFO").Value)
        On Error GoTo errMunkalapObjKiir
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

Public Function DuplikalMunk(ByRef strMUNKALAP_ID As String) As Long
    On Error GoTo errDuplikalMunk
    DuplikalMunk = 0
    
    Dim lstParams As New Collection
    lstParams.Add strMUNKALAP_ID, "pID"
    
    Dim rst As New ADODB.Recordset
    If oAdmin.ExecVal("sp_DuplikalMunk", lstParams, rst) = True Then
        DuplikalMunk = rst(0).Value
    End If
    Exit Function
    
errDuplikalMunk:
    DuplikalMunk = 0
End Function

Public Function PrintMunkalapSok(ByRef strMUNKALAP_REF As String, ByVal iKateg As Integer) As Boolean
    On Error GoTo errPrintMunkalapSok
    PrintMunkalapSok = False
    
    Dim sQuery As String
    
    Dim lstParams As New Collection
    lstParams.Add strMUNKALAP_REF, "pREF"
    
    Select Case iKateg
        Case 1
            sQuery = "sp_FillTabPlomb"
        Case 2
            sQuery = "sp_FillTabVizora"
    End Select
    
    If oAdmin.Exec(sQuery, lstParams) = True Then
        PrintMunkalapSok = True
    End If
    Exit Function
    
errPrintMunkalapSok:
End Function

Public Function Jegyzokonyv(ByRef sJTIP As String, ByVal iJEGYZSZ As Integer, ByRef sDocPath As String) As Boolean
    On Error GoTo errJegyzokonyv
    Jegyzokonyv = False
    
    Dim objWord As Object
    Dim sDocSavePath As String
    
    'Dim sJTIP As String 'Lekérdezzük a választott jegyzõkönyv típusát
    'sJTIP = ComboBoxGet(Nothing, cmbJTIP)
    
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
    On Error Resume Next
    sDat = ""
    sDat = CStr(rstJEGYZ("JDAT").Value)
    sDat = Replace(sDat, "/", ".")
    On Error GoTo errJegyzokonyv
    
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
        Case "8"
            sDotName = "labor"
            sDocSavePath = sDocPath + lstReplace("FUTOMU")
            If Right(sDocSavePath, 1) = "." Then
                sDocSavePath = Left(sDocSavePath, Len(sDocSavePath) - 1)
            End If
            sDat = Date
            sDocSavePath = sDocSavePath + "\" + sDat + ". - "
            sDocSavePath = Replace(sDocSavePath, "/", ".")
        End Select
    
    Set objWord = WordAppNewDoc(sDocPath, sDotName, CStr(iJEGYZSZ), ".doc", sDocSavePath)  'Word indítása

    InsTextToWord objWord, lstReplace   'Word dokumentumon belül cseréket végrehajtjuk
    Set lstReplace = Nothing
    Jegyzokonyv = True
    Exit Function
    
errJegyzokonyv:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "Jegyzokonyv"
End Function    'Jegyzokonyv

'   OsszesitoFeltolt
'
'   Feltölti az összesítõ jegyzõkönyv elpválasztó képernyõ combobox-ait.
'
'   Paraméterek:    frm -   a kitöltendõ form
'
'   Visszatérés:    Boolean. True, ha minden OK, egyébként False
'
Public Function OsszesitoFeltolt(ByRef frm As Object) As Boolean
    OsszesitoFeltolt = False
    
    On Error Resume Next
    Dim i As Integer
    For i = 1 To 23
        g_oKodszotar.Remove "labor" + CStr(i)
    Next i
    
    On Error GoTo errOsszesitoFeltolt
    
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 27), "labor1", "labor1", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 28), "labor2", "labor2", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 29), "labor3", "labor3", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 30), "labor4", "labor4", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 31), "labor5", "labor5", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 32), "labor6", "labor6", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 9), "labor7", "labor7", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 26), "labor8", "labor8", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 34), "labor9", "labor9", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 38), "labor10", "labor10", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 20), "labor11", "labor11", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 39), "labor12", "labor12", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 24), "labor13", "labor13", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 43), "labor14", "labor14", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 41), "labor15", "labor15", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 45), "labor16", "labor16", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 40), "labor17", "labor17", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 46), "labor18", "labor18", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 915), "labor19", "labor19", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 47), "labor20", "labor20", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 674), "labor21", "labor21", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 44), "labor22", "labor22", 10
    g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFUTOMU_ID", 1722), "labor23", "labor23", 10
    
    OsszesitoFeltolt = SetCombo(frm)
    Exit Function
    
    'hat ez lenne a tisztesseges megoldas... ha a tomb mukodne
    Dim ctrlNum As Integer
    Dim futomuId As Long
    Dim sSectName As String
    Dim ctrl As Object
    
    For Each ctrl In frm.Controls
        If Left(ctrl.Name, 3) = "cmb" Then
            ctrlNum = CInt(Mid(ctrl.Name, 4))   'a combobox száma
            futomuId = gIdTable(ctrlNum) 'fûtõmû objid (a tömbbõl kiolvasva)
            sSectName = "labor" + CStr(ctrlNum)
            g_oKodszotar.Load "sp_FillLaborJegyz", Array("pFutomu_Id", futomuId), sSectName, sSectName, 10
        End If
    Next
    
    OsszesitoFeltolt = True
    Exit Function

errOsszesitoFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "OsszesitoFeltolt"
End Function    'OsszesitoFeltolt

'   LaborOsszesito
'
'   Összeállítja a labor összesítõ jegyzõkönyvet a labor_o.dot Word sablon alapján
'
'   Paraméterek:    sDocPath    -   a sablon file-t tartalmazó könyvtár elérési útja
'
'   Visszatérés:    Boolean. True, ha minden OK, egyébként False
'
Public Function LaborOsszesito(ByRef sDocPath As String, sDate As String) As Boolean
    On Error GoTo errLaborOsszesito
    LaborOsszesito = False
    
    Dim rstLabor As New ADODB.Recordset
    Dim lstParams As New Collection
    lstParams.Add sDate, "pDATUM"
    oAdmin.ExecVal "sp_LaborOsszesito", lstParams, rstLabor
    
    'Melyik mezõket kell cserélni és mire
    Dim lstReplace As New Collection
    Dim a As ADODB.Field
    For Each a In rstLabor.Fields
        lstReplace.Add a, a.Name
    Next
    
'    a.Value = sDate
'    a.Name = "DATUM"
'    lstReplace.Add a, a.Name
    
    'Sablon alapján létrehozzuk a Word doksit
    Dim sDotName As String
    Dim sDocSaveName As String
    Dim sDocSavePath As String
    sDotName = "labor_o"
    sDocSavePath = sDocPath
    sDocSaveName = "Vízvizsg.havi.össz." + sDate
    
    Dim objWord As Object
    Set objWord = WordAppNewDoc(sDocPath, sDotName, sDocSaveName, ".doc", sDocSavePath)
    
    'Word dokumentumon belül cseréket végrehajtjuk
    InsTextToWord objWord, lstReplace
    
    Set lstReplace = Nothing
    LaborOsszesito = True
    Exit Function
    
errLaborOsszesito:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "LaborOsszesito"
End Function    'LaborOsszesito


'   OsszesitoKivalaszt
'
'   Automatikusan kitölti az összesítõ jegyzõkönyv jegyzõkönyv sorszámait
'       a megadott dátum alapján
'
'   Paraméterek:    sDate   -   jegyzõkönyvek készítési dátuma (csak év/hónap számít)
'
'   Visszatérés:    Boolean. True, ha minden OK, egyébként False
'
Public Function OsszesitoKivalaszt(ByRef sDate As String, ByRef frm As Object) As Boolean
    On Error GoTo errOsszesitoKivalaszt
    OsszesitoKivalaszt = False
    
    'Feltölti a comboboxokat az összes, rájuk vonatkozó jegyzõkönyvszámokkal
    OsszesitoFeltolt frm
    
    'Feltölti az átmeneti SQL táblát, amibõl kiolvassuk a jegyzõkönyvek adatait
    Dim lstParams As New Collection
    lstParams.Add sDate, "pDATUM"
    oAdmin.Exec "sp_FillOsszesitoSorsz", lstParams
    lstParams.Remove "pDATUM"
    
    'Lekérdezzük, hogy melyik helyhez melyik az aktuális jegyzõkönyv,
    ' és ráállítjuk a comboboxokat.
    Dim rstResult As New ADODB.Recordset
    Dim sCmbSorsz As Integer
    Dim cmb As Object
    For Each cmb In frm.Controls
        If Left(cmb.Name, 3) = "cmb" Then   'végigmegyünk az összes comboboxon
            sCmbSorsz = Right(cmb.Tag, Len(cmb.Tag) - 5)    'a nevébõl kiolvasható, melyik sorban van az adata
            lstParams.Add sCmbSorsz, "pSORSZ"
            On Error Resume Next
            If oAdmin.ExecVal("sp_GetOsszesitoSorsz", lstParams, rstResult) = True Then
                SetComboVal cmb, rstResult("SORSZ").Value
                cmb.Enabled = True
            End If
            On Error GoTo errOsszesitoKivalaszt
            lstParams.Remove "pSORSZ"
        End If
    Next
    
    OsszesitoKivalaszt = True
    Exit Function
    
errOsszesitoKivalaszt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "OsszesitoKivalaszt"
End Function    'OsszesitoKivalaszt
