Option Compare Database
Option Explicit

Private Sub cmblekpar_Updated(Code As Integer)
    If cmbLEKPAR.ListIndex <> -1 Then
        lbpar = cmbLEKPAR
        lbpar.Enabled = True
        txtPAR.Enabled = True
        txtPARIG.Enabled = True
        DoCmd.GoToControl ("txtpar")
        txtPAR = Null
        txtPARIG = Null
    End If
End Sub

Private Sub Form_Open(Cancel As Integer)
    util.setcombo Controls
End Sub

Private Sub txtPAR_AfterUpdate()
    'util.gridder Parent.cmbOBJTIP, Parent.cmbMEGNEV, Parent.grdGRID, cmbLEKPAR, txtPAR, txtPARIG, "Alt"
 End Sub

Private Sub txtPARIG_AfterUpdate()
    ' util.gridder Parent.cmbOBJTIP, Parent.cmbMEGNEV, Parent.grdGRID, cmbLEKPAR, txtPAR, txtPARIG, "Alt"
End Sub
