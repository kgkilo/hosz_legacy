Option Compare Database
Option Explicit

Private Sub cmbMEGNEV_Enter()
    modosVizsg
    cmbMEGNEV = Null
    disableModDupPrnDel
    subTorol
    switchoffGrid
End Sub

Private Sub cmbMEGNEV_Updated(Code As Integer)
    If cmbMEGNEV.ListIndex <> -1 Then
        LEKERD
        fullPermiss
        enableModDupPrnDel
    End If
End Sub

Private Sub cmdBACK_Click()
    BACK_BTN
End Sub

Private Sub cmdEXIT_Click()
    EXIT_APP
End Sub

Private Sub cmdLEKERD_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    modosVizsg
    switchoffGrid
    enableCmbMegnev
    cmdOK.Enabled = False
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

Private Sub cmdNEZET_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    modosVizsg
    cmbMEGNEV = Null
    activateGrid
    util.gridder cmbOBJTIP, cmbMEGNEV, Me![sub]![grdGRID], Nothing, Nothing, Nothing, "Alt"
    disableCmbMegnev
    disableModDupPrnDel
    cmdOK.Enabled = False
    cmdMODOSIT = False
End Sub

Private Sub cmdBESZUR_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    modosVizsg
    cmdMODOSIT = False
    cmbMEGNEV = Null
    switchoffGrid
    disableCmbMegnev
    disableModDupPrnDel
    util.setcombo Me.sub.Controls
    cmdOK.Enabled = True
    parok = 1
    fullPermiss
End Sub

Private Sub cmdDEL_Click()
    cmdOK.Enabled = False
    cmdMODOSIT = False
    torol
    util.megnevfeltolt cmbMEGNEV, Nothing
End Sub

Private Sub cmdDUPLIKAL_Click()
    duplikal
    util.megnevfeltolt cmbMEGNEV, Nothing
End Sub

Private Sub cmdOK_Click()
    felir
    util.megnevfeltolt cmbMEGNEV, Nothing
End Sub

Private Sub cmdPrint_Click()
    cmdMODOSIT = False
End Sub

Private Sub Form_Load()
    util.megnevfeltolt cmbMEGNEV, Nothing
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
