VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form Form002Dolg 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Dolgozó kiválasztása"
   ClientHeight    =   2235
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
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2235
   ScaleWidth      =   4380
   StartUpPosition =   1  'CenterOwner
   Tag             =   "027"
   Begin VB.TextBox txtMEGJ 
      Height          =   540
      Left            =   315
      TabIndex        =   4
      Top             =   1155
      Width           =   3900
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
      TabIndex        =   2
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
      Left            =   105
      TabIndex        =   1
      ToolTipText     =   "F 5"
      Top             =   1755
      Width           =   1135
   End
   Begin MSForms.ComboBox cmbDOLG_ID 
      Height          =   315
      Left            =   1935
      TabIndex        =   0
      Tag             =   "334"
      Top             =   180
      Width           =   2355
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "4154;556"
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin VB.Label lblDOLG_ID 
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
      Left            =   225
      TabIndex        =   3
      Tag             =   "007"
      Top             =   225
      Width           =   1635
   End
End
Attribute VB_Name = "Form002Dolg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCLOSE_Click()
    Form002.iReturn = vbCancel
    Unload Me
End Sub

Private Sub cmdOK_Click()
    If cmbDOLG_ID.ListIndex <> -1 Then
        Form002.lDOLG_ID = util.getComboErtek(cmbDOLG_ID)
        Form002.strMEGJ = txtMEGJ
        Form002.iReturn = vbOK
        Unload Me
    End If
End Sub

Private Sub Form_Load()
    KeyPreview = True
    util.setcombo Me
End Sub

Private Sub Form_KeyDown(Keycode As Integer, Shift As Integer)
    KeyCommand Keycode
End Sub

Private Sub KeyCommand(Keycode As Integer)
    Static CtrlKey As Boolean
 
    Select Case Keycode
        Case vbKeyF1:
        Case vbKeyX:
            If CtrlKey Then
                cmdCLOSE_Click
            End If
        Case vbKeyEscape: cmdCLOSE_Click
        Case vbKeyF5: cmdOK_Click
    End Select
    
    If Keycode = vbKeyControl Then
        CtrlKey = True
    Else
        CtrlKey = False
    End If
End Sub
