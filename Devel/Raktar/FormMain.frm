VERSION 5.00
Begin VB.Form FormMain 
   Caption         =   "Raktár"
   ClientHeight    =   8100
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8880
   LinkTopic       =   "Form1"
   ScaleHeight     =   2.63121e5
   ScaleMode       =   0  'User
   ScaleWidth      =   6.86253e6
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdExit 
      Caption         =   "Kilépés"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   13.5
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   690
      Left            =   2715
      TabIndex        =   2
      Top             =   6540
      Width           =   3450
   End
   Begin VB.CommandButton cmdReport 
      Caption         =   "Jelentések"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   13.5
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   690
      Left            =   2715
      TabIndex        =   1
      Top             =   2400
      Width           =   3450
   End
   Begin VB.CommandButton cmdRaktar 
      Caption         =   "Raktár kezelés"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   13.5
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   690
      Left            =   2715
      TabIndex        =   0
      Top             =   1320
      Width           =   3450
   End
End
Attribute VB_Name = "FormMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdRaktar_Click()
    Form002.Show vbModal
End Sub

Private Sub Form_Initialize()
    sReportDir = "J:\GABOR\WORK\HOSZOLG"
    Set util = CreateObject("Rakt.Global")
    util.Init sReportDir
    
    HOOSSZEGZO = "18"
    VIZORA = "19"
    ERZEKELO = "20"
    MIND = "00"
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
   If MsgBox("Valóban ki szeretne lépni a rendszerbõl?", _
        vbQuestion + vbYesNo, "Tisztelt felhasználó!") = vbNo _
        Then Cancel = True
End Sub



