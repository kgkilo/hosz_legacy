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
'
'   Param�terek:    -
'
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
'
Public Function Init(ByRef sReportDir As String, ByRef sANTSZDir As String, ByRef iWorkMode As Integer) As Boolean
'Public Function Init(ByRef sReportDir As String) As Boolean
    'On Error GoTo errInit
    Init = False

    'A formel.ini file-b�l a sz�ks�ges adatok bet�lt�se
    Dim FileNum, iCount As Integer
    Dim sInputLine, sDriver, sServer, sDatabase As String
    
    iWorkMode = NORMAL
    
    FileNum = FreeFile              'egy �res file sorsz�m k�r�se
    
    Open "C:\formel.ini" For Input As FileNum     'File nyit�s olvas�sra
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
    Close #FileNum                              'File z�r�s

    m_sConnect = sDriver & "; " & sServer & ";uid=sa;pwd=;" & sDatabase
    oAdmin.Login m_sConnect   'Bejelentkezik az SQL szerverre
    
    g_oKodszotar.Load "sp_Q271", Nothing, "271", "Szervezeti egys�g", 2  'Bet�ltj�k a k�dsz�t�ri elemeket
    g_oKodszotar.Load "sp_Q272", Nothing, "272", "H�l�pcs�", 3
    g_oKodszotar.Load "sp_Q274", Nothing, "274", "�p�let t�pusa", 3
    g_oKodszotar.Load "sp_Q275", Nothing, "275", "F�t�si m�d", 3
    g_oKodszotar.Load "sp_Q276", Nothing, "276", "L�gtelen�t� t�pusa", 3
    g_oKodszotar.Load "sp_Q277", Nothing, "277", "F�t�test t�pusa", 3
    g_oKodszotar.Load "sp_Q278", Nothing, "278", "�p�let karbantart�", 3
    g_oKodszotar.Load "sp_Q279", Nothing, "279", "M�rt�kegys�g", 3
    g_oKodszotar.Load "sp_Q281", Nothing, "281", "F�t�si beszab�lyoz�s m�dja", 3
    g_oKodszotar.Load "sp_Q282", Nothing, "282", "Cirkul�ci�s strang t�pusa", 3
    g_oKodszotar.Load "sp_Q283", Nothing, "283", "HMV rendszer t�pusa", 3
    g_oKodszotar.Load "sp_Q284", Nothing, "284", "Cirkul�ci�s szab�lyoz�s m�dja", 3
    g_oKodszotar.Load "sp_Q285", Nothing, "285", "K�zeg", 3
    g_oKodszotar.Load "sp_Q288", Nothing, "288", "F�t�v�z eloszt�sa", 3
    g_oKodszotar.Load "sp_Q289", Nothing, "289", "V�ros", 1
    g_oKodszotar.Load "sp_Q297", Nothing, "297", "�zem�llapot", 1
    g_oKodszotar.Load "sp_Q298", Nothing, "298", "M�velet t�pusa", 3
    g_oKodszotar.Load "sp_Q299", Nothing, "299", "Id�egys�g", 2
    g_oKodszotar.Load "sp_Q300", Nothing, "300", "Karbantart�s t�pusa", 2
    g_oKodszotar.Load "sp_Q302", Nothing, "302", "Jegyz�k�nyv t�pusa", 1
    g_oKodszotar.Load "sp_Q304", Nothing, "304", "Beoszt�s", 2
    g_oKodszotar.Load "sp_Q305", Nothing, "305", "Szolg�ltat�s t�pusa", 2
    g_oKodszotar.Load "sp_Q306", Nothing, "306", "Munkav�gz�s/jav�t�s t�pusa", 2
    g_oKodszotar.Load "sp_Q307", Nothing, "307", "V�gzend� feladat t�pusa", 2
    g_oKodszotar.Load "sp_Q308", Nothing, "308", "�szlelt jelens�g t�pusa", 2
    g_oKodszotar.Load "sp_Q309", Nothing, "309", "Szolg�lat t�pusa", 2
    g_oKodszotar.Load "sp_Q310", Nothing, "310", "F�k�nyvi sz�m", 12
    g_oKodszotar.Load "sp_Q311", Nothing, "311", "Munkalap szervezeti egys�g", 1
    g_oKodszotar.Load "sp_Q312", Nothing, "312", "Gy�rt� c�g", 3
    g_oKodszotar.Load "sp_Q313", Nothing, "313", "Vesz�lyess�gi oszt�ly", 1
    g_oKodszotar.Load "sp_Q314", Nothing, "314", "Kulcs tal�lhat�", 3
    g_oKodszotar.Load "sp_Q315", Nothing, "315", "Al��r�sra jogosult", 3
    g_oKodszotar.Load "sp_Q316", Nothing, "316", "Leolvas�si m�d", 2
    g_oKodszotar.Load "sp_Q317", Nothing, "317", "Kateg�ria", 2
    g_oKodszotar.Load "sp_Q318", Nothing, "318", "Szab�lyoz�s m�dja", 2
    g_oKodszotar.Load "sp_Q319", Nothing, "319", "Szivatty� fokozat", 2
    g_oKodszotar.Load "sp_Q320", Nothing, "320", "Boyler t�pus", 2
    g_oKodszotar.Load "sp_Q321", Nothing, "321", "T�lt�si m�d", 2
    g_oKodszotar.Load "sp_Q322", Nothing, "322", "Sz�r� t�pus", 2
    g_oKodszotar.Load "sp_Q323", Nothing, "323", "Kimenet t�pusa", 2
    g_oKodszotar.Load "sp_Q324", Nothing, "324", "M�k�d�si m�d", 3
    g_oKodszotar.Load "sp_Q325", Nothing, "325", "Szelep t�pus", 3
    g_oKodszotar.Load "sp_Q326", Nothing, "326", "Fel�p�t�s", 2
    g_oKodszotar.Load "sp_Q327", Nothing, "327", "�tem", 2
    g_oKodszotar.Load "sp_Q328", Nothing, "328", "L�gtelen�t� elhelyez�se", 3
    g_oKodszotar.Load "sp_Q329", Nothing, "329", "�p�let �zemeltet�je", 3
    g_oKodszotar.Load "sp_Q330", Nothing, "330", "F�t�si f�elz�r� elhelyez�se", 3
    g_oKodszotar.Load "sp_Q331", Nothing, "331", "F�t�m� lek�rdez�s t�pusa", 20
    g_oKodszotar.Load "sp_Q332", Nothing, "332", "H�k�zpont lek�rdez�s t�pusa", 20
    g_oKodszotar.Load "sp_Q333", Nothing, "333", "�p�let lek�rdez�s t�pusa", 20
    g_oKodszotar.Load "sp_Q334", Nothing, "334", "Dolgoz�", 3
    g_oKodszotar.Load "sp_Q335", Nothing, "335", "Munkalap �llapota", 3
    g_oKodszotar.Load "sp_Q336", Nothing, "336", "M�velet r�vid leir�sa", 3
    g_oKodszotar.Load "sp_Q337", Nothing, "337", "Munkalap t�pusa", 1
    g_oKodszotar.Load "sp_Q338", Nothing, "338", "Szolg�ltat�s", 1
    g_oKodszotar.Load "sp_Q339", Nothing, "339", "Fizet�si m�d", 1
    g_oKodszotar.Load "sp_Q340", Nothing, "340", "Szolg�ltat�s jellege", 1
    g_oKodszotar.Load "sp_Q341", Nothing, "341", "�FA kulcs", 2
    g_oKodszotar.Load "sp_Q342", Nothing, "342", "Cikk", 2
    g_oKodszotar.Load "sp_Q343", Nothing, "343", "Szerz�d�s t�pus", 1
    g_oKodszotar.Load "sp_Q344", Nothing, "344", "Szerz�d�s jellege", 2
    g_oKodszotar.Load "sp_Q345", Nothing, "345", "Lek�rdez�s v�z�r�ra", 11
    g_oKodszotar.Load "sp_Q346", Nothing, "346", "Lek�rdez�s �rz�kel�p�rra", 11
    g_oKodszotar.Load "sp_Q347", Nothing, "347", "Lek�rdez�s h��sszegz�re", 11
    g_oKodszotar.Load "sp_Q348", Nothing, "348", "Plomb�z�s", 1
    
    Select Case iWorkMode
        Case DISZPECSER
            g_oKodszotar.Load "sp_Q291D", Nothing, "291", "Szolg�ltat�s jellege", 2
            'g_oKodszotar.Load "sp_Q369", Nothing, "369", "Diszp.t�pushiba", 3
            g_oKodszotar.Load "sp_Q369", Nothing, "293", "Diszp.t�pushiba", 3
            g_oKodszotar.Load "sp_Q296_Diszp", Nothing, "296", "Objektum t�pus", 2
            g_oKodszotar.Load "sp_Q310D", Nothing, "310A", "Akt�v f�k�nyvi sz�m", 12
        Case NORMAL, MLAP
            g_oKodszotar.Load "sp_Q291", Nothing, "291", "Szolg�ltat�s jellege", 2
            g_oKodszotar.Load "sp_Q293", Nothing, "293", "T�pus hiba", 3
            g_oKodszotar.Load "sp_Q296", Nothing, "296", "Objektum t�pus", 2
            g_oKodszotar.Load "sp_Q310A", Nothing, "310A", "Akt�v f�k�nyvi sz�m", 12
            g_oKodszotar.Load "sp_Q370", Nothing, "370", "Labor.jegyz.t�pus", 1
            
        Case LABOR
            g_oKodszotar.Load "sp_Q296", Nothing, "296", "Objektum t�pus", 2
            g_oKodszotar.Load "sp_Q370", Nothing, "370", "Labor.jegyz.t�pus", 1
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
'   Felt�lti az objektum neveket tartalmaz� combobox-ot a v�lasztott objektumt�pusnak megfelel�en.
'
'   Param�terek:    cmbMegnev As Object -   a felt�ltend� combobox
'                   cmbOBJTIP As Object -   az objektumt�pusok combobox-a
'
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
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
    
    g_oKodszotar.Remove sSectName    'T�r�lj�k az �l-k�dsz�t�ri MEGNEV szekci�t
    
    Dim sOBJTIP As String
    If TypeName(cmbOBJTIP) = "Nothing" Then
        sOBJTIP = "01"
    Else
        sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)   'Lek�rdezz�k az objektumt�pust
    End If
    
    g_oKodszotar.Load "sp_FillObjMegnev", Array("pObjTip", sOBJTIP), sSectName, "Objektum megnevez�se", 100
    MegnevFeltolt = ComboBoxSet(cmbMegnev, Nothing) 'Bet�ltj�k a k�dsz�t�rba a megnevez�seket, majd felt�ltj�k a combobox-ot
    cmbMegnev.ListWidth = 350
    Exit Function
    
errMegnevFeltolt:
End Function    'MegnevFeltolt

'   MegnevFelt
'
'   Felt�lti az objektum neveket tartalmaz� combobox-ot a v�lasztott objektumt�pusnak megfelel�en.
'
'   Param�terek:    cmbMegnev As Object -   a felt�ltend� combobox
'                   cmbOBJTIP As Object -   az objektumt�pusok combobox-a
'
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
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
    
    g_oKodszotar.Remove sSectName    'T�r�lj�k az �l-k�dsz�t�ri MEGNEV szekci�t
    
    Dim sOBJTIP As String
    If TypeName(cmbOBJTIP) = "Nothing" Then
        sOBJTIP = "01"
    Else
        sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)   'Lek�rdezz�k az objektumt�pust
    End If

    g_oKodszotar.Load "sp_FillObjMegnev", Array("pObjTip", sOBJTIP, "ELSOOSZLOP", sElsoOszlop), sSectName, "Objektum megnevez�se", 100
    MegnevFelt = ComboBoxSet(cmbMegnev, Nothing) 'Bet�ltj�k a k�dsz�t�rba a megnevez�seket, majd felt�ltj�k a combobox-ot
    cmbMegnev.ListWidth = 350
    Exit Function
    
errMegnevFelt:
End Function    'MegnevFelt

'   TelephszFeltolt
'
'   Felt�lti a telep�t�si helysz�mokat tartalmaz� combobox-ot a v�lasztott objektumt�pusnak megfelel�en.
'
'   Param�terek:    cmbTelephsz As Object   -   a felt�ltend� combobox
'                   cmbOBJTIP As Object -   az objektumt�pusok combobox-a
'
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
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
    
    g_oKodszotar.Remove sSectName    'T�r�lj�k az �l-k�dsz�t�ri MEGNEV szekci�t
    
    Dim sOBJTIP As String
    If TypeName(cmbOBJTIP) = "Nothing" Then
        sOBJTIP = "01"
    Else
        sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)   'Lek�rdezz�k az objektumt�pust
    End If
    
    g_oKodszotar.Load "sp_FillObjTelephsz", Array("pObjTip", sOBJTIP), sSectName, "Objektum telep�t�si helysz�ma", 100
    TelephszFeltolt = ComboBoxSet(cmbTELEPHSZ, Nothing) 'Bet�ltj�k a k�dsz�t�rba a megnevez�seket, majd felt�ltj�k a combobox-ot
    cmbTELEPHSZ.ListWidth = 350
    Exit Function
    
errTelephszFeltolt:
End Function    'TelephszFeltolt

'   MunkalapszamFeltolt
'
'   Felt�lti a munkalapsz�mokat tartalmaz� combobox-ot.
'
'   Param�terek:    cmbMunkalap As Object   -   a felt�ltend� combobox
'
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
'
Public Function MunkalapszamFeltolt(ByRef cmbMunkalap As Object) As Boolean
    On Error GoTo errMunkalapszamFeltolt
    MunkalapszamFeltolt = False
    
    Dim sSectName As String
    sSectName = "MUNKALAP"
    
    g_oKodszotar.Remove sSectName    'T�r�lj�k az �l-k�dsz�t�ri MUNKALAP szekci�t
    
    g_oKodszotar.Load "sp_FillMunkalapJegyz", Nothing, sSectName, "Munkalap sz�ma", 100
    MunkalapszamFeltolt = ComboBoxSet(cmbMunkalap, Nothing) 'Bet�ltj�k a k�dsz�t�rba a megnevez�seket, majd felt�ltj�k a combobox-ot
    cmbMunkalap.ListWidth = 350
    Exit Function
    
errMunkalapszamFeltolt:
End Function    'MunkalapszamFeltolt

'   RekordFeltolt
'
'   Felt�lti a kiv�lasztott objektum adatival a k�perny�t.
'
'   Param�terek:    cmbMegnev As Object -   az objektum megnevez�sek combobox-a
'                   lstControls As Access.Controls  -   a k�perny�n tal�lhat� kontrollok.
'
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
'
Public Function RekordFeltolt(ByRef frm As Object, ByVal sKategoria As String, ByVal sID As Long) As Boolean
    On Error GoTo errRekordFeltolt
    RekordFeltolt = False
    
    Dim lstParams As New Collection 'Betessz�k az azonos�t�t a lek�rdez�s param�terei k�z�
    lstParams.Add sID, "pID"
    
    Dim sQuery As String
    Select Case sKategoria
        Case "MUNKALAP"
            sQuery = "sp_LoadMunkalap"
        Case "LABOR"
            sQuery = "sp_LoadLabor"
        Case Else
            sQuery = "sp_LoadObjEgyedi"
    End Select
       
    Dim rs As New ADODB.Recordset   'Bet�ltj�k az azonos�t� alapj�n a rekordot
    If oAdmin.LoadFirstRecord(sQuery, lstParams, rs) = True Then
        If ControlsSet(rs, frm) Then    'Ha siker�lt, felt�ltj�k a k�perny� kontrolljait adatokkal.
            RekordFeltolt = True
        End If
    End If
    
    Exit Function
    
errRekordFeltolt:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "RekordFeltolt"
End Function    'RekordFeltolt

'   RekordInsert
'
'   R�gz�t egy rekordot a k�perny�n l�that� adatok alapj�n
'
'   Param�terek:    cmbOBJTIP As Object -   az objektumt�pust meghat�roz� combobox
'                   lstControls as Access.Controls  -   a k�perny�n tal�lhat� kontrollok
'
'   Visszat�r�s:    String, a t�rolt elj�r�st�l visszakapott �rt�k
'
Public Function RekordInsert(ByRef frm As Object, ByVal sKategoria As String) As String
    On Error GoTo errRekordInsert
    RekordInsert = "-1"
    
    Dim sQuery As String
    Dim lstParams As New Collection '�s �tadjuk majd param�terk�nt
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
        Case Else
            'sOBJTIP = ComboBoxGet(Nothing, cmbOBJTIP)
            'lstParams.Add sOBJTIP, "pOBJTIP"
            sQuery = "sp_InsObjAlt"
    End Select
    
    ControlsGet lstParams, frm 'Lek�rdezz�k az �sszes l�that� kontroll �rt�k�t
    
    Dim rstResult As New ADODB.Recordset
    If oAdmin.ExecVal(sQuery, lstParams, rstResult) = True Then 'V�grehajtjuk az inzertet
        RekordInsert = CStr(rstResult(0).Value)
    End If
    Exit Function
    
errRekordInsert:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "RekordInsert"
End Function    'RekordInsert

'   RekordUpdate
'
'   Friss�t egy rekordot a k�perny�n l�that� adatok alapj�n
'
'   Param�terek:    cmbMegnev As Object -   a friss�tend� objektumot meghat�roz� combobox
'                   lstControls As Access.Controls  -   a k�perny�n tal�lhat� kontrollok
'                   sKategoria As String    -   meghat�rozza a friss�tend� adatok k�r�t.
'                       Lehets�ges �rt�kek: "Alt", "Gep", "Vill", "Uzem"
'                       (�ltal�nos, G�p�szeti, Villamos, �zemeltet�si)
'
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
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
    
    Dim lstParams As New Collection '�s �tadjuk majd param�terk�nt
    lstParams.Add sID, "pID"
    
    ControlsGet lstParams, frm  'Lek�rdezz�k az �sszes l�that� kontroll �rt�k�t
    
    If oAdmin.Exec(sQuery, lstParams) = True Then 'V�grehajtjuk a friss�t�st
        RekordUpdate = True
    Else
    End If
    Exit Function
    
errRekordUpdate:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "RekordUpdate"
End Function    'RekordUpdate

'   RekordDel
'
'   T�rli a kijel�lt rekordot.
'
'   Param�terek:    cmbMegnev As Object -   a t�rlend� objektumot meghat�roz� combobox
'
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
'
Public Function RekordDel(ByVal sKategoria As String, ByVal sID As Long) As Boolean
    On Error GoTo errRekordDel
    RekordDel = False
    
    Dim lstParams As New Collection '�s �tadjuk majd param�terk�nt
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
    If oAdmin.Exec(sQuery, lstParams) = True Then   'V�grehajtjuk a t�rl�st
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

' Lek�rdezem a munkalap darabsz�mot
            Dim rs As New ADODB.Recordset   'A visszat�r�si rekordszett
            sQuery = "sp_LoadMlapDb"
            If oAdmin.ExecVal(sQuery, lstParams, rs) = True Then
                rs.MoveFirst                 'A recordset elej�re �llunk
                frm.Controls("txtTALALAT").Text = CInt(rs.Fields("MLAPDB").Value)
            Else
                'Hiba
            End If
' Elk�sz�tem a grid-et
            sFormatstring = "<||Munkalap|Bejelent�|Ki�ll. d�tum|V�gezhet�|Szolg. jellege|Helysz�n|Berendez�s|Telep. hsz.|Hiba le�r�sa|Elv�gzett munka|Dolgoz�|Vissza�r�s|Munka�ra"
            sQuery = "sp_LekerdMlap"
            iMerge = 5
        
        Case "TELJ"
            sFormatstring = "<||Dolgoz�|Munkav�gz�s d�tuma|Munka�ra"
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
        
            sFormatstring = "<||Jegyz. sz�ma|Jegyz. d�tuma|Karbant. t�p.|M�velet|Ber.t�pus|Berendez�s|Gy. t�p.|Telep.hsz.|Gy.sz�m"
            sQuery = "sp_LekerdJegyz"
            iMerge = 9
        
        Case "LABOR"
            sFormatstring = "<||Jegyz. sz�ma|Jegyz. d�tuma|Karbant. t�p.|M�velet|Ber.t�pus|Berendez�s|Gy. t�p.|Telep.hsz.|Gy.sz�m"
            sQuery = "sp_LekerdLabor"
            iMerge = 9
            
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
'   Felt�lti az �zemfenntart�si munkalaphoz tartoz�,
'       dolgoz�i munkav�gz�st �s teljes�tm�nyadatokat kimutat� list�t.
'
'   Param�terek:    cmbMUNKALAP As Object   -   a munkalapot meghat�roz� combobox
'                   lstTeljm As Object  -   a felt�ltend� lista
'                   spcMUNOSZ As Object -   munka�ra �sszesen textbox
'
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
'
Public Function TeljListFeltolt(ByRef sMUNKALAP_ID As String, ByRef frm As Object) As Boolean
    On Error GoTo errTeljListFeltolt
    TeljListFeltolt = False
    
    Dim lstParams As New Collection
    lstParams.Add sMUNKALAP_ID, "pMUNKALAP_ID"
    Dim rstResult As New ADODB.Recordset
    If oAdmin.ExecVal("sp_GetTeljmSum", lstParams, rstResult) = True Then 'V�grehajtjuk az inzertet
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
    
    Dim lstParams As New Collection '�s �tadjuk majd param�terk�nt
    
    lstParams.Add sID, "pID"
    lstParams.Add iAllapot, "pALLAPOT"
    
    'oAdmin.BeginTrans
    If oAdmin.Exec("sp_SetMunkalapAllapot", lstParams) = True Then   'V�grehajtjuk az inzertet
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
    
    Dim lstParams As New Collection '�s �tadjuk majd param�terk�nt
    Dim sID As String
    sID = frm.Controls("txtOBJID").Text
    
    lstParams.Add sID, "OBJID"

    Dim sQuery As String
    sQuery = "sp_GetMunkalapObj"
    
    Dim rs As New ADODB.Recordset   'Bet�ltj�k az azonos�t� alapj�n a rekordot
    
    If oAdmin.ExecVal(sQuery, lstParams, rs) = True Then
    'If oAdmin.LoadFirstRecord("sp_GetTulajInfo", lstParams, rs) = True Then    '�s ha siker�lt
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
    
    'Dim sJTIP As String 'Lek�rdezz�k a v�lasztott jegyz�k�nyv t�pus�t
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
    
    Set objWord = WordAppNewDoc(sDocPath, sDotName, CStr(iJEGYZSZ), ".doc", sDocSavePath)  'Word ind�t�sa

    InsTextToWord objWord, lstReplace   'Word dokumentumon bel�l cser�ket v�grehajtjuk
    Set lstReplace = Nothing
    Jegyzokonyv = True
    Exit Function
    
errJegyzokonyv:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "Jegyzokonyv"
End Function    'Jegyzokonyv

'   OsszesitoFeltolt
'
'   Felt�lti az �sszes�t� jegyz�k�nyv elpv�laszt� k�perny� combobox-ait.
'
'   Param�terek:    frm -   a kit�ltend� form
'
'   Visszat�r�s:    Boolean. True, ha minden OK, egy�bk�nt False
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
            ctrlNum = CInt(Mid(ctrl.Name, 4))   'a combobox sz�ma
            futomuId = gIdTable(ctrlNum) 'f�t�m� objid (a t�mbb�l kiolvasva)
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
'   �ssze�ll�tja a labor �sszes�t� jegyz�k�nyvet a labor_o.dot Word sablon alapj�n
'
'   Param�terek:    sDocPath    -   a sablon file-t tartalmaz� k�nyvt�r el�r�si �tja
'
'   Visszat�r�s:    Boolean. True, ha minden OK, egy�bk�nt False
'
Public Function LaborOsszesito(ByRef sDocPath As String, sDate As String) As Boolean
    On Error GoTo errLaborOsszesito
    LaborOsszesito = False
    
    Dim rstLabor As New ADODB.Recordset
    Dim lstParams As New Collection
    lstParams.Add sDate, "pDATUM"
    oAdmin.ExecVal "sp_LaborOsszesito", lstParams, rstLabor
    
    'Melyik mez�ket kell cser�lni �s mire
    Dim lstReplace As New Collection
    Dim a As ADODB.Field
    For Each a In rstLabor.Fields
        lstReplace.Add a, a.Name
    Next
    
'    a.Value = sDate
'    a.Name = "DATUM"
'    lstReplace.Add a, a.Name
    
    'Sablon alapj�n l�trehozzuk a Word doksit
    Dim sDotName As String
    Dim sDocSaveName As String
    Dim sDocSavePath As String
    sDotName = "labor_o"
    sDocSavePath = sDocPath
    sDocSaveName = "V�zvizsg.havi.�ssz." + sDate
    
    Dim objWord As Object
    Set objWord = WordAppNewDoc(sDocPath, sDotName, sDocSaveName, ".doc", sDocSavePath)
    
    'Word dokumentumon bel�l cser�ket v�grehajtjuk
    InsTextToWord objWord, lstReplace
    
    Set lstReplace = Nothing
    LaborOsszesito = True
    Exit Function
    
errLaborOsszesito:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "LaborOsszesito"
End Function    'LaborOsszesito


'   OsszesitoKivalaszt
'
'   Automatikusan kit�lti az �sszes�t� jegyz�k�nyv jegyz�k�nyv sorsz�mait
'       a megadott d�tum alapj�n
'
'   Param�terek:    sDate   -   jegyz�k�nyvek k�sz�t�si d�tuma (csak �v/h�nap sz�m�t)
'
'   Visszat�r�s:    Boolean. True, ha minden OK, egy�bk�nt False
'
Public Function OsszesitoKivalaszt(ByRef sDate As String, ByRef frm As Object) As Boolean
    On Error GoTo errOsszesitoKivalaszt
    OsszesitoKivalaszt = False
    
    'Felt�lti a comboboxokat az �sszes, r�juk vonatkoz� jegyz�k�nyvsz�mokkal
    OsszesitoFeltolt frm
    
    'Felt�lti az �tmeneti SQL t�bl�t, amib�l kiolvassuk a jegyz�k�nyvek adatait
    Dim lstParams As New Collection
    lstParams.Add sDate, "pDATUM"
    oAdmin.Exec "sp_FillOsszesitoSorsz", lstParams
    lstParams.Remove "pDATUM"
    
    'Lek�rdezz�k, hogy melyik helyhez melyik az aktu�lis jegyz�k�nyv,
    ' �s r��ll�tjuk a comboboxokat.
    Dim rstResult As New ADODB.Recordset
    Dim sCmbSorsz As Integer
    Dim cmb As Object
    For Each cmb In frm.Controls
        If Left(cmb.Name, 3) = "cmb" Then   'v�gigmegy�nk az �sszes comboboxon
            sCmbSorsz = Right(cmb.Tag, Len(cmb.Tag) - 5)    'a nev�b�l kiolvashat�, melyik sorban van az adata
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