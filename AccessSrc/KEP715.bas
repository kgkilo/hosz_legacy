Option Compare Database
Option Explicit

Private Sub cmbFUTOMU_Updated(Code As Integer)
    If cmbFUTOMU.ListIndex <> -1 Then
        cmbLEPCSOHAZ.Enabled = False
    End If
End Sub

Private Sub cmbLEPCSOHAZ_Updated(Code As Integer)
    If cmbLEPCSOHAZ.ListIndex <> -1 Then
        cmbFUTOMU.Enabled = False
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
    util.szolglekerd Controls, grdGRID
    txtTALALAT = grdGRID.Rows - 1
    cmbFUTOMU.Enabled = True
    cmbLEPCSOHAZ.Enabled = True
    cmbFUTOMU = Null
    cmbLEPCSOHAZ = Null
    DoCmd.Hourglass False
End Sub

Private Sub cmdLEKERD_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    enableCmbMegnev
    switchoffGrid
End Sub

Private Sub cmdNEZET_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    disableModDupPrnDel
    disableCmbMegnev
    activateGrid
End Sub

Private Sub Form_Load()
    util.setcombo Controls
    util.megnevfeltolt2 cmbLEPCSOHAZ, "37"
    util.szolglekerdfutomufeltolt cmbFUTOMU

    If glbPERMIS = PERM_NULL Then
        cmbFUTOMU.Enabled = False
        cmbLEPCSOHAZ.Enabled = False
        cmbSZOLG.Enabled = False
        cmdFrissit.Enabled = False
    End If
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
