VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form Form004 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Közös képviselõ adatai"
   ClientHeight    =   4200
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4770
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4200
   ScaleWidth      =   4770
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtNEV 
      Height          =   330
      Left            =   1305
      TabIndex        =   0
      Top             =   630
      Width           =   3375
   End
   Begin VB.TextBox txtMEGB_MUN_TEL 
      Height          =   330
      Left            =   3570
      TabIndex        =   8
      Top             =   3150
      Width           =   1065
   End
   Begin VB.TextBox txtMEGB_MOB_TEL 
      Height          =   330
      Left            =   2415
      TabIndex        =   7
      Top             =   3150
      Width           =   1065
   End
   Begin VB.TextBox txtMEGB_LAK_TEL 
      Height          =   330
      Left            =   1245
      TabIndex        =   6
      Top             =   3150
      Width           =   1065
   End
   Begin VB.TextBox txtMEGB_NEV 
      Height          =   330
      Left            =   1245
      TabIndex        =   5
      Top             =   2520
      Width           =   3375
   End
   Begin VB.TextBox txtMUN_TEL 
      Height          =   330
      Left            =   3570
      TabIndex        =   4
      Top             =   1680
      Width           =   1065
   End
   Begin VB.TextBox txtMOB_TEL 
      Height          =   330
      Left            =   2415
      TabIndex        =   3
      Top             =   1680
      Width           =   1065
   End
   Begin VB.TextBox txtLAK_TEL 
      Height          =   330
      Left            =   1305
      TabIndex        =   2
      Top             =   1680
      Width           =   1065
   End
   Begin VB.TextBox txtCIM 
      Height          =   330
      Left            =   1305
      TabIndex        =   1
      Top             =   1050
      Width           =   3375
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
      Left            =   3465
      TabIndex        =   10
      ToolTipText     =   "E S C"
      Top             =   3750
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
      Left            =   105
      TabIndex        =   9
      ToolTipText     =   "F 5"
      Top             =   3750
      Width           =   1135
   End
   Begin VB.Label lblID 
      Alignment       =   1  'Right Justify
      Caption         =   "Közös képv.:"
      Height          =   225
      Left            =   135
      TabIndex        =   23
      Top             =   270
      Width           =   1170
   End
   Begin MSForms.ComboBox cmbID 
      Height          =   330
      Left            =   1305
      TabIndex        =   22
      Tag             =   "KEPVIS"
      Top             =   210
      Width           =   3375
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "5953;582"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Munkahely:"
      Height          =   225
      Left            =   3570
      TabIndex        =   21
      Top             =   2940
      Width           =   1065
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Mobil:"
      Height          =   225
      Left            =   2415
      TabIndex        =   20
      Top             =   2940
      Width           =   1065
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Lakás:"
      Height          =   225
      Left            =   1245
      TabIndex        =   19
      Top             =   2940
      Width           =   1065
   End
   Begin VB.Label lblKEPV_TEL3 
      Alignment       =   2  'Center
      Caption         =   "Munkahely:"
      Height          =   225
      Left            =   3570
      TabIndex        =   18
      Top             =   1470
      Width           =   1065
   End
   Begin VB.Label lblKEPV_TEL2 
      Alignment       =   2  'Center
      Caption         =   "Mobil:"
      Height          =   225
      Left            =   2415
      TabIndex        =   17
      Top             =   1470
      Width           =   1065
   End
   Begin VB.Label lblKEPV_TEL1 
      Alignment       =   2  'Center
      Caption         =   "Lakás:"
      Height          =   225
      Left            =   1305
      TabIndex        =   16
      Top             =   1470
      Width           =   1065
   End
   Begin VB.Label lblMEGB_TEL 
      Alignment       =   1  'Right Justify
      Caption         =   "Telefon:"
      Height          =   225
      Left            =   75
      TabIndex        =   15
      Top             =   3210
      Width           =   1170
   End
   Begin VB.Label lblKEPVIS_TEL 
      Alignment       =   1  'Right Justify
      Caption         =   "Telefon:"
      Height          =   225
      Left            =   135
      TabIndex        =   14
      Top             =   1740
      Width           =   1170
   End
   Begin VB.Label lblMEGB 
      Alignment       =   1  'Right Justify
      Caption         =   "Megbízott:"
      Height          =   225
      Left            =   75
      TabIndex        =   13
      Top             =   2580
      Width           =   1170
   End
   Begin VB.Label lblCIM 
      Alignment       =   1  'Right Justify
      Caption         =   "Cím:"
      Height          =   225
      Left            =   135
      TabIndex        =   12
      Top             =   1050
      Width           =   1170
   End
   Begin VB.Label lblNEV 
      Alignment       =   1  'Right Justify
      Caption         =   "Név:"
      Height          =   225
      Left            =   135
      TabIndex        =   11
      Top             =   690
      Width           =   1170
   End
End
Attribute VB_Name = "Form004"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public lKEPVID As Integer

Private Sub cmdCLOSE_Click()
    Form003.iRet = vbCancel
    Unload Me
End Sub

Private Sub cmdOK_Click()
    Screen.MousePointer = vbHourglass
    util.Save Me, "KEP"
    Form003.iRet = vbOK
    Screen.MousePointer = vbDefault
    Unload Me
End Sub

Private Sub Form_Load()
    Screen.MousePointer = vbHourglass
    If lKEPVID > 0 Then
        SetCombo Me
        util.Load Me, lKEPVID, "KEP"
    Else
        cmbID.Enabled = False
    End If
    Screen.MousePointer = vbDefault
End Sub
