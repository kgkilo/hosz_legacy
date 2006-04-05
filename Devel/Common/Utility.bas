Attribute VB_Name = "utility"
' $Id$

Public Const P_READ = 1 'Adatbázisobjektum hozzáférési jogok
Public Const P_UPDATE = 2
Public Const P_INSERT = 4
Public Const P_DELETE = 8

Function AktivForm()
    Dim MyReport As Form
    Set MyReport = Screen.ActiveForm
    AktivForm = MyReport.Name
End Function

Sub Kilep(ByRef frm As Form)
    Exit Sub
    If MsgBox("???", vbQuestion + vbYesNo, "Tisztelt felhasználó!") = vbYes Then
        Unload frm
    End If
End Sub

Sub Back(ByRef frm As Form)
    frm.Hide
    Unload frm
End Sub

Sub Nyomtat(reportname As String, iDestination As Integer)
    With Form001.rep
        .Destination = iDestination ' 0 - privjú ablak, 1 - közvetlenül nyomtat
        .WindowBorderStyle = 3
        .WindowState = 2
        .Connect = sConnectString
        .ReportFileName = sReportDir & reportname
        .Action = 1
    End With
End Sub


'   ControlsSet
'
'   Kitölti az adott form kontrolljait az adott mezõk
'   értéke és a rájuk vonatkozó hozzáférési jogosultságok alapján.
'
'   Paraméterek:    lstFields As Collection -   a mezõket tartalmazó collection
'                   lstControls As Object   -   a form-on lévõ kontrollok
'
'   Visszatérés:    Boolean, True
'
Public Function ControlsSet(ByRef rs As ADODB.Recordset, ByRef frm As Object) As Boolean
    On Error GoTo errControlsSet
    ControlsSet = False
    On Error Resume Next
    
    Dim oControl As Control
    Dim sFieldName As String

    For Each oControl In frm.Controls   'Végigmegyünk az összes kontrollon, ami a form-on van
        sFieldName = Mid(oControl.Name, 4)  'A kontroll neve tartalmazza a hozzá kapcsolt mezõ nevét
        
        Select Case Left(oControl.Name, 3)  'A kontroll nevének prefixuma alapján máshogy kell kitölteni
            
            Case "dat" 'Ha dátum
                oControl = rs(sFieldName).Value
            
            Case "txt"  'Ha textbox
                Select Case rs(sFieldName).Type 'Megnézzük, hogy milyen típusú az adott mezõ
                    Case ADODB.adBSTR   'Ha string típusú a mezõ
                        If IsNull(rs(sFieldName).Value) Then    'Ha NULL a mezõ értéke,
                            oControl = "" 'akkor üres lesz a textbox.
                        Else    'Ha nem NULL a mezõ értéke,
                            oControl = rs(sFieldName).Value   'akkor a mezõ értéke lesz a textboxban.
                            'oControl.MaxLength = lstFields(sFieldName).Size 'beállítjuk a max hosszot is
                        End If
                
                    Case Else
                        If IsNull(rs(sFieldName).Value) Then    'Ha NULL a mezõ értéke,
                            oControl = ""   'akkor a textboxba egy - kerül.
                        Else    'Ha nem NULL a mezõ értéke,
                            oControl = CStr(rs(sFieldName).Value)   'akkor a mezõ értéke lesz a textboxban.
                        End If
                End Select
                
            Case "cmb"  'Comboboxot majd kitölti a ComboBoxSet függvény
                ComboBoxSet oControl, rs(sFieldName)
            
            Case "lst"
                ComboBoxSet oControl, Nothing
                
            Case "chk"
                If rs(sFieldName).Value = "y" Then
                    oControl = 1
                Else
                    oControl = 0
                End If
                
            Case "grp"  'Rádiógomb csoport kezelése
                oControl = rs(sFieldName).Value
        End Select
    Next oControl   'Következõ kontroll
    
    ControlsSet = True
    Exit Function

errControlsSet:
    'MsgBox Err.Description, , oControl.Name
End Function    'ControlsSet

'   ComboBoxSetBase
'
'   A comboboxhoz tartozó kódszótári szekcióból (amit a combobox Tag property értéke jelöl)
'   feltölti a comboboxot a szekció elemeivel. Ha a comboboxhoz csatolt mezõnek már volt
'   értéke, kiválasztja a megfelelõ elemet.
'
'   Paraméterek:    oCombo As Access.ComboBox   -   a combobox maga
'                   sKod As String  -   a comboboxban megjelenítendõ mezõ értéke
'
'   Visszatérés:    Boolean. Sikeres végrehajtás - True, egyébként False.
'
Public Function ComboBoxSetBase(ByRef oCombo As Object, ByRef sKod As String) As Boolean
    On Error GoTo errComboBoxSetBase
    ComboBoxSetBase = False
    
    If oCombo.Tag <> "" Then
        'A combobox Tag property-je tárolja, hogy melyik kódszótári szekcióból vegye az elemeket.
        
        Dim KodList As Collection   'lekérdezzük a szekció elemeit.
        Set KodList = g_oKodszotar.Section(oCombo.Tag).KodList
        If Not (KodList Is Nothing) Then    'Ha sikerült lekérdezni
            Dim oElem As CKod   'Egy kódszótári elem
            Dim i As Integer    'segéd, hányadik elemnél tart a combobox feltöltése
            i = 0
        
            oCombo.Clear        'Kitöröljük az összes benne lévõ elemet, mielõtt feltöltenénk
            Dim j, k As Integer
            Dim iCols As Integer
            Dim sNev As String
            iCols = 0
            
            Set oElem = KodList(1)
            sNev = oElem.Nev
            For j = 1 To Len(sNev)
                If Mid(sNev, j, 1) = ";" Then iCols = iCols + 1
            Next j
            If iCols <> 0 Then oCombo.ColumnCount = iCols + 2
            
            
            If sKod = "" Then   'Ha a mezõ még üres
                For Each oElem In KodList    'Az adott szekció összes elemének
                                            'nevét és értékét a comboboxba tesszük.
                    j = 1
                    k = 1
                    iCols = 0
                    oCombo.AddItem CStr(oElem.Nev), i
                    j = InStr(k, oElem.Nev, ";", vbTextCompare)
                    Do While j <= Len(oElem.Nev) And j <> 0
                        oCombo.List(i, iCols) = Mid(CStr(oElem.Nev), k, j - k)
                        k = j + 1
                        iCols = iCols + 1
                        j = InStr(k, oElem.Nev, ";", vbTextCompare)
                    Loop
                    i = i + 1
                Next    'Következõ szekcióelem.
            Else    'Ha a mezõ már nem volt üres
                Dim iIndex As Integer   'Ha már volt értéke a mezõnek, ezzel állítjuk rá a comboboxot
                iIndex = -1
                For Each oElem In KodList   'Az adott szekció összes elemének
                                            'nevét és értékét a comboboxba tesszük.
                    j = 1
                    k = 1
                    iCols = 0
                    oCombo.AddItem CStr(oElem.Nev), i
                    j = InStr(k, oElem.Nev, ";", vbTextCompare)
                    Do While j <= Len(oElem.Nev) And j <> 0
                        oCombo.List(i, iCols) = Mid(CStr(oElem.Nev), k, j - k)
                        k = j + 1
                        iCols = iCols + 1
                        j = InStr(k, oElem.Nev, ";", vbTextCompare)
                    Loop
                    If oElem.Ertek = sKod Then  'A mezõben szereplõ értékét pedig
                        iIndex = i  'kijelöljük majd
                    End If
                    i = i + 1
                Next    'Következõ szekcióelem.
                oCombo.ListIndex = iIndex   'Kijelöljük a megfelelõ elemet.
            End If  'sKod = ""
        End If  'Not (KodList Is Nothing)
    End If  'oCombo.Tag <> ""
    
    ComboBoxSetBase = True
    Exit Function
    
errComboBoxSetBase:
    'MsgBox Err.Description + ", No:" + CStr(Err.Number) + ", Ctrl:" + oCombo.Name, , "ComboBoxSetBase"
End Function 'ComboBoxSetBase

'   ComboBoxSet
'
'   A comboboxhoz tartozó kódszótári szekcióból (amit a combobox Tag property értéke jelöl)
'   feltölti a comboboxot a szekció elemeivel. Ha a comboboxhoz csatolt mezõnek már volt
'   értéke, kiválasztja a megfelelõ elemet.
'
'   Paraméterek:    oCombo As Access.ComboBox   -   a combobox maga
'                   oField As ADODB.Field   -   a comboboxban megjelenítendõ mezõ
'
'   Visszatérés:    Boolean. Sikeres végrehajtás - True, egyébként False.
'
Public Function ComboBoxSet(oCombo As Object, oField As ADODB.Field) As Boolean
    On Error GoTo errComboBoxSet
    ComboBoxSet = False
    
    Dim sKod As String  'A mezõ értéke
    
    If TypeName(oField) = "Nothing" Then
        sKod = ""
    Else
        If oField.Value = Null Or oField.ActualSize = 0 Then
            sKod = ""
        Else
            sKod = oField.Value 'Mi is a mezõ értéke?
        End If  'oField.Value
    End If  'TypeName
    
    ComboBoxSet = ComboBoxSetBase(oCombo, sKod)
    Exit Function
    
errComboBoxSet:
End Function 'ComboBoxSet

Public Function FieldCheck(oControl As Object, sField As Variant) As Boolean
    On Error Resume Next

    If Not IsNull(sField) Then
        Dim i As Integer
        For i = 0 To UBound(sField, 1) - 1 Step 2
            If oControl(sField(i)) = "" Then
                oControl(sField(i)).SetFocus
                MsgBox sField(i + 1), vbExclamation
                FieldCheck = False
                Exit Function
            End If
        Next i
    End If
    FieldCheck = True

End Function

'   ControlsGet
'
'   Kiolvassa a kontrollokból a mezõkbe a kontrollok értékét.
'
'   Paraméterek:    lstFields As Collection -   a mezõket tartalmazó collecion
'                   lstControls As Object   -   a form-on lévõ kontrollok
'
'   Visszatérés:    Boolean, végrehajtás sikeres / hibás
'
Public Function ControlsGet(ByRef lstFields As Collection, ByRef frm As Object) As Boolean
    On Error GoTo errControlsGet
    ControlsGet = False
    
    Dim oControl As Control  'segédváltozó ciklushoz
    Dim sFieldName As String    'Aktuális mezõ neve
    
    For Each oControl In frm.Controls    'Végigmegyünk a form kontrolljain.
        sFieldName = Mid(oControl.Name, 4)  'A kontroll neve tartalmazza a hozzá kapcsolt mezõ nevét.
        
        Select Case Left(oControl.Name, 3)  'A kontroll nevének prefixuma alapján máshogy kell kiolvasni.
            Case "dat"  'Dátum csoport kezelése
                lstFields.Add oControl.Value, sFieldName
            
            Case "txt"  'Ha textbox
                If oControl.Text = "" Then  'Ha üres a textbox,
                    lstFields.Add Null, sFieldName  '- kerül tárolásra.
                Else    'Ha nem üres,
                    lstFields.Add Trim(oControl.Text), sFieldName  'a beírt szöveg tárolandó.
                End If
                
            Case "cmb"  'A comboboxot majd leolvassa a ComboBoxGet függvény
                lstFields.Add ComboBoxGet(Nothing, oControl), sFieldName
            
            Case "chk"
                If oControl = 1 Then
                    lstFields.Add "y", sFieldName
                Else
                    lstFields.Add "n", sFieldName
                End If
                
            Case "grp"  'Rádiógomb csoport kezelése
                lstFields.Add oControl.Value, sFieldName
        End Select
    Next oControl   'Következõ kontroll
    
    ControlsGet = True
    Exit Function

errFieldsSet:   'Hiba esetén
    MsgBox "Hibás adatbevitel : '" & oControl.Tag & "' mezõnél!", vbExclamation, "Hibás adatbevitel!"
    oControl.SetFocus   'a fókuszt rátesszük a hibásan kitöltött kontrollra

errControlsGet:
    MsgBox Err.Description + ", No:" + CStr(Err.Number) + ", Ctrl:" + oControl.Name, , "ControlsGet"
End Function    'ControlsGet

'   ComboBoxGet
'
'   Visszaadja az adott combobox kiválasztott elemének megfelelõ adatot.
'   Ha nem választott ki semmit a combobox adatai közül, akkor üres stringet ad vissza.
'
'   Paraméterek:    rs As ADODB.Recordset   -   Ha nem nothing, akkor az így átadott rekord
'                                               megfelelõ mezõ értékét tölti fel
'                   oCombo As Access.ComboBox   -   a combobox maga
'
'   Visszatérés:    String, a megfelelõ adat. Hiba esetén üres string.
'
Public Function ComboBoxGet(rs As ADODB.Recordset, oCombo As Object) As String
    On Error GoTo errComboBoxGet
    ComboBoxGet = ""
    
    Dim sRet As String  'Ebbe tesszük átmenetileg a választott kódszótári elem értékét
    
    If oCombo.ListIndex <> -1 Then  'Ha már választott, tehát nem üres a combobox text része
        Dim i As Integer
        
        i = oCombo.ListIndex + 1    'Lekérdezzük a kiválasztott sor sorszámát
            
        'A megfelelõ kódszótári adatot adja vissza.
        sRet = g_oKodszotar.Section(oCombo.Tag).KodList.Item(i).Ertek
        
        If TypeName(rs) <> "Nothing" Then   'Ha egy rekord mezõi közé kell betenni az adatot
            Dim sFieldName As String            'A feltöltendõ mezõ neve
            sFieldName = Mid(oCombo.Name, 4)    'a combobox nevébõl következik.
            
            rs(sFieldName).Value = sRet 'A megadott mezõbe beírjuk a visszatérési értéket.
        End If  'TypeName(lstFields)
        
        ComboBoxGet = sRet  'Visszatérésként megadjuk a már lekérdezett értéket
    End If  'oCombo.Text <> ""
    Exit Function

errComboBoxGet:
    MsgBox Err.Description + ", No:" + CStr(Err.Number) + ", Ctrl:" + oCombo.Name, , "ComboBoxGet"
End Function    'ComboBoxGet

Public Function FillGrid(ByVal sQry As String, ByVal lstParams As Collection, _
    ByRef oGrid As Object, ByRef sFormatstring As String, ByVal iMerge As Integer) As Long
    On Error GoTo errFillGrid
    FillGrid = 0
    
    Dim ActRows As Long
    Dim iCols As Integer
    Dim iCurCol As Integer
    Dim lCurRow As Long
    Dim vCellValue As Variant
    
    Dim rstRecordset As New ADODB.Recordset
    oAdmin.ExecVal sQry, lstParams, rstRecordset
    
    With oGrid
        iCols = rstRecordset.Fields.Count
        .Cols = iCols + 1
        lCurRow = 0
        ActRows = 1
    
        Do While Not rstRecordset.EOF
            lCurRow = lCurRow + 1
            .Rows = lCurRow + 1
            For iCurCol = 0 To iCols - 1
                vCellValue = rstRecordset.Fields(iCurCol).Value
                If IsNull(vCellValue) Then
                    .TextMatrix(lCurRow, iCurCol + 1) = ""
                Else
                    .TextMatrix(lCurRow, iCurCol + 1) = vCellValue
                End If
            Next iCurCol
            rstRecordset.MoveNext
        Loop
    
        If lCurRow > 0 Then
            .Select ActRows, IIf(iCols < 3, iCols, 3), ActRows, IIf(iCols < 3, iCols, 3) 'iCols
            .TopRow = ActRows
            .LeftCol = 1 'ActRows
        Else
            .Rows = 1
        End If
        rstRecordset.Close
        
        .FormatString = sFormatstring
        .AllowUserResizing = 1  'flexResizeColumns
        .SelectionMode = 1  'flexSelectionByRow
        .BackColorAlternate = &H8000000F
        .AutoSize 2, .Cols - 2
        .ColWidth(1) = 0
        .WordWrap = 1
        .MergeCells = 3
        Dim i As Integer
        For i = 1 To iMerge
            .MergeCol(i) = True
        Next i
    End With
    
    FillGrid = lCurRow
    Exit Function

errFillGrid:
    rstRecordset.Close
    MsgBox Err.Description & ", " & Err.Number, , "FillGrid"
End Function


'   SetCombo
'
'   Feltölti a képernyõn található combobox-okat a kódszótár alapján.
'
'   Paraméterek:    lstControls As Access.Controls  -   a képernyõn található kontrollok
'
'   Visszatérés:    Boolean, True ha sikeres. Egyébként False.
'
Public Function SetCombo(ByRef frm As Object) As Boolean
    On Error GoTo errSetCombo
    SetCombo = False
    
    Dim oControl As Control
    For Each oControl In frm.Controls     'Végigmegyünk az összes kontrolon,
        If Left(oControl.Name, 3) = "cmb" Then  'és ha combobox, akkor
            SetCombo = ComboBoxSet(oControl, Nothing)   'feltöltjük.
        End If
    Next
    Exit Function
    
errSetCombo:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "SetCombo"
End Function    'SetCombo

Public Function SetComboVal(ByRef cmbCombo As Object, ByRef sID As String) As Boolean
    SetComboVal = ComboBoxSetBase(cmbCombo, sID)
End Function    'SetComboVal

'   GetComboNev
'
'   Visszaadja az átadott combobox kiválasztott sorának szövegét (ami látszik...)
'
'   Paraméterek:    cmbCombo as Object  -   a lekérdezendõ combobox
'
'   Visszatérés:    String, a szöveg. Hiba esetén üres string.
'
Public Function GetComboNev(ByRef cmbCombo As Object) As String
    On Error GoTo errGetComboNev
    GetComboNev = ""
    
    If cmbCombo.ListIndex <> -1 Then
        GetComboNev = g_oKodszotar.Section(cmbCombo.Tag).KodList.Item(cmbCombo.ListIndex + 1).Nev
    End If
    Exit Function
    
errGetComboNev:
    MsgBox Err.Description + ", No:" + CStr(Err.Number), , "GetComboNev"
End Function    'GetComboNev

'   GetComboErtek
'
'   Visszaadja az átadott combobox kiválasztott sorának értékét (ami nem látszik...)
'
'   Paraméterek:    cmbCombo as Object  -   a lekérdezendõ combobox
'
'   Visszatérés:    String, az érték. Hiba esetén üres string.
'
Public Function GetComboErtek(ByRef cmbCombo As Object) As String
    GetComboErtek = ComboBoxGet(Nothing, cmbCombo)
End Function    'GetComboErtek


