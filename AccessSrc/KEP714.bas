Option Compare Database
Option Explicit

Private Sub cmbSZOLGADAT_Click()
    If cmbSZOLGADAT.ListCount > 0 And glbPERMIS = PERM_RW Then
        cmdSZOLGDEL.Enabled = True
    Else
        cmdSZOLGDEL.Enabled = False
    End If
End Sub

Private Sub cmbSZOLG_Enter()
    modosVizsg
    cmbSZOLG = Null
    txtNOTERT = Null
    txtERVDAT = Null
    txtBEFDAT = Null
    cmbSZOLGADAT.Clear
End Sub

Private Sub cmbSZOLG_Updated(Code As Integer)
    If cmbSZOLG.ListIndex <> -1 Then
        util.arvaltlistfeltolt cmbSZOLG, cmbSZOLGADAT
        If glbPERMIS = PERM_RW Then
            txtNOTERT.Enabled = True
            txtERVDAT.Enabled = True
            txtBEFDAT.Enabled = True
        End If
    Else
        txtNOTERT.Enabled = False
        txtERVDAT.Enabled = False
        txtBEFDAT.Enabled = False
    End If
End Sub

Private Sub cmdBACK_Click()
    DoCmd.Close
End Sub

Private Sub cmdEXIT_Click()
    kilep
End Sub

Private Sub cmdSZOLGFEL_Click()
    If Not (txtNOTERT And txtERVDAT) Then
        util.rekordinsert cmbSZOLG, Controls, "Arvalt"
        util.arvaltlistfeltolt cmbSZOLG, cmbSZOLGADAT
    Else
        MsgBox "A szolgáltatás adatok helytelenül vannak megadva!", vbExclamation, "Tisztelt " & CurrentUser() & " felhasználó!"
    End If
End Sub

Private Sub cmdSZOLGDEL_Click()
    util.rekorddel cmbSZOLGADAT, "Arvalt"
    util.arvaltlistfeltolt cmbSZOLG, cmbSZOLGADAT
End Sub

Private Sub Form_Load()
    util.setcombo Controls
    cmbSZOLGADAT.Clear

    Select Case glbPERMIS
        Case PERM_NULL:
            cmbSZOLG.Enabled = False
            cmdSZOLGDEL.Enabled = False
            cmdSZOLGFEL.Enabled = False

        Case PERM_RO:
            cmbSZOLG.Enabled = True
            cmdSZOLGDEL.Enabled = False
            cmdSZOLGFEL.Enabled = False

        Case PERM_RW:
            cmbSZOLG.Enabled = True
            cmdSZOLGDEL.Enabled = True
            cmdSZOLGFEL.Enabled = True
    End Select
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
