Attribute VB_Name = "util"
Sub Kilep(ByRef frm As Form)
  If MsgBox("Biztosan ki szeretne lépni?", vbYesNo + vbExclamation, "Tisztelt felhasználó!") = vbYes Then
   frm.Hide
   Unload frm
  End If
End Sub
