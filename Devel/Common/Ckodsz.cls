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
Option Explicit

Private m_collSections As Collection    'Ebben tároljuk a kód szekciókat

'   Section property
'
'   Visszaadja a kért kódszekciót.
'
'   Paraméterek:    sTipus As String    -   a kért kódszekció neve.
'
'   Visszatérés:    CKodSection -   a kért szekció
'
Public Property Get Section(sTipus As String) As CKodSection
    Set Section = m_collSections(sTipus)
End Property    'Section

'   Konstruktor
'
'   Inicializálja a szekciókat tartalmazó collection-t.
'
'   Paraméterek:    -
'
'   Visszatérés:    -
'
Private Sub Class_Initialize()
    Set m_collSections = New Collection
End Sub 'Class_Initialize

'   Destruktor
'
'   Megsemmisíti a szekciókat tartalmazó collection-t.
'
'   Paraméterek:    -
'
'   Visszatérés:    -
'
Private Sub Class_Terminate()
    Set m_collSections = Nothing
End Sub 'Class_Terminate

'   Load
'
'   Eltárolja az adott szekciót a szekciók között. Ha a tárolási mód szerint memóriában kell tárolni,
'   betölti az értékeket a memóriába.
'
'   Paraméterek:    sSql As String  -   a query, ami a szekció elemeit adja
'                   sSectionName As String  -   szekció rövid neve
'                   sLongName As String -   szekció hosszú neve
'                   cSize As Byte   -   szekcióban szereplõ kódértékek szélessége
'
'   Visszatérés:    -
'
Public Sub Load(sSql As String, sParams As Variant, sSectionName As String, sLongName As String, CSize As Byte)
    Dim oKodSection As New CKodSection  'Ebbe töltjük be az új szekciót
    oKodSection.Name = sSectionName 'Kitöltjük a kódszekció tulajdonságait
    oKodSection.SQL = sSql
    oKodSection.Size = CSize
    oKodSection.LongName = sLongName
    Dim i As Integer    'segéd
    
    If TypeName(sParams) = "Nothing" Then
        Set oKodSection.Params = Nothing
    Else    'A paraméter collectionbe kerül a paraméter értéke, az index a paraméter neve
        Dim lstParams As New Collection
        For i = 0 To UBound(sParams, 1) - 1 Step 2
            lstParams.Add sParams(i + 1), sParams(i)
        Next i
        Set oKodSection.Params = lstParams
    End If
    
    Dim oSection As New Collection  'Segéd
    
    oAdmin.FillSection sSql, oKodSection.Params, oSection
    Set oKodSection.KodList = oSection  'A szekció kódlistájába betesszük a segédben lévõ értékeket
    
    Set oSection = Nothing  'A segéd collection tovább nem kell

    m_collSections.Add oKodSection, sSectionName    'Betesszük a (feltöltött) szekciót a többi szekció közé
End Sub 'Load

Public Function Remove(sSectionName As String) As Boolean
    On Error GoTo errRemove
    Remove = False
    
    Set m_collSections(sSectionName).KodList = Nothing  'Memóriában lévõ kódértékeket töröljük
    Set m_collSections(sSectionName).Params = Nothing   'paramétereket töröljük
    m_collSections.Remove sSectionName
    Remove = True
    Exit Function
    
errRemove:
End Function

