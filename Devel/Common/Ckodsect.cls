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
Option Explicit

Public Name As String   'Szekció neve
Public LongName As String   'Szekció hosszú neve
Public Size As Byte 'Kód szélessége
Public SQL As String    'Szekció feltöltéséhez használt SQL parancs
Public Params As Collection     'SQL paraméter collekció
Public KodList As Collection    'Kódok és értékeik
