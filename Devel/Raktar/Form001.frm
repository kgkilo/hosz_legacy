VERSION 5.00
Object = "{00025600-0000-0000-C000-000000000046}#5.1#0"; "crystl32.ocx"
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form Form001 
   Caption         =   "Raktár"
   ClientHeight    =   8100
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   8880
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   8100
   ScaleMode       =   0  'User
   ScaleWidth      =   9506.57
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.CheckBox chkFrissit 
      Height          =   285
      Left            =   3360
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   1215
      Width           =   285
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
      Left            =   1800
      TabIndex        =   12
      ToolTipText     =   "F 5"
      Top             =   840
      Width           =   1755
   End
   Begin VB.Frame boxERZEKELO 
      Caption         =   "Érzékelõ"
      Height          =   855
      Left            =   120
      TabIndex        =   8
      Top             =   7200
      Width           =   11655
   End
   Begin VB.Frame boxVIZMERO 
      Caption         =   "Vízmérõ"
      Height          =   855
      Left            =   120
      TabIndex        =   7
      Top             =   6240
      Width           =   11655
   End
   Begin VB.Frame boxHOOSSZEGZO 
      Caption         =   "Hõösszegzõ"
      Height          =   855
      Left            =   120
      TabIndex        =   6
      Top             =   5280
      Width           =   11655
   End
   Begin VB.ListBox szállítónál 
      Height          =   3375
      Left            =   8280
      TabIndex        =   5
      Top             =   1770
      Width           =   3495
   End
   Begin VB.ListBox raktáron 
      Height          =   3375
      Left            =   4193
      TabIndex        =   4
      Top             =   1770
      Width           =   3495
   End
   Begin VB.ListBox felszerelve 
      Height          =   3375
      Left            =   120
      TabIndex        =   3
      Top             =   1770
      Width           =   3495
   End
   Begin VB.OptionButton optOBJTIP 
      Caption         =   "Vízmérõ"
      Height          =   195
      Index           =   1
      Left            =   240
      TabIndex        =   1
      Top             =   1080
      Width           =   1335
   End
   Begin VB.OptionButton optOBJTIP 
      Caption         =   "Érzékelõ"
      Height          =   195
      Index           =   2
      Left            =   240
      TabIndex        =   2
      Top             =   1320
      Width           =   1335
   End
   Begin VB.OptionButton optOBJTIP 
      Caption         =   "Hõösszegzõ"
      Height          =   195
      Index           =   0
      Left            =   240
      TabIndex        =   0
      Top             =   840
      Value           =   -1  'True
      Width           =   1335
   End
   Begin VB.Timer tmrVILLOG 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   600
      Top             =   0
   End
   Begin Crystal.CrystalReport rep 
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   348160
      WindowControlBox=   -1  'True
      WindowMaxButton =   -1  'True
      WindowMinButton =   -1  'True
      PrintFileLinesPerPage=   60
   End
   Begin VB.Frame frmOBJTIP 
      Height          =   975
      Left            =   120
      TabIndex        =   14
      Top             =   600
      Width           =   3615
      Begin MSForms.Label lblFRISSIT 
         Height          =   240
         Left            =   1680
         TabIndex        =   15
         Top             =   615
         Width           =   1500
         Caption         =   "Azonnali frissítés"
         Size            =   "2646;423"
         FontName        =   "Arial"
         FontHeight      =   195
         FontCharSet     =   0
         FontPitchAndFamily=   2
      End
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "S Z Á L L Í T Ó N Á L"
      Height          =   255
      Left            =   8280
      TabIndex        =   11
      Top             =   1560
      Width           =   3495
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "R A K T Á R O N"
      Height          =   255
      Left            =   4200
      TabIndex        =   10
      Top             =   1560
      Width           =   3495
   End
   Begin VB.Label lblFELSZERELVE 
      Alignment       =   2  'Center
      Caption         =   "F E L S Z E R E L V E"
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   1560
      Width           =   3495
   End
End
Attribute VB_Name = "Form001"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public iRefresh As Integer
Public sOBJTIP As String

Const HOOSSZEGZO = "18"
Const VIZORA = "19"
Const ERZEKELO = "20"

Private Sub frissit()
    If iRefresh = 1 Then
        If chkFrissit = 1 Then
            'grdMUNKALAP.Redraw = False
            'util.gridderx grdMUNKALAP, "MUNKALAP", Me
            'grdMUNKALAP.Redraw = True
        Else
            tmrVILLOG.Enabled = True
        End If
    End If
    iRefresh = 0
End Sub

Private Sub optOBJTIP_Click(Index As Integer)
    If optOBJTIP(0) Then
        sOBJTIP = HOOSSZEGZO
    ElseIf optOBJTIP(1) Then
        sOBJTIP = VIZORA
    ElseIf optOBJTIP(2) Then
        sOBJTIP = ERZEKELO
    End If
    iRefresh = 1
    frissit
End Sub

Private Sub tmrVILLOG_Timer()
    If cmdFRISSIT.Caption = "" Then
        cmdFRISSIT.Caption = "Frissítés"
    Else
        cmdFRISSIT.Caption = ""
    End If
End Sub

Private Sub cmdFRISSIT_Click()
    Screen.MousePointer = vbHourglass
    tmrVILLOG.Enabled = False
    cmdFRISSIT.Caption = "Frissítés"
    Screen.MousePointer = vbDefault
End Sub

Private Sub Form_Activate()
    'Form001.Caption = "Munkalap nyilvántartás  " & AktivForm()
    KeyPreview = True
End Sub


Private Sub Form_Load()
    Screen.MousePointer = vbHourglass
    iRefresh = 1
    sOBJTIP = "17"
    frissit
    
    'util.setcombo Me
    'datDATUMIG.Value = Date
    'datDATUMTOL.Value = DateAdd("m", -1, Date)
    'datMUNDATTOL.Value = Date
    'datMUNDATIG.Value = Date
    'datMUNDATTOL.Value = ""
    'datMUNDATIG.Value = ""
    'util.setcomboVal cmbMLAPTIP, "1"
    'util.setcomboVal cmbALLAPOT, "5"
    Screen.MousePointer = vbDefault
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
   If MsgBox("Valóban ki szeretne lépni a rendszerbõl?", _
        vbQuestion + vbYesNo, "Tisztelt felhasználó!") = vbNo _
        Then Cancel = True
End Sub

