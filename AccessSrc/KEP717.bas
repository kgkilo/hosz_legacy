Option Compare Database
Option Explicit

Private Sub cmdBACK_Click()
    DoCmd.Close
End Sub

Private Sub cmdEXIT_Click()
    kilep
End Sub

Private Sub cmdFrissit_Click()
    DoCmd.Hourglass True
    grdGRID.Rows = 1
    util.kepvislekerd Controls, grdGRID
    txtTALALAT = grdGRID.Rows - 1
    DoCmd.Hourglass False
End Sub

Private Sub cmdPrint_Click()
    util.printkepvislekerd grdGRID, rep, Controls
    With rep
        .Left = 15
        .Top = 15
        .Width = Me.Width
        .Height = Me.InsideHeight
    End With
End Sub

Private Sub Form_Load()
    util.kepvisfeltolt cmbKEPVIS
    util.megnevfeltolt2 cmbEPUL, "37"

    If glbPERMIS = PERM_NULL Then
        cmbEPUL.Enabled = False
        cmbKEPVIS.Enabled = False
        cmdFrissit.Enabled = False
        txtDATUMTOL.Enabled = False
        txtDATUMIG.Enabled = False
        cmdPRINT.Enabled = False
    End If
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
