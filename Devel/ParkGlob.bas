Attribute VB_Name = "ParkGlobals"

'-------------------------------------------------------------------
'- MiniPark rendszer készítette: Szojka Csaba - Xant Bt. 1998-1999 -
'-------------------------------------------------------------------

Option Explicit

Public APP_PARAMS As String                          'Alkalmazás indítási paramétere (ha van)

Public Const G_DEFUID = "sa"                        'Alapért. felszanálói név
Public Const G_DEFPWD = ""                          'Alapért. jelszó
Public Const G_DEFODBCDSN = "MiniPark"              'ODBC connect neve
Public Const G_DATABASENAME = "MiniPark"            'Adatbázis neve
Public Const G_SQLSERVERNAME = "NT"                 'SQL szerver neve

'Frissítések gyorsítására szolgáló glob. változók
Public G_FESET As Boolean

'Kódszótár elemek azonosítói, kódtípusok
Public Const G_Q001 = "01"
Public Const G_Q002 = "02"
Public Const G_Q003 = "03"
Public Const G_Q004 = "04"
Public Const G_Q099 = "99"
Public Const G_Q100 = "100"
Public Const G_Q102 = "102"
Public Const G_Q103 = "103"
Public Const G_Q104 = "104"
Public Const G_Q105 = "105"
Public Const G_Q106 = "106"
Public Const G_Q107 = "107"
Public Const G_Q108 = "108"
Public Const G_Q109 = "109"
Public Const G_Q110 = "110"
Public Const G_Q111 = "111"
Public Const G_Q112 = "112"
Public Const G_Q114 = "114"
Public Const G_Q115 = "115"
Public Const G_Q116 = "116"
Public Const G_Q117 = "117"
Public Const G_Q118 = "118"
Public Const G_Q119 = "119"
Public Const G_Q120 = "120"
Public Const G_Q121 = "121"
Public Const G_Q122 = "122"
Public Const G_Q125 = "125"
Public Const G_Q126 = "126"
Public Const G_Q129 = "129"
Public Const G_Q130 = "130"
Public Const G_Q132 = "132"
Public Const G_Q133 = "133"
Public Const G_Q134 = "134"
Public Const G_Q135 = "135"
Public Const G_Q136 = "136"
Public Const G_Q200 = "200"
Public Const G_Q201 = "201"
Public Const G_Q202 = "202"
Public Const G_Q203 = "203"
Public Const G_Q205 = "205"
Public Const G_Q206 = "206"
Public Const G_Q208 = "208"
Public Const G_Q223 = "223"
Public Const G_Q224 = "224"
Public Const G_Q272 = "272"

Public Const B_COUNT = 8    ' Word beszúrandó változó szüvegelemek száma
Public Const REKSUB_MAX = 30

Public S_DOCPATH  As String
Public S_APPDOCP  As String
Public S_APPBANK  As String
Public S_APPBANKA As String
Public Const S_DOCTIPDOT = ".dot"
Public Const S_DOCTIPDOC = ".doc"
Public Const S_ALAPMINTA = "Alapminta"
Public Const S_ALAPMINTASZ = "AlapmintaSz"

Public g_oCFVisible As New CFVisib              'Cimék és üzenetek objektuma

Public g_aWordVText(B_COUNT, 2) As String   '  A Word könyvjelzõinek gyûjtõje

Public g_DocAct As Boolean                  'Jelzi, hogy a dokumentumot létrehoztuk, vagy megnyitottuk
Public g_rParam As CRecord                  'Rendszerparaméterek tömbje
Public g_RtulAd, g_FelhAd As String

Public g_Report As CrystalReport            'Report objektum

Public g_Lista As String
Public g_ListaTag As String
Public g_ListaName As String

Public g_oJogcsopFDef As CRecordDef               'Jogcímcsoportok segéd objektuma a forgalom keseléséhez
Public g_oJogcsopDef As CRecordDef                'Jogcímcsoportok objektuma
Public g_oKodDef As CRecordDef                    'Kódszótári elemek objektuma
Public g_oNaploDef As CRecordDef                  'Naplózás rekord objektuma
Public g_oRparDef As CRecordDef                   'Rendszerparaméterek objektuma
Public g_oParkoloDef As CRecordDef                'A Parkolók objektuma
Public g_oGepkocsiDef As CRecordDef               'A gépkocsik objektuma
Public g_oPartnerEDef As CRecordDef               'Egyéb gépkocsihoz kapcsolódó személyt leíró segéd objektum
Public g_oGepkocsiTNDef As CRecordDef             'Munkastruktúra a tulajdonos nélküli gépkocsikhoz
Public g_oPartnerDef As CRecordDef                'A gépkocsi tulajdonosok objektuma
Public g_oDolgozoDef As CRecordDef                'A Dolgozók objektuma
Public g_oMozgasDef As CRecordDef                 'A mozgásnemeket leíró objektum
Public g_oJogcimekDef As CRecordDef               'A jogcímeket leíró objektum
Public g_oArDef As CRecordDef                     'Az árakat leíró objektum
Public g_oGkPartnerDef As CRecordDef              'A gépkocsik tulajdonosok-gépkocsi kapcsolatot leíró objektum
Public g_oArgenDef As CRecordDef                  'Árképzés leíró objektuma
Public g_oIndokokDef As CRecordDef                'Az indokokat leíró objektum
Public g_oPartnerMDef As CRecordDef               'Munkastruktúra a tulajdonos nélküli gépkocsik tulajdonosának kezeléséhez
Public g_oEsetLeirDef As CRecordDef               'Esetleírásokat leíró objektum
Public g_oEllentmDef As CRecordDef                'Ellentmondásokat leíró objektum
Public g_oBirosagDef As CRecordDef                'Bírósági esetek leíró objektuma
Public g_oLevelekDef As CRecordDef                'Leveleket leíró objektum

Public g_oKodszotar As CKodSzotar           'Kódok rekord objektuma

Public g_oStatus As CStatusBar
'Public g_oTimer As CTimer
Public g_iLoginFlag As Integer

Public oAdmin As CadminADO 'Ez a külsõ adatelérést végzõ réteg
Public g_oLogin As CLoginStruct
Public g_oIni As CIniFile
Public g_sDSN As String
Public g_sUID As String
Public g_sPWD As String
Public g_sDefaultDBName As String

'HTML Help konstansok és deklaráció Szojka Csaba 1998. Dec 22
Public MYHELP_FILE As String
Public Const HH_HELP_CONTEXT = &HF
Public Declare Function HtmlHelpLongArg Lib "hhctrl.ocx" _
        Alias "HtmlHelpA" (ByVal hwndCaller As Long, _
        ByVal pszFile As String, ByVal uCommand As Long, _
        ByVal dwData As Long) As Long
Sub GlobalRecordDef()
    
     Set g_oKodDef = New CRecordDef
     With g_oKodDef
        .Key = "KODTIP"
        .Key = "KODERT"
        .Field = "KODENEV"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdKod"
        .DelSQL = g_sDefaultDBName & "..rpc_DelKod"
        .InsSQL = g_sDefaultDBName & "..rpc_InsKod"
        .GetSQL = g_sDefaultDBName & "..rpc_GetKod"
        .RecordSourceName = g_sDefaultDBName & "..KODSZOT"
        .Name = "KODOK"
     End With
     
     Set g_oNaploDef = New CRecordDef
     With g_oNaploDef
        .Key = "FUTNID":    .FieldType = vbLong
        .Field = "USERID":  .FieldType = vbLong
        .Field = "INDTIME": .FieldType = vbDate
        .UpdSQL = g_sDefaultDBName & "..rpc_Upd" 'FutNaplo" 'Nem használt
        .DelSQL = g_sDefaultDBName & "..rpc_Del" 'FutNaplo" 'Nem használt
        .InsSQL = g_sDefaultDBName & "..rpc_Ins" 'FutNaplo" 'Nem használt
        .GetSQL = g_sDefaultDBName & "..rpc_Get" 'FutNaplo" 'Nem használt
        .RecordSourceName = g_sDefaultDBName & "..FUTNAPLO"
        .Name = "KEP004"
     End With
     
     Set g_oRparDef = New CRecordDef
     With g_oRparDef
        .Key = "RID":           .FieldType = vbLong
        .Field = "ALNEV"
        .Field = "ALRNEV"
        .Field = "VERZIO"
        .Field = "VERMOD":      .FieldType = vbDate
        .Field = "RTUL"
        .Field = "RCIM"
        .Field = "RTEL"
        .Field = "RBANKSZ"
        .Field = "RADOSZ"
        .Field = "SMENT"
        .Field = "DMENT"
        .Field = "RVED"
        .Field = "NEV"
        .Field = "NEV1"
        .Field = "VAROS"
        .Field = "UTCA"
        .Field = "IRSZ"
        .Field = "PF"
        .Field = "TELEFON"
        .Field = "BANK"
        .Field = "ADO"
        .Field = "WATIR"
        .Field = "ORSZAG"
        .Field = "LEKAVAL"
        .Field = "TARGYEV"
        .Field = "MEGYE"
        .Field = "PVAROS"
        .Field = "AFA"
        .Field = "FKOD"
        .Field = "PELDANY":      .FieldType = vbInteger
        .Field = "PBAZON":       .FieldType = vbLong
        .Field = "KAZON":        .FieldType = vbLong
        .Field = "TURIDO":       .FieldType = vbInteger
        .Field = "TURIDOE":      .FieldType = vbInteger
        .Field = "TURIDOM":      .FieldType = vbInteger
        .Field = "ELLINDOKA1"
        .Field = "ELLINDOKA2"
        .Field = "KONTRMAX"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdRparam"
        .DelSQL = Empty ' nincs törlés
        .InsSQL = Empty ' nincs beszúrás
        .GetSQL = g_sDefaultDBName & "..rpc_GetRparam"
        .RecordSourceName = g_sDefaultDBName & "..RPARAM"
        .Name = "KEP611"
     End With
     
     Set g_oArDef = New CRecordDef
     With g_oArDef
        .Key = "ARID":          .FieldType = vbLong
        .Field = "JOGCSOP"
        .Field = "JOGCIM":      .FieldType = vbLong
        .Field = "ERVKEZD":     .FieldType = vbDate
        .Field = "ERVVEGE":     .FieldType = vbDate
        .Field = "ARMEGN"
        .Field = "ARMIN"
        .Field = "AR":          .FieldType = vbDouble
        .Field = "FELAR":       .FieldType = vbDouble
        .Field = "NETTO":       .FieldType = vbDouble
        .Field = "NETTOFELAR":  .FieldType = vbDouble
        .Field = "KITOLTES"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdArtabla"
        .DelSQL = g_sDefaultDBName & "..rpc_DelArtabla"
        .InsSQL = g_sDefaultDBName & "..rpc_InsArtabla"
        .GetSQL = g_sDefaultDBName & "..rpc_GetArtabla"
        .RecordSourceName = g_sDefaultDBName & "..ARTABLA"
        .Name = "KEP612"
     End With

     Set g_oJogcsopDef = New CRecordDef
     With g_oJogcsopDef
        .Key = "JOGCSOPID":      .FieldType = vbLong
        .Field = "JOGCSOP"
        .Field = "JCSJELLEG"
        .Field = "FAJTAVEZ"
        .Field = "MINVEZ"
        .Field = "KZONAVEZ"
        .Field = "ZONAVEZ"
        .Field = "PARKVEZ"
        .Field = "ESETVEZ"
        .Field = "LEVELVEZ"
        .Field = "RENDVEZ"
        .Field = "IDOVEZ"
        .Field = "SSZTOLVEZ"
        .Field = "SSZIGVEZ"
        .Field = "MENNYVEZ"
        .Field = "SZERZVEZ"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdJogcsop"
        .DelSQL = g_sDefaultDBName & "..rpc_DelJogcsop"
        .InsSQL = g_sDefaultDBName & "..rpc_InsJogcsop"
        .GetSQL = g_sDefaultDBName & "..rpc_GetJogcsop"
        .RecordSourceName = g_sDefaultDBName & "..JOGCSOPORT"
        .Name = "KEP663"
     End With
     
     Set g_oJogcsopFDef = New CRecordDef
     With g_oJogcsopFDef
        .Key = "JOGCSOP"
        .Field = "SSZTOLVEZ"
        .Field = "SSZIGVEZ"
        .Field = "MENNYVEZ"
        .Field = "SZERZVEZ"
        .UpdSQL = Empty
        .DelSQL = Empty
        .InsSQL = Empty
        .GetSQL = g_sDefaultDBName & "..rpc_GetJogcsopF"
        .RecordSourceName = g_sDefaultDBName & "..JOGCSOPORT"
        .Name = "KEP663"
     End With

     Set g_oMozgasDef = New CRecordDef
     With g_oMozgasDef
        .Key = "MOZGID":        .FieldType = vbLong
        .Field = "MOZGCSOP"
        .Field = "MOZGNEV"
        .Field = "MOZGIRANY"
        .Field = "MOZGPAR":      .FieldType = vbLong
        .Field = "ELOMOZG":      .FieldType = vbLong
        .Field = "UTOMOZG":      .FieldType = vbLong
        .Field = "RAKTJEL"
        .Field = "PENZJEL"
        .Field = "BEKJELZO"
        .Field = "TEVJELLEG"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdMozgas"
        .DelSQL = g_sDefaultDBName & "..rpc_DelMozgas"
        .InsSQL = g_sDefaultDBName & "..rpc_InsMozgas"
        .GetSQL = g_sDefaultDBName & "..rpc_GetMozgas"
        .RecordSourceName = g_sDefaultDBName & "..MOZGAS"
        .Name = "KEP614"
     End With

    Set g_oJogcimekDef = New CRecordDef
     With g_oJogcimekDef
        .Key = "JOGCIM":      .FieldType = vbLong
        .Field = "JOGCSOP"
        .Field = "MEGNEV"
        .Field = "ROVID"
        .Field = "FAJTA"
        .Field = "MINOSIT"
        .Field = "KZONA"
        .Field = "ZONA"
        .Field = "PARKJEL"
        .Field = "PARTJEL"
        .Field = "GKPID"
        .Field = "ESETJEL"
        .Field = "LEVELJEL"
        .Field = "RENDJEL"
        .Field = "SZJNEV"
        .Field = "SZJKOD"
        .Field = "IDOSZELET"
        .Field = "KAMAT":     .FieldType = vbInteger
        .Field = "AFA":       .FieldType = vbInteger
        .Field = "SZJ"
        .Field = "MEGYSEG"
        '------------------------------------------------
        .Field = "RENDSZAM"
        '------------------------------------------------
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdJogcimek"
        .DelSQL = g_sDefaultDBName & "..rpc_DelJogcimek"
        .InsSQL = g_sDefaultDBName & "..rpc_InsJogcimek"
        .GetSQL = g_sDefaultDBName & "..rpc_GetJogcim"
        .RecordSourceName = g_sDefaultDBName & "..JOGCIMEK"
        .Name = "KEP609"
     End With
     
     Set g_oGepkocsiDef = New CRecordDef
     With g_oGepkocsiDef
        .Key = "GEPKID":      .FieldType = vbLong
        .Field = "RENDSZAM"
        .Field = "GKTIPUS"
        .Field = "GKSZIN"
        .Field = "ORSZAG"
        .Field = "MEGYE"
        .Field = "FKOD"
        .Field = "ERVDAT":    .FieldType = vbDate
        'Ez itt a tulajdonosi kapcsolatot biztosító
        'táblarészlet nem ebben a táblában tároljuk, hanem a GkPartner-ben.
        .Field = "GKPID":    .FieldType = vbLong
        .Field = "PARTNID":  .FieldType = vbLong
        .Field = "ERVVEG":   .FieldType = vbDate
        .Field = "NYVDAT":   .FieldType = vbDate
        .Field = "JELLEG"
        '---------------------------------------
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdGepkocsi"
        .DelSQL = g_sDefaultDBName & "..rpc_DelGkPartner"
        .InsSQL = g_sDefaultDBName & "..rpc_InsGepkocsi"
        .GetSQL = g_sDefaultDBName & "..rpc_GetGepkocsi"
        .RecordSourceName = g_sDefaultDBName & "..GEPKOCSI"
        .Name = "KEP615"
     End With

     Set g_oPartnerDef = New CRecordDef
     With g_oPartnerDef
        .Key = "PARTNID":      .FieldType = vbLong
        .Field = "PNEV"
        .Field = "PIRSZ"
        .Field = "PVAROS"
        .Field = "PCIM"
        .Field = "MIGSZAM"
        .Field = "MIGERV":     .FieldType = vbDate
        .Field = "BANKNEV"
        .Field = "SZLASZAM"
        .Field = "UNEV"
        .Field = "SZIGSZAM"
        .Field = "ADOSZAM"
        .Field = "LAKIRSZ"
        .Field = "LAKVAROS"
        .Field = "LAKCIM"
        .Field = "IGTIP"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdPartner"
        .DelSQL = g_sDefaultDBName & "..rpc_DelPartner"
        .InsSQL = g_sDefaultDBName & "..rpc_InsPartner"
        .GetSQL = g_sDefaultDBName & "..rpc_GetPartner"
        .RecordSourceName = g_sDefaultDBName & "..PARTNER"
        .Name = "KEP615"
     End With

     Set g_oGkPartnerDef = New CRecordDef
     With g_oGkPartnerDef
        .Key = "GKPID":      .FieldType = vbLong
        .Field = "GEPKID":   .FieldType = vbLong
        .Field = "PARTNID":  .FieldType = vbLong
        .Field = "ERVVEG":   .FieldType = vbDate
        .Field = "NYVDAT":   .FieldType = vbDate
        .Field = "JELLEG"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdGkPartner"
        .DelSQL = g_sDefaultDBName & "..rpc_DelGkPartner"
        .InsSQL = g_sDefaultDBName & "..rpc_InsGkPartner"
        .GetSQL = g_sDefaultDBName & "..rpc_GetGkPartner"
        .RecordSourceName = g_sDefaultDBName & "..GKPARTNER"
        .Name = "KEP615"
     End With

     Set g_oParkoloDef = New CRecordDef
     With g_oParkoloDef
        .Key = "PARKOLID":    .FieldType = vbLong
        .Field = "HELY"
        .Field = "ZONA"
        .Field = "KZONA"
        .Field = "KORZET"
        .Field = "HELYEK":    .FieldType = vbInteger
        .Field = "MHELYEK":   .FieldType = vbInteger
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdParkolo"
        .DelSQL = g_sDefaultDBName & "..rpc_DelParkolo"
        .InsSQL = g_sDefaultDBName & "..rpc_InsParkolo"
        .GetSQL = g_sDefaultDBName & "..rpc_GetParkolo"
        .RecordSourceName = g_sDefaultDBName & "..PARKOLO"
        .Name = "KEP607"
     End With
     
     Set g_oIndokokDef = New CRecordDef
     With g_oIndokokDef
        .Key = "INDOKID":    .FieldType = vbLong
        .Field = "INDOK"
        .Field = "ARMIN"
        .Field = "ITIPUS"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdIndokok"
        .DelSQL = g_sDefaultDBName & "..rpc_DelIndokok"
        .InsSQL = g_sDefaultDBName & "..rpc_InsIndokok"
        .GetSQL = g_sDefaultDBName & "..rpc_GetIndokok"
        .RecordSourceName = g_sDefaultDBName & "..INDOKOK"
        .Name = "KEP605"
     End With
     
     Set g_oDolgozoDef = New CRecordDef
     With g_oDolgozoDef
        .Key = "DOLGID":    .FieldType = vbLong
        .Field = "USERID":  .FieldType = vbLong
        .Field = "NEV"
        .Field = "VAROS"
        .Field = "CIM"
        .Field = "MEGYE"
        .Field = "TELEFON"
        .Field = "MOBIL"
        .Field = "SZERVEZET"
        .Field = "BEOSZT"
        .Field = "SZOLGIGSZ"
        .Field = "JELVSZAM"
        .Field = "MENT"
        .Field = "PARJA":   .FieldType = vbLong
        .Field = "BEDATUM": .FieldType = vbDate
        .Field = "KIDATUM": .FieldType = vbDate
        .Field = "SZHELY"
        .Field = "SZIDO":   .FieldType = vbDate
        .Field = "ANYJANEV"
        .Field = "VEGZETTS"
        .Field = "AKTIV"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdDolgozo"
        .DelSQL = g_sDefaultDBName & "..rpc_DelDolgozo"
        .InsSQL = g_sDefaultDBName & "..rpc_InsDolgozo"
        .GetSQL = g_sDefaultDBName & "..rpc_GetDolgozo"
        .RecordSourceName = g_sDefaultDBName & "..DOLGOZO"
        .Name = "KEP602"
     End With
     
     Set g_oArgenDef = New CRecordDef
     With g_oArgenDef
        .Key = "ARGENID":      .FieldType = vbLong
        .Field = "LEVTIP"
        .Field = "JOGCIM":    .FieldType = vbLong
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdArgen"
        .DelSQL = g_sDefaultDBName & "..rpc_DelArgen"
        .InsSQL = g_sDefaultDBName & "..rpc_InsArgen"
        .GetSQL = g_sDefaultDBName & "..rpc_GetArgen"
        .RecordSourceName = g_sDefaultDBName & "..ARGEN"
        .Name = "KEP634"
     End With
     
    Set g_oGepkocsiTNDef = New CRecordDef
     With g_oGepkocsiTNDef
        .Key = "GEPKID":      .FieldType = vbLong
        .Field = "RENDSZAM"
        .Field = "GKTIPUS"
        .Field = "GKSZIN"
        .Field = "ORSZAG"
        .Field = "MEGYE"
        .Field = "FKOD"
        .Field = "ERVDAT":    .FieldType = vbDate
        .Field = "NYVDAT":    .FieldType = vbDate
        .Field = "JELLEG"
        .UpdSQL = Empty
        .DelSQL = Empty
        .InsSQL = g_sDefaultDBName & "..rpc_InsGepkocsiTN"
        .GetSQL = g_sDefaultDBName & "..rpc_GetGepkocsiTN"
        .RecordSourceName = g_sDefaultDBName & "..GEPKOCSI"
        .Name = "KEP615"
     End With
     
     Set g_oPartnerMDef = New CRecordDef
     With g_oPartnerMDef
        .Key = "PARTNID":      .FieldType = vbLong
        .Field = "PNEV"
        .Field = "PIRSZ"
        .Field = "PVAROS"
        .Field = "PCIM"
        .Field = "MIGSZAM"
        .Field = "MIGERV":     .FieldType = vbDate
        .Field = "BANKNEV"
        .Field = "SZLASZAM"
        .Field = "UNEV"
        .Field = "SZIGSZAM"
        .Field = "ADOSZAM"
        .Field = "LAKIRSZ"
        .Field = "LAKVAROS"
        .Field = "LAKCIM"
        .Field = "IGTIP"
        .Field = "GKPID":      .FieldType = vbLong
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdPartnerTN"
        .DelSQL = Empty
        .InsSQL = Empty
        .GetSQL = g_sDefaultDBName & "..rpc_GetPartnerTN"
        .RecordSourceName = g_sDefaultDBName & "..PARTNER"
        .Name = "KEP615"
     End With
     
     Set g_oPartnerEDef = New CRecordDef
     With g_oPartnerEDef
        .Key = "GEPKID":       .FieldType = vbLong
        .Field = "PARTNID":    .FieldType = vbLong
        .Field = "PNEVF"
        .Field = "PIRSZ"
        .Field = "PVAROS"
        .Field = "PCIM"
        .Field = "MIGSZAM"
        .Field = "MIGERV":     .FieldType = vbDate
        .Field = "BANKNEV"
        .Field = "SZLASZAM"
        .Field = "UNEV"
        .Field = "SZIGSZAM"
        .Field = "ADOSZAM"
        .Field = "GKPID":      .FieldType = vbLong
        .Field = "JELLEG"
        .Field = "NYVDAT":     .FieldType = vbDate
        .Field = "LAKIRSZ"
        .Field = "LAKVAROS"
        .Field = "LAKCIM"
        .Field = "IGTIP"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdPartnerEP"
        .DelSQL = Empty
        .InsSQL = g_sDefaultDBName & "..rpc_InsPartnerEP"
        .GetSQL = g_sDefaultDBName & "..rpc_GetPartnerEP"
        .RecordSourceName = g_sDefaultDBName & "..PARTNER"
        .Name = "KEP615"
     End With
     
     Set g_oEsetLeirDef = New CRecordDef
     With g_oEsetLeirDef
        .Key = "ESETID":      .FieldType = vbLong
        .Field = "BIZONYLAT"
        .Field = "ESETDAT":   .FieldType = vbDate
        .Field = "ESETIDO"
        .Field = "GKPID":     .FieldType = vbLong
        .Field = "GKPEID":    .FieldType = vbLong
        .Field = "PARKOLIDK": .FieldType = vbLong
        .Field = "INDOKID":   .FieldType = vbLong
        .Field = "SZELVENY"
        .Field = "MIGSZAM"
        .Field = "ELLENOR1":  .FieldType = vbLong
        .Field = "ELLENOR2":  .FieldType = vbLong
        .Field = "KAZETTA"
        .Field = "POZICIO"
        .Field = "ELLMEGJ"
        .Field = "ESETALL"
        .Field = "ESTORNO"
        .Field = "SZINT"
        .Field = "LEVIDSZ1":  .FieldType = vbLong
        .Field = "LEVIDSZ2":  .FieldType = vbLong
        .Field = "LEVIDSZ3":  .FieldType = vbLong
        .Field = "BEFID":     .FieldType = vbLong
        '---- nem aktív mezõk a táblában           ----
        .Field = "RENDSZAM"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdEsetLeir"
        .DelSQL = g_sDefaultDBName & "..rpc_DelEsetLeir"
        .InsSQL = g_sDefaultDBName & "..rpc_InsEsetLeir"
        .GetSQL = g_sDefaultDBName & "..rpc_GetEsetLeir"
        .RecordSourceName = g_sDefaultDBName & "..ESETLEIR"
        .Name = "KEP635"
     End With
     
     Set g_oEllentmDef = New CRecordDef
     With g_oEllentmDef
        .Key = "ELLENID":     .FieldType = vbLong
        .Field = "IRATSZAM":  .FieldType = vbLong
        .Field = "ALSZAM":    .FieldType = vbInteger
        .Field = "LEVTIP"
        .Field = "ESETID":    .FieldType = vbLong
        .Field = "GKPEID":    .FieldType = vbLong
        .Field = "IKTDATUM":  .FieldType = vbDate
        .Field = "ELDATUM":   .FieldType = vbDate
        .Field = "EREDMENY"
        .Field = "INDOKID1":  .FieldType = vbLong
        .Field = "INDOKID2":  .FieldType = vbLong
        .Field = "INDOKID3":  .FieldType = vbLong
        .Field = "INDOKID4":  .FieldType = vbLong
        .Field = "INDOKID5":  .FieldType = vbLong
        '--Segédmezõ az eset kezeléséhez
        .Field = "BIZONYLAT"
        .Field = "RENDSZAM"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdEllentm"
        .DelSQL = g_sDefaultDBName & "..rpc_DelEllentm"
        .InsSQL = g_sDefaultDBName & "..rpc_InsEllentm"
        .GetSQL = g_sDefaultDBName & "..rpc_GetEllentm"
        .RecordSourceName = g_sDefaultDBName & "..ELLENTM"
        .Name = "KEP636"
     End With
     
    Set g_oBirosagDef = New CRecordDef
     With g_oBirosagDef
        .Key = "BIRID":       .FieldType = vbLong
        .Field = "BIRATSZAM"
        .Field = "IDATUM":    .FieldType = vbDate
        .Field = "GKPID":     .FieldType = vbLong
        .Field = "OSSZEG":    .FieldType = vbDouble
        .Field = "KAMAT":    .FieldType = vbDouble
        .Field = "EGYEBKTG":    .FieldType = vbDouble
        .Field = "BDATUM":    .FieldType = vbDate
        .Field = "BIKTAT"
        .Field = "TGDATUM":   .FieldType = vbDate
        .Field = "ITELET"
        .Field = "JELLEG"
        .Field = "LUHN"
        .UpdSQL = g_sDefaultDBName & "..rpc_updBirosag"
        .DelSQL = Empty
        .InsSQL = Empty
        .GetSQL = g_sDefaultDBName & "..rpc_GetBirosag"
        .RecordSourceName = g_sDefaultDBName & "..BIROSAG"
        .Name = "KEP638"
     End With
     
     Set g_oLevelekDef = New CRecordDef
     With g_oLevelekDef
        .Key = "LEVID":       .FieldType = vbLong
        .Field = "LEVTIP"
        .Field = "LEVDATUM":  .FieldType = vbDate
        .Field = "GKPID":     .FieldType = vbLong
        .Field = "DOKUAZ"
        .Field = "BUNTETDIJ": .FieldType = vbDouble
        .Field = "TERTIVEV"
        .Field = "KBDATUM":   .FieldType = vbDate
        .Field = "LEVJELZO"
        .Field = "LUHN"
        .UpdSQL = g_sDefaultDBName & "..rpc_UpdLevelek"
        .DelSQL = Empty
        .InsSQL = Empty
        .GetSQL = g_sDefaultDBName & "..rpc_GetLevelek"
        .RecordSourceName = g_sDefaultDBName & "..LEVELEK"
        .Name = "KEP634"
     End With
     
End Sub
Public Function ParkGlobMain() As Boolean
'MiniPark rendszer globális main eljárása az összes modulra vonakozó
'alapbeállításokra vonatkozóan
'Szojka Csaba 1998. Dec
    
    Set g_oKodszotar = New CKodSzotar
    Set g_rParam = New CRecord
    
    'inicializáljuk az MDI ablakot
    ParkGlobMain = InitMDI
    
    'Globális minden modul számára szükséges kódszótárként kezelt adatbázis elem betöltése
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_QP", Array("KODTIP", ""), "KODOK", "Rendszer kódolt fogalmai", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_Q206", Nothing, "Q206", "Igazolvány típusok", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_Q135", Nothing, "Q135", "Indok típusa", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_Q136", Nothing, "Q136", "Ár minõsítése", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetNezetek", Array("CSOP", ""), "NEZETEK", "Lekérdezés Nézetek", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetListak", Array("CSOP", ""), "LISTAK", "Lekérdezések listái", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetCsoportok", Nothing, "CSOPORTOK", "Felhasználói csoportok", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetMiniParkUsers", Nothing, "MPUSERS", "MiniPark felhasználók", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetKepObj", Nothing, "KEPOBJ", "MiniPark KEP objektumok", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetNaplo", Array("USERID", Null), "NAPLO", "Naplózási dátumok", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetFelhasznalok", Nothing, "MPFELH", "Minipark rendszer felhasználók", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetFelhaszSuid", Nothing, "MPFELHS", "Minipark rendszer felhasználók", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetDolgozok", Nothing, "DOLGOZOK", "Dolgozok", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetEllenorok", Nothing, "ELLENOROK", "Ellenõrök", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetELLIndokok", Nothing, "ELLINDOKOK", "Ellenõri Indokok", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetParkolok", Nothing, "PARKOLOK", "Parkolók", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetParkolokP", Array("KZONA", Null), "PARKOLOKP", "Parkolók övezetre szûrve", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetTIndokok", Nothing, "INDOKOK", "Indokok", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetEsetGkEll", Array("ESETID", Null), "GKPEGYEBU", "Eset idõpontjához kötött gépkocsik", 1, STORAGE_DATABASE
    g_oKodszotar.Load g_sDefaultDBName & "..rpc_GetPartnerP", Array("PNEV", Null), "PARTNERP", "Partnerek - paraméterezetten", 1, STORAGE_DATABASE
    'Az egész rendszerre vonatkozó rekorddef objektumok definíciói
    GlobalRecordDef
    
    'A HELP-rendszer útvonalának beállítása
    MYHELP_FILE = App.Path & "\..\help\MiniPark.chm"

    'Dokumentumok tárolásának helye
    S_DOCPATH = App.Path + "\..\DOC\"
    
    'Dokumentáció és Help (HTML) tárolásának helye
    S_APPDOCP = App.Path + "\..\HELP\"

    'Banki floppy-k tárolásának helye
    S_APPBANK = App.Path + "\..\BANK\"
    
    'Banki floppy-k archiv tárolásának helye
    S_APPBANKA = App.Path + "\..\BANK\ARHIV\"
    
    frmMenu.Caption = frmMenu.lblRMNEV(1)
    
End Function
Private Function InitMDI() As Boolean
    InitMDI = True
    If oAdmin.PreMessLoad <> vbOK Then 'Elõolvassa a rendszer üzeneteit, címkéit
        MsgBox "Nem sikerült elõolvasni a rendszer cimkéket, rövid helszövegét'", vbCritical, "Elõolvasás"
        InitMDI = False
    Else
        If Dir(App.Path + "\..\desert.jpg") <> "" Then
            frmMenu.Image4 = LoadPicture(App.Path + "\..\desert.jpg")
        End If
        If Dir(App.Path + "\..\clouds.jpg") <> "" Then
            frmMenu.Picture = LoadPicture(App.Path + "\..\clouds.jpg")
        End If
        frmMenu.Show
    End If
End Function
