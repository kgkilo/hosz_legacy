Attribute VB_Name = "Start"
Public util As Object
Public sConnectString As String
Public sReportDir As String

Sub Main()
    sReportDir = "I:\HOSZOLG\"
    Set util = CreateObject("munkVB.Global")
    util.init sReportDir
    Form001.Show 1
End Sub
