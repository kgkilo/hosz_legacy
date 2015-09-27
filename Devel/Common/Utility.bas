Attribute VB_Name = "utility"
' $Id$

Public Const P_READ = 1 'Adatb�zisobjektum hozz�f�r�si jogok
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
    If MsgBox("???", vbQuestion + vbYesNo, "Tisztelt felhaszn�l�!") = vbYes Then
        Unload frm
    End If
End Sub

Sub Back(ByRef frm As Form)
    frm.Hide
    Unload frm
End Sub

Sub Nyomtat(reportname As String, iDestination As Integer)
    With Form001.rep
        .Destination = iDestination ' 0 - privj� ablak, 1 - k�zvetlen�l nyomtat
        .WindowBorderStyle = 3
        .WindowState = 2
        .Connect = sConnectString
        .ReportFileName = sReportDir & reportname
        .Action = 1
    End With
End Sub


'   ControlsSet
'
'   Kit�lti az adott form kontrolljait az adott mez�k
'   �rt�ke �s a r�juk vonatkoz� hozz�f�r�si jogosults�gok alapj�n.
'
'   Param�terek:    lstFields As Collection -   a mez�ket tartalmaz� collection
'                   lstControls As Object   -   a form-on l�v� kontrollok
'
'   Visszat�r�s:    Boolean, True
'
Public Function ControlsSet(ByRef rs As ADODB.Recordset, ByRef frm As Object) As Boolean
    On Error GoTo errControlsSet
    ControlsSet = False
    On Error Resume Next
    
    Dim oControl As Control
    Dim sFieldName As String

    For Each oControl In frm.Controls   'V�gigmegy�nk az �sszes kontrollon, ami a form-on van
        sFieldName = Mid(oControl.Name, 4)  'A kontroll neve tartalmazza a hozz� kapcsolt mez� nev�t
        
        Select Case Left(oControl.Name, 3)  'A kontroll nev�nek prefixuma alapj�n m�shogy kell kit�lteni
            
            Case "dat" 'Ha d�tum
                oControl = rs(sFieldName).Value
            
            Case "txt"  'Ha textbox
                Select Case rs(sFieldName).Type 'Megn�zz�k, hogy milyen t�pus� az adott mez�
                    Case ADODB.adBSTR   'Ha string t�pus� a mez�
                        If IsNull(rs(sFieldName).Value) Then    'Ha NULL a mez� �rt�ke,
                            oControl = "" 'akkor �res lesz a textbox.
                        Else    'Ha nem NULL a mez� �rt�ke,
                            oControl = rs(sFieldName).Value   'akkor a mez� �rt�ke lesz a textboxban.
                            'oControl.MaxLength = lstFields(sFieldName).Size 'be�ll�tjuk a max hosszot is
                        End If
                
                    Case Else
                        If IsNull(rs(sFieldName).Value) Then    'Ha NULL a mez� �rt�ke,
                            oControl = ""   'akkor a textboxba egy - ker�l.
                        Else    'Ha nem NULL a mez� �rt�ke,
                            oControl = CStr(rs(sFieldName).Value)   'akkor a mez� �rt�ke lesz a textboxban.
                        End If
                End Select
                
            Case "cmb"  'Comboboxot majd kit�lti a ComboBoxSet f�ggv�ny
                ComboBoxSet oControl, rs(sFieldName)
            
            Case "lst"
                ComboBoxSet oControl, Nothing
                
            Case "chk"
                If rs(sFieldName).Value = "y" Then
                    oControl = 1
                Else
                    oControl = 0
                End If
                
            Case "grp"  'R�di�gomb csoport kezel�se
                oControl = rs(sFieldName).Value
        End Select
    Next oControl   'K�vetkez� kontroll
    
    ControlsSet = True
    Exit Function

errControlsSet:
    'MsgBox Err.Description, , oControl.Name
End Function    'ControlsSet

'   ComboBoxSetBase
'
'   A comboboxhoz tartoz� k�dsz�t�ri szekci�b�l (amit a combobox Tag property �rt�ke jel�l)
'   felt�lti a comboboxot a szekci� elemeivel. Ha a comboboxhoz csatolt mez�nek m�r volt
'   �rt�ke, kiv�lasztja a megfelel� elemet.
'
'   Param�terek:    oCombo As Access.ComboBox   -   a combobox maga
'                   sKod As String  -   a comboboxban megjelen�tend� mez� �rt�ke
'
'   Visszat�r�s:    Boolean. Sikeres v�grehajt�s - True, egy�bk�nt False.
'
Public Function ComboBoxSetBase(ByRef oCombo As Object, ByRef sKod As String) As Boolean
    On Error GoTo errComboBoxSetBase
    ComboBoxSetBase = False
    
    If oCombo.Tag <> "" Then
        'A combobox Tag property-je t�rolja, hogy melyik k�dsz�t�ri szekci�b�l vegye az elemeket.
        
        Dim KodList As Collection   'lek�rdezz�k a szekci� elemeit.
        Set KodList = g_oKodszotar.Section(oCombo.Tag).KodList
        If Not (KodList Is Nothing) Then    'Ha siker�lt lek�rdezni
            Dim oElem As CKod   'Egy k�dsz�t�ri elem
            Dim i As Integer    'seg�d, h�nyadik elemn�l tart a combobox felt�lt�se
            i = 0
        
            oCombo.Clear        'Kit�r�lj�k az �sszes benne l�v� elemet, miel�tt felt�lten�nk
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
            
            
            If sKod = "" Then   'Ha a mez� m�g �res
                For Each oElem In KodList    'Az adott szekci� �sszes elem�nek
                                            'nev�t �s �rt�k�t a comboboxba tessz�k.
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
                Next    'K�vetkez� szekci�elem.
            Else    'Ha a mez� m�r nem volt �res
                Dim iIndex As Integer   'Ha m�r volt �rt�ke a mez�nek, ezzel �ll�tjuk r� a comboboxot
                iIndex = -1
                For Each oElem In KodList   'Az adott szekci� �sszes elem�nek
                                            'nev�t �s �rt�k�t a comboboxba tessz�k.
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
                    If oElem.Ertek = sKod Then  'A mez�ben szerepl� �rt�k�t pedig
                        iIndex = i  'kijel�lj�k majd
                    End If
                    i = i + 1
                Next    'K�vetkez� szekci�elem.
                oCombo.ListIndex = iIndex   'Kijel�lj�k a megfelel� elemet.
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
'   A comboboxhoz tartoz� k�dsz�t�ri szekci�b�l (amit a combobox Tag property �rt�ke jel�l)
'   felt�lti a comboboxot a szekci� elemeivel. Ha a comboboxhoz csatolt mez�nek m�r volt
'   �rt�ke, kiv�lasztja a megfelel� elemet.
'
'   Param�terek:    oCombo As Access.ComboBox   -   a combobox maga
'                   oField As ADODB.Field   -   a comboboxban megjelen�tend� mez�
'
'   Visszat�r�s:    Boolean. Sikeres v�grehajt�s - True, egy�bk�nt False.
'
Public Function ComboBoxSet(oCombo As Object, oField As ADODB.Field) As Boolean
    On Error GoTo errComboBoxSet
    ComboBoxSet = False
    
    Dim sKod As String  'A mez� �rt�ke
    
    If TypeName(oField) = "Nothing" Then
        sKod = ""
    Else
        If oField.Value = Null Or oField.ActualSize = 0 Then
            sKod = ""
        Else
            sKod = oField.Value 'Mi is a mez� �rt�ke?
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
'   Kiolvassa a kontrollokb�l a mez�kbe a kontrollok �rt�k�t.
'
'   Param�terek:    lstFields As Collection -   a mez�ket tartalmaz� collecion
'                   lstControls As Object   -   a form-on l�v� kontrollok
'
'   Visszat�r�s:    Boolean, v�grehajt�s sikeres / hib�s
'
Public Function ControlsGet(ByRef lstFields As Collection, ByRef frm As Object) As Boolean
    On Error GoTo errControlsGet
    ControlsGet = False
    
    Dim oControl As Control  'seg�dv�ltoz� ciklushoz
    Dim sFieldName As String    'Aktu�lis mez� neve
    
    For Each oControl In frm.Controls    'V�gigmegy�nk a form kontrolljain.
        sFieldName = Mid(oControl.Name, 4)  'A kontroll neve tartalmazza a hozz� kapcsolt mez� nev�t.
        
        Select Case Left(oControl.Name, 3)  'A kontroll nev�nek prefixuma alapj�n m�shogy kell kiolvasni.
            Case "dat"  'D�tum csoport kezel�se
                lstFields.Add oControl.Value, sFieldName
            
            Case "txt"  'Ha textbox
                If oControl.Text = "" Then  'Ha �res a textbox,
                    lstFields.Add Null, sFieldName  '- ker�l t�rol�sra.
                Else    'Ha nem �res,
                    lstFields.Add Trim(oControl.Text), sFieldName  'a be�rt sz�veg t�roland�.
                End If
                
            Case "cmb"  'A comboboxot majd leolvassa a ComboBoxGet f�ggv�ny
                lstFields.Add ComboBoxGet(Nothing, oControl), sFieldName
            
            Case "chk"
                If oControl = 1 Then
                    lstFields.Add "y", sFieldName
                Else
                    lstFields.Add "n", sFieldName
                End If
                
            Case "grp"  'R�di�gomb csoport kezel�se
                lstFields.Add oControl.Value, sFieldName
        End Select
    Next oControl   'K�vetkez� kontroll
    
    ControlsGet = True
    Exit Function

errFieldsSet:   'Hiba eset�n
    MsgBox "Hib�s adatbevitel : '" & oControl.Tag & "' mez�n�l!", vbExclamation, "Hib�s adatbevitel!"
    oControl.SetFocus   'a f�kuszt r�tessz�k a hib�san kit�lt�tt kontrollra

errControlsGet:
    MsgBox Err.Description + ", No:" + CStr(Err.Number) + ", Ctrl:" + oControl.Name, , "ControlsGet"
End Function    'ControlsGet

'   ComboBoxGet
'
'   Visszaadja az adott combobox kiv�lasztott elem�nek megfelel� adatot.
'   Ha nem v�lasztott ki semmit a combobox adatai k�z�l, akkor �res stringet ad vissza.
'
'   Param�terek:    rs As ADODB.Recordset   -   Ha nem nothing, akkor az �gy �tadott rekord
'                                               megfelel� mez� �rt�k�t t�lti fel
'                   oCombo As Access.ComboBox   -   a combobox maga
'
'   Visszat�r�s:    String, a megfelel� adat. Hiba eset�n �res string.
'
Public Function ComboBoxGet(rs As ADODB.Recordset, oCombo As Object) As String
    On Error GoTo errComboBoxGet
    ComboBoxGet = ""
    
    Dim sRet As String  'Ebbe tessz�k �tmenetileg a v�lasztott k�dsz�t�ri elem �rt�k�t
    
    If oCombo.ListIndex <> -1 Then  'Ha m�r v�lasztott, teh�t nem �res a combobox text r�sze
        Dim i As Integer
        
        i = oCombo.ListIndex + 1    'Lek�rdezz�k a kiv�lasztott sor sorsz�m�t
            
        'A megfelel� k�dsz�t�ri adatot adja vissza.
        sRet = g_oKodszotar.Section(oCombo.Tag).KodList.Item(i).Ertek
        
        If TypeName(rs) <> "Nothing" Then   'Ha egy rekord mez�i k�z� kell betenni az adatot
            Dim sFieldName As String            'A felt�ltend� mez� neve
            sFieldName = Mid(oCombo.Name, 4)    'a combobox nev�b�l k�vetkezik.
            
            rs(sFieldName).Value = sRet 'A megadott mez�be be�rjuk a visszat�r�si �rt�ket.
        End If  'TypeName(lstFields)
        
        ComboBoxGet = sRet  'Visszat�r�sk�nt megadjuk a m�r lek�rdezett �rt�ket
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
'   Felt�lti a k�perny�n tal�lhat� combobox-okat a k�dsz�t�r alapj�n.
'
'   Param�terek:    lstControls As Access.Controls  -   a k�perny�n tal�lhat� kontrollok
'
'   Visszat�r�s:    Boolean, True ha sikeres. Egy�bk�nt False.
'
Public Function SetCombo(ByRef frm As Object) As Boolean
    On Error GoTo errSetCombo
    SetCombo = False
    
    Dim oControl As Control
    For Each oControl In frm.Controls     'V�gigmegy�nk az �sszes kontrolon,
        If Left(oControl.Name, 3) = "cmb" Then  '�s ha combobox, akkor
            SetCombo = ComboBoxSet(oControl, Nothing)   'felt�ltj�k.
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
'   Visszaadja az �tadott combobox kiv�lasztott sor�nak sz�veg�t (ami l�tszik...)
'
'   Param�terek:    cmbCombo as Object  -   a lek�rdezend� combobox
'
'   Visszat�r�s:    String, a sz�veg. Hiba eset�n �res string.
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
'   Visszaadja az �tadott combobox kiv�lasztott sor�nak �rt�k�t (ami nem l�tszik...)
'
'   Param�terek:    cmbCombo as Object  -   a lek�rdezend� combobox
'
'   Visszat�r�s:    String, az �rt�k. Hiba eset�n �res string.
'
Public Function GetComboErtek(ByRef cmbCombo As Object) As String
    GetComboErtek = ComboBoxGet(Nothing, cmbCombo)
End Function    'GetComboErtek


