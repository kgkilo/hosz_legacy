Option Compare Database
Option Explicit

Private Sub chkUEW_Click()
    If chkUEW.Value = True Then
        chkUER.Value = True
    End If
End Sub

Private Sub chkUFW_Click()
    If chkUFW.Value = True Then
        chkUFR.Value = True
    End If
End Sub
