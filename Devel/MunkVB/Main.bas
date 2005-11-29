Attribute VB_Name = "Start"
Public util As Object
Public sConnectString As String
Public sReportDir As String
Public sANTSZDir As String
Public iWorkMode As Integer

Public Const NORMAL = 0
Public Const DISZPECSER = 1
Public Const LABOR = 2
Public Const MUNKALAP = 3

Sub Main()
    sReportDir = "I:\HOSZOLG\"
    sANTSZDir = "I:\HOSZOLG\"
    Set util = CreateObject("munkVB.Global")
    util.init sReportDir, sANTSZDir, iWorkMode
    Select Case iWorkMode
        Case NORMAL
            FormStart.Show 1
        Case DISZPECSER
            Form001.Show 1
        Case LABOR
            Form003.Show 1
        Case MUNKALAP
            Form001.Show 1
    End Select
    
End Sub
