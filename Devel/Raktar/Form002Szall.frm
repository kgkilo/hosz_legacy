VERSION 5.00
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Form002Szall 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Szállítólevél adatai"
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
   Begin VB.TextBox txtSZLEVEL_SZAM 
      Height          =   330
      Left            =   1995
      TabIndex        =   0
      Top             =   210
      Width           =   2220
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
      TabIndex        =   3
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
      TabIndex        =   2
      ToolTipText     =   "F 5"
      Top             =   1785
      Width           =   1135
   End
   Begin MSComCtl2.DTPicker datSZLEVEL_DAT 
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
      Left            =   1995
      TabIndex        =   1
      Top             =   630
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
      Format          =   23068673
      CurrentDate     =   38353
   End
   Begin VB.Label lvlSZLEVEL_DAT 
      Alignment       =   1  'Right Justify
      Caption         =   "Szállítólevél dátuma:"
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
      Left            =   210
      TabIndex        =   5
      Tag             =   "007"
      Top             =   645
      Width           =   1635
   End
   Begin VB.Label lblSZLEVEL_SZAM 
      Alignment       =   1  'Right Justify
      Caption         =   "Szállítólevél száma:"
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
      TabIndex        =   4
      Tag             =   "007"
      Top             =   225
      Width           =   1635
   End
End
Attribute VB_Name = "Form002Szall"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdCLOSE_Click()
    Unload Me
End Sub

Private Sub cmdOK_Click()
    If txtSZLEVEL_SZAM <> "" And datSZLEVEL_DAT.Value <> "" Then
        Form002.strSZLEVEL_SZAM = txtSZLEVEL_SZAM.Text
        Form002.strSZLEVEL_DATUM = datSZLEVEL_DAT.Value
        Unload Me
    End If
End Sub

Private Sub Form_Load()
    KeyPreview = True
    datSZLEVEL_DAT.Value = Now()
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
                Unload Me
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

