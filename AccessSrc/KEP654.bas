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
    onMegnevUpdated "Alt"
End Sub

Private Sub cmdBACK_Click()
    BACK_BTN
End Sub

Private Sub cmdEXIT_Click()
    EXIT_APP
End Sub

Private Sub cmbOBJTIP_LostFocus()
    enableInsQryGrd
End Sub

Private Sub cmd1_AfterUpdate()
    Select Case cmd1
        Case 1  'Beszur
            modosVizsg
            cmdMODOSIT = False
            cmbMEGNEV = Null
            switchoffGrid
            disableCmbMegnev
            disableModDupPrnDel
            util.setcombo [sub].Controls
            cmdOK.Enabled = True
            parok = 1
            util.setpermis cmbOBJTIP, [sub].Controls, 1
        Case 4  'Lekerd
            onLekerdMouseDown
        Case 5  'grid view
            onNezetMouseDown
    End Select
 End Sub

Private Sub cmdDEL_Click()
    cmdOK.Enabled = False
    cmdMODOSIT = False
    torol
End Sub

Private Sub cmdDUPLIKAL_Click()
    duplmodosit
    duplikal
End Sub

Private Sub cmdMODOSIT_Click()
    onModositClick
End Sub

Private Sub cmdOK_Click()
    onOK
End Sub

Private Sub Form_Load()
    util.objtipfeltolt cmbOBJTIP
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
