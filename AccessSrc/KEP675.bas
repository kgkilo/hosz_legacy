Option Compare Database
Option Explicit

Private Sub cmbOBJTIP_Change()
    If cmbOBJTIP.ListIndex <> -1 Then
        Karbtervlekerd
        If glbPERMIS = PERM_RW Then
            cmdODA.Enabled = True
            cmdVISSZA.Enabled = True
        End If
    End If
End Sub

Private Sub cmbIDOE_Updated(Code As Integer)
    If cmbIDOE.ListIndex <> -1 Then
        nyilvizsg
    End If
End Sub

Private Sub txtIDO_AfterUpdate()
    nyilvizsg
End Sub

Private Sub cmbMUVEL_Updated(Code As Integer)
    If cmbMUVEL.ListIndex <> -1 Then
        txtIDO.Enabled = True
        cmbIDOE.Enabled = True
        lblIDOE.ForeColor = 0
        Karbtervlekerd
    End If
End Sub

Private Sub cmdBACK_Click()
    BACK_BTN
End Sub

Private Sub cmdEXIT_Click()
    EXIT_APP
End Sub

Private Sub cmdODA_Click()
    DoCmd.Beep
    If Megerosit("Biztosan kapcsolni szeretné?") = vbYes Then
        DoCmd.Hourglass True
        util.karbtervkapcsol Controls
        Karbtervlekerd
        DoCmd.Hourglass False
    End If
End Sub

Private Sub cmdVISSZA_Click()
    DoCmd.Beep
    If Megerosit("Biztosan le szeretné kapcsolni?") = vbYes Then
        DoCmd.Hourglass True
        util.karbtervszetkapcsol grdKAPCSOLT
        Karbtervlekerd
        DoCmd.Hourglass False
    End If
 End Sub

Private Sub Form_Load()
    util.setcombo Controls
    Select Case glbPERMIS
        Case PERM_NULL:
            cmbOBJTIP.Enabled = False
            cmbMUVEL.Enabled = False
            cmdODA.Enabled = False
            cmdVISSZA.Enabled = False
            grpBEALLIT.Enabled = False

        Case PERM_RO:
        Case PERM_RW:
    End Select
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub

Private Sub grpBEALLIT_AfterUpdate()
    Select Case grpBEALLIT
        Case "1"
            cmbOBJTIP.Enabled = False
            lblOBJTIP.ForeColor = 9868950
            lblOBJ.Caption = "B E R E N D E Z É S  F É L E S É G E K"
            cmbOBJTIP.ListIndex = -1
            cmdODA.Enabled = False
            cmdVISSZA.Enabled = False

        Case "2"
            cmbOBJTIP.Enabled = True
            lblOBJTIP.ForeColor = 0
            lblOBJ.Caption = "B E R E N D E Z É S E K"
    End Select
End Sub

Private Sub Karbtervlekerd()
    DoCmd.Hourglass True
    util.karbtervlistfeltolt cmbOBJTIP, cmbMUVEL, grdNEMKAPCSOLT, grdKAPCSOLT
    DoCmd.Hourglass False
End Sub

Private Sub nyilvizsg()
    If txtIDO <> "" And cmbIDOE <> "" Then
        If glbPERMIS = PERM_RW Then
            cmdODA.Enabled = True
            cmdVISSZA.Enabled = True
        End If
    Else
        cmdODA.Enabled = False
        cmdVISSZA.Enabled = False
    End If
End Sub

