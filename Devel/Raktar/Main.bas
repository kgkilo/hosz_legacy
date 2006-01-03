Attribute VB_Name = "Start"
Option Explicit

Public util As Object
Public oAdmin As CadminADO
Public g_oKodszotar As CKodSzotar

Global sConnectString As String
Global sReportDir As String

Public Const HOOSSZEGZO = "18"
Public Const VIZORA = "19"
Public Const ERZEKELO = "20"
Public Const MIND = "00"

Sub Main()
    sReportDir = "I:\HOSZOLG\"
    
    Set util = New CGlobal
    
    sConnectString = util.Init(sReportDir)
    
    FormMain.Show vbModal
    
End Sub

Sub Nyomtat(reportname As String, iDestination As Integer)
    With Form002.rep
        .Destination = iDestination ' 0 - privjú ablak, 1 - közvetlenül nyomtat
        .WindowBorderStyle = 3
        .WindowState = 2
        .Connect = sConnectString
        .ReportFileName = sReportDir & reportname
        .Action = 1
    End With
End Sub

