Option Compare Database
Option Explicit

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

Function ujrekord() As String
    Dim title  As Variant, Msg As Variant, Response As Variant
    title = "Tisztelt " & CurrentUser() & " felhasználó!"
    Msg = "Rögzíteni kívánja az új adatokat?"
    DoCmd.Beep
    Response = MsgBox(Msg, DgDef, title)
    With Screen.ActiveForm
        If Response = vbYes Then
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
        If Response = vbYes Then
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
            '????util.megnevfeltolt .cmbMEGNEV, .cmbOBJTIP
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
        If Response = vbYes Then
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
        If Response = vbYes Then
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
    If Response = vbYes Then
        With Screen.ActiveForm
            .parok = 0
            util.rekordupdate .cmbMEGNEV, .sub.Controls, .modparam
            'DoCmd.GoToControl ("cmbmegnev")
            'DoCmd.GoToControl ("cmdBack")
            'util.megnevfeltolt .cmbMEGNEV, .cmbOBJTIP
        End With
    End If
End Sub

