Attribute VB_Name = "utility"
Function AktivForm()
    Dim MyReport As Form
    Set MyReport = Screen.ActiveForm
    AktivForm = MyReport.Name
End Function

Sub Kilep(ByRef frm As Form)
    Exit Sub
    If MsgBox("???", vbQuestion + vbYesNo, "Tisztelt felhasználó!") = vbYes Then
        Unload frm
    End If
End Sub

Sub Back(ByRef frm As Form)
    frm.Hide
    Unload frm
End Sub

Sub Subtorol()
    Set frmCurrentForm = Screen.ActiveForm
    Dim oControl As Control
    For Each oControl In frmCurrentForm.Controls
        If Left(oControl.Name, 3) = "txt" Or Left(oControl.Name, 3) = "cmb" Or Left(oControl.Name, 3) = "chk" Then
            oControl = ""
        End If
    Next
End Sub

Sub Nyomtat(reportname As String, iDestination As Integer)
    Form001.rep.Destination = iDestination ' 0 - privjú ablak, 1 - közvetlenül nyomtat
    Form001.rep.WindowBorderStyle = 3
    Form001.rep.WindowState = 2
    Form001.rep.Connect = sConnectString
    Form001.rep.ReportFileName = sReportDir & reportname
    Form001.rep.Action = 1
End Sub
