VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{00025600-0000-0000-C000-000000000046}#5.1#0"; "crystl32.ocx"
Object = "{8AE029D0-08E3-11D1-BAA2-444553540000}#3.0#0"; "VSFLEX3.OCX"
Begin VB.Form Form004 
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
   Begin VB.TextBox txtR_TELEPHSZ 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   9660
      TabIndex        =   35
      Top             =   7650
      Width           =   1170
   End
   Begin VB.TextBox txtR_GYSZAM 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   9660
      TabIndex        =   33
      Top             =   7245
      Width           =   1170
   End
   Begin VB.TextBox txtR_TIPUS 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   7500
      TabIndex        =   31
      Top             =   7650
      Width           =   1170
   End
   Begin VB.TextBox txtR_MEGNEV 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   7500
      TabIndex        =   29
      Top             =   7245
      Width           =   1170
   End
   Begin VB.TextBox txtSZ_TELEPHSZ 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4470
      TabIndex        =   27
      Top             =   7650
      Width           =   1170
   End
   Begin VB.TextBox txtSZ_GYSZAM 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4470
      TabIndex        =   25
      Top             =   7245
      Width           =   1170
   End
   Begin VB.TextBox txtSZ_TIPUS 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2310
      TabIndex        =   23
      Top             =   7650
      Width           =   1170
   End
   Begin VB.TextBox txtSZ_MEGNEV 
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   2310
      TabIndex        =   21
      Top             =   7245
      Width           =   1170
   End
   Begin VB.TextBox txtR_TALALAT 
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
      Left            =   7560
      Locked          =   -1  'True
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   6825
      Width           =   960
   End
   Begin VB.TextBox txtSZ_TALALAT 
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
      Left            =   2415
      Locked          =   -1  'True
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   6825
      Width           =   960
   End
   Begin VB.CheckBox chkFrissit 
      Height          =   285
      Left            =   720
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   1095
      Width           =   285
   End
   Begin VB.CommandButton cmdLIST 
      Caption         =   "Nyomtat�s"
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
      TabIndex        =   2
      ToolTipText     =   "Egyedi munkalap nyomtat�sa"
      Top             =   4785
      Visible         =   0   'False
      Width           =   1275
   End
   Begin VB.CommandButton cmdFRISSIT 
      Caption         =   "Friss�t�s"
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
      Caption         =   "Kil�p�s"
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
      TabIndex        =   8
      ToolTipText     =   "E s c "
      Top             =   8040
      Width           =   1275
   End
   Begin VB.Timer tmrVILLOG 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   2382
      Top             =   90
   End
   Begin vsFlexLib.vsFlexArray grdSZABAD 
      Height          =   4455
      Left            =   1530
      TabIndex        =   0
      Top             =   2355
      Width           =   4110
      _Version        =   196608
      _ExtentX        =   7250
      _ExtentY        =   7858
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
      Left            =   8145
      TabIndex        =   4
      Top             =   1260
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
      Format          =   51773441
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
      Left            =   9945
      TabIndex        =   5
      Top             =   1260
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
      Format          =   51773441
      CurrentDate     =   37013
   End
   Begin vsFlexLib.vsFlexArray grdRAKTAR 
      Height          =   4455
      Left            =   6720
      TabIndex        =   14
      Top             =   2355
      Width           =   4110
      _Version        =   196608
      _ExtentX        =   7250
      _ExtentY        =   7858
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
   Begin VB.Label lblR_TELEPHSZ 
      Caption         =   "Telep.hsz:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   8880
      TabIndex        =   36
      Top             =   7710
      Width           =   750
   End
   Begin VB.Label lblR_GYSZAM 
      Caption         =   "Gy.sz�m:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   8880
      TabIndex        =   34
      Top             =   7305
      Width           =   750
   End
   Begin VB.Label lblR_TIPUS 
      Caption         =   "T�pus:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   6720
      TabIndex        =   32
      Top             =   7710
      Width           =   750
   End
   Begin VB.Label lblR_MEGNEV 
      Caption         =   "Megnev.:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   6720
      TabIndex        =   30
      Top             =   7305
      Width           =   750
   End
   Begin VB.Label lblSZ_TELEPHSZ 
      Caption         =   "Telep.hsz:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3690
      TabIndex        =   28
      Top             =   7710
      Width           =   750
   End
   Begin VB.Label lblSZ_GYSZAM 
      Caption         =   "Gy.sz�m:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   3690
      TabIndex        =   26
      Top             =   7305
      Width           =   750
   End
   Begin VB.Label lblSZ_TIPUS 
      Caption         =   "T�pus:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   1530
      TabIndex        =   24
      Top             =   7710
      Width           =   750
   End
   Begin VB.Label lblSZ_MEGNEV 
      Caption         =   "Megnev.:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   225
      Left            =   1530
      TabIndex        =   22
      Top             =   7305
      Width           =   750
   End
   Begin MSForms.Label lblR_TALALAT 
      Height          =   240
      Left            =   6720
      TabIndex        =   19
      Top             =   6825
      Width           =   825
      Caption         =   "Tal�latok:"
      Size            =   "1455;423"
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
   End
   Begin MSForms.Label lblSZ_TALALAT 
      Height          =   240
      Left            =   1575
      TabIndex        =   17
      Top             =   6825
      Width           =   825
      Caption         =   "Tal�latok:"
      Size            =   "1455;423"
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
   End
   Begin MSForms.Label lblFRISSIT 
      Height          =   240
      Left            =   135
      TabIndex        =   16
      Top             =   840
      Width           =   1500
      Caption         =   "Azonnali friss�t�s"
      Size            =   "2646;423"
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
   End
   Begin VB.Label lblTITLE 
      Alignment       =   2  'Center
      Caption         =   "Berendez�s rakt�r"
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
      Left            =   3605
      TabIndex        =   13
      Top             =   105
      Width           =   4670
   End
   Begin VB.Label lblOBJID 
      Alignment       =   1  'Right Justify
      Caption         =   "Berendez�s megn.:"
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
      TabIndex        =   12
      Top             =   1275
      Width           =   1515
   End
   Begin VB.Label lblOBJTIP 
      Alignment       =   1  'Right Justify
      Caption         =   "Berendez�s t�pusa:"
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
      TabIndex        =   11
      Top             =   840
      Width           =   1515
   End
   Begin VB.Label lblDATUMTOL 
      Alignment       =   1  'Right Justify
      Caption         =   "Id�szak:"
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
      Left            =   6870
      TabIndex        =   10
      Top             =   1290
      Width           =   1200
   End
   Begin VB.Label lblDOLG 
      Alignment       =   1  'Right Justify
      Caption         =   "Dolgoz�:"
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
      Left            =   6870
      TabIndex        =   9
      Top             =   840
      Width           =   1200
   End
   Begin VB.Line lblDATUMIG 
      X1              =   10381.22
      X2              =   10525.74
      Y1              =   1425
      Y2              =   1425
   End
   Begin MSForms.ComboBox cmbDOLG 
      Height          =   315
      Left            =   8145
      TabIndex        =   3
      Tag             =   "334"
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
   Begin MSForms.ComboBox cmbOBJTIP 
      Height          =   315
      Left            =   3285
      TabIndex        =   6
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
      Left            =   3285
      TabIndex        =   7
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
Attribute VB_Name = "Form004"
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
    Unload Form004
    Unload FormStart
End Sub

Private Sub cmdLIST_Click()
'    If MsgBox("Biztosan nyomtatni szeretn� a v�lasztott munkalapot?", vbYesNo + vbExclamation, "Tisztelt felhaszn�l�!") = vbYes Then
'        util.munkalapallapot grdJEGYZ.TextMatrix(grdJEGYZ.Row, 1), 2
'        util.printmunkalap "1", grdJEGYZ.TextMatrix(grdJEGYZ.Row, 1)
'        Nyomtat "munuf.rpt", 1
'    End If
'    util.Jegyzokonyv "8", 7, sReportDir
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

Private Sub grdRAKTAR_SelChange()
    util.RekordFeltolt Me, "RAKTAR", grdRAKTAR.TextMatrix(grdRAKTAR.Row, 1)
End Sub

Private Sub grdSZABAD_SelChange()
    util.RekordFeltolt Me, "RAKTARSZ", grdSZABAD.TextMatrix(grdSZABAD.Row, 1)
End Sub

Private Sub tmrVILLOG_Timer()
    If cmdFRISSIT.Caption = "F5" Then
        cmdFRISSIT.Caption = "Friss�t�s"
    Else
        cmdFRISSIT.Caption = "F5"
    End If
End Sub

Private Sub cmdFRISSIT_Click()
    Screen.MousePointer = vbHourglass
    
    util.GridderX grdRAKTAR, "RAKTAR", Me
    util.GridderX grdSZABAD, "RAKTARSZ", Me
    
    tmrVILLOG.Enabled = False
    cmdFRISSIT.Caption = "Friss�t�s"
    Screen.MousePointer = vbDefault
End Sub

Private Sub cmdUJ_Click()
    Form004a.mode = 0
    Form004a.Show 1
    frissit
End Sub

Private Sub Form_Activate()
    Form004.Caption = "Berendez�s rakt�r " & AktivForm()
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

Private Sub KeyCommand(KeyCode As Integer)
    Static CtrlKey As Boolean
 
    Select Case KeyCode
        Case vbKeyF1:
        Case vbKeyX:
            If CtrlKey Then
                Unload Form004
                Unload FormStart
            End If
        Case vbKeyEscape: cmdEXIT_Click
        Case vbKeyInsert: cmdUJ_Click
        'Case vbKeyF2: cmdMODOSIT_Click
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
   Msg = "Val�ban ki szeretne l�pni a rendszerb�l?"
   If MsgBox(Msg, vbQuestion + vbYesNo, "Tisztelt felhaszn�l�!") = vbNo Then Cancel = True
End Sub

