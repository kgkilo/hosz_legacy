Option Compare Database
Option Explicit

Private Sub cmbOBJTIP_Enter()
    onObjtipEnter True
End Sub

Private Sub cmbOBJTIP_Updated(Code As Integer)
    onObjtipUpdated
End Sub

Private Sub cmbMEGNEV_Enter()
    onMegnevEnter True
End Sub

Private Sub cmbMEGNEV_Updated(Code As Integer)
    onMegnevUpdated "Spec"
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
        util.setpermis cmbOBJTIP, Me.sub.Controls, 1
        Me![sub]![fldADAT].Value = 2 - Me![sub]![fldADAT].Value
        Me![sub]![fldADAT].Value = 2 - Me![sub]![fldADAT].Value
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

Private Sub cmdOK_Click()
    felir
End Sub

Private Sub cmdPrint_Click()
    cmdMODOSIT = False
End Sub

Private Sub Form_Load()
    util.objtipfeltolt cmbOBJTIP
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
