Option Compare Database
Option Explicit

Public util As Object
Public sConnectString As String
Public sReportDir As String
Public RaborulID As String

Sub dllinit()
    RaborulID = ""
    sReportDir = "J:\GABOR\WORK\Hoszolg\"
    sConnectString = "DRIVER={SQL Server};Server=127.0.0.1;database=SZETAV;"
    sConnectString = sConnectString + "uid=" + CurrentUser() + ";pwd=" + CurrentUser()

    Set util = CreateObject("SZTKUtil.Global")
    util.init sConnectString
End Sub
