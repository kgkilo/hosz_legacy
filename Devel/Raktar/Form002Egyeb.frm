VERSION 5.00
Begin VB.Form Form002Egyeb 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Mozgatás"
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
      Left            =   210
      TabIndex        =   3
      Top             =   1050
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
      Left            =   105
      TabIndex        =   0
      ToolTipText     =   "F 5"
      Top             =   1755
      Width           =   1135
   End
   Begin VB.Label lblMEHET 
      Alignment       =   1  'Right Justify
      Caption         =   "Mozgatás mehet ?"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   1373
      TabIndex        =   2
      Tag             =   "007"
      Top             =   225
      Width           =   1635
   End
End
Attribute VB_Name = "Form002Egyeb"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCLOSE_Click()
    Form002.iReturn = vbCancel
    Unload Me
End Sub

Private Sub cmdOK_Click()
    Form002.strMEGJ = txtMEGJ
    Form002.iReturn = vbOK
    Unload Me
End Sub

Private Sub Form_Load()
    KeyPreview = True
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
