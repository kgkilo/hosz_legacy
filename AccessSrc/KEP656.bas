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
    onLekerdMouseDown
End Sub

Private Sub cmdMODOSIT_Click()
    onModositClick
    If cmdMODOSIT = True Then
        With [sub]![fldADAT]
            .Value = 2 - .Value
            .Value = 2 - .Value
        End With
    End If
End Sub

Private Sub cmdNEZET_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    onNezetMouseDown
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
