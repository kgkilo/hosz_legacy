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
        .Destination = iDestination ' 0 - privjú ablak, 1 - közvetlenül nyomtat
        .WindowBorderStyle = 3
        .WindowState = 2
        .Connect = sConnectString
        .ReportFileName = sReportDir & reportname
        .Action = 1
    End With
End Sub

Sub kilep()
    Dim title  As Variant, Msg As Variant, Response As Variant
    title = "Tisztelt " & CurrentUser() & " felhasználó!"
    Msg = "Biztosan ki szeretne lépni?"
    DoCmd.Beep
    Response = MsgBox(Msg, DgDef, title)
    If Response = IDYES Then
        DoCmd.Quit
    End If
End Sub

Function ujrekord() As String
    Dim title  As Variant, Msg As Variant, Response As Variant
    title = "Tisztelt " & CurrentUser() & " felhasználó!"
    Msg = "Rögzíteni kívánja az új adatokat?"
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
    title = "Tisztelt " & CurrentUser() & " felhasználó!"
    Msg = "Menti a módosításokat?"
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
    title = "Tisztelt " & CurrentUser() & " felhasználó!"
    Msg = "Biztosan törli az objektumot?"
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
        If .parok = 1 Then              'a parok egy rejtett mezõ a keret formokon, ami 1, ha módosít a user
            If .cmd1 = 1 Then           'Ha inzert üzemmódban vagyunk
                modosVizsg = ujrekord   'beszúrjuk a rekordot
            End If
            If .cmdMODOSIT = True Then  'Ha módosítás üzemmódban vagyunk
                modosVizsg = modosit    'módosítjuk a rekordot
            End If
        End If
        'KEP699 Üzemeltetési munkalap
        'KEP700 Üzemfenntartási munkalap
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

    title = "Tisztelt " & CurrentUser() & " felhasználó!"
    Msg = "Biztosan duplikálni kívánja a választott berendezést?"
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
    title = "Tisztelt " & CurrentUser() & " felhasználó!"
    Msg = "Menti a módosításokat?"
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
    Forint = s1

End Function
