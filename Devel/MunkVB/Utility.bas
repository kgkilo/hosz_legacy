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
    With Form001.rep
        .Destination = iDestination ' 0 - privjú ablak, 1 - közvetlenül nyomtat
        .WindowBorderStyle = 3
        .WindowState = 2
        .Connect = sConnectString
        .ReportFileName = sReportDir & reportname
        .Action = 1
    End With
End Sub
