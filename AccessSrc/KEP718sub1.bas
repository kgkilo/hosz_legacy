Option Compare Database

Private Sub kapcsolvizsg()
    cmdEPULFEL.Enabled = True
    Exit Sub

    If txtCIKK_MENNY <> "" And txtSZ_MENNY <> "" And txtOSSZEG <> "" Then
        cmdEPULFEL.Enabled = True
    Else
        cmdEPULFEL.Enabled = False
    End If
End Sub

Private Sub cmb1_Click()
    If Parent.cmdMODOSIT.Value = True Then
        If cmb1.ListCount > 0 Then
            cmdEPULDEL.Enabled = True
        Else
            cmdEPULDEL.Enabled = False
        End If
    End If
End Sub

Private Sub cmdEPULDEL_Click()
    DoCmd.Hourglass True
    util.szertetszetkapcsol cmb1
    util.szertetlistfeltolt Parent.cmbMEGNEV, cmb1
    DoCmd.Hourglass False
End Sub

Private Sub cmdEPULFEL_Click()
    DoCmd.Hourglass True
    If txtCIKK_MENNY <> "" And txtSZ_MENNY <> "" And txtOSSZEG <> "" Then
        util.szertetkapcsol Parent.cmbMEGNEV, Controls
        util.szertetlistfeltolt Parent.cmbMEGNEV, cmb1
    Else
        MsgBox "A kapcsolandó adatok helytelenül vannak megadva!", vbExclamation, "Tisztelt " & CurrentUser() & " felhasználó!"
    End If
    DoCmd.Hourglass False
End Sub

Private Sub Form_Load()
    util.kepvisfeltolt cmbKEPVIS
End Sub

Private Sub txtCIKK_MENNY_AfterUpdate()
    kapcsolvizsg
End Sub

Private Sub txtSZ_MENNY_AfterUpdate()
    kapcsolvizsg
    txtOSSZEG = util.szertetosszegszamol(Controls)
End Sub

Private Sub txtOSSZEG_AfterUpdate()
    kapcsolvizsg
End Sub

