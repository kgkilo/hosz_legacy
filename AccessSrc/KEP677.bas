Option Compare Database
Option Explicit

Private Sub cmbOBJTIP_Enter()
    cmbOBJTIP = Null
    cmbOBJID = Null
End Sub

Private Sub cmbOBJTIP_Updated(Code As Integer)
    If cmbOBJTIP.ListIndex <> -1 Then
        DoCmd.Hourglass True
        util.megnevfeltolt cmbOBJID, cmbOBJTIP, "MEGNEV"
        DoCmd.Hourglass False
    End If
End Sub

Private Sub cmdBACK_Click()
    DoCmd.Close
End Sub

Private Sub cmdEXIT_Click()
    kilep
End Sub

Private Sub cmdFrissit_Click()
    DoCmd.Hourglass True
    grdGRID.Rows = 1
    util.Karbtervlekerd Controls, grdGRID
    txtTALALAT = grdGRID.Rows - 1
    DoCmd.Hourglass False
End Sub

Private Sub cmdPrint_Click()
    util.printkarbterv grdGRID, rep, Controls
    With rep
        .Left = 15
        .Top = 15
        .Width = Me.Width
        .Height = Me.InsideHeight
    End With
End Sub

Private Sub Form_Load()
    util.setcombo Controls
    Select Case glbPERMIS
        Case PERM_NULL:
            cmbOBJTIP.Enabled = False
            cmbMUVEL.Enabled = False
            cmbOBJID.Enabled = False
            cmdFrissit.Enabled = False
            txtDATUMTOL.Enabled = False
            txtDATUMIG.Enabled = False
            grdGRID.Enabled = False
            cmdPRINT.Enabled = False

        Case PERM_RO:
        Case PERM_RW:
    End Select
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
