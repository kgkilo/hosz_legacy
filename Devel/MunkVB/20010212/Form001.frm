VERSION 5.00
Object = "{8AE029D0-08E3-11D1-BAA2-444553540000}#3.0#0"; "VSFLEX3.OCX"
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Object = "{00025600-0000-0000-C000-000000000046}#5.1#0"; "crystl32.ocx"
Begin VB.Form Form001 
   ClientHeight    =   8595
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   BeginProperty Font 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form001.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8595
   ScaleMode       =   0  'User
   ScaleWidth      =   12718.25
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtDATUMIG 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   4545
      TabIndex        =   36
      Top             =   2475
      Width           =   1050
   End
   Begin VB.TextBox txtDATUMTOL 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   3285
      MaxLength       =   10
      TabIndex        =   35
      Top             =   2475
      Width           =   1050
   End
   Begin VB.CommandButton cmdCSOPLIST 
      Caption         =   "Csop. nyomt"
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
      TabIndex        =   6
      ToolTipText     =   "Csoportos nyomtatás"
      Top             =   6795
      Width           =   1275
   End
   Begin VB.CommandButton cmdUJ 
      Caption         =   "Új munkalap"
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
      Top             =   4167
      Width           =   1275
   End
   Begin VB.CommandButton cmdMODOSIT 
      Caption         =   "Módosítás"
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
      Top             =   4824
      Width           =   1275
   End
   Begin VB.CommandButton cmdVISSZAI 
      Caption         =   "Visszaírás"
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
      TabIndex        =   4
      Top             =   5481
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
      Top             =   6120
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
      Top             =   3510
      Width           =   1275
   End
   Begin VB.TextBox txtMUNOSZ 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   360
      Locked          =   -1  'True
      TabIndex        =   33
      TabStop         =   0   'False
      Top             =   1575
      Width           =   960
   End
   Begin VB.TextBox txtMUNDATTOL 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   8145
      MaxLength       =   10
      TabIndex        =   15
      Top             =   2475
      Width           =   1050
   End
   Begin VB.TextBox txtMUNDATIG 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   9405
      MaxLength       =   10
      TabIndex        =   16
      Top             =   2475
      Width           =   1050
   End
   Begin VB.CommandButton cmdEXIT 
      Caption         =   "Vissza"
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
      TabIndex        =   17
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
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   360
      Locked          =   -1  'True
      TabIndex        =   22
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
      TabIndex        =   18
      TabStop         =   0   'False
      Top             =   2565
      Width           =   285
   End
   Begin vsFlexLib.vsFlexArray grdMUNKALAP 
      Height          =   4875
      Left            =   1530
      TabIndex        =   0
      Top             =   3510
      Width           =   10095
      _Version        =   196608
      _ExtentX        =   17806
      _ExtentY        =   8599
      _StockProps     =   228
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
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
      PrintFileLinesPerPage=   60
   End
   Begin MSForms.Label lblMUNOSZ 
      Height          =   240
      Left            =   405
      TabIndex        =   34
      Top             =   1305
      Width           =   915
      Caption         =   "Munkaóra"
      Size            =   "1614;423"
      FontName        =   "Arial"
      FontHeight      =   195
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin VB.Label lblMUNDAT 
      Alignment       =   1  'Right Justify
      Caption         =   "Visszaírás dátuma"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   6435
      TabIndex        =   32
      Top             =   2520
      Width           =   1650
   End
   Begin VB.Line Line2 
      X1              =   9875.914
      X2              =   10020.44
      Y1              =   2655
      Y2              =   2655
   End
   Begin VB.Label lblMUNIDO 
      Alignment       =   1  'Right Justify
      Caption         =   "Kiállítás dátuma"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   1575
      TabIndex        =   31
      Top             =   2520
      Width           =   1650
   End
   Begin VB.Line Line1 
      X1              =   4672.993
      X2              =   4817.519
      Y1              =   2655
      Y2              =   2655
   End
   Begin VB.Label lblKAPCSOLAT 
      Alignment       =   1  'Right Justify
      Caption         =   "Dolgozó"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   5
      Left            =   6660
      TabIndex        =   30
      Top             =   2115
      Width           =   1410
   End
   Begin MSForms.ComboBox cmbDOLGID 
      Height          =   315
      Left            =   8145
      TabIndex        =   14
      Tag             =   "334"
      Top             =   2070
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
   Begin VB.Label lblKAPCSOLAT 
      Alignment       =   1  'Right Justify
      Caption         =   "Berendezés megn."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   3
      Left            =   6660
      TabIndex        =   29
      Top             =   1710
      Width           =   1410
   End
   Begin VB.Label lblALLAPOT 
      Alignment       =   1  'Right Justify
      Caption         =   "Állapot jelzõ"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   0
      Left            =   6660
      TabIndex        =   28
      Top             =   900
      Width           =   1410
   End
   Begin VB.Label lblCEG 
      Alignment       =   1  'Right Justify
      Caption         =   "Berendezés típus"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   1
      Left            =   6660
      TabIndex        =   27
      Top             =   1275
      Width           =   1410
   End
   Begin MSForms.ComboBox cmbALLAPOT 
      Height          =   315
      Left            =   8145
      TabIndex        =   11
      Tag             =   "335"
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
      Left            =   8145
      TabIndex        =   12
      Tag             =   "296"
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
   Begin MSForms.ComboBox cmbOBJID 
      Height          =   315
      Left            =   8145
      TabIndex        =   13
      Tag             =   "MEGNEV"
      Top             =   1665
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
   Begin VB.Label lblMLAPTIP 
      Alignment       =   1  'Right Justify
      Caption         =   "Munkalap típus"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   2
      Left            =   1800
      TabIndex        =   26
      Top             =   2115
      Width           =   1410
   End
   Begin MSForms.ComboBox cmbMLAPTIP 
      Height          =   315
      Left            =   3285
      TabIndex        =   10
      Tag             =   "337"
      Top             =   2070
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
   Begin VB.Label lblFSZAM 
      Alignment       =   1  'Right Justify
      Caption         =   "Fõkönyvi szám"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   0
      Left            =   1800
      TabIndex        =   25
      Top             =   1710
      Width           =   1410
   End
   Begin MSForms.ComboBox cmbFSZAM 
      Height          =   315
      Left            =   3285
      TabIndex        =   9
      Tag             =   "310"
      Top             =   1665
      Width           =   3255
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "5741;556"
      ListWidth       =   10000
      ColumnCount     =   2
      cColumnInfo     =   2
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      Object.Width           =   "2000;8000"
   End
   Begin MSForms.Label lblFRISSIT 
      Height          =   240
      Left            =   135
      TabIndex        =   24
      Top             =   2295
      Width           =   1500
      Caption         =   "Azonnali frissítés"
      Size            =   "2646;423"
      FontName        =   "Arial"
      FontHeight      =   195
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin MSForms.Label lblTALALAT 
      Height          =   240
      Left            =   450
      TabIndex        =   23
      Top             =   630
      Width           =   825
      Caption         =   "Találatok"
      Size            =   "1455;423"
      FontName        =   "Arial"
      FontHeight      =   195
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin MSForms.ComboBox cmbTIPUSH 
      Height          =   315
      Left            =   3285
      TabIndex        =   8
      Tag             =   "293"
      Top             =   1260
      Width           =   3255
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "5741;556"
      ListWidth       =   10000
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin MSForms.ComboBox cmbSZOLGJELL 
      Height          =   315
      Left            =   3285
      TabIndex        =   7
      Tag             =   "291"
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
      Height          =   2850
      Left            =   90
      Shape           =   4  'Rounded Rectangle
      Top             =   540
      Width           =   11535
   End
   Begin VB.Label lblUGYFELFORM 
      BackStyle       =   0  'Transparent
      Caption         =   "Munkalapok"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000001&
      Height          =   420
      Index           =   0
      Left            =   5235
      TabIndex        =   21
      Top             =   45
      Width           =   2490
   End
   Begin VB.Label lblSZOLGJELL 
      Alignment       =   1  'Right Justify
      Caption         =   "Szolgáltatás jellege"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   0
      Left            =   1665
      TabIndex        =   20
      Top             =   870
      Width           =   1545
   End
   Begin VB.Label lblTIPUSH 
      Alignment       =   1  'Right Justify
      Caption         =   "Típus hiba"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Index           =   1
      Left            =   1800
      TabIndex        =   19
      Top             =   1305
      Width           =   1410
   End
End
Attribute VB_Name = "Form001"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public iRefresh As Integer
Private Sub frissit()
 If iRefresh = 1 Then
  If chkFrissit = 1 Then
   grdMUNKALAP.Redraw = False
   util.gridderx grdMUNKALAP, "MUNKALAP", Me
   grdMUNKALAP.Redraw = True
   'util.setcombo Me
   'util.setcombo3 cmbTULAJNEV
   'util.setcombo3 cmbCEG
   'util.setcombo3 cmbKAPCSOLAT
  Else
   tmrVILLOG.Enabled = True
  End If
 End If
 iRefresh = 0
End Sub

Private Sub cmbALLAPOT_Change()
 'csoportosnyomtatas
End Sub

Private Sub cmbMLAPTIP_Change()
 'csoportosnyomtatas
End Sub

Private Sub cmbOBJTIP_Change()
 If cmbOBJTIP.ListIndex <> -1 Then
   util.megnevfeltolt cmbOBJID, cmbOBJTIP, "MEGNEV"
 End If
End Sub

Private Sub cmbOBJTIP_GotFocus()
 Me!cmbOBJTIP = Null
 Me!cmbOBJID = Null
End Sub

Private Sub cmdCSOPLIST_Click()
If MsgBox("Biztosan nyomtatni szeretné a választott munkalapokat?", vbYesNo + vbExclamation, "Tisztelt felhasználó!") = vbYes Then
 Dim I As Integer
 If util.getcomboertek(cmbMLAPTIP) = 1 Then
  For I = 1 To grdMUNKALAP.Rows - 1
     util.printmunkalap "1", grdGRID.TextMatrix(I, 1)
     Nyomtat "munuf.rpt", 1
     util.munkalapallapot grdMUNKALAP.TextMatrix(I, 1), 2
  Next I
 Else
  For I = 1 To grdMUNKALAP.Rows - 1
     util.printmunkalap "2", grdMUNKALAP.TextMatrix(I, 1)
     Nyomtat "munue.rpt", 1
     util.munkalapallapot grdMUNKALAP.TextMatrix(I, 1), 2
  Next I
 End If
End If
End Sub

Private Sub cmdEXIT_Click()
 Unload Form001
End Sub

Private Sub cmdVISSZA_Click()

End Sub

Private Sub cmdLIST_Click()
 If MsgBox("Biztosan nyomtatni szeretné a választott munkalapot?", vbYesNo + vbExclamation, "Tisztelt felhasználó!") = vbYes Then
   util.munkalapallapot grdMUNKALAP.TextMatrix(grdMUNKALAP.Row, 1), 2
   util.printmunkalap "1", grdMUNKALAP.TextMatrix(grdMUNKALAP.Row, 1)
   Nyomtat "munuf.rpt", 1
 End If
End Sub

Private Sub cmdVISSZAI_Click()
 Form002.Show 1
 frissit
End Sub

Private Sub Form_KeyDown(Keycode As Integer, Shift As Integer)
 KeyCommand Keycode
 'Keycode = 0
End Sub

Private Sub grdmunkalap_GotFocus()
 KeyPreview = False

End Sub

Private Sub grdmunkalap_KeyDown(Keycode As Integer, Shift As Integer)
 KeyCommand Keycode
 'Keycode = 0
End Sub

Private Sub grdmunkalap_LostFocus()
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
 util.gridderx grdMUNKALAP, "MUNKALAP", Me
 
 Dim z As Long
  Dim I As Long
  Dim t As String
    z = 0
    For I = 1 To grdMUNKALAP.Rows - 1
     t = grdMUNKALAP.TextMatrix(I, 13)
     If t <> "" Then z = z + CLng(t)
    Next I
  Me.txtMUNOSZ = z
 
 tmrVILLOG.Enabled = False
 cmdFRISSIT.Caption = "Frissítés"
 txtTALALAT = grdMUNKALAP.Rows - 1
 Screen.MousePointer = vbDefault
 csoportosnyomtatas
End Sub

Private Sub cmdMODOSIT_Click()
 Form001a.mode = grdMUNKALAP.TextMatrix(grdMUNKALAP.Row, 1)
 Form001a.Show 1
 frissit
End Sub

Private Sub cmdTOROL_Click()
 'If MsgBox("Biztosan törölni szeretné?", vbYesNo + vbExclamation, "Tisztelt felhasználó!") = vbYes Then
 ' Screen.MousePointer = vbHourglass
 ' util.rekorddel "UGYFEL", grdMUNKALAP.TextMatrix(grdMUNKALAP.Row, 1)
 ' iRefresh = 1
 ' frissit
 ' Screen.MousePointer = vbDefault
 'End If
End Sub

Private Sub cmdUJ_Click()
 Form001a.mode = 0
 Form001a.Show 1
 frissit
End Sub

Private Sub Form_Activate()
 Form001.Caption = "Munkalap nyilvántartás  " & AktivForm()
 KeyPreview = True
End Sub

Private Sub Form_Load()
 Screen.MousePointer = vbHourglass
 iRefresh = 0
 'util.gridderx grdMUNKALAP, "MUNKALAP", Me
 util.setcombo Me
 Me.txtDATUMIG = Date
 Me.txtDATUMTOL = DateAdd("m", -1, Date)
 util.setcomboVal cmbMLAPTIP, "1"
 'util.munkalaplekerdepulfeltolt cmbEPULID
 'util.setcombo3 cmbTULAJNEV
' util.setcombo3 cmbCEG
' util.setcombo3 cmbKAPCSOLAT
 'txtTALALAT = grdMUNKALAP.Rows - 1
 Screen.MousePointer = vbDefault
End Sub

Private Sub grdmunkalap_DblClick()
 cmdMODOSIT_Click
End Sub

Private Sub KeyCommand(Keycode As Integer)
 Static CtrlKey As Boolean
 
 Select Case Keycode
  Case vbKeyF1:
  Case vbKeyX:
             If CtrlKey Then
              Unload Me
             End If
  Case vbKeyEscape: cmdEXIT_Click
  Case vbKeyInsert: cmdUJ_Click
  'Case vbKeyDelete: cmdTOROL_Click
  Case vbKeyF2: cmdMODOSIT_Click
  Case vbKeyF3: cmdVISSZAI_Click
  Case vbKeyHome: grdMUNKALAP.SetFocus
  Case vbKeyF5: cmdFRISSIT_Click
 End Select
 If Keycode = vbKeyControl Then
  CtrlKey = True
 Else
  CtrlKey = False
 End If
End Sub
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
   Dim Msg   ' Declare variable.
   ' Set the message text.
   Msg = "Valóban ki szeretne lépni a rendszerbõl?"
   ' If user clicks the No button, stop QueryUnload.
   If MsgBox(Msg, vbQuestion + vbYesNo, "Tisztelt felhasználó!") = vbNo Then Cancel = True
   'If MsgBox("Biztosan ki szeretne lépni a rendszerbõl?", vbYesNo + vbExclamation, "Tisztelt felhasználó!") = vbYes Then
End Sub

Sub csoportosnyomtatas()
  Set frmCurrentForm = Screen.ActiveForm
  If frmCurrentForm![cmbMLAPTIP].ListIndex <> -1 And util.getcomboertek(frmCurrentForm![cmbALLAPOT]) = "1" Then
  frmCurrentForm![cmdCSOPLIST].Enabled = True
  frmCurrentForm![cmdLIST].Enabled = True
  Else
   frmCurrentForm![cmdCSOPLIST].Enabled = False
   frmCurrentForm![cmdLIST].Enabled = False
  End If
End Sub
