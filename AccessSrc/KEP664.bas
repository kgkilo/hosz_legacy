Option Compare Database
Option Explicit

Private Sub cmbOBJTIP_Enter()
    cmbOBJTIP = Null
    cmbMEGNEV = Null
    cmbOBJTIP2 = Null
    cmbMEGNEV.Enabled = False
    cmbOBJTIP2.Enabled = False
    cmdODA.Enabled = False
    cmdVISSZA.Enabled = False
    grdNEMKAPCSOLT.Clear
    grdKAPCSOLT.Clear
    subinfTorol
End Sub

Private Sub cmbOBJTIP_Updated(Code As Integer)
    If cmbOBJTIP.ListIndex <> -1 Then
        enableCmbMegnev
        util.megnevfeltolt cmbMEGNEV, cmbOBJTIP, "MEGNEV"
    End If
End Sub

Private Sub cmbOBJTIP2_Enter()
    cmbOBJTIP2 = Null
    cmdODA.Enabled = False
    cmdVISSZA.Enabled = False
    grdNEMKAPCSOLT.Clear
    grdKAPCSOLT.Clear
End Sub

Private Sub cmbOBJTIP2_Change()
    DoCmd.Hourglass True
    If cmbOBJTIP2.ListIndex <> -1 Then
        If glbPERMIS = PERM_RW Then
            cmdODA.Enabled = True
            cmdVISSZA.Enabled = True
        End If
        'DoCmd.GoToControl "cmdexit"
        util.kapcsololistfeltolt cmbOBJTIP2, cmbMEGNEV, grdNEMKAPCSOLT, grdKAPCSOLT
    End If
    DoCmd.Hourglass False
End Sub

Private Sub cmbOBJTIP2_Updated(Code As Integer)
    If cmbOBJTIP2.ListIndex <> -1 Then
        util.elozokapcskiir Me.subinfold.Controls, Me.Controls
    End If
End Sub

Private Sub cmbMEGNEV_Enter()
    cmbMEGNEV = Null
    cmbOBJTIP2 = Null
    cmbOBJTIP2.Enabled = False
    cmdODA.Enabled = False
    cmdVISSZA.Enabled = False
    grdNEMKAPCSOLT.Clear
    grdKAPCSOLT.Clear
    subinfTorol
    'subtorol
End Sub

Private Sub cmbMEGNEV_Updated(Code As Integer)
    If cmbMEGNEV.ListIndex <> -1 Then
        util.getinfo cmbMEGNEV, Me.subinf.Controls, "Spec"
        cmbOBJTIP2.Enabled = True
        util.objtipfeltolt cmbOBJTIP2
    End If
End Sub

Private Sub cmdBACK_Click()
    BACK_BTN
End Sub

Private Sub cmdEXIT_Click()
    EXIT_APP
End Sub

Private Sub cmdODA_Click()
    DoCmd.Hourglass True
    util.kapcsol cmbMEGNEV, grdNEMKAPCSOLT
    util.kapcsololistfeltolt cmbOBJTIP2, cmbMEGNEV, grdNEMKAPCSOLT, grdKAPCSOLT
    DoCmd.Hourglass False
End Sub

Private Sub cmdVISSZA_Click()
    DoCmd.Hourglass True
    util.szetkapcsol cmbMEGNEV, grdKAPCSOLT
    util.kapcsololistfeltolt cmbOBJTIP2, cmbMEGNEV, grdNEMKAPCSOLT, grdKAPCSOLT
    DoCmd.Hourglass False
End Sub

Private Sub Form_Load()
    util.objtipfeltolt cmbOBJTIP
    Select Case glbPERMIS
        Case PERM_NULL:
            cmbOBJTIP.Enabled = False
        Case PERM_RO:
        Case PERM_RW:
    End Select
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
