Option Compare Database
Option Explicit

Public glbPERMIS
Global Const PERM_NULL = 0
Global Const PERM_RO = 1
Global Const PERM_RW = 2

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

'Ha objektum t�pust v�lasztott, felt�lti a Megnevez�s comboboxot
Sub onObjtipUpdated()
    DoCmd.Hourglass True
    With Screen.ActiveForm
        If .cmbOBJTIP.ListIndex <> -1 Then
            enableCmbMegnev
            util.megnevfeltolt .cmbMEGNEV, .cmbOBJTIP, "MEGNEV"
            disableCmbMegnev
            enableInsQryGrd
            .cmd1 = 6   'Besz�r/Lek�rdez/N�zet csoport �llapot�t �ll�tjuk
        End If
    End With
    DoCmd.Hourglass False
End Sub

Sub onMegnevEnter(Optional hasSubinf As Boolean)
    DoCmd.Hourglass True
    With Screen.ActiveForm
        modosVizsg
        .cmbMEGNEV = Null
        disableModDupPrnDel
        subTorol
        If hasSubinf = True Then subinfTorol
        switchoffGrid
    End With
    DoCmd.Hourglass False
End Sub

Sub onMegnevUpdated(strKategoria As String)
    DoCmd.Hourglass True
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
    DoCmd.Hourglass False
End Sub

Sub BACK_BTN()
    modosVizsg
    DoCmd.Close
End Sub

Sub EXIT_APP()
    modosVizsg
    kilep
End Sub

Sub onLekerdMouseDown()
    DoCmd.Hourglass True
    With Screen.ActiveForm
        modosVizsg
        switchoffGrid
        enableCmbMegnev
        .cmdOK.Enabled = False
    End With
    DoCmd.Hourglass False
End Sub

Sub onModositClick()
    DoCmd.Hourglass True
    With Screen.ActiveForm
        If .cmdMODOSIT = True Then
            .cmdOK.Enabled = True
            util.setpermis .cmbOBJTIP, .sub.Controls, 1
        Else
            .cmdOK.Enabled = False
        End If
        .parok = 1
    End With
    DoCmd.Hourglass False
End Sub

Sub onNezetMouseDown()
    DoCmd.Hourglass True
    With Screen.ActiveForm
        .cmbMEGNEV = Null
        activateGrid
        util.gridder ![cmbOBJTIP], ![cmbMEGNEV], ![sub]![grdGRID], Nothing, Nothing, Nothing, "Alt"
        disableCmbMegnev
        disableModDupPrnDel
        .cmdOK.Enabled = False
        .cmdMODOSIT = False
    End With
    DoCmd.Hourglass False
End Sub

Sub onOK()
    DoCmd.Hourglass True
    felir
    DoCmd.Hourglass False
End Sub

'Enged�lyezi a M�dos�t/Nyomtat/T�r�l/Duplik�l gombokat
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

'Letiltja a M�dos�t/Nyomtat/T�r�l/Duplik�l gombokat
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

'Enged�lyezi a Lek�rdez/N�zet/Besz�r gombokat
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

'Letiltja a Lek�rdez/N�zet/Besz�r gombokat
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

'Enged�lyezi a Megnevez�s comboboxot
Sub enableCmbMegnev()
    If glbPERMIS = PERM_RO Or glbPERMIS = PERM_RW Then
        With Screen.ActiveForm
            ![cmbMEGNEV].Enabled = True
            ![lbMEGNEV].ForeColor = vbBlack
        End With
    End If
End Sub

'Letiltja a Megnevez�s comboboxot
Sub disableCmbMegnev()
    With Screen.ActiveForm
        ![cmbMEGNEV].Enabled = False
        '![lbMEGNEV].ForeColor = vbGrayText '9868950
    End With
End Sub

'Aktiv�lja a N�zet funkci�t (grid form�tum)
Public Function activateGrid()
    With Screen.ActiveForm
        ![sub].SourceObject = .Name + " sub2"
    End With
End Function

'Kikapcsolja a N�zet funkci�t, vissza�ll egyszeres lek�rdez�sre
Public Function switchoffGrid()
    With Screen.ActiveForm
        ![sub].SourceObject = .Name + " sub1"
    End With
End Function

' A form neve �s a user login neve alapj�n visszaadja, hogy milyen jogosults�g van az adott formra.
' Be�ll�tja a glbPERMIS glob�lis v�ltoz� �rt�k�t PERM_NULL, PERM_RO, PERM_RW �rt�kek valamelyik�re.
' Ez hat�rozza meg, hogy egy form megnyithat�-e, �s ha igen, mely gombok akt�vak.
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

Sub kilep()
    DoCmd.Beep
    If Megerosit("Biztosan ki szeretne l�pni?") = vbYes Then
        DoCmd.Quit
    End If
End Sub

Sub fullPermiss()
    DoCmd.Hourglass True
    Dim oControl As Access.Control

    Dim bEnabled As Boolean
    Dim bVisible As Boolean
    Dim iColor As Long

    Select Case glbPERMIS
        Case PERM_NULL:
            iColor = vbGrayText
            bEnabled = False
            bVisible = False

        Case PERM_RO:
            iColor = vbGrayText
            bEnabled = False
            bVisible = True

        Case PERM_RW:
            iColor = vbBlack
            bEnabled = True
            bVisible = True
    End Select

    With Screen.ActiveForm
        For Each oControl In .sub.Controls
            Select Case Left(oControl.Name, 3)
                Case "txt", "cmb", "chk", "spc", "grp"
                    oControl.Enabled = bEnabled
                    oControl.Visible = bVisible

                Case "lbl"
                    oControl.ForeColor = iColor
                    oControl.Visible = bVisible
            End Select
        Next
    End With
    DoCmd.Hourglass False
End Sub

Sub subTorol()
    DoCmd.Hourglass True
    Dim oControl As Access.Control
    With Screen.ActiveForm
        For Each oControl In .sub.Controls
            Select Case Left(oControl.Name, 3)
                Case "txt", "cmb", "chk":
                    oControl = Null
            End Select
        Next
    End With
    DoCmd.Hourglass False
End Sub

Sub subinfTorol()
    DoCmd.Hourglass True
    Dim oControl As Access.Control
    With Screen.ActiveForm
        For Each oControl In .subinf.Controls
            Select Case Left(oControl.Name, 3)
                Case "txt", "cmb", "chk":
                    oControl = Null
            End Select
        Next
    End With
    DoCmd.Hourglass False
End Sub

Public Function Megerosit(msg As String) As Integer
    Megerosit = MsgBox(msg, vbDefaultButton2 + vbYesNo + vbApplicationModal + vbQuestion, "Tisztelt " & CurrentUser() & " felhaszn�l�!")
End Function

