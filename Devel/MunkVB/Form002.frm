VERSION 5.00
Object = "{8AE029D0-08E3-11D1-BAA2-444553540000}#3.0#0"; "Vsflex3.ocx"
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form Form002 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   5550
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9330
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form002.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5550
   ScaleWidth      =   9330
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox spcMUNOSZ 
      Alignment       =   2  'Center
      BackColor       =   &H80000004&
      Height          =   315
      Left            =   8145
      Locked          =   -1  'True
      MaxLength       =   4
      TabIndex        =   11
      TabStop         =   0   'False
      Top             =   90
      Width           =   510
   End
   Begin VB.TextBox txtID 
      Alignment       =   2  'Center
      Enabled         =   0   'False
      Height          =   315
      Left            =   0
      Locked          =   -1  'True
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   0
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.CommandButton cmdUJ 
      Caption         =   "Rögzítés"
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
      Left            =   140
      TabIndex        =   3
      ToolTipText     =   "I n s e r t"
      Top             =   2745
      Width           =   1135
   End
   Begin VB.CommandButton cmdTOROL 
      Caption         =   "Törlés"
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
      Left            =   140
      TabIndex        =   4
      ToolTipText     =   "D E L"
      Top             =   4140
      Width           =   1135
   End
   Begin vsFlexLib.vsFlexArray grdTELJ 
      Height          =   2130
      Left            =   1620
      TabIndex        =   2
      Top             =   2565
      Width           =   7620
      _Version        =   196608
      _ExtentX        =   13441
      _ExtentY        =   3757
      _StockProps     =   228
      Appearance      =   1
      ConvInfo        =   1413783674
   End
   Begin VB.CommandButton cmdCLOSE 
      Caption         =   "Mégsem"
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
      Left            =   8100
      TabIndex        =   6
      ToolTipText     =   "E S C"
      Top             =   4965
      Width           =   1135
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "Rendben"
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
      Left            =   140
      TabIndex        =   5
      ToolTipText     =   "F 5"
      Top             =   4965
      Width           =   1135
   End
   Begin VB.TextBox txtMUVLEIR 
      Height          =   1665
      Left            =   1665
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   1
      Top             =   495
      Width           =   7575
   End
   Begin VB.Label lblMUNORA 
      Alignment       =   1  'Right Justify
      Caption         =   "Munkaóra összesen"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   6390
      TabIndex        =   13
      Tag             =   "007"
      Top             =   135
      Width           =   1680
   End
   Begin VB.Label Label2 
      Caption         =   "óra"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   8730
      TabIndex        =   12
      Tag             =   "007"
      Top             =   135
      Width           =   465
   End
   Begin VB.Label lblTELJ 
      Caption         =   "Teljesítmény adatok"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   238
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   45
      TabIndex        =   9
      Top             =   2295
      Width           =   1830
   End
   Begin VB.Line Line4 
      X1              =   0
      X2              =   10560
      Y1              =   4860
      Y2              =   4860
   End
   Begin VB.Line Line2 
      X1              =   -1260
      X2              =   9300
      Y1              =   2250
      Y2              =   2250
   End
   Begin VB.Label lblMUVLEIRROV 
      Alignment       =   1  'Right Justify
      Caption         =   "Elvégzett munka"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   315
      TabIndex        =   8
      Top             =   135
      Width           =   1290
   End
   Begin MSForms.ComboBox cmbMUVLEIRROV 
      Height          =   315
      Left            =   1665
      TabIndex        =   0
      Tag             =   "336"
      Top             =   90
      Width           =   2895
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "5106;556"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin VB.Label lblMUVLEIR 
      Alignment       =   1  'Right Justify
      Caption         =   "Munka leírása"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   90
      TabIndex        =   7
      Top             =   540
      Width           =   1515
   End
End
Attribute VB_Name = "Form002"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public mode As Long
Public iRefresh As Integer
Public Mundat As Date
Public Munora As String

Private Sub cmbUGYFEL_ID_Change()
  'util.tulajdonoskiir Form025
End Sub

Private Sub cmbMUVLEIRROV_Change()
 If cmbMUVLEIRROV.ListIndex <> -1 Then
  txtMUVLEIR = cmbMUVLEIRROV
 End If
End Sub

Private Sub cmdClose_Click()
 Back Me
End Sub

Private Sub cmdMODOSIT_Click()
 'Form025a.mode = grdSZERZTET.TextMatrix(grdSZERZTET.Row, 1)
 'Form025a.Show 1
 'util.gridderx grdSZERZTET, "SZERZTET", Me
End Sub

Private Sub cmdOK_Click()
 util.rekordupdate Me, "VISSZAIR", mode
 Form001.iRefresh = 1
 util.karbanfelvitel txtID
 Back Me
End Sub

Private Sub cmdTOROL_Click()
 If MsgBox("Biztosan törölni szeretné?", vbYesNo + vbExclamation, "Tisztelt felhasználó!") = vbYes Then
  Screen.MousePointer = vbHourglass
   util.rekorddel "TELJ", grdTELJ.TextMatrix(grdTELJ.Row, 1)
   util.gridderx grdTELJ, "TELJ", Me
   util.teljlistfeltolt txtID, Me
  Screen.MousePointer = vbDefault
 End If
End Sub

Private Sub cmdUJ_Click()
 Form002a.txtOBJID = mode
 Form002a.Show 1
 'util.gridderx grdSZERZTET, "SZERZTET", Me
End Sub

Private Sub Form_Activate()
 Form002.Caption = "Munkavégzés  " & AktivForm()
 util.gridderx grdTELJ, "TELJ", Me
 util.teljlistfeltolt txtID, Me
End Sub

Private Sub Form_Load()
KeyPreview = True
 util.setcombo Me
 If mode <> 0 Then
  util.rekordfeltolt Me, "MUNKALAP", mode
 End If
 Me.Mundat = Date
 Me.Munora = ""
End Sub
 
Private Sub Form_KeyDown(Keycode As Integer, Shift As Integer)
 KeyCommand Keycode
 'Keycode = 0
End Sub
Private Sub grdSZERZTET_DblClick()
 cmdMODOSIT_Click
End Sub
Private Sub grdSZERZTET_LostFocus()
 KeyPreview = True
End Sub
Private Sub grdSZERZTET_GotFocus()
 KeyPreview = False
End Sub

 Private Sub KeyCommand(Keycode As Integer)
 Static CtrlKey As Boolean
 
 Select Case Keycode
  Case vbKeyF1:
  Case vbKeyX:
             If CtrlKey Then
              Unload Me
             End If
  Case vbKeyEscape: cmdClose_Click
  Case vbKeyInsert: cmdUJ_Click
  'Case vbKeyDelete: cmdTOROL_Click
  Case vbKeyF2: cmdMODOSIT_Click
  Case vbKeyHome: grdSZERZTET.SetFocus
  Case vbKeyF5: cmdOK_Click
 End Select
 If Keycode = vbKeyControl Then
  CtrlKey = True
 Else
  CtrlKey = False
 End If
End Sub
Private Sub grdSZERZTET_KeyDown(Keycode As Integer, Shift As Integer)
 KeyCommand Keycode
End Sub

Private Sub lblUGYIRAT_ID_Click(Index As Integer)
End Sub

