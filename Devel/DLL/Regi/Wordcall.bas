Attribute VB_Name = "Word"
Public Function WordAppNewDoc(S_DOCPATH As String, Template As String, DocName As String, Tipus As String, sSavePath As String) As Object
' A Word alkalmazás általános hívására használható függvény
' új dokumentum létrehozásához. (Szojka Csaba 1998 április)
' Paraméterek: - Template - A word milyen sablont használjon az új dokumentum létrehozásához
'              - DocName  - Milyen néven mentsük a dokumentumot
    On Error Resume Next

    Const DOC = 0   'Dokumentum típusa dokumentum
    Const TEMP = 1  'Dokumentum típusa sablon
    Dim i As Integer
    Dim WrdApp As Object        ' Word alkalmazás objektuma
    Dim WrdDoc As Object        ' Word alkalmazás dokumentumai
        
    ' Ellenõrizzük, hogy létezik-e már a dokumentum
    'MsgBox sSavePath & DocName, , "Dokumentum neve"
    If Dir(sSavePath & DocName & Tipus, vbNormal) = Empty Then
        g_DocAct = True
        If Not IsNull(Template) And Template <> "Normal" Then
            If Not Dir(S_DOCPATH & Template & ".dot", vbNormal) = Empty Then
                'Word aktivizálása
                Set WrdApp = WordCall
                'Dokumentum létrehozása minta alapján
                Set WrdDoc = WrdApp.Documents.Add(S_DOCPATH & Template)
                WrdDoc.SaveAs FileName:=sSavePath & DocName & Tipus, FileFormat:=IIf(Tipus = ".doc", DOC, TEMP) ' Dokumentum mentése
            Else
                MsgBox "A mintafile " & S_DOCPATH & Template & ".dot" & " nincs a helyén!", vbCritical, "Mintafile"
            End If
        Else
            'Word aktivizálása
            Set WrdApp = WordCall
            'Dokumentum létrehozása minta alapján
            Set WrdDoc = WrdApp.Documents.Add("Normal")
            WrdDoc.SaveAs FileName:=sSavePath & DocName & Tipus, FileFormat:=IIf(Tipus = ".doc", DOC, TEMP) ' Dokumentum mentése
        End If
    Else ' Ha igen rákérdezünk a felülírásra
        If g_rParam.Fields("WATIR").Value = "y" Then
            If MsgBox("A " & sSavePath & DocName & Tipus & " file már létezik!" & vbCr _
                & "Létrehozzuk újra a dokumentumot?", vbInformation + vbYesNo, "Létezõ dokumentum") = vbYes Then
            g_DocAct = True
            'If Not IsNull(Template) And Template <> "Normal" And Not Dir(S_DOCPATH & S_DOCTIPDOT & Tipus, vbNormal) = Empty Then
            'Word aktivizálása
            Set WrdApp = WordCall
            'Dokumentum létrehozása minta alapján
            Set WrdDoc = WrdApp.Documents.Add(IIf(IsNull(Template), "Normal", S_DOCPATH & Template))
            WrdDoc.SaveAs FileName:=sSavePath & DocName & Tipus, FileFormat:=IIf(Tipus = ".doc", DOC, TEMP) ' Dokumentum mentése
            'Else
            '    MsgBox "A mintafile " & S_DOCPATH & Template & S_DOCTIPDOT & " nincs a helyén!", vbCritical, "Mintafile"
            'End If
            Else
                g_DocAct = False
                'Word aktivizálása
                Set WrdApp = WordCall
                'Ha nem írjuk felül, megnyitjuk
                Set WrdDoc = WrdApp.Documents.Open(sSavePath & DocName & Tipus)
            End If
        Else
            g_DocAct = False
            'Word aktivizálása
            Set WrdApp = WordCall
            'Ha nem írjuk felül, megnyitjuk
            Set WrdDoc = WrdApp.Documents.Open(sSavePath & DocName & Tipus)
        End If
    End If

    'Word alkalmazás példány átadása a hívónak
    Set WordAppNewDoc = WrdDoc
End Function

Public Function WordCall() As Object
' Word alkalmazás aktivizálása (Szojka Csaba 1998 április)
' -kg- 2000.05.10
    
    On Error Resume Next
    
    Const wdWindowStateMaximize = 1
    Dim WrdApp As Object

    ' Van e aktív Word példán a Windows-ban?
    Set WrdApp = GetObject(, "Word.Application")
    
    If Err.Number <> 0 Then 'ha nincs
        Err.Clear
         
        'Word alkalmazás aktivizálása
        Set WrdApp = CreateObject("Word.Application")
        
        'Word alkalmazás megjelenítése
        WrdApp.Visible = True
    End If
    On Error GoTo 0
    
    'Word alkalmazás aktívvá tétele, megjelenítése
    WrdApp.WindowState = wdWindowStateMaximize
    WrdApp.Activate
 
    'Alkalmazás objektum visszaadása a hívónak
    Set WordCall = WrdApp
End Function    'WordCall

Public Function InsTextToWord(WrdDoc As Object, ByRef lstReplace As Collection) As Boolean
'Adatok átvitele a Word-be könyvjelzõk segítségével (Szojka Csaba 1998 április)
'paraméterek: WrdDoc - dokumentum objektum a Word-tõl
' -kg- 2000.05.10
'   lstReplace - Collection, mit mire kell cserélni

    Const wdAllowOnlyFormFields = 2
    InsTextToWord = True

    Dim WDocRange As Object   'Tartományobjektum a dokumentumban

    Dim z As ADODB.Field
    For Each z In lstReplace
        'Tartomány az egész dokumentumra pozicionálása
        Set WDocRange = WrdDoc.Range(Start:=0, _
            End:=WrdDoc.Paragraphs(WrdDoc.Paragraphs.Count).Range.End)
        With WDocRange
            .Find.Text = "<" + CStr(z.Name) + ">"
            .Find.Forward = True
            .Find.Execute 'Keresés indítása
            If .Find.Found Then
                .Words.Parent = CStr(z.Value) ' Szöveg áttétele a Word dokumentumba
            Else
                'MsgBox "Nincs ilyen azonosító a WORD-ben létrehozva!", _
                    vbCritical, "Szöveg beszúrás"
                InsTextToWord = False
            End If
        End With

    'Tartomány objektum törlése a memóriából
    Set WDocRange = Nothing
    Next
    
    WrdDoc.Protect Type:=wdAllowOnlyFormFields, NoReset:=False, Password:="informal"
    WrdDoc.Save
    
End Function    'InsTextToWord


