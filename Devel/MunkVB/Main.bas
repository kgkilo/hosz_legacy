Attribute VB_Name = "Start"
' $Id$

Option Explicit

Public util As Object
Public oAdmin As CadminADO
Public g_oKodszotar As CKodSzotar

Public sConnectString As String
Public sReportDir As String
Public sANTSZDir As String
Public iWorkMode As Integer

Public Const NORMAL = 0
Public Const DISZPECSER = 1
Public Const LABOR = 2
Public Const MLAP = 3
Public Const VISSZAIR = 4

'itt kell megadni, hogy melyik fûtõmûnek mi az objid-je
'olyan sorrendben kell megadni, ahogy a Form003b-n a comboboxok száma mutatja (Name-ben)
'select id, megnev from objektum where objtip='03' order by megnev
Public gIdTable() As Variant

Sub Main()
    'sReportDir = "I:\HOSZOLG\"
    sReportDir = "C:\Work\HOSZOLG\"
    sANTSZDir = "I:\HOSZOLG\"
    
    Set util = New CGlobal
    
    util.Init sReportDir, sANTSZDir, iWorkMode
    Select Case iWorkMode
        Case NORMAL
            FormStart.Show 1
        Case DISZPECSER
            Form001.Show 1
        Case LABOR
            Form003.Show 1
        Case MLAP
            Form001.Show 1
        Case VISSZAIR
            Form001.Show 1
    End Select
    
End Sub


