Option Compare Database
Option Explicit

Private Sub cmbOBJTIP_Enter()
    cmbOBJTIP = Null
    cmbMEGNEV = Null
    cmbKARB_ID = Null
    cmbMEGNEV.Enabled = False
    cmdWORD.Enabled = False
End Sub

Private Sub cmbOBJTIP_Updated(Code As Integer)
    If cmbOBJTIP.ListIndex <> -1 Then
        DoCmd.Hourglass True
        enableCmbMegnev
        util.megnevfeltolt cmbMEGNEV, cmbOBJTIP, "MEGNEV"
        DoCmd.Hourglass False
    End If
End Sub

Private Sub cmbMEGNEV_Enter()
    cmbMEGNEV = Null
End Sub

Private Sub cmbMEGNEV_Updated(Code As Integer)
    If cmbMEGNEV.ListIndex <> -1 Then
        util.jegyzkarbfeltolt cmbOBJTIP, cmbMEGNEV, cmbKARB_ID
    End If
End Sub

Private Sub cmbJTIP_Updated(Code As Integer)
    If cmbJTIP.ListIndex <> -1 Then
        enableCmdWord
        Dim jegyzokonyTip As String
        jegyzokonyTip = util.getcomboertek(cmbJTIP)
        If jegyzokonyTip = 3 Then
            util.dolgozofeltolt cmbNEV
            cmbNEV.Enabled = True
        Else
            cmbNEV.Enabled = False
        End If
    End If
End Sub

Private Sub cmbKARB_ID_Updated(Code As Integer)
    If cmbKARB_ID.ListIndex <> -1 Then
        util.getinfo cmbKARB_ID, subinf.Controls, "Karb"
        enableCmdWord
    End If
End Sub

Private Sub cmdBACK_Click()
    BACK_BTN
End Sub

Private Sub cmdEXIT_Click()
    EXIT_APP
End Sub

Private Sub cmdWORD_Click()
    DoCmd.Hourglass True
    If MsgBox("Biztosan létrehozza az új jegyzõkönyvet?", vbQuestion + vbYesNo, "Tisztelt " & CurrentUser() & " felhasználó!") = vbYes Then
        Dim i As Integer
        i = util.rekordinsert(cmbKARB_ID, Controls, "Jegyz")
        MsgBox "Az új jegyzõkönyv száma: " & i
        util.jegyzokonyv cmbJTIP, i, sReportDir
    End If
    DoCmd.Hourglass False
End Sub

Private Sub txtJDAT_AfterUpdate()
    enableCmdWord
End Sub

Private Sub Form_Load()
    util.objtipfeltolt cmbOBJTIP
    util.setcombo Controls

    Select Case glbPERMIS
        Case PERM_NULL:
            cmbOBJTIP.Enabled = False
            cmbMEGNEV.Enabled = False
            cmbKARB_ID.Enabled = False
            cmbJTIP.Enabled = False
            txtJDAT.Enabled = False

        Case PERM_RO:
        Case PERM_RW:
    End Select
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub

Private Sub enableCmdWord()
    If cmbKARB_ID.ListIndex <> -1 Then
        If cmbJTIP.ListIndex <> -1 Then
            If Not txtJDAT Then
                If glbPERMIS = PERM_RW Then
                    cmdWORD.Enabled = True
                End If
            Else
                cmdWORD.Enabled = False
            End If
        End If
    End If
End Sub
