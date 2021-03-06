VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CKodSzotar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
' $Id$

Option Explicit

Private m_collSections As Collection    'Ebben t�roljuk a k�d szekci�kat

'   Section property
'
'   Visszaadja a k�rt k�dszekci�t.
'
'   Param�terek:    sTipus As String    -   a k�rt k�dszekci� neve.
'
'   Visszat�r�s:    CKodSection -   a k�rt szekci�
'
Public Property Get Section(sTipus As String) As CKodSection
    Set Section = m_collSections(sTipus)
End Property    'Section

'   Konstruktor
'
'   Inicializ�lja a szekci�kat tartalmaz� collection-t.
'
'   Param�terek:    -
'
'   Visszat�r�s:    -
'
Private Sub Class_Initialize()
    Set m_collSections = New Collection
End Sub 'Class_Initialize

'   Destruktor
'
'   Megsemmis�ti a szekci�kat tartalmaz� collection-t.
'
'   Param�terek:    -
'
'   Visszat�r�s:    -
'
Private Sub Class_Terminate()
    Set m_collSections = Nothing
End Sub 'Class_Terminate

'   Load
'
'   Elt�rolja az adott szekci�t a szekci�k k�z�tt. Ha a t�rol�si m�d szerint mem�ri�ban kell t�rolni,
'   bet�lti az �rt�keket a mem�ri�ba.
'
'   Param�terek:    sSql As String  -   a query, ami a szekci� elemeit adja
'                   sSectionName As String  -   szekci� r�vid neve
'                   sLongName As String -   szekci� hossz� neve
'                   cSize As Byte   -   szekci�ban szerepl� k�d�rt�kek sz�less�ge
'
'   Visszat�r�s:    -
'
Public Sub Load(sSql As String, sParams As Variant, sSectionName As String, sLongName As String, CSize As Byte)
    Dim oKodSection As New CKodSection  'Ebbe t�ltj�k be az �j szekci�t
    With oKodSection
        .Name = sSectionName 'Kit�ltj�k a k�dszekci� tulajdons�gait
        .SQL = sSql
        .Size = CSize
        .LongName = sLongName
    
        Dim i As Integer    'seg�d
        If TypeName(sParams) = "Nothing" Then
            Set .Params = Nothing
        Else    'A param�ter collectionbe ker�l a param�ter �rt�ke, az index a param�ter neve
            Dim lstParams As New Collection
            For i = 0 To UBound(sParams, 1) - 1 Step 2
                lstParams.Add sParams(i + 1), sParams(i)
            Next i
            Set .Params = lstParams
        End If
    
        Dim oSection As New Collection  'Seg�d
    
        oAdmin.FillSection sSql, .Params, oSection
        Set .KodList = oSection  'A szekci� k�dlist�j�ba betessz�k a seg�dben l�v� �rt�keket
        Set oSection = Nothing  'A seg�d collection tov�bb nem kell
    End With
    
    m_collSections.Add oKodSection, sSectionName    'Betessz�k a (felt�lt�tt) szekci�t a t�bbi szekci� k�z�
End Sub 'Load

Public Function Remove(sSectionName As String) As Boolean
    On Error GoTo errRemove
    Remove = False
    
    Set m_collSections(sSectionName).KodList = Nothing  'Mem�ri�ban l�v� k�d�rt�keket t�r�lj�k
    Set m_collSections(sSectionName).Params = Nothing   'param�tereket t�r�lj�k
    m_collSections.Remove sSectionName
    Remove = True
    Exit Function
    
errRemove:
End Function

