Option Compare Database
Option Explicit

Private Sub cmbOBJTIP_Enter()
    cmbOBJTIP = Null
    cmbMEGNEV = Null
    cmbMEGNEV.Enabled = False
End Sub

Private Sub cmbOBJTIP_Updated(Code As Integer)
    DoCmd.Hourglass True
    If cmbOBJTIP.ListIndex <> -1 Then
        enableCmbMegnev
        util.megnevfeltolt cmbMEGNEV, cmbOBJTIP, "MEGNEV"
    End If
    DoCmd.Hourglass False
End Sub

Private Sub cmbMEGNEV_Updated(Code As Integer)
    DoCmd.Hourglass True
    If cmbMEGNEV.ListIndex <> -1 Then
        grdGRID.Rows = 1
        util.lekerdhierarchia Controls, grdGRID
        txtTALALAT = grdGRID.Rows - 1
    End If
    DoCmd.Hourglass False
End Sub

Private Sub cmdBACK_Click()
    DoCmd.Close
End Sub

Private Sub cmdEXIT_Click()
    kilep
End Sub

Private Sub Form_Load()
    util.objtipfeltolt cmbOBJTIP
    Select Case glbPERMIS
        Case PERM_NULL:
            cmbOBJTIP.Enabled = False
            cmbMEGNEV.Enabled = False

        Case PERM_RO:
        Case PERM_RW:
    End Select
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
