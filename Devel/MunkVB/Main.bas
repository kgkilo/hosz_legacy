Attribute VB_Name = "Start"
' $Id$

Option Explicit

Public util As Object
Public oAdmin As CadminADO
Public g_oKodszotar As CKodSzotar
Public g_sUserName As String

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
    Dim objNetUserName As New clsNetUserName        'define a reference to the class
    
    'Bejelentkezo kepernyo
    Dim bInitSuccess As Boolean
    frmLogin.Caption = App.ProductName & " bejelentkezés innen: " & objNetUserName.ComputerName
    frmLogin.txtUserName = objNetUserName.NetworkUserName   'get user name
    frmLogin.Show 1
    
    Do While frmLogin.LoginSucceeded = True 'Cancel gombbal kiszallhat
        'De ha az OK-t nyomta meg, megprobalunk bejelentkezni...
        bInitSuccess = util.Init(sReportDir, sANTSZDir, iWorkMode, frmLogin.txtUserName.Text, frmLogin.txtPassword.Text)
        If bInitSuccess = True Then 'Ha be tud login-elni
            g_sUserName = frmLogin.txtUserName
            Select Case iWorkMode
                Case NORMAL
                    FormStart.Caption = FormStart.Caption & " - " & g_sUserName
                    FormStart.Show 0
                Case DISZPECSER
                    Form001.Show 1
                Case LABOR
                    Form003.Show 1
                Case MLAP
                    Form001.Show 1
                Case VISSZAIR
                    Form001.Show 1
            End Select
            Exit Do
        Else    'Sikertelen SQL login
            frmLogin.txtPassword = ""
            frmLogin.Show 1
        End If
    Loop
    Unload frmLogin
    
End Sub

