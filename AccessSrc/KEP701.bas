Option Compare Database
Option Explicit

Private Sub cmbALLAPOT_Updated(Code As Integer)
    enableCsoportosButton
End Sub

Private Sub cmbMLAPTIP_Updated(Code As Integer)
    enableCsoportosButton
End Sub

Private Sub cmbOBJTIP_Enter()
    cmbOBJTIP = Null
    cmbOBJID = Null
End Sub

Private Sub cmbOBJTIP_Updated(Code As Integer)
    If cmbOBJTIP.ListIndex <> -1 Then
        DoCmd.Hourglass True
        util.megnevfeltolt cmbOBJID, cmbOBJTIP, "MEGNEV"
        DoCmd.Hourglass False
    End If
End Sub

Private Sub cmdBACK_Click()
    DoCmd.Close
End Sub

Private Sub cmdCSOPORTOS_Click()
    Dim i As Integer
    If util.getcomboertek(cmbMLAPTIP) = 1 Then
        For i = 1 To grdGRID.Rows - 1
            util.printmunkalap "1", grdGRID.TextMatrix(i, 1)
            Nyomtat "munuf.rpt", 1
            util.munkalapallapot grdGRID.TextMatrix(i, 1), 2
        Next i
    Else
        For i = 1 To grdGRID.Rows - 1
            util.printmunkalap "2", grdGRID.TextMatrix(i, 1)
            Nyomtat "munue.rpt", 1
            util.munkalapallapot grdGRID.TextMatrix(i, 1), 2
        Next i
    End If
End Sub

Private Sub cmdEXIT_Click()
    kilep
End Sub

Private Sub cmdFrissit_Click()
    DoCmd.Hourglass True
    grdGRID.Rows = 1
    txtTALALAT = util.lekerdmunkalapaltalanos(Controls, grdGRID)
    Dim iOrak As Integer
    Dim sCell As String
    Dim i As Integer
    iOrak = 0
    With grdgrdi
        For i = 1 To .Rows - 1
            sCell = .TextMatrix(i, 13)
            If sCell <> "" Then iOrak = iOrak + CInt(sCell)
        Next i
    End With
    txtMUNOSZ = iOrak
    DoCmd.Hourglass False
End Sub

Private Sub cmdPrint_Click()
    util.printmunkalapaltalanos grdGRID, rep, Controls
    With rep
        .Left = 15
        .Top = 15
        .Width = Me.Width
        .Height = Me.InsideHeight
    End With
End Sub

Private Sub Form_Load()
    util.setcombo Controls
    util.munkalaplekerdepulfeltolt cmbEPULID

    If glbPERMIS = PERM_NULL Then
        txtDATUMTOL.Enabled = False
        txtDATUMIG.Enabled = False
        cmbSZEREGYS.Enabled = False
        cmbSZOLGJELL.Enabled = False
        cmbTIPUSH.Enabled = False
        cmbFSZAM.Enabled = False
        cmbMLAPTIP.Enabled = False
        cmbALLAPOT.Enabled = False
        cmbOBJTIP.Enabled = False
        cmbOBJID.Enabled = False
        cmbEPULID.Enabled = False
        cmbDOLGID.Enabled = False
        txtMUNDATTOL.Enabled = False
        txtMUNDATIG.Enabled = False
        cmdCSOPORTOS.Enabled = False
        cmdFrissit.Enabled = False
    End If
End Sub

Private Sub Form_Open(Cancel As Integer)
    checkPermis Me
End Sub

Private Sub grdGRID_DblClick()
    RaborulID = grdGRID.TextMatrix(grdGRID.Row, 1)
    If grdGRID.TextMatrix(grdGRID.Row, 14) = 1 Then
        DoCmd.OpenForm "KEP700"
        With [Forms]![KEP700]
            .honnan = 1
            .cmd1.DefaultValue = 4
            SendKeys "&m"
            .[sub]![fldADAT].Value = 1
            .cmdBESZUR.Enabled = False
            .cmdLEKERD.Enabled = False
            .cmdMODOSIT.Enabled = False
        End With
    Else
        DoCmd.OpenForm "KEP699"
        With [Forms]![KEP699]
            .honnan = 1
            .cmd1.DefaultValue = 4
            SendKeys "&m"
            .[sub]![fldADAT].Value = 1
            .cmdBESZUR.Enabled = False
            .cmdLEKERD.Enabled = False
            .cmdMODOSIT.Enabled = False
        End With
    End If
End Sub

Sub enableCsoportosButton()
    If cmbMLAPTIP.ListIndex <> -1 And util.getcomboertek(cmbALLAPOT) = "1" Then
        cmdCSOPORTOS.Enabled = True
    Else
        cmdCSOPORTOS.Enabled = False
    End If
End Sub

