Option Compare Database
Option Explicit

Private Sub cmblekpar_Updated(Code As Integer)
    If cmbLEKPAR.ListIndex <> -1 Then
        lbpar = cmbLEKPAR
        lbpar.Enabled = True
        cmbpar.Enabled = True
        DoCmd.GoToControl ("cmbpar")
        cmbpar = Null
        cmbpar.Tag = util.getcomboertek(cmbLEKPAR)
        util.setcombo2 cmbpar
    End If
End Sub

Private Sub cmbPAR_Updated(Code As Integer)
    'util.gridder Parent.cmbOBJTIP, Parent.cmbMEGNEV, Parent.grdGRID, cmbLEKPAR, cmbpar, Nothing, "Alt"
End Sub

Private Sub Form_Open(Cancel As Integer)
    util.setcombo Controls
End Sub
