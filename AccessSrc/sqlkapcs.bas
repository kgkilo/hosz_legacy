Option Compare Database
Option Explicit

Public util As Object
Public sReportDir As String
Public RaborulID As String

Sub dllinit()
    DoCmd.Hourglass True
    RaborulID = ""

    Set util = CreateObject("SZTKUtil.Global")
    util.init "J:\GABOR\WORK\Hoszolg\formel.ini", CurrentUser(), sReportDir

    DoCmd.Hourglass False
End Sub
