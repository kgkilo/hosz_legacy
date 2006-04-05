VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{00025600-0000-0000-C000-000000000046}#5.1#0"; "crystl32.ocx"
Object = "{8AE029D0-08E3-11D1-BAA2-444553540000}#3.0#0"; "VSFLEX3.OCX"
Begin VB.Form Form003 
   ClientHeight    =   8595
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   238
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   8595
   ScaleMode       =   0  'User
   ScaleWidth      =   12718.25
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdOSSZESITO 
      Caption         =   "Összesítõ"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   105
      TabIndex        =   4
      ToolTipText     =   "F 2"
      Top             =   4176
      Width           =   1275
   End
   Begin VB.CommandButton cmdUJ 
      Caption         =   "Új"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   2
      ToolTipText     =   "I n s e r t"
      Top             =   2962
      Width           =   1275
   End
   Begin VB.CommandButton cmdMODOSIT 
      Caption         =   "Megtekintés"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   3
      ToolTipText     =   "F 2"
      Top             =   3569
      Width           =   1275
   End
   Begin VB.CommandButton cmdLIST 
      Caption         =   "Nyomtatás"
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   5
      ToolTipText     =   "Egyedi munkalap nyomtatása"
      Top             =   4785
      Width           =   1275
   End
   Begin VB.CommandButton cmdFRISSIT 
      Caption         =   "Frissítés"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   1
      ToolTipText     =   "F 5"
      Top             =   2355
      Width           =   1275
   End
   Begin VB.CommandButton cmdEXIT 
      Caption         =   "Kilépés"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   120
      TabIndex        =   13
      ToolTipText     =   "E s c "
      Top             =   8040
      Width           =   1275
   End
   Begin VB.TextBox txtTALALAT 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   360
      Locked          =   -1  'True
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   900
      Width           =   960
   End
   Begin VB.Timer tmrVILLOG 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   2382
      Top             =   90
   End
   Begin VB.CheckBox chkFrissit 
      Height          =   285
      Left            =   720
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   1620
      Width           =   285
   End
   Begin vsFlexLib.vsFlexArray grdJEGYZ 
      Height          =   6030
      Left            =   1530
      TabIndex        =   0
      Top             =   2355
      Width           =   10095
      _Version        =   196608
      _ExtentX        =   17806
      _ExtentY        =   10636
      _StockProps     =   228
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Appearance      =   1
      ConvInfo        =   1418783674
   End
   Begin Crystal.CrystalReport rep 
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   348160
      WindowControlBox=   -1  'True
      WindowMaxButton =   -1  'True
      WindowMinButton =   -1  'True
      PrintFileLinesPerPage=   60
   End
   Begin MSComCtl2.DTPicker datDATUMTOL 
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "yyyy/MM/dd"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1038
         SubFormatType   =   0
      EndProperty
      Height          =   330
      Left            =   3285
      TabIndex        =   8
      Top             =   1680
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   582
      _Version        =   393216
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      CheckBox        =   -1  'True
      DateIsNull      =   -1  'True
      Format          =   23134209
      CurrentDate     =   37013
   End
   Begin MSComCtl2.DTPicker datDATUMIG 
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "yyyy/MM/dd"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1038
         SubFormatType   =   0
      EndProperty
      Height          =   330
      Left            =   5085
      TabIndex        =   9
      Top             =   1680
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   582
      _Version        =   393216
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      CheckBox        =   -1  'True
      DateIsNull      =   -1  'True
      Format          =   23134209
      CurrentDate     =   37013
   End
   Begin VB.Label lblTITLE 
      Alignment       =   2  'Center
      Caption         =   "Jegyzõkönyvek"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   238
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000001&
      Height          =   435
      Left            =   4778
      TabIndex        =   22
      Top             =   105
      Width           =   2325
   End
   Begin VB.Label lblOBJID 
      Alignment       =   1  'Right Justify
      Caption         =   "Berendezés megn.:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   6555
      TabIndex        =   21
      Top             =   1275
      Width           =   1515
   End
   Begin VB.Label lblOBJTIP 
      Alignment       =   1  'Right Justify
      Caption         =   "Berendezés típusa:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   6555
      TabIndex        =   20
      Top             =   840
      Width           =   1515
   End
   Begin VB.Label lblDATUMTOL 
      Alignment       =   1  'Right Justify
      Caption         =   "Jegyzõkönyv dátuma:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   1620
      TabIndex        =   19
      Top             =   1710
      Width           =   1620
   End
   Begin VB.Label lblJTIP 
      Alignment       =   1  'Right Justify
      Caption         =   "Jegyzõkönyv típusa:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   1725
      TabIndex        =   18
      Top             =   840
      Width           =   1515
   End
   Begin VB.Label lblMUVEL 
      Alignment       =   1  'Right Justify
      Caption         =   "Mûvelet:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   1725
      TabIndex        =   17
      Top             =   1275
      Width           =   1515
   End
   Begin VB.Line lblDATUMIG 
      X1              =   5170.804
      X2              =   5315.329
      Y1              =   1845
      Y2              =   1845
   End
   Begin MSForms.ComboBox cmbMUVEL 
      Height          =   315
      Left            =   3285
      TabIndex        =   7
      Tag             =   "298"
      Top             =   1260
      Width           =   3255
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "5741;556"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin MSForms.ComboBox cmbOBJTIP 
      Height          =   315
      Left            =   8145
      TabIndex        =   10
      Tag             =   "296"
      Top             =   855
      Width           =   3255
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "5741;556"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin MSForms.ComboBox cmbOBJID 
      Height          =   315
      Left            =   8145
      TabIndex        =   11
      Tag             =   "MEGNEV"
      Top             =   1260
      Width           =   3255
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "5741;556"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin MSForms.Label lblFRISSIT 
      Height          =   240
      Left            =   135
      TabIndex        =   16
      Top             =   1350
      Width           =   1500
      Caption         =   "Azonnali frissítés"
      Size            =   "2646;423"
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
   End
   Begin MSForms.Label lblTALALAT 
      Height          =   240
      Left            =   450
      TabIndex        =   15
      Top             =   630
      Width           =   825
      Caption         =   "Találatok"
      Size            =   "1455;423"
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
   End
   Begin MSForms.ComboBox cmbJTIP 
      Height          =   315
      Left            =   3285
      TabIndex        =   6
      Tag             =   "302"
      Top             =   855
      Width           =   3255
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "5741;556"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H8000000A&
      DrawMode        =   1  'Blackness
      Height          =   1590
      Left            =   105
      Shape           =   4  'Rounded Rectangle
      Top             =   540
      Width           =   11535
   End
End
Attribute VB_Name = "Form003"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' $Id$

Public iRefresh As Integer

Private Sub frissit()
    If iRefresh = 1 Then
        If chkFrissit = 1 Then
            grdJEGYZ.Redraw = False
            util.GridderX grdJEGYZ, "JEGYZ", Me
            grdJEGYZ.Redraw = True
        Else
            tmrVILLOG.Enabled = True
        End If
    End If
    iRefresh = 0
End Sub

Private Sub cmbJTIP_Change()
    If cmbJTIP.ListIndex <> -1 Then
        If GetComboErtek(cmbJTIP) = 8 Then 'Vizvizsgalati jegyzokonyv
            cmbMUVEL.Enabled = False
            lblMUVEL.Enabled = False
            cmbOBJTIP.Enabled = False
            lblOBJTIP.Enabled = False
            cmbOBJID.Enabled = False
            lblOBJID.Enabled = False
        Else
            cmbMUVEL.Enabled = True
            lblMUVEL.Enabled = True
            cmbOBJTIP.Enabled = True
            lblOBJTIP.Enabled = True
            cmbOBJID.Enabled = True
            lblOBJID.Enabled = True
        End If
    End If
End Sub

Private Sub cmbOBJTIP_Change()
    If cmbOBJTIP.ListIndex <> -1 Then
        Screen.MousePointer = vbHourglass
        util.MegnevFeltolt cmbOBJID, cmbOBJTIP, "MEGNEV"
        Screen.MousePointer = vbDefault
    End If
End Sub

Private Sub cmbOBJTIP_GotFocus()
    cmbOBJTIP = Null
    cmbOBJID = Null
End Sub

Private Sub cmdEXIT_Click()
    Unload Form003
    Unload FormStart
End Sub

Private Sub cmdLIST_Click()
'    If MsgBox("Biztosan nyomtatni szeretné a választott munkalapot?", vbYesNo + vbExclamation, "Tisztelt felhasználó!") = vbYes Then
'        util.munkalapallapot grdJEGYZ.TextMatrix(grdJEGYZ.Row, 1), 2
'        util.printmunkalap "1", grdJEGYZ.TextMatrix(grdJEGYZ.Row, 1)
'        Nyomtat "munuf.rpt", 1
'    End If
    util.Jegyzokonyv "8", 7, sReportDir
End Sub

Private Sub cmdOSSZESITO_Click()
    Form003b.Show 1
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyCommand KeyCode
End Sub

Private Sub grdJEGYZ_GotFocus()
    KeyPreview = False
End Sub

Private Sub grdJEGYZ_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyCommand KeyCode
End Sub

Private Sub grdJEGYZ_LostFocus()
    KeyPreview = True
End Sub

Private Sub tmrVILLOG_Timer()
    If cmdFRISSIT.Caption = "F5" Then
        cmdFRISSIT.Caption = "Frissítés"
    Else
        cmdFRISSIT.Caption = "F5"
    End If
End Sub

Private Sub cmdFRISSIT_Click()
    Screen.MousePointer = vbHourglass
    
    util.GridderX grdJEGYZ, "JEGYZ", Me
    
    tmrVILLOG.Enabled = False
    cmdFRISSIT.Caption = "Frissítés"
    Screen.MousePointer = vbDefault
End Sub

Private Sub cmdMODOSIT_Click()
    On Error GoTo errModosit
    Form003a.mode = grdJEGYZ.TextMatrix(grdJEGYZ.Row, 1)
    Form003a.Show 1
    frissit
errModosit:
End Sub

Private Sub cmdUJ_Click()
    Form003a.mode = 0
    Form003a.Show 1
    frissit
End Sub

Private Sub Form_Activate()
    Form003.Caption = "Jegyzõkönyv nyilvántartás  " & AktivForm()
    KeyPreview = True
End Sub

Private Sub Form_Load()
    Screen.MousePointer = vbHourglass
    iRefresh = 0
    datDATUMIG.Value = DateValue(Now())
    datDATUMTOL.Value = DateValue(DateAdd("m", -1, Now()))
    SetCombo Me
    Screen.MousePointer = vbDefault
End Sub

Private Sub grdJEGYZ_DblClick()
    cmdMODOSIT_Click
End Sub

Private Sub KeyCommand(KeyCode As Integer)
    Static CtrlKey As Boolean
 
    Select Case KeyCode
        Case vbKeyF1:
        Case vbKeyX:
            If CtrlKey Then
                Unload Form003
                Unload FormStart
            End If
        Case vbKeyEscape: cmdEXIT_Click
        Case vbKeyInsert: cmdUJ_Click
        Case vbKeyF2: cmdMODOSIT_Click
        Case vbKeyHome: grdJEGYZ.SetFocus
        Case vbKeyF5: cmdFRISSIT_Click
    End Select
 
    If KeyCode = vbKeyControl Then
        CtrlKey = True
    Else
        CtrlKey = False
    End If
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
   Dim Msg
   Msg = "Valóban ki szeretne lépni a rendszerbõl?"
   If MsgBox(Msg, vbQuestion + vbYesNo, "Tisztelt felhasználó!") = vbNo Then Cancel = True
End Sub

