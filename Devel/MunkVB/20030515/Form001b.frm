VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form Form001b 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   2580
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5310
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form001b.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2580
   ScaleWidth      =   5310
   StartUpPosition =   1  'CenterOwner
   Tag             =   "027"
   Begin VB.Frame spcBERENDREND 
      Caption         =   "Berendezések rendezése"
      Height          =   870
      Left            =   1485
      TabIndex        =   8
      Top             =   1440
      Width           =   2310
      Begin VB.OptionButton Option1 
         Caption         =   "Név"
         Height          =   285
         Index           =   1
         Left            =   360
         TabIndex        =   10
         Top             =   225
         Value           =   -1  'True
         Width           =   1455
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Telepítési helyszám"
         Height          =   285
         Index           =   2
         Left            =   360
         TabIndex        =   9
         Top             =   495
         Width           =   1725
      End
   End
   Begin VB.TextBox txtLAKAS 
      Height          =   315
      Left            =   1800
      TabIndex        =   6
      Top             =   990
      Width           =   2355
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
      Left            =   4050
      TabIndex        =   1
      ToolTipText     =   "E S C"
      Top             =   1755
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
      TabIndex        =   0
      ToolTipText     =   "F 5"
      Top             =   1755
      Width           =   1135
   End
   Begin VB.Label lblLAKAS 
      Alignment       =   1  'Right Justify
      Caption         =   "Lakás"
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
      Left            =   225
      TabIndex        =   7
      Top             =   1035
      Width           =   1500
   End
   Begin MSForms.ComboBox cmbOBJID 
      Height          =   315
      Left            =   1800
      TabIndex        =   5
      Tag             =   "MEGNEV"
      Top             =   585
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
      Left            =   1800
      TabIndex        =   4
      Tag             =   "296"
      Top             =   180
      Width           =   3255
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "5741;556"
      ListRows        =   10
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
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
      Left            =   180
      TabIndex        =   3
      Top             =   195
      Width           =   1545
   End
   Begin VB.Label lblKAPCSOLAT 
      Alignment       =   1  'Right Justify
      Caption         =   "Berendezés"
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
      Left            =   315
      TabIndex        =   2
      Top             =   630
      Width           =   1410
   End
End
Attribute VB_Name = "Form001b"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public mode As Integer
Public nevrend As String

Private Sub cmbOBJTIP_Change()
 If cmbOBJTIP.ListIndex <> -1 Then
   util.megnevfelt cmbOBJID, cmbOBJTIP, nevrend, "MEGNEV"
 End If
End Sub

Private Sub cmdClose_Click()
 Back Me
End Sub


Private Sub cmdOK_Click()
If cmbOBJTIP.ListIndex <> -1 And cmbOBJID.ListIndex <> -1 Then
  Form001a.txtOBJID = util.getcomboertek(cmbOBJID)
  Form001a.txtLAKAS = Me.txtLAKAS
  Back Me
Else
 MsgBox "A helyadatok helytelenül vannak megadva!", vbExclamation, "Tisztelt felhasználó!"
End If
End Sub



Private Sub Form_Activate()
 Form001b.Caption = "Hiba helye  " & AktivForm()
End Sub

Private Sub Form_Load()
 KeyPreview = True
 util.setcombo Me
 Option1(1) = True
End Sub

Private Sub Form_KeyDown(Keycode As Integer, Shift As Integer)
 KeyCommand Keycode
 'Keycode = 0
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
  Case vbKeyF5: cmdOK_Click
 End Select
 If Keycode = vbKeyControl Then
  CtrlKey = True
 Else
  CtrlKey = False
 End If
End Sub


Private Sub Option1_Click(Index As Integer)
 If Option1(1) = True Then
  nevrend = "M"
 ElseIf Option1(2) = True Then
  nevrend = "T"
 End If
 util.megnevfelt cmbOBJID, cmbOBJTIP, nevrend, "MEGNEV"
End Sub

