Option Compare Database
Option Explicit

Global Const MB_YESNO = 4
Global Const MB_ICONSTOP = 32
Global Const MB_DEFBUTTON2 = 256
Global Const IDYES = 6
Global Const IDNO = 7
Global Const DgDef = MB_YESNO + MB_ICONSTOP + MB_DEFBUTTON2

Sub Nyomtat(reportname As String, iDestination As Integer)
    With [Forms]![_MENU_FO]![rep]
        .Destination = iDestination ' 0 - privj� ablak, 1 - k�zvetlen�l nyomtat
        .WindowBorderStyle = 3
        .WindowState = 2
        .Connect = sConnectString
        .ReportFileName = sReportDir & reportname
        .Action = 1
    End With
End Sub

Sub kilep()
    Dim title  As Variant, Msg As Variant, Response As Variant
    title = "Tisztelt " & CurrentUser() & " felhaszn�l�!"
    Msg = "Biztosan ki szeretne l�pni?"
    DoCmd.Beep
    Response = MsgBox(Msg, DgDef, title)
    If Response = IDYES Then
        DoCmd.Quit
    End If
End Sub

Function ujrekord() As String
    Dim title  As Variant, Msg As Variant, Response As Variant
    title = "Tisztelt " & CurrentUser() & " felhaszn�l�!"
    Msg = "R�gz�teni k�v�nja az �j adatokat?"
    DoCmd.Beep
    Response = MsgBox(Msg, DgDef, title)
    With Screen.ActiveForm
        If Response = IDYES Then
            ujrekord = util.rekordinsert(.cmbOBJTIP, .sub.Controls, .modparam)
        Else
            ujrekord = "-1"
        End If
        util.megnevfeltolt .cmbMEGNEV, .cmbOBJTIP
    End With
End Function

Function modosit() As String
    Dim title  As Variant, Msg As Variant, Response As Variant
    title = "Tisztelt " & CurrentUser() & " felhaszn�l�!"
    Msg = "Menti a m�dos�t�sokat?"
    DoCmd.Beep
    Response = MsgBox(Msg, DgDef, title)
    With Screen.ActiveForm
        If Response = IDYES Then
            .parok = 0
            util.rekordupdate .cmbMEGNEV, .sub.Controls, .modparam

            If .Name = "KEP700" Then
                If ![sub]![cmbKARBTIP].ListIndex <> -1 And ![sub]![grpALLAPOT] = 4 Then
                    util.karbanfelvitel .cmbMEGNEV
                End If
            End If

            modosit = .cmbMEGNEV

            If .Name = "KEP700" Then
                If .honnan = 0 Then
                    DoCmd.GoToControl ("cmbmegnev")
                End If
            End If

            If .Name <> "KEP700" And .Name <> "KEP699" Then
                DoCmd.GoToControl ("cmbmegnev")
            End If
            'DoCmd.GoToControl ("cmdBack")
            util.megnevfeltolt .cmbMEGNEV, .cmbOBJTIP
        Else
            DoCmd.GoToControl ("cmdBack")
            modosit = "-1"
        End If
    End With
End Function

Sub torol()
    Dim title  As Variant, Msg As Variant, Response As Variant
    title = "Tisztelt " & CurrentUser() & " felhaszn�l�!"
    Msg = "Biztosan t�rli az objektumot?"
    DoCmd.Beep
    Response = MsgBox(Msg, DgDef, title)
    With Screen.ActiveForm
        If Response = IDYES Then
            util.rekorddel .cmbMEGNEV, .modparam
            Select Case .Name
                Case "Kep662", "Kep695", "Kep697", "Kep699", "Kep716", "Kep718", "Kep723"
                '662: Epulet adatok karbantartasa
                '695: Kontirozo torzs karbantartas
                '697: Dolgozo torzs karbantartas
                '699: Uzemeltetesi munkalap
                '716: Kozos kepviselok
                '718: Szerzodesek
                '723: Egyedi szamlak
                    DoCmd.GoToControl "cmbMEGNEV"
                Case Else
                    DoCmd.GoToControl "cmbOBJTIP"
            End Select
            subTorol
        End If
    End With
End Sub

Sub subTorol()
    Dim oControl As Access.Control
    With Screen.ActiveForm
        For Each oControl In .sub.Controls
            If Left(oControl.Name, 3) = "txt" Or Left(oControl.Name, 3) = "cmb" Or Left(oControl.Name, 3) = "chk" Then
                oControl = Null
            End If
        Next
    End With
End Sub

Sub subinfTorol()
    Dim oControl As Access.Control
    With Screen.ActiveForm
        For Each oControl In .subinf.Controls
            If Left(oControl.Name, 3) = "txt" Or Left(oControl.Name, 3) = "cmb" Or Left(oControl.Name, 3) = "chk" Then
                oControl = Null
            End If
        Next
    End With
End Sub

Function modosVizsg() As String
    modosVizsg = ""
    With Screen.ActiveForm
        If .parok = 1 Then              'a parok egy rejtett mez� a keret formokon, ami 1, ha m�dos�t a user
            If .cmd1 = 1 Then           'Ha inzert �zemm�dban vagyunk
                modosVizsg = ujrekord   'besz�rjuk a rekordot
            End If
            If .cmdMODOSIT = True Then  'Ha m�dos�t�s �zemm�dban vagyunk
                modosVizsg = modosit    'm�dos�tjuk a rekordot
            End If
        End If
        'KEP699 �zemeltet�si munkalap
        'KEP700 �zemfenntart�si munkalap
        If .Name <> "KEP699" And .Name <> "KEP700" Then
            .parok = 0
        End If
    End With
End Function

Sub fullPermiss()
    Dim oControl As Access.Control
    With Screen.ActiveForm
        For Each oControl In .sub.Controls
            Select Case Left(oControl.Name, 3)
                Case "txt", "cmb", "chk", "spc", "grp"
                    oControl.Enabled = True
                    oControl.Visible = True

                Case "lbl"
                    oControl.ForeColor = 0
                    oControl.Visible = True
            End Select
        Next
    End With
End Sub

Function felir() As String
    felir = ""
    With Screen.ActiveForm
        If .cmd1 = 1 Then
            felir = ujrekord
            If .Name <> "KEP699" And .Name <> "KEP700" Then
                subTorol
            End If
        End If
        If .cmdMODOSIT = True Then
            felir = modosit
            .cmdOK.Enabled = False
        End If
        If .Name <> "KEP699" And .Name <> "KEP700" Then
            .parok = 0
        End If
    End With
End Function

Sub LEKERD()
    With Screen.ActiveForm
        util.rekordfeltolt .cmbMEGNEV, .sub.Controls, .modparam
    End With
End Sub

Sub duplikal()
    Dim title  As Variant, Msg As Variant, Response As Variant

    title = "Tisztelt " & CurrentUser() & " felhaszn�l�!"
    Msg = "Biztosan duplik�lni k�v�nja a v�lasztott berendez�st?"
    DoCmd.Beep
    Response = MsgBox(Msg, DgDef, title)

    Dim Y As Long
    With Screen.ActiveForm
        If Response = IDYES Then
            If .Name = "Kep662" Then
                Y = util.duplikal(.cmbMEGNEV, "Epul")
                'DoCmd.GoToControl "cmbMEGNEV"
            Else
                Y = util.duplikal(.cmbMEGNEV, "Alt")
                'DoCmd.GoToControl "cmbobjtip"
            End If
        util.megnevfeltolt .cmbMEGNEV, .cmbOBJTIP, "MEGNEV"
        util.duplutankivalaszt .cmbMEGNEV, Y
        'subtorol
        End If
    End With
End Sub

Sub duplmodosit()
    Dim title  As Variant, Msg As Variant, Response As Variant
    title = "Tisztelt " & CurrentUser() & " felhaszn�l�!"
    Msg = "Menti a m�dos�t�sokat?"
    DoCmd.Beep
    Response = MsgBox(Msg, DgDef, title)
    If Response = IDYES Then
        With Screen.ActiveForm
            .parok = 0
            util.rekordupdate .cmbMEGNEV, .sub.Controls, .modparam
            'DoCmd.GoToControl ("cmbmegnev")
            'DoCmd.GoToControl ("cmdBack")
            'util.megnevfeltolt .cmbMEGNEV, .cmbOBJTIP
        End With
    End If
End Sub

Sub csoportosbaszasvizsgalat()
    With Screen.ActiveForm
        If ![cmbMLAPTIP].ListIndex <> -1 And util.getcomboertek(![cmbALLAPOT]) = "1" Then
            ![cmdCSOPORTOS].Enabled = True
        Else
            ![cmdCSOPORTOS].Enabled = False
        End If
    End With
End Sub

Function Forint(Ft As Currency)
Static Szam(127)
Static Szov(127)  As String
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
    Szov(2) = "kett�"
    Szov(3) = "h�rom"
    Szov(4) = "n�gy"
    Szov(5) = "�t"
    Szov(6) = "hat"
    Szov(7) = "h�t"
    Szov(8) = "nyolc"
    Szov(9) = "kilenc"
    Szov(10) = "tiz"
    Szov(11) = "tizenegy"
    Szov(12) = "tizenkett�"
    Szov(13) = "tizenh�rom"
    Szov(14) = "tizenn�gy"
    Szov(15) = "tizen�t"
    Szov(16) = "tizenhat"
    Szov(17) = "tizenh�t"
    Szov(18) = "tizennyolc"
    Szov(19) = "tizenkilenc"
    Szov(20) = "h�sz"
    Szov(21) = "huszonegy"
    Szov(22) = "huszonkett�"
    Szov(23) = "huszonh�rom"
    Szov(24) = "huszonn�gy"
    Szov(25) = "huszon�t"
    Szov(26) = "huszonhat"
    Szov(27) = "huszonh�t"
    Szov(28) = "huszonnyolc"
    Szov(29) = "huszonkilenc"
    Szov(30) = "harminc"
    Szov(31) = "negyven"
    Szov(32) = "�tven"
    Szov(33) = "hatvan"
    Szov(34) = "hetven"
    Szov(35) = "nyolcvan"
    Szov(36) = "kilencven"
    Szov(37) = "egysz�z"
    Szov(38) = "kett�sz�z"
    Szov(39) = "h�romsz�z"
    Szov(40) = "n�gysz�z"
    Szov(41) = "�tsz�z"
    Szov(42) = "hatsz�z"
    Szov(43) = "h�tsz�z"
    Szov(44) = "nyolcsz�z"
    Szov(45) = "kilencsz�z"
    Szov(46) = "egyezer"
    Szov(47) = "kett�ezer"
    Szov(48) = "h�romezer"
    Szov(49) = "n�gyezer"
    Szov(50) = "�tezer"
    Szov(51) = "hatezer"
    Szov(52) = "h�tezer"
    Szov(53) = "nyolcezer"
    Szov(54) = "kilencezer"
    Szov(55) = "tizezer"
    Szov(56) = "tizenegyezer"
    Szov(57) = "tizenkett�ezer"
    Szov(58) = "tizenh�romezer"
    Szov(59) = "tizenn�gyezer"
    Szov(60) = "tizen�tezer"
    Szov(61) = "tizenhatezer"
    Szov(62) = "tizenh�tezer"
    Szov(63) = "tizennyolcezer"
    Szov(64) = "tizenkilencezer"
    Szov(65) = "h�szezer"
    Szov(66) = "huszonegyezer"
    Szov(67) = "huszonkett�ezer"
    Szov(68) = "huszonh�romezer"
    Szov(69) = "huszonn�gyezer"
    Szov(70) = "huszon�tezer"
    Szov(71) = "huszonhatezer"
    Szov(72) = "huszonh�tezer"
    Szov(73) = "huszonnyolcezer"
    Szov(74) = "huszonkilencezer"
    Szov(75) = "harmincezer"
    Szov(76) = "negyvenezer"
    Szov(77) = "�tvenezer"
    Szov(78) = "hatvanezer"
    Szov(79) = "hetvenezer"
    Szov(80) = "nyolcvanezer"
    Szov(81) = "kilencvenezer"
    Szov(82) = "egysz�zezer"
    Szov(83) = "kett�sz�zezer"
    Szov(84) = "h�romsz�zezer"
    Szov(85) = "n�gysz�zezer"
    Szov(86) = "�tsz�zezer"
    Szov(87) = "hatsz�zezer"
    Szov(88) = "h�tsz�zezer"
    Szov(89) = "nyolcsz�zezer"
    Szov(90) = "kilencsz�zezer"
    Szov(91) = "egymilli�"
    Szov(92) = "kett�milli�"
    Szov(93) = "h�rommilli�"
    Szov(94) = "n�gymilli�"
    Szov(95) = "�tmilli�"
    Szov(96) = "hatmilli�"
    Szov(97) = "h�tmilli�"
    Szov(98) = "nyolcmilli�"
    Szov(99) = "kilencmilli�"
    Szov(100) = "tizmilli�"
    Szov(101) = "tizenegymilli�"
    Szov(102) = "tizenkett�milli�"
    Szov(103) = "tizenh�rommilli�"
    Szov(104) = "tizenn�gymilli�"
    Szov(105) = "tizen�tmilli�"
    Szov(106) = "tizenhatmilli�"
    Szov(107) = "tizenh�tmilli�"
    Szov(108) = "tizennyolcmilli�"
    Szov(109) = "tizenkilencmilli�"
    Szov(110) = "h�szmilli�"
    Szov(111) = "huszonegymilli�"
    Szov(112) = "huszonkett�milli�"
    Szov(113) = "huszonh�rommilli�"
    Szov(114) = "huszonn�gymilli�"
    Szov(115) = "huszon�tmilli�"
    Szov(116) = "huszonhatmilli�"
    Szov(117) = "huszonh�tmilli�"
    Szov(118) = "huszonnyolcmilli�"
    Szov(119) = "huszonkilencmilli�"
    Szov(120) = "harmincmilli�"
    Szov(121) = "negyvenmilli�"
    Szov(122) = "�tvenmilli�"
    Szov(123) = "hatvanmilli�"
    Szov(124) = "hetvenmilli�"
    Szov(125) = "nyolcvanmilli�"
    Szov(126) = "kilencvenmilli�"
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
    Forint = s1

End Function
