Option Compare Database
Option Explicit

Private Sub cmbOBJTIP_Enter()
    cmbOBJTIP2 = Null
    cmbMEGNEV = Null
    cmbOBJTIP2.Enabled = False
    cmbMEGNEV.Enabled = False
    grdKAPCS.Clear
    subinfTorol
End Sub

Private Sub cmbOBJTIP_Change()
    If cmbOBJTIP.ListIndex <> -1 Then
        DoCmd.Hourglass True
        enableCmbMegnev
        util.megnevfeltolt cmbMEGNEV, cmbOBJTIP, "MEGNEV"
        DoCmd.Hourglass False
    End If
End Sub

Private Sub cmbMEGNEV_Enter()
    cmbOBJTIP2 = Null
    cmbMEGNEV = Null
    cmbOBJTIP2.Enabled = False
    grdKAPCS.Clear
    subinfTorol
End Sub

Private Sub cmbMEGNEV_Change()
    If cmbMEGNEV.ListIndex <> -1 Then
        DoCmd.Hourglass True
        grdKAPCS.Clear
        util.gridder2 cmbMEGNEV, cmbOBJTIP2, grdKAPCS
        util.getinfo cmbMEGNEV, subinf.Controls, "Spec"
        cmbOBJTIP2.Enabled = True
        cmdPRINT.Enabled = True
        util.objtipfeltolt cmbOBJTIP2
        DoCmd.Hourglass False
    End If
End Sub

Private Sub cmbOBJTIP2_Enter()
    cmbOBJTIP2 = Null
    grdKAPCS.Clear
End Sub

Private Sub cmbOBJTIP2_Change()
    If cmbOBJTIP2.ListIndex <> -1 Then
        DoCmd.Hourglass True
        grdKAPCS.Clear
        util.gridder2 cmbMEGNEV, cmbOBJTIP2, grdKAPCS
        DoCmd.Hourglass False
    End If
End Sub

Private Sub cmdBACK_Click()
    BACK_BTN
End Sub

Private Sub cmdEXIT_Click()
    EXIT_APP
End Sub

Private Sub cmdPrint_Click()
    DoCmd.Hourglass True
    util.gridder3 cmbMEGNEV, cmbOBJTIP2
    DoCmd.Hourglass False
    With [Forms]![_MENU_FO]![rep]
        .Formulas(0) = "objtip='" & cmbOBJTIP & "'"
        .Formulas(1) = "megnev='" & cmbMEGNEV & "'"
        .Formulas(2) = "telephsz='" & [subinf]!txtTELEPHSZ & "'"
        .Formulas(3) = "tipus='" & [subinf]!txtTIPUS & "'"
        .Formulas(4) = "gyszam='" & [subinf]!txtGYSZAM & "'"
        .Formulas(5) = "futomunev='" & [subinf]!txtFUTOMUNEV & "'"
    End With
    Nyomtat "torzskapcs.rpt", 0
End Sub

Private Sub Form_Load()
    util.objtipfeltolt cmbOBJTIP
    Select Case glbPERMIS
        Case PERM_NULL:
            cmbOBJTIP.Enabled = False
            cmbMEGNEV.Enabled = False
            cmbOBJTIP2.Enabled = False

        Case PERM_RO:
        Case PERM_RW:
    End Select
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
