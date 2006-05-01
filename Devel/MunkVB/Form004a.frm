VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Form004a 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   4800
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4380
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form004a.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4800
   ScaleWidth      =   4380
   StartUpPosition =   1  'CenterOwner
   Tag             =   "027"
   Begin VB.TextBox txtOBJID 
      Enabled         =   0   'False
      Height          =   315
      Left            =   1890
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   585
      Width           =   2385
   End
   Begin VB.TextBox txtOBJTIP 
      Enabled         =   0   'False
      Height          =   315
      Left            =   1890
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   180
      Width           =   2385
   End
   Begin VB.TextBox txtMEGJ 
      Height          =   1785
      Left            =   1890
      MaxLength       =   4
      TabIndex        =   5
      Top             =   2205
      Width           =   2385
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
      Left            =   3150
      TabIndex        =   7
      ToolTipText     =   "E S C"
      Top             =   4275
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
      Left            =   90
      TabIndex        =   6
      ToolTipText     =   "F 5"
      Top             =   4275
      Width           =   1135
   End
   Begin MSComCtl2.DTPicker datDATUM 
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
      Left            =   1890
      TabIndex        =   2
      Top             =   990
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
      Format          =   23003137
      CurrentDate     =   37013
   End
   Begin VB.Label lblDOLGID 
      Alignment       =   1  'Right Justify
      Caption         =   "Dolgozó:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   180
      TabIndex        =   13
      Tag             =   "007"
      Top             =   1830
      Width           =   1635
   End
   Begin MSForms.ComboBox cmbDOLGID 
      Height          =   315
      Left            =   1890
      TabIndex        =   4
      Tag             =   "334"
      Top             =   1800
      Width           =   2385
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "4207;556"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin VB.Label lblOBJID 
      Alignment       =   1  'Right Justify
      Caption         =   "Berendezés:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   0
      TabIndex        =   12
      Tag             =   "007"
      Top             =   615
      Width           =   1815
   End
   Begin VB.Label lblOBJTIP 
      Alignment       =   1  'Right Justify
      Caption         =   "Berendezés típus:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   0
      TabIndex        =   11
      Tag             =   "007"
      Top             =   210
      Width           =   1815
   End
   Begin VB.Label lblMEGJ 
      Alignment       =   1  'Right Justify
      Caption         =   "Megjegyzés:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   135
      TabIndex        =   10
      Tag             =   "007"
      Top             =   2235
      Width           =   1680
   End
   Begin VB.Label lblDATUM 
      Alignment       =   1  'Right Justify
      Caption         =   "Idõpont:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   0
      TabIndex        =   9
      Tag             =   "007"
      Top             =   1020
      Width           =   1815
   End
   Begin MSForms.ComboBox cmbMEROID 
      Height          =   315
      Left            =   1890
      TabIndex        =   3
      Tag             =   "334"
      Top             =   1395
      Width           =   2385
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "4207;556"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin VB.Label lblMEROID 
      Alignment       =   1  'Right Justify
      Caption         =   "Mérõhely:"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   180
      TabIndex        =   8
      Tag             =   "007"
      Top             =   1425
      Width           =   1635
   End
End
Attribute VB_Name = "Form004a"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' $Id: Form004a.frm 88 2006-04-05 20:07:24Z kilo $

Public iOBJID As Long

Private Sub cmdClose_Click()
    Back Me
End Sub

Private Sub cmdOK_Click()
    util.RekordInsert Me, "BERRAKTARBA"
    Back Me
End Sub

Private Sub Form_Activate()
    Form004a.Caption = "Mozgatás raktárba " & AktivForm()
    txtOBJID = CStr(iOBJID)
End Sub

Private Sub Form_Load()
    KeyPreview = True
    SetCombo Me
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyCommand KeyCode
    'Keycode = 0
End Sub

Private Sub KeyCommand(KeyCode As Integer)
    Static CtrlKey As Boolean
 
    Select Case KeyCode
        Case vbKeyF1:
        Case vbKeyX:
            If CtrlKey Then
                Unload Me
            End If
        Case vbKeyEscape: cmdClose_Click
        Case vbKeyF5: cmdOK_Click
    End Select
    
    If KeyCode = vbKeyControl Then
        CtrlKey = True
    Else
        CtrlKey = False
    End If
End Sub

