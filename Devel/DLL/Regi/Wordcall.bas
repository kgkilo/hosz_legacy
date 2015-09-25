Attribute VB_Name = "Word"
Public Function WordAppNewDoc(S_DOCPATH As String, Template As String, DocName As String, Tipus As String, sSavePath As String) As Object
' A Word alkalmaz�s �ltal�nos h�v�s�ra haszn�lhat� f�ggv�ny
' �j dokumentum l�trehoz�s�hoz. (Szojka Csaba 1998 �prilis)
' Param�terek: - Template - A word milyen sablont haszn�ljon az �j dokumentum l�trehoz�s�hoz
'              - DocName  - Milyen n�ven ments�k a dokumentumot
    On Error Resume Next

    Const DOC = 0   'Dokumentum t�pusa dokumentum
    Const TEMP = 1  'Dokumentum t�pusa sablon
    Dim i As Integer
    Dim WrdApp As Object        ' Word alkalmaz�s objektuma
    Dim WrdDoc As Object        ' Word alkalmaz�s dokumentumai
        
    ' Ellen�rizz�k, hogy l�tezik-e m�r a dokumentum
    'MsgBox sSavePath & DocName, , "Dokumentum neve"
    If Dir(sSavePath & DocName & Tipus, vbNormal) = Empty Then
        g_DocAct = True
        If Not IsNull(Template) And Template <> "Normal" Then
            If Not Dir(S_DOCPATH & Template & ".dot", vbNormal) = Empty Then
                'Word aktiviz�l�sa
                Set WrdApp = WordCall
                'Dokumentum l�trehoz�sa minta alapj�n
                Set WrdDoc = WrdApp.Documents.Add(S_DOCPATH & Template)
                WrdDoc.SaveAs FileName:=sSavePath & DocName & Tipus, FileFormat:=IIf(Tipus = ".doc", DOC, TEMP) ' Dokumentum ment�se
            Else
                MsgBox "A mintafile " & S_DOCPATH & Template & ".dot" & " nincs a hely�n!", vbCritical, "Mintafile"
            End If
        Else
            'Word aktiviz�l�sa
            Set WrdApp = WordCall
            'Dokumentum l�trehoz�sa minta alapj�n
            Set WrdDoc = WrdApp.Documents.Add("Normal")
            WrdDoc.SaveAs FileName:=sSavePath & DocName & Tipus, FileFormat:=IIf(Tipus = ".doc", DOC, TEMP) ' Dokumentum ment�se
        End If
    Else ' Ha igen r�k�rdez�nk a fel�l�r�sra
        If g_rParam.Fields("WATIR").Value = "y" Then
            If MsgBox("A " & sSavePath & DocName & Tipus & " file m�r l�tezik!" & vbCr _
                & "L�trehozzuk �jra a dokumentumot?", vbInformation + vbYesNo, "L�tez� dokumentum") = vbYes Then
            g_DocAct = True
            'If Not IsNull(Template) And Template <> "Normal" And Not Dir(S_DOCPATH & S_DOCTIPDOT & Tipus, vbNormal) = Empty Then
            'Word aktiviz�l�sa
            Set WrdApp = WordCall
            'Dokumentum l�trehoz�sa minta alapj�n
            Set WrdDoc = WrdApp.Documents.Add(IIf(IsNull(Template), "Normal", S_DOCPATH & Template))
            WrdDoc.SaveAs FileName:=sSavePath & DocName & Tipus, FileFormat:=IIf(Tipus = ".doc", DOC, TEMP) ' Dokumentum ment�se
            'Else
            '    MsgBox "A mintafile " & S_DOCPATH & Template & S_DOCTIPDOT & " nincs a hely�n!", vbCritical, "Mintafile"
            'End If
            Else
                g_DocAct = False
                'Word aktiviz�l�sa
                Set WrdApp = WordCall
                'Ha nem �rjuk fel�l, megnyitjuk
                Set WrdDoc = WrdApp.Documents.Open(sSavePath & DocName & Tipus)
            End If
        Else
            g_DocAct = False
            'Word aktiviz�l�sa
            Set WrdApp = WordCall
            'Ha nem �rjuk fel�l, megnyitjuk
            Set WrdDoc = WrdApp.Documents.Open(sSavePath & DocName & Tipus)
        End If
    End If

    'Word alkalmaz�s p�ld�ny �tad�sa a h�v�nak
    Set WordAppNewDoc = WrdDoc
End Function

Public Function WordCall() As Object
' Word alkalmaz�s aktiviz�l�sa (Szojka Csaba 1998 �prilis)
' -kg- 2000.05.10
    
    On Error Resume Next
    
    Const wdWindowStateMaximize = 1
    Dim WrdApp As Object

    ' Van e akt�v Word p�ld�n a Windows-ban?
    Set WrdApp = GetObject(, "Word.Application")
    
    If Err.Number <> 0 Then 'ha nincs
        Err.Clear
         
        'Word alkalmaz�s aktiviz�l�sa
        Set WrdApp = CreateObject("Word.Application")
        
        'Word alkalmaz�s megjelen�t�se
        WrdApp.Visible = True
    End If
    On Error GoTo 0
    
    'Word alkalmaz�s akt�vv� t�tele, megjelen�t�se
    WrdApp.WindowState = wdWindowStateMaximize
    WrdApp.Activate
 
    'Alkalmaz�s objektum visszaad�sa a h�v�nak
    Set WordCall = WrdApp
End Function    'WordCall

Public Function InsTextToWord(WrdDoc As Object, ByRef lstReplace As Collection) As Boolean
'Adatok �tvitele a Word-be k�nyvjelz�k seg�ts�g�vel (Szojka Csaba 1998 �prilis)
'param�terek: WrdDoc - dokumentum objektum a Word-t�l
' -kg- 2000.05.10
'   lstReplace - Collection, mit mire kell cser�lni

    Const wdAllowOnlyFormFields = 2
    InsTextToWord = True

    Dim WDocRange As Object   'Tartom�nyobjektum a dokumentumban

    Dim z As ADODB.Field
    For Each z In lstReplace
        'Tartom�ny az eg�sz dokumentumra pozicion�l�sa
        Set WDocRange = WrdDoc.Range(Start:=0, _
            End:=WrdDoc.Paragraphs(WrdDoc.Paragraphs.Count).Range.End)
        With WDocRange
            .Find.Text = "<" + CStr(z.Name) + ">"
            .Find.Forward = True
            .Find.Execute 'Keres�s ind�t�sa
            If .Find.Found Then
                .Words.Parent = CStr(z.Value) ' Sz�veg �tt�tele a Word dokumentumba
            Else
                'MsgBox "Nincs ilyen azonos�t� a WORD-ben l�trehozva!", _
                    vbCritical, "Sz�veg besz�r�s"
                InsTextToWord = False
            End If
        End With

    'Tartom�ny objektum t�rl�se a mem�ri�b�l
    Set WDocRange = Nothing
    Next
    
    WrdDoc.Protect Type:=wdAllowOnlyFormFields, NoReset:=False, Password:="informal"
    WrdDoc.Save
    
End Function    'InsTextToWord


