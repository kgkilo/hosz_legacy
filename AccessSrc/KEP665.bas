Option Compare Database
Option Explicit

Private Sub cmbOBJTIP_Enter()
    cmdPRINT.Enabled = False
    [Param].SourceObject = "Kep665 subnull"
    subinf!txtFUTOMUNEV = Null
End Sub

Private Sub cmbOBJTIP_Change()
    If cmbOBJTIP.ListIndex <> -1 Then
        enableCmbMegnev
        Dim sObjtip As String
        sObjtip = util.getcomboertek(cmbOBJTIP)
        Select Case sObjtip
            Case "01"   'Épület
                [Param].SourceObject = "Kep665 subepul"
            Case "03"   'Fûtõmû
                [Param].SourceObject = "Kep665 subfutomu"
            Case "17"   'Hõközpont
                [Param].SourceObject = "Kep665 subhokoz"
            Case "18"   'Hõösszegzõ
                [Param].SourceObject = "Kep665 subhoosszegzo"
            Case "19"   'Vízóra
                [Param].SourceObject = "Kep665 subvizora"
            Case "20"   'Érzékelõ
                [Param].SourceObject = "Kep665 suberzekelo"
        End Select
    End If
End Sub

Private Sub cmbMEGNEV_Enter()
    cmdPRINT.Enabled = False
End Sub

Private Sub grdGRID_RowColChange()
    util.getgridinfo grdGRID, Me.[subinf].Controls, "Alt"
End Sub

Private Sub grdGRID_SelChange()
    util.getgridinfo grdGRID, Me.[subinf].Controls, "Alt"
End Sub

Private Sub cmdBACK_Click()
    DoCmd.Close
End Sub

Private Sub cmdEXIT_Click()
    kilep
End Sub

Private Sub cmdFrissit_Click()
    DoCmd.Hourglass True
    grdGRID.Rows = 1
    Dim sObjtip As String
    sObjtip = util.getcomboertek(cmbOBJTIP)
    Select Case sObjtip
        Case "01"   'Épület
            util.gridder cmbOBJTIP, cmbMEGNEV, grdGRID, [Param]!cmbLEKPAR, [Param]!cmbpar, [Param]!cmbpar, "Alt"

        Case "03", "17", "18", "19", "20"   'Fûtõmû, hõközpont, hõösszegzõ, vízóra, érzékelõ
            util.gridder cmbOBJTIP, cmbMEGNEV, grdGRID, [Param]!cmbLEKPAR, [Param]!txtPAR, [Param]!txtPARIG, "Alt"

        Case Else
            util.gridder cmbOBJTIP, cmbMEGNEV, grdGRID, Nothing, Nothing, Nothing, "Alt"
    End Select

    txtTALALAT = grdGRID.Rows - 1
    cmdPRINT.Enabled = True
    DoCmd.Hourglass False
End Sub

Private Sub cmdPrint_Click()
    Dim sObjtip As String
    sObjtip = util.getcomboertek(cmbOBJTIP)
    Select Case sObjtip
        Case "01"   'Épület
            If IsNull([Param]!cmbpar.Value) Then
                util.printobjaltalanos grdGRID, rep, cmbOBJTIP, cmbMEGNEV, [Param]!cmbLEKPAR.Value, ""
            Else
                util.printobjaltalanos grdGRID, rep, cmbOBJTIP, cmbMEGNEV, [Param]!cmbLEKPAR.Value, [Param]!cmbpar.Value
            End If

        Case "03", "17", "18", "19", "20"   'Fûtõmû, hõközpont, hõösszegzõ, vízóra, érzékelõ
            If IsNull([Param]!txtPAR.Value) Then
                util.printobjaltalanos grdGRID, rep, cmbOBJTIP, cmbMEGNEV, [Param]!cmbLEKPAR.Value, ""
            Else
                util.printobjaltalanos grdGRID, rep, cmbOBJTIP, cmbMEGNEV, [Param]!cmbLEKPAR.Value, [Param]!txtPAR.Value & " - " & [Param]!txtPARIG.Value
            End If

        Case Else
            util.printobjaltalanos grdGRID, rep, cmbOBJTIP, cmbMEGNEV, "", ""
    End Select

    With rep
        .Left = 15
        .Top = 15
        .Width = Me.Width
        .Height = Me.InsideHeight
    End With
End Sub

Private Sub Form_Load()
    Select Case glbPERMIS
        Case PERM_NULL
            cmbOBJTIP.Enabled = False
            cmbMEGNEV.Enabled = False
            cmdFrissit.Enabled = False

        Case PERM_RO, PERM_RW
            util.objtipfeltolt cmbOBJTIP
            util.megnevfeltolt2 cmbMEGNEV, "03" 'Fûtõmûvekkel kell feltölteni
    End Select
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub

