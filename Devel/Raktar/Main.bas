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
    
    util.Init sReportDir
    
    Form001.Show vbModal
End Sub

