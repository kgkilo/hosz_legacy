Attribute VB_Name = "utility"
Function AktivForm()
    Dim MyReport As Form
    Set MyReport = Screen.ActiveForm
    AktivForm = MyReport.Name
End Function

Sub Kilep(ByRef frm As Form)
    Exit Sub
    If MsgBox("???", vbQuestion + vbYesNo, "Tisztelt felhaszn�l�!") = vbYes Then
        Unload frm
    End If
End Sub

Sub Back(ByRef frm As Form)
    frm.Hide
    Unload frm
End Sub

Sub Nyomtat(reportname As String, iDestination As Integer)
    With Form001.rep
        .Destination = iDestination ' 0 - privj� ablak, 1 - k�zvetlen�l nyomtat
        .WindowBorderStyle = 3
        .WindowState = 2
        .Connect = sConnectString
        .ReportFileName = sReportDir & reportname
        .Action = 1
    End With
End Sub
