VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CKod"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' $Id$

Option Explicit

Private m_sErtek
Private m_sNev
Public Property Get Ertek() As String
    Ertek = m_sErtek
End Property
Public Property Let Ertek(E As String)
    m_sErtek = E
End Property
Public Property Get Nev() As String
    Nev = m_sNev
End Property
Public Property Let Nev(N As String)
    m_sNev = N
End Property
