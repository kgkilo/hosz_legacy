Option Compare Database
Option Explicit

Private Sub cmbOBJTIP_Enter()
    onObjtipEnter
End Sub

Private Sub cmbOBJTIP_Updated(Code As Integer)
    If cmbOBJTIP.ListIndex <> -1 Then
        enableInsQryGrd
        enableCmbMegnev
        util.megnevfeltolt cmbMEGNEV, cmbOBJTIP, "MEGNEV"
        DoCmd.GoToControl "cmdexit"
        cmd1 = 6
        If cmd1 <> 4 Then
            disableCmbMegnev
        End If
    End If
End Sub

Private Sub cmbMEGNEV_Enter()
    modosVizsg
    cmbMEGNEV = Null
    subTorol
    disableModDupPrnDel
    switchoffGrid
End Sub

Private Sub cmbMEGNEV_Updated(Code As Integer)
    If cmbMEGNEV.ListIndex <> -1 Then
        LEKERD
        util.rekordfeltolt cmbMEGNEV, [sub].Controls, "Kontir"
        enableModDupPrnDel
    End If
End Sub

Private Sub cmbFSZAM_Updated(Code As Integer)
    If cmbMEGNEV.ListIndex <> -1 Then
        LEKERD
        enableModDupPrnDel
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
    cmbMEGNEV = Null
    cmbMEGNEV.Enabled = False
    switchoffGrid
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
    util.kontirfeltolt cmbMEGNEV
End Sub

Private Sub cmdLEKERD_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    modosVizsg
    switchoffGrid
    cmdOK.Enabled = False
    cmbMEGNEV.Enabled = True
End Sub

Private Sub cmdMODOSIT_Click()
    If Me.cmdMODOSIT = True Then
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
    util.gridder cmbOBJTIP, cmbMEGNEV, [sub]![grdGRID], Nothing, Nothing, Nothing, "Kontir"
    cmbMEGNEV.Enabled = False
    disableModDupPrnDel
    cmdOK.Enabled = False
End Sub

Private Sub cmdOK_Click()
    felir
    util.kontirfeltolt cmbMEGNEV
End Sub

Private Sub cmdPrint_Click()
    cmdMODOSIT = False
End Sub

Private Sub Form_Load()
    util.kontirfeltolt cmbMEGNEV
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
