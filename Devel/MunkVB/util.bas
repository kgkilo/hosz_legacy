Attribute VB_Name = "util"
Sub Kilep(ByRef frm As Form)
  If MsgBox("Biztosan ki szeretne l�pni?", vbYesNo + vbExclamation, "Tisztelt felhaszn�l�!") = vbYes Then
   frm.Hide
   Unload frm
  End If
End Sub
