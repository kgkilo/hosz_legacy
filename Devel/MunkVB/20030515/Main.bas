Attribute VB_Name = "Start"
Public util As Object
Public sConnectString As String
Public sReportDir As String
Sub Main()
 'sReportDir = "I:\KTORZS\"
 'sReportDir = "I:\HOSZOLG\"
 'sConnectString = "DRIVER={SQL Server};Server=NTSERVER;uid=sa;pwd=;database=SZETAV"
 Set util = CreateObject("munkVB.Global")
 util.init sReportDir
 Form001.Show 1
End Sub


