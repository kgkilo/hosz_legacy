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

'Ha objektum t�pust v�lasztott, felt�lti a Megnevez�s comboboxot
Sub onObjtipUpdated()
    With Screen.ActiveForm
        If .cmbOBJTIP.ListIndex <> -1 Then
            fillCmbMegnev
            disableCmbMegnev
            enableInsQryGrd
            .cmd1 = 6   'Besz�r/Lek�rdez/N�zet csoport �llapot�t �ll�tjuk
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
            ![lbMEGNEV].ForeColor = 0
        End With
    End If
End Sub

'Letiltja a Megnevez�s comboboxot
Sub disableCmbMegnev()
    With Screen.ActiveForm
        ![cmbMEGNEV].Enabled = False
        ![lbMEGNEV].ForeColor = 9868950
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
