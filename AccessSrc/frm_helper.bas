Option Compare Database
Option Explicit

Public glbPERMIS
Public Const PERM_NULL = 0
Public Const PERM_RO = 1
Public Const PERM_RW = 2

Sub onObjtipEnter(Optional hasSubinf As Boolean)
    With Screen.ActiveForm
        modosVizsg
        .cmbOBJTIP = Null
        .cmbMEGNEV = Null
        .cmbMEGNEV.Enabled = False
        disableModDupPrnDel
        disableInsQryGrd
        subTorol
        If hasSubinf = True Then subinfTorol
        switchoffGrid
    End With
End Sub

'Ha objektum típust választott, feltölti a Megnevezés comboboxot
Sub onObjtipUpdated()
    With Screen.ActiveForm
        If .cmbOBJTIP.ListIndex <> -1 Then
            fillCmbMegnev
            disableCmbMegnev
            enableInsQryGrd
            .cmd1 = 6   'Beszúr/Lekérdez/Nézet csoport állapotát állítjuk
        End If
    End With
End Sub

Sub onMegnevEnter(Optional hasSubinf As Boolean)
    With Screen.ActiveForm
        modosVizsg
        .cmbMEGNEV = Null
        disableModDupPrnDel
        subTorol
        If hasSubinf = True Then subinfTorol
        switchoffGrid
    End With
End Sub

Sub onMegnevUpdated(strKategoria As String)
    With Screen.ActiveForm
        If .cmbMEGNEV.ListIndex <> -1 Then
            LEKERD
            util.setpermis .cmbOBJTIP, .sub.Controls, 0
            If strKategoria <> "" Then
                util.getinfo .cmbMEGNEV, .subinf.Controls, strKategoria
            End If
            enableModDupPrnDel
        End If
    End With
End Sub

Sub BACK_BTN()
    modosVizsg
    DoCmd.Close
End Sub

Sub EXIT_APP()
    modosVizsg
    kilep
End Sub

'Engedélyezi a Módosít/Nyomtat/Töröl/Duplikál gombokat
Sub enableModDupPrnDel()
    If glbPERMIS = PERM_RW Then
        With Screen.ActiveForm
            ![cmdMODOSIT].Enabled = True
            Select Case .Name
                Case "KEP656", "KEP658", "KEP660", "KEP664", "KEP666"
                '656: Gepeszeti adatok karbantartasa
                '658: Elektromos adatok karbantartasa
                '660: Uzemeltetesi adatok karbantartasa
                '664: Kapcsolatok karbantartasa
                '666: Kapcsolatok lekerdezese

                Case Else
                    ![cmdDEL].Enabled = True
                    '![cmdPRINT].Enabled = True
                    ![cmdDUPLIKAL].Enabled = True
            End Select
        End With
    End If
End Sub

'Letiltja a Módosít/Nyomtat/Töröl/Duplikál gombokat
Sub disableModDupPrnDel()
    With Screen.ActiveForm
        ![cmdMODOSIT].Enabled = False
        ![cmdPRINT].Enabled = False
        ![cmdMODOSIT] = False
        Select Case .Name
            Case "KEP656", "KEP658", "KEP660", "KEP683"
            '656: Gepeszeti adatok karbantartasa
            '658: Elektromos adatok karbantartasa
            '660: Uzemeltetesi adatok karbantartasa
            '683: Jegyzokonyvek

            Case Else
                ![cmdDEL].Enabled = False
                ![cmdDUPLIKAL].Enabled = False
        End Select
    End With
End Sub

'Engedélyezi a Lekérdez/Nézet/Beszúr gombokat
Sub enableInsQryGrd()
    With Screen.ActiveForm
        If glbPERMIS = PERM_RO Or glbPERMIS = PERM_RW Then
            ![cmdLEKERD].Enabled = True
            ![cmdNEZET].Enabled = True
        End If
        Select Case .Name
            Case "KEP656", "KEP658", "KEP660"
            '656: Gepeszeti adatok karbantartasa
            '658: Elektromos adatok karbantartasa
            '660: Uzemeltetesi adatok karbantartasa

            Case Else
                If glbPERMIS = PERM_RW Then
                    ![cmdBESZUR].Enabled = True
                End If
        End Select
    End With
End Sub

'Letiltja a Lekérdez/Nézet/Beszúr gombokat
Sub disableInsQryGrd()
    With Screen.ActiveForm
        ![cmdLEKERD].Enabled = False
        ![cmdNEZET].Enabled = False
        Select Case .Name
            Case "KEP656", "KEP658", "KEP660"
            '656: Gepeszeti adatok karbantartasa
            '658: Elektromos adatok karbantartasa
            '660: Uzemeltetesi adatok karbantartasa

            Case Else
                ![cmdBESZUR].Enabled = False
        End Select
    End With
End Sub

'Engedélyezi a Megnevezés comboboxot
Sub enableCmbMegnev()
    If glbPERMIS = PERM_RO Or glbPERMIS = PERM_RW Then
        With Screen.ActiveForm
            ![cmbMEGNEV].Enabled = True
            ![lbMEGNEV].ForeColor = 0
        End With
    End If
End Sub

'Letiltja a Megnevezés comboboxot
Sub disableCmbMegnev()
    With Screen.ActiveForm
        ![cmbMEGNEV].Enabled = False
        ![lbMEGNEV].ForeColor = 9868950
    End With
End Sub

'Aktiválja a Nézet funkciót (grid formátum)
Public Function activateGrid()
    With Screen.ActiveForm
        ![sub].SourceObject = .Name + " sub2"
    End With
End Function

'Kikapcsolja a Nézet funkciót, visszaáll egyszeres lekérdezésre
Public Function switchoffGrid()
    With Screen.ActiveForm
        ![sub].SourceObject = .Name + " sub1"
    End With
End Function

' A form neve és a user login neve alapján visszaadja, hogy milyen jogosultság van az adott formra.
' Beállítja a glbPERMIS globális változó értékét PERM_NULL, PERM_RO, PERM_RW értékek valamelyikére.
' Ez határozza meg, hogy egy form megnyitható-e, és ha igen, mely gombok aktívak.
Public Function checkPermis(frm As Form)
    glbPERMIS = util.checkPermis(frm.Name, CurrentUser())

    'MsgBox glbPERMIS, , "PERMIS"
    Select Case glbPERMIS
        Case PERM_NULL:
            'DoCmd.Close

        Case PERM_RO:
        Case PERM_RW:
    End Select
End Function

Public Function fillCmbMegnev()
    With Screen.ActiveForm
        If .cmbOBJTIP.ListIndex <> -1 Then
            DoCmd.Hourglass True
            enableCmbMegnev
            util.megnevfeltolt .cmbMEGNEV, .cmbOBJTIP, "MEGNEV"
            DoCmd.Hourglass False
        End If
    End With
End Function
