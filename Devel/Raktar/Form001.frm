VERSION 5.00
Object = "{00025600-0000-0000-C000-000000000046}#5.1#0"; "crystl32.ocx"
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Object = "{8AE029D0-08E3-11D1-BAA2-444553540000}#3.0#0"; "Vsflex3.ocx"
Begin VB.Form Form001 
   Caption         =   "Raktár"
   ClientHeight    =   8100
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   8880
   LinkTopic       =   "Form1"
   ScaleHeight     =   8100
   ScaleMode       =   0  'User
   ScaleWidth      =   9506.57
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.TextBox Text19 
      Height          =   285
      Left            =   9480
      TabIndex        =   41
      Text            =   "Plomba száma 1"
      Top             =   7080
      Width           =   2175
   End
   Begin VB.TextBox Text18 
      Height          =   285
      Left            =   9480
      TabIndex        =   40
      Text            =   "Plomba száma 2"
      Top             =   7440
      Width           =   2175
   End
   Begin VB.TextBox Text17 
      Height          =   285
      Left            =   9480
      TabIndex        =   39
      Text            =   "Hossz"
      Top             =   6360
      Width           =   2175
   End
   Begin VB.TextBox Text16 
      Height          =   285
      Left            =   9480
      TabIndex        =   38
      Text            =   "Szükséges hossz"
      Top             =   6720
      Width           =   2175
   End
   Begin VB.TextBox Text15 
      Height          =   285
      Left            =   9480
      TabIndex        =   37
      Text            =   "Szonda hossza"
      Top             =   6000
      Width           =   2175
   End
   Begin VB.TextBox Text14 
      Height          =   285
      Left            =   9480
      TabIndex        =   36
      Text            =   "Gy.szám"
      Top             =   4560
      Width           =   2175
   End
   Begin VB.TextBox Text13 
      Height          =   285
      Left            =   9480
      TabIndex        =   35
      Text            =   "Hit. idõ"
      Top             =   4920
      Width           =   2175
   End
   Begin VB.TextBox Text12 
      Height          =   285
      Left            =   9480
      TabIndex        =   34
      Text            =   "Típus"
      Top             =   5280
      Width           =   2175
   End
   Begin VB.TextBox Text11 
      Height          =   285
      Left            =   9480
      TabIndex        =   33
      Text            =   "Elhelyezkedés"
      Top             =   5640
      Width           =   2175
   End
   Begin VB.TextBox Text10 
      Height          =   285
      Left            =   5400
      TabIndex        =   32
      Text            =   "Kulcs található"
      Top             =   7440
      Width           =   2175
   End
   Begin VB.TextBox Text9 
      Height          =   285
      Left            =   5400
      TabIndex        =   31
      Text            =   "Megjegyzés"
      Top             =   7800
      Width           =   2175
   End
   Begin VB.TextBox Text8 
      Height          =   285
      Left            =   5400
      TabIndex        =   30
      Text            =   "Plomba száma"
      Top             =   7080
      Width           =   2175
   End
   Begin VB.TextBox Text7 
      Height          =   285
      Left            =   5400
      TabIndex        =   29
      Text            =   "Átmérõ"
      Top             =   6360
      Width           =   2175
   End
   Begin VB.TextBox Text6 
      Height          =   285
      Left            =   5400
      TabIndex        =   28
      Text            =   "Terv. t.á.m."
      Top             =   6720
      Width           =   2175
   End
   Begin VB.TextBox Text5 
      Height          =   285
      Left            =   5400
      TabIndex        =   27
      Text            =   "Impulzus"
      Top             =   6000
      Width           =   2175
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   5400
      TabIndex        =   26
      Text            =   "Gy.szám"
      Top             =   4560
      Width           =   2175
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   5400
      TabIndex        =   25
      Text            =   "Hit. idõ"
      Top             =   4920
      Width           =   2175
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   5400
      TabIndex        =   24
      Text            =   "Típus"
      Top             =   5280
      Width           =   2175
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   5400
      TabIndex        =   23
      Text            =   "Elhelyezkedés"
      Top             =   5640
      Width           =   2175
   End
   Begin VB.TextBox txtGYSZAM 
      Height          =   285
      Left            =   1320
      TabIndex        =   22
      Text            =   "Gy.szám"
      Top             =   4560
      Width           =   2175
   End
   Begin VB.TextBox txtMEGJ 
      Height          =   285
      Left            =   1320
      TabIndex        =   21
      Text            =   "Megjegyzés"
      Top             =   7800
      Width           =   2175
   End
   Begin VB.TextBox txtKULCS 
      Height          =   285
      Left            =   1320
      TabIndex        =   20
      Text            =   "Kulcs található"
      Top             =   7440
      Width           =   2175
   End
   Begin VB.TextBox txtPLOMBA 
      Height          =   285
      Left            =   1320
      TabIndex        =   19
      Text            =   "Plomba száma"
      Top             =   7080
      Width           =   2175
   End
   Begin VB.TextBox txtFESZULT 
      Height          =   285
      Left            =   1320
      TabIndex        =   18
      Text            =   "Feszültség"
      Top             =   6720
      Width           =   2175
   End
   Begin VB.TextBox txtLEOLV 
      Height          =   285
      Left            =   1320
      TabIndex        =   17
      Text            =   "Leolvasás módja"
      Top             =   6360
      Width           =   2175
   End
   Begin VB.TextBox txtIMPULZUS 
      Height          =   285
      Left            =   1320
      TabIndex        =   16
      Text            =   "Impulzus"
      Top             =   6000
      Width           =   2175
   End
   Begin VB.TextBox txtELHELYEZ 
      Height          =   285
      Left            =   1320
      TabIndex        =   15
      Text            =   "Elhelyezkedés"
      Top             =   5640
      Width           =   2175
   End
   Begin VB.TextBox txtTIPUS 
      Height          =   285
      Left            =   1320
      TabIndex        =   14
      Text            =   "Típus"
      Top             =   5280
      Width           =   2175
   End
   Begin VB.TextBox txtHITIDO 
      Height          =   285
      Left            =   1320
      TabIndex        =   13
      Text            =   "Hit. idõ"
      Top             =   4920
      Width           =   2175
   End
   Begin VB.CheckBox chkFrissit 
      Height          =   285
      Left            =   3240
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   735
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
      Left            =   1680
      TabIndex        =   9
      ToolTipText     =   "F 5"
      Top             =   360
      Width           =   1755
   End
   Begin VB.Frame boxERZEKELO 
      Caption         =   "Érzékelõ"
      Height          =   3920
      Left            =   8280
      TabIndex        =   5
      Top             =   4320
      Width           =   3495
   End
   Begin VB.Frame boxVIZMERO 
      Caption         =   "Vízmérõ"
      Height          =   3920
      Left            =   4200
      TabIndex        =   4
      Top             =   4320
      Width           =   3495
   End
   Begin VB.Frame boxHOOSSZEGZO 
      Caption         =   "Hõösszegzõ"
      Height          =   3920
      Left            =   120
      TabIndex        =   3
      Top             =   4320
      Width           =   3495
   End
   Begin VB.OptionButton optOBJTIP 
      Caption         =   "Vízmérõ"
      Height          =   195
      Index           =   1
      Left            =   240
      TabIndex        =   1
      Top             =   600
      Width           =   1335
   End
   Begin VB.OptionButton optOBJTIP 
      Caption         =   "Érzékelõ"
      Height          =   195
      Index           =   2
      Left            =   240
      TabIndex        =   2
      Top             =   840
      Width           =   1335
   End
   Begin VB.OptionButton optOBJTIP 
      Caption         =   "Hõösszegzõ"
      Height          =   195
      Index           =   0
      Left            =   240
      TabIndex        =   0
      Top             =   360
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
      TabIndex        =   11
      Top             =   120
      Width           =   3495
      Begin MSForms.Label lblFRISSIT 
         Height          =   240
         Left            =   1560
         TabIndex        =   12
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
   Begin vsFlexLib.vsFlexArray grdRaktaron 
      Height          =   2790
      Left            =   4200
      TabIndex        =   42
      Top             =   1440
      Width           =   3495
      _Version        =   196608
      _ExtentX        =   6165
      _ExtentY        =   4921
      _StockProps     =   228
      Appearance      =   1
      ConvInfo        =   1413783674
   End
   Begin vsFlexLib.vsFlexArray grdFelszerelve 
      Height          =   2790
      Left            =   120
      TabIndex        =   43
      Top             =   1440
      Width           =   3495
      _Version        =   196608
      _ExtentX        =   6165
      _ExtentY        =   4921
      _StockProps     =   228
      Appearance      =   1
      ConvInfo        =   1413783674
   End
   Begin vsFlexLib.vsFlexArray grdSzallitonal 
      Height          =   2790
      Left            =   8280
      TabIndex        =   44
      Top             =   1440
      Width           =   3495
      _Version        =   196608
      _ExtentX        =   6165
      _ExtentY        =   4921
      _StockProps     =   228
      Appearance      =   1
      ConvInfo        =   1413783674
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "S Z Á L L Í T Ó N Á L"
      Height          =   255
      Left            =   8280
      TabIndex        =   8
      Top             =   1200
      Width           =   3495
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "R A K T Á R O N"
      Height          =   255
      Left            =   4200
      TabIndex        =   7
      Top             =   1200
      Width           =   3495
   End
   Begin VB.Label lblFELSZERELVE 
      Alignment       =   2  'Center
      Caption         =   "F E L S Z E R E L V E"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   1200
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
            GridFeltolt
        Else
            tmrVILLOG.Enabled = True
        End If
    End If
    iRefresh = 0
End Sub

Private Sub Form_Initialize()
    sReportDir = "J:\GABOR\WORK\HOSZOLG"
    Set util = CreateObject("Rakt.Global")
    util.Init sReportDir
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
    tmrVILLOG.Enabled = False
    cmdFRISSIT.Caption = "Frissítés"
    GridFeltolt
End Sub

Private Sub Form_Activate()
    'Form001.Caption = "Munkalap nyilvántartás  " & AktivForm()
    KeyPreview = True
End Sub


Private Sub Form_Load()
    Screen.MousePointer = vbHourglass
    iRefresh = 1
    sOBJTIP = HOOSSZEGZO
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

Private Sub GridFeltolt()
    Screen.MousePointer = vbHourglass
    
    grdFelszerelve.Redraw = False
    grdRaktaron.Redraw = False
    grdSzallitonal.Redraw = False
    
    util.Gridder grdFelszerelve, "FELSZERELVE", sOBJTIP, Me
    util.Gridder grdRaktaron, "RAKTAR", sOBJTIP, Me
    util.Gridder grdSzallitonal, "SZALLITONAL", sOBJTIP, Me
    
    grdFelszerelve.Redraw = True
    grdRaktaron.Redraw = True
    grdSzallitonal.Redraw = True
    
    Screen.MousePointer = vbDefault
End Sub
