VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CKodSection"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' $Id$

Option Explicit

Public Name As String   'Szekci� neve
Public LongName As String   'Szekci� hossz� neve
Public Size As Byte 'K�d sz�less�ge
Public SQL As String    'Szekci� felt�lt�s�hez haszn�lt SQL parancs
Public Params As Collection     'SQL param�ter collekci�
Public KodList As Collection    'K�dok �s �rt�keik
