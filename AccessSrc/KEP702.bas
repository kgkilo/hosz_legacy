Option Compare Database
Option Explicit

Private Sub cmbOBJTIP_Enter()
    onObjtipEnter
End Sub

Private Sub cmdBACK_Click()
    BACK_BTN
End Sub

Private Sub cmdEXIT_Click()
    EXIT_APP
End Sub

Private Sub Form_Load()
    util.setcombo Controls
    util.megnevfeltolt2 cmbFUTOMU, "03"

    If glbPERMIS = PERM_NULL Then
        grpBEALLIT.Enabled = False
        txtDATUMTOL.Enabled = False
        txtDATUMIG.Enabled = False
        cmbSZOLGJELL.Enabled = False
        cmbDOLGID.Enabled = False
        cmbFUTOMU.Enabled = False
        cmdPRINT.Enabled = False
        txtSZOLGJELL.ForeColor = 9868950
    End If
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub

Private Sub cmdPrint_Click()
    With [Forms]![_MENU_FO]![rep]
        .Formulas(0) = "datumtol='" & txtDATUMTOL & "'"
        .Formulas(1) = "datumig='" & txtDATUMIG & "'"

        Select Case grpBEALLIT
            Case "1"
                util.printmunossz "403", Controls
                .Formulas(2) = "szolgjell='" & cmbSZOLGJELL & "'"
                Nyomtat "TAB403.rpt", 0

            Case "2"
                util.printmunossz "404", Controls
                Nyomtat "TAB404.rpt", 0

            Case "3"
                util.printmunossz "406", Controls
                Nyomtat "TAB406.rpt", 0

            Case "4"
                If (cmbDOLGID.ListIndex <> -1 And cmbSZOLGJELL.ListIndex <> -1) Then
                    util.printmunossz "407", Controls
                    .Formulas(2) = "szolgjell='" & cmbSZOLGJELL & "'"
                    .Formulas(3) = "dolgid='" & cmbDOLGID & "'"
                    Nyomtat "TAB407.rpt", 0
                Else
                    MsgBox "Nyomtatás elõtt ki kell választani egy szolgáltatást és egy dolgozót!", vbExclamation, "Tisztelt " & CurrentUser() & " felhasználó!"
                End If

            Case "5"
                If cmbFUTOMU.ListIndex <> -1 Then
                    util.printmunossz "408", Controls
                    .Formulas(2) = "futomu='" & cmbFUTOMU & "'"
                    Nyomtat "TAB408.rpt", 0
                Else
                    MsgBox "Nyomtatás elõtt ki kell választani egy fûtõmûvet!", vbExclamation, "Tisztelt " & CurrentUser() & " felhasználó!"
                End If
        End Select
    End With
End Sub

Private Sub grpBEALLIT_AfterUpdate()
    cmbSZOLGJELL.Clear
    cmbDOLGID.Clear
    util.setcombo Controls

    Select Case grpBEALLIT
        Case "1"
            txtSZOLGJELL.ForeColor = 0
            cmbSZOLGJELL.Enabled = True
            txtDOLGID.ForeColor = 9868950
            cmbDOLGID.Enabled = False
            txtFUTOMU.ForeColor = 9868950
            cmbFUTOMU.Enabled = False

        Case "2"
            txtSZOLGJELL.ForeColor = 9868950
            cmbSZOLGJELL.Enabled = False
            txtDOLGID.ForeColor = 9868950
            cmbDOLGID.Enabled = False
            txtFUTOMU.ForeColor = 9868950
            cmbFUTOMU.Enabled = False

        Case "3"
            txtSZOLGJELL.ForeColor = 9868950
            cmbSZOLGJELL.Enabled = False
            txtDOLGID.ForeColor = 0
            cmbDOLGID.Enabled = False
            txtFUTOMU.ForeColor = 9868950
            cmbFUTOMU.Enabled = False

        Case "4"
            txtSZOLGJELL.ForeColor = 0
            cmbSZOLGJELL.Enabled = True
            txtDOLGID.ForeColor = 0
            cmbDOLGID.Enabled = True
            txtFUTOMU.ForeColor = 9868950
            cmbFUTOMU.Enabled = False

        Case "5"
            txtSZOLGJELL.ForeColor = 9868950
            cmbSZOLGJELL.Enabled = False
            txtDOLGID.ForeColor = 9868950
            cmbDOLGID.Enabled = False
            txtFUTOMU.ForeColor = 0
            cmbFUTOMU.Enabled = True
     End Select
End Sub
