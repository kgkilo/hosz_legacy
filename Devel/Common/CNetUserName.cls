VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsNetUserName"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' clsNetUserName - Return the network user name
' 1999/11/28 Copyright 1999, Larry Rebich, BuyGold.Net

    Option Explicit
    DefLng A-Z
    
    Private msNetworkUserName   As String
    Private msComputerName      As String
    Private Declare Function GetUserName Lib "advapi32.dll" Alias "GetUserNameA" (ByVal lpBuffer As String, nSize As Long) As Long
    Private Declare Function GetComputerName Lib "kernel32" Alias "GetComputerNameA" (ByVal lpBuffer As String, nSize As Long) As Long
    '

Public Property Get ComputerName() As String
    ComputerName = msComputerName
End Property

Public Function NetworkUserName() As String
    NetworkUserName = msNetworkUserName
End Function

Private Sub Class_Initialize()
'This routine will obtain the network userID that the user used to sign in
'
'Below is sample calling code needed to obtain the userID.
'
'    Dim sUserName as string
'    Dim objNetUserName As New clsNetUserName        'define a reference to the class
'    sUserName = objNetUserName.NetworkUserName      'get user name
'
'If the user is not signed in or the userID cannot be obtained, then the a zero length string is returned.
'
    Dim sName   As String   'name into here
    Dim lCnt    As Long     'length of name
    Dim lNull   As Long     'null character
    lCnt = 255              'length of buffer
    
    sName = String$(lCnt - 1, " ")              'buffer
    If GetUserName(sName, lCnt) <> 0 Then       'get the result
        lNull = InStr(sName, vbNullChar)
        If lNull > 1 Then
            sName = Left$(sName, lNull - 1)     'return what we found based on Null
        Else
            sName = Left$(sName, lCnt)          'return what we found based on lCnt
        End If
    End If
    If sName <> "" Then
        msNetworkUserName = sName
    Else
        msNetworkUserName = "Unknown"           'not logged onto network
    End If
    DoGetComputerName                           '2000/04/20 Added
End Sub

Private Sub DoGetComputerName()
' 2000/04/20 Add get computer name
    Dim sTemp As String
    Dim iPos  As Integer
    sTemp = String$(256, vbNullChar)
    Dim lRtn As Long
    lRtn = GetComputerName(sTemp, Len(sTemp))
    If lRtn <> 0 Then
        iPos = InStr(sTemp, vbNullChar)
        msComputerName = Left$(sTemp, iPos - 1)
    Else
        msComputerName = "Unknown"
    End If
End Sub
