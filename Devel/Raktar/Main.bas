Attribute VB_Name = "Start"
Global util As Object
Global sReportDir As String
Global sConnectString As String
Global HOOSSZEGZO
Global VIZORA
Global ERZEKELO
Global MIND

Sub Nyomtat(reportName As String, iDestination As Integer)
    With Form002.rep
        .Destination = iDestination ' 0 - privjú ablak, 1 - közvetlenül nyomtat
        .WindowBorderStyle = 3
        .WindowState = 2
        .Connect = sConnectString
        .ReportFileName = sReportDir & reportName
        .Action = 1
    End With
End Sub

