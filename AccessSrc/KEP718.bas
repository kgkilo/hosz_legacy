Option Compare Database
Option Explicit

Private Sub cmbMEGNEV_Enter()
    onMegnevEnter False
End Sub

Private Sub cmbMEGNEV_Updated(Code As Integer)
    If cmbMEGNEV.ListIndex <> -1 Then
        DoCmd.Hourglass True
        LEKERD
        enableModDupPrnDel
        cmdDUPLIKAL.Enabled = False
        util.szertetlistfeltolt cmbMEGNEV, [sub]!cmb1
        DoCmd.Hourglass False
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
    cmdMODOSIT = False
    cmbMEGNEV = Null
    switchoffGrid
    cmbMEGNEV.Enabled = False
    disableModDupPrnDel
    util.setcombo [sub].Controls
    util.megnevfeltolt2 [sub]!cmbOBJ_ID, "37"
    cmdOK.Enabled = True
    parok = 1
    fullPermiss
    [sub]!cmb1.Clear
    With [sub]!fldADAT
        .Value = 2
        .Value = 1
        .Value = 0
        .Pages(1).Enabled = False
        .Pages(2).Enabled = False
        '.Value = 1 - .Value
        '.Value = 1 - .Value
    End With
    'util.setpermis cmbOBJTIP, Me.sub.Controls
End Sub

Private Sub cmdDEL_Click()
    cmdOK.Enabled = False
    cmdMODOSIT = False
    torol
    util.szerzfejfeltolt cmbMEGNEV
End Sub

Private Sub cmdLEKERD_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    modosVizsg
    switchoffGrid
    cmdOK.Enabled = False
    cmbMEGNEV.Enabled = True
End Sub

Private Sub cmdMODOSIT_Click()
    If cmdMODOSIT = True Then
        cmdOK.Enabled = True
        With [sub]!fldADAT
            .Pages(1).Enabled = True
            .Pages(2).Enabled = True
            fullPermiss
            .Value = 2
            .Value = 1
            .Value = 0
        End With
        With [sub]
            util.megnevfeltolt2 !cmbOBJ_ID, "37"
            util.setcombo2 !cmbCIKK
            util.setcombo2 !cmbAFA
            util.setcombo2 !cmbMENNY_ME
        End With
    Else
        cmdOK.Enabled = False
    End If
    parok = 1
End Sub

Private Sub cmdOK_Click()
    felir
    util.szerzfejfeltolt cmbMEGNEV
    With [sub]!fldADAT
        .Value = 2
        .Value = 1
        .Value = 0
    End With
End Sub

Private Sub cmdPrint_Click()
    cmdMODOSIT = False
End Sub

Private Sub Form_Load()
    util.szerzfejfeltolt cmbMEGNEV
    If glbPERMIS <> PERM_RW Then
        disableInsQryGrd
    End If
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub
