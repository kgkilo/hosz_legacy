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
   LockControls    =   -1  'True
   ScaleHeight     =   15252.25
   ScaleMode       =   0  'User
   ScaleWidth      =   28000.63
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdSzallitonal2Felszerelt 
      Caption         =   "<<<"
      Height          =   375
      Left            =   7680
      TabIndex        =   50
      Top             =   3600
      Width           =   615
   End
   Begin VB.CommandButton cmdFelszerelt2Szallitonal 
      Caption         =   ">>>"
      Height          =   375
      Left            =   3600
      TabIndex        =   49
      Top             =   3600
      Width           =   615
   End
   Begin VB.CommandButton cmdSzallitonal2Raktar 
      Caption         =   "<"
      Height          =   375
      Left            =   7680
      TabIndex        =   48
      Top             =   2520
      Width           =   615
   End
   Begin VB.CommandButton cmdRaktar2Szallitonal 
      Caption         =   ">"
      Height          =   375
      Left            =   7680
      TabIndex        =   47
      Top             =   1920
      Width           =   615
   End
   Begin VB.CommandButton cmdRaktar2Felszerelt 
      Caption         =   "<"
      Height          =   375
      Left            =   3600
      TabIndex        =   46
      Top             =   2520
      Width           =   615
   End
   Begin VB.CommandButton cmdFelszerelt2Raktar 
      Caption         =   ">"
      Height          =   375
      Left            =   3600
      TabIndex        =   45
      Top             =   1920
      Width           =   615
   End
   Begin VB.TextBox txtE_PLOMBA 
      Height          =   285
      Left            =   9480
      TabIndex        =   41
      Top             =   7080
      Width           =   2175
   End
   Begin VB.TextBox txtE_PLOMBA2 
      Height          =   285
      Left            =   9480
      TabIndex        =   40
      Top             =   7440
      Width           =   2175
   End
   Begin VB.TextBox txtE_VEZHOSSZ 
      Height          =   285
      Left            =   9480
      TabIndex        =   39
      Top             =   6360
      Width           =   2175
   End
   Begin VB.TextBox Text16 
      Enabled         =   0   'False
      Height          =   285
      Left            =   9480
      TabIndex        =   38
      Top             =   6720
      Width           =   2175
   End
   Begin VB.TextBox txtE_BENYHOSSZ 
      Height          =   285
      Left            =   9480
      TabIndex        =   37
      Top             =   6000
      Width           =   2175
   End
   Begin VB.TextBox txtE_GYSZAM 
      Height          =   285
      Left            =   9480
      TabIndex        =   36
      Top             =   4560
      Width           =   2175
   End
   Begin VB.TextBox txtE_HITIDO 
      Height          =   285
      Left            =   9480
      TabIndex        =   35
      Top             =   4920
      Width           =   2175
   End
   Begin VB.TextBox txtE_TIPUS 
      Enabled         =   0   'False
      Height          =   285
      Left            =   9480
      TabIndex        =   34
      Top             =   5280
      Width           =   2175
   End
   Begin VB.TextBox txtE_ELHELYEZ 
      Height          =   285
      Left            =   9480
      TabIndex        =   33
      Top             =   5640
      Width           =   2175
   End
   Begin VB.TextBox txtV_KULCS 
      Height          =   285
      Left            =   5400
      TabIndex        =   32
      Top             =   7440
      Width           =   2175
   End
   Begin VB.TextBox txtV_MEGJ 
      Height          =   285
      Left            =   5400
      TabIndex        =   31
      Top             =   7800
      Width           =   2175
   End
   Begin VB.TextBox txtV_PLOMBA 
      Height          =   285
      Left            =   5400
      TabIndex        =   30
      Top             =   7080
      Width           =   2175
   End
   Begin VB.TextBox txtV_ATMERO 
      Height          =   285
      Left            =   5400
      TabIndex        =   29
      Top             =   6360
      Width           =   2175
   End
   Begin VB.TextBox Text6 
      Enabled         =   0   'False
      Height          =   285
      Left            =   5400
      TabIndex        =   28
      Top             =   6720
      Width           =   2175
   End
   Begin VB.TextBox txtV_IMPULZUS 
      Height          =   285
      Left            =   5400
      TabIndex        =   27
      Top             =   6000
      Width           =   2175
   End
   Begin VB.TextBox txtV_GYSZAM 
      Height          =   285
      Left            =   5400
      TabIndex        =   26
      Top             =   4560
      Width           =   2175
   End
   Begin VB.TextBox txtV_HITIDO 
      Height          =   285
      Left            =   5400
      TabIndex        =   25
      Top             =   4920
      Width           =   2175
   End
   Begin VB.TextBox txtV_TIPUS 
      Height          =   285
      Left            =   5400
      TabIndex        =   24
      Top             =   5280
      Width           =   2175
   End
   Begin VB.TextBox txtV_ELHELYEZ 
      Height          =   285
      Left            =   5400
      TabIndex        =   23
      Top             =   5640
      Width           =   2175
   End
   Begin VB.TextBox txtH_GYSZAM 
      Height          =   285
      Left            =   1320
      TabIndex        =   22
      Top             =   4560
      Width           =   2175
   End
   Begin VB.TextBox txtH_MEGJ 
      Height          =   285
      Left            =   1320
      TabIndex        =   21
      Top             =   7800
      Width           =   2175
   End
   Begin VB.TextBox txtH_KULCS 
      Height          =   285
      Left            =   1320
      TabIndex        =   20
      Top             =   7440
      Width           =   2175
   End
   Begin VB.TextBox txtH_PLOMBA 
      Height          =   285
      Left            =   1320
      TabIndex        =   19
      Top             =   7080
      Width           =   2175
   End
   Begin VB.TextBox txtH_FESZULT 
      Height          =   285
      Left            =   1320
      TabIndex        =   18
      Top             =   6720
      Width           =   2175
   End
   Begin VB.TextBox txtH_LEOLV 
      Height          =   285
      Left            =   1320
      TabIndex        =   17
      Top             =   6360
      Width           =   2175
   End
   Begin VB.TextBox txtH_IMPULZUS 
      Height          =   285
      Left            =   1320
      TabIndex        =   16
      Top             =   6000
      Width           =   2175
   End
   Begin VB.TextBox txtH_ELHELYEZ 
      Height          =   285
      Left            =   1320
      TabIndex        =   15
      Top             =   5640
      Width           =   2175
   End
   Begin VB.TextBox txtH_TIPUS 
      Height          =   285
      Left            =   1320
      TabIndex        =   14
      Top             =   5280
      Width           =   2175
   End
   Begin VB.TextBox txtH_HITIDO 
      Height          =   285
      Left            =   1320
      TabIndex        =   13
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
      Begin VB.Label Label11 
         Caption         =   "Szüks. h:"
         Height          =   255
         Left            =   165
         TabIndex        =   79
         Top             =   2430
         Width           =   900
      End
      Begin VB.Label lblE_VEZHOSSZ 
         Caption         =   "Hossz:"
         Height          =   255
         Left            =   165
         TabIndex        =   78
         Top             =   2070
         Width           =   900
      End
      Begin VB.Label lblE_PLOMBA2 
         Caption         =   "Plomba 2:"
         Height          =   255
         Left            =   165
         TabIndex        =   77
         Top             =   3150
         Width           =   900
      End
      Begin VB.Label lblE_PLOMBA 
         Caption         =   "Plomba 1:"
         Height          =   255
         Left            =   165
         TabIndex        =   76
         Top             =   2790
         Width           =   900
      End
      Begin VB.Label lblE_BENYHOSSZ 
         Caption         =   "Sz. hossz:"
         Height          =   255
         Left            =   165
         TabIndex        =   75
         Top             =   1710
         Width           =   900
      End
      Begin VB.Label lblE_ELHELYEZ 
         Caption         =   "Hely:"
         Height          =   255
         Left            =   165
         TabIndex        =   74
         Top             =   1350
         Width           =   900
      End
      Begin VB.Label lblE_TIPUS 
         Caption         =   "Típus:"
         Height          =   255
         Left            =   165
         TabIndex        =   73
         Top             =   990
         Width           =   900
      End
      Begin VB.Label lblE_HITIDO 
         Caption         =   "Hit. idõ:"
         Height          =   255
         Left            =   165
         TabIndex        =   72
         Top             =   630
         Width           =   900
      End
      Begin VB.Label lblE_GYSZAM 
         Caption         =   "Gy.szám:"
         Height          =   255
         Left            =   165
         TabIndex        =   71
         Top             =   270
         Width           =   915
      End
   End
   Begin VB.Frame boxVIZMERO 
      Caption         =   "Vízmérõ"
      Height          =   3920
      Left            =   4200
      TabIndex        =   4
      Top             =   4320
      Width           =   3495
      Begin VB.Label Label10 
         Caption         =   "Terv. t.á.:"
         Height          =   255
         Left            =   165
         TabIndex        =   70
         Top             =   2430
         Width           =   900
      End
      Begin VB.Label lblV_ATMERO 
         Caption         =   "Átmérõ:"
         Height          =   255
         Left            =   165
         TabIndex        =   69
         Top             =   2070
         Width           =   900
      End
      Begin VB.Label lblV_MEGJ 
         Caption         =   "Megjegyzés:"
         Height          =   255
         Left            =   165
         TabIndex        =   68
         Top             =   3510
         Width           =   900
      End
      Begin VB.Label lblV_KULCS 
         Caption         =   "Kulcs:"
         Height          =   255
         Left            =   165
         TabIndex        =   67
         Top             =   3150
         Width           =   900
      End
      Begin VB.Label lblV_PLOMBA 
         Caption         =   "Plomba:"
         Height          =   255
         Left            =   165
         TabIndex        =   66
         Top             =   2790
         Width           =   900
      End
      Begin VB.Label lblV_IMPULZUS 
         Caption         =   "Impulzus:"
         Height          =   255
         Left            =   165
         TabIndex        =   65
         Top             =   1710
         Width           =   900
      End
      Begin VB.Label lblV_ELHELYEZ 
         Caption         =   "Hely:"
         Height          =   255
         Left            =   165
         TabIndex        =   64
         Top             =   1350
         Width           =   900
      End
      Begin VB.Label lblV_TIPUS 
         Caption         =   "Típus:"
         Height          =   255
         Left            =   165
         TabIndex        =   63
         Top             =   990
         Width           =   900
      End
      Begin VB.Label lblV_HITIDO 
         Caption         =   "Hit. idõ:"
         Height          =   255
         Left            =   165
         TabIndex        =   62
         Top             =   630
         Width           =   900
      End
      Begin VB.Label lblV_GYSZAM 
         Caption         =   "Gy.szám:"
         Height          =   255
         Left            =   165
         TabIndex        =   61
         Top             =   270
         Width           =   915
      End
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
      Top             =   195
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
   Begin vsFlexLib.vsFlexArray grdFelszerelt 
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
   Begin VB.Frame boxHOOSSZEGZO 
      Caption         =   "Hõösszegzõ"
      Height          =   3920
      Left            =   150
      TabIndex        =   3
      Top             =   4320
      Width           =   3495
      Begin VB.Label lblH_MEGJ 
         Caption         =   "Megjegyzés:"
         Height          =   255
         Left            =   180
         TabIndex        =   60
         Top             =   3510
         Width           =   900
      End
      Begin VB.Label lblH_KULCS 
         Caption         =   "Kulcs:"
         Height          =   255
         Left            =   185
         TabIndex        =   59
         Top             =   3150
         Width           =   895
      End
      Begin VB.Label lblH_PLOMBA 
         Caption         =   "Plomba:"
         Height          =   255
         Left            =   185
         TabIndex        =   58
         Top             =   2790
         Width           =   895
      End
      Begin VB.Label lblH_FESZULTS 
         Caption         =   "Feszültség:"
         Height          =   255
         Left            =   185
         TabIndex        =   57
         Top             =   2430
         Width           =   895
      End
      Begin VB.Label lblH_LEOLV 
         Caption         =   "Leolvasás:"
         Height          =   255
         Left            =   185
         TabIndex        =   56
         Top             =   2070
         Width           =   895
      End
      Begin VB.Label lblH_IMPULZUS 
         Caption         =   "Impulzus:"
         Height          =   255
         Left            =   185
         TabIndex        =   55
         Top             =   1710
         Width           =   895
      End
      Begin VB.Label lblH_ELHELYEZ 
         Caption         =   "Hely:"
         Height          =   255
         Left            =   185
         TabIndex        =   54
         Top             =   1350
         Width           =   895
      End
      Begin VB.Label lblH_TIPUS 
         Caption         =   "Típus:"
         Height          =   255
         Left            =   185
         TabIndex        =   53
         Top             =   990
         Width           =   895
      End
      Begin VB.Label lblH_HITIDO 
         Caption         =   "Hit. idõ:"
         Height          =   255
         Left            =   185
         TabIndex        =   52
         Top             =   630
         Width           =   895
      End
      Begin VB.Label lblH_GYSZAM 
         Caption         =   "Gy.szám:"
         Height          =   255
         Left            =   165
         TabIndex        =   51
         Top             =   270
         Width           =   915
      End
   End
   Begin VB.Label lblSZALLITONAL 
      Alignment       =   2  'Center
      Caption         =   "S Z Á L L Í T Ó N Á L"
      Height          =   255
      Left            =   8280
      TabIndex        =   8
      Top             =   1200
      Width           =   3495
   End
   Begin VB.Label lblRAKTARON 
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

Private Sub cmdFelszerelt2Szallitonal_Click()
    util.athelyez "Felszerelt", "Szallito", grdFelszerelt.TextMatrix(grdFelszerelt.Row, 1)
    frissit
End Sub

Private Sub cmdFelszerelt2Raktar_Click()
    util.athelyez "Felszerelt", "Raktar", grdFelszerelt.TextMatrix(grdFelszerelt.Row, 1)
    frissit
End Sub

Private Sub cmdRaktar2Felszerelt_Click()
    util.athelyez "Raktar", "Felszerelt", grdRaktaron.TextMatrix(grdRaktaron.Row, 1)
    frissit
End Sub

Private Sub cmdRaktar2Szallitonal_Click()
    util.athelyez "Raktar", "Szallito", grdRaktaron.TextMatrix(grdRaktaron.Row, 1)
    frissit
End Sub

Private Sub cmdSzallitonal2Felszerelt_Click()
    util.athelyez "Szallito", "Felszerelt", grdSzallitonal.TextMatrix(grdSzallitonal.Row, 1)
    frissit
End Sub

Private Sub cmdSzallitonal2Raktar_Click()
    util.athelyez "Szallito", "Raktar", grdSzallitonal.TextMatrix(grdSzallitonal.Row, 1)
    frissit
End Sub

Private Sub Form_Initialize()
    sReportDir = "J:\GABOR\WORK\HOSZOLG"
    Set util = CreateObject("Rakt.Global")
    util.Init sReportDir
End Sub

Private Sub grdFelszerelt_SelChange()
    InfoTorol
    util.LoadInfo Me, grdFelszerelt.TextMatrix(grdFelszerelt.Row, 1), "Felszerelt"
End Sub

Private Sub grdRaktaron_SelChange()
    InfoTorol
    util.LoadInfo Me, grdRaktaron.TextMatrix(grdRaktaron.Row, 1), "Raktar"
End Sub

Private Sub grdSzallitonal_SelChange()
    InfoTorol
    util.LoadInfo Me, grdSzallitonal.TextMatrix(grdSzallitonal.Row, 1), "Szallitonal"
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

Private Sub frissit()
    If iRefresh = 1 Then
        If chkFrissit = 1 Then
            GridFeltolt
        Else
            tmrVILLOG.Enabled = True
        End If
    End If
    'iRefresh = 0
End Sub

Private Sub GridFeltolt()
    Screen.MousePointer = vbHourglass
    
    grdFelszerelt.Redraw = False
    grdRaktaron.Redraw = False
    grdSzallitonal.Redraw = False
    
    util.Gridder grdFelszerelt, "FELSZERELT", sOBJTIP, Me
    util.Gridder grdRaktaron, "RAKTAR", sOBJTIP, Me
    util.Gridder grdSzallitonal, "SZALLITONAL", sOBJTIP, Me
    
    grdFelszerelt.Redraw = True
    grdRaktaron.Redraw = True
    grdSzallitonal.Redraw = True
    
    Screen.MousePointer = vbDefault
End Sub

Private Sub InfoTorol()
    Dim oControl As Control
    For Each oControl In Controls
        Select Case Left(oControl.Name, 5)
            Case "txtH_", "txtV_", "txtE_"
                oControl.Text = ""
        End Select
    Next
End Sub
