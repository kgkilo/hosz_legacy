Option Compare Database
Option Explicit

Private Sub cmbMEGNEV_Enter()
    onMegnevEnter False
End Sub

Private Sub cmbMEGNEV_Updated(Code As Integer)
 If cmbMEGNEV.ListIndex <> -1 Then
    LEKERD
    enableModDupPrnDel
    cmdDUPLIKAL.Enabled = False
  End If
End Sub

Private Sub cmdBACK_Click()
    BACK_BTN
End Sub

Private Sub cmdEXIT_Click()
    EXIT_APP
End Sub

Private Sub cmdBESZUR_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    modosVizsg
    cmdMODOSIT = False
    cmbMEGNEV = Null
    switchoffGrid
    cmbMEGNEV.Enabled = False
    disableModDupPrnDel
    util.setcombo [sub].Controls
    cmdOK.Enabled = True
    parok = 1
    fullPermiss
End Sub

Private Sub cmdDEL_Click()
    cmdOK.Enabled = False
    cmdMODOSIT = False
    torol
    util.kepvisfeltolt cmbMEGNEV
End Sub

Private Sub cmdLEKERD_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    modosVizsg
    switchoffGrid
    cmdOK.Enabled = False
    cmbMEGNEV.Enabled = True
End Sub

Private Sub cmdMODOSIT_Click()
    If cmdMODOSIT = True Then
        cmdOK.Enabled = True
        fullPermiss
    Else
        cmdOK.Enabled = False
    End If
    parok = 1
End Sub

Private Sub cmdOK_Click()
    felir
    util.kepvisfeltolt cmbMEGNEV
End Sub

Private Sub cmdPrint_Click()
    cmdMODOSIT = False
End Sub

Private Sub Form_Load()
    util.kepvisfeltolt cmbMEGNEV
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
