VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form Form002a 
   BorderStyle     =   1  'Fixed Single
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
   Icon            =   "Form002a.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2235
   ScaleWidth      =   4380
   StartUpPosition =   1  'CenterOwner
   Tag             =   "027"
   Begin VB.TextBox txtSZERZ_ID 
      Enabled         =   0   'False
      Height          =   315
      Left            =   3915
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   1215
      Visible         =   0   'False
      Width           =   195
   End
   Begin VB.TextBox txtMUNORA 
      Height          =   315
      Left            =   1935
      MaxLength       =   4
      TabIndex        =   2
      Top             =   990
      Width           =   915
   End
   Begin VB.TextBox txtMUNDAT 
      Height          =   315
      Left            =   1935
      TabIndex        =   1
      Top             =   585
      Width           =   915
   End
   Begin VB.CommandButton cmdCLOSE 
      Caption         =   "M�gsem"
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
      TabIndex        =   4
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
      TabIndex        =   3
      ToolTipText     =   "F 5"
      Top             =   1755
      Width           =   1135
   End
   Begin VB.Label Label2 
      Caption         =   "�ra"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   2925
      TabIndex        =   9
      Tag             =   "007"
      Top             =   1035
      Width           =   465
   End
   Begin VB.Label lblMUNORA 
      Alignment       =   1  'Right Justify
      Caption         =   "Elv�gzett munka ideje"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   180
      TabIndex        =   7
      Tag             =   "007"
      Top             =   1035
      Width           =   1680
   End
   Begin VB.Label lblMUNDAT 
      Alignment       =   1  'Right Justify
      Caption         =   "Elv�gzett munka d�tuma"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   45
      TabIndex        =   6
      Tag             =   "007"
      Top             =   630
      Width           =   1815
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
      Caption         =   "Munk�t v�gz� dolgoz�"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   270
      Left            =   225
      TabIndex        =   5
      Tag             =   "007"
      Top             =   225
      Width           =   1635
   End
End
Attribute VB_Name = "Form002a"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public mode As Integer


Private Sub cmdClose_Click()
 Back Me
End Sub


Private Sub cmdOK_Click()
If mode = 0 Then
 'util.rekordinsert Me, "SZERZTET"
 If Me.txtMUNORA <> "" And Me.txtMUNDAT <> "" And cmbDOLG_ID.ListIndex <> -1 Then
 'util.rekordinsert Parent.cmbMEGNEV, Me.Controls, "Telj"
 'util.teljlistfeltolt Parent.cmbMEGNEV, cmb1, spcMUNOSZ
 'Visszaerkezettre tenni!!!!!
 Back Me
Else
 MsgBox "A teljes�tm�nyadatok helytelen�l vannak megadva!", vbExclamation, "Tisztelt felhaszn�l�!"
End If
Else
 ' util.rekordupdate Me, "SZERZTET", mode
End If 'Form002.iRefresh = 1
End Sub

Private Sub Form_Activate()
 Form002a.Caption = "Munkav�gz�s  " & AktivForm()
End Sub

Private Sub Form_Load()
 KeyPreview = True
 util.setcombo Me
 'txtSZERZ_ID = Form002.spcID
 If mode <> 0 Then
  'util.rekordfeltolt Me, "SZERZTET", mode
 End If
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


Private Sub lblIRSZ_Click()

End Sub
