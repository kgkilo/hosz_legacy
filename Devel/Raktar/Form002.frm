VERSION 5.00
Object = "{00025600-0000-0000-C000-000000000046}#5.1#0"; "crystl32.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Object = "{8AE029D0-08E3-11D1-BAA2-444553540000}#3.0#0"; "VSFLEX3.OCX"
Begin VB.Form Form002 
   Caption         =   "Raktár nyilvántartás"
   ClientHeight    =   8595
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   8595
   ScaleWidth      =   11880
   WindowState     =   2  'Maximized
   Begin VB.Frame frmERZEKELO 
      Caption         =   "Érzékelõ"
      Height          =   2115
      Left            =   8505
      TabIndex        =   23
      Top             =   6300
      Width           =   3270
      Begin VB.TextBox txtE_PLOMBA 
         Height          =   285
         Left            =   945
         TabIndex        =   35
         Top             =   1260
         Width           =   1170
      End
      Begin VB.TextBox txtE_HITIDO 
         Height          =   285
         Left            =   945
         TabIndex        =   34
         Top             =   945
         Width           =   1170
      End
      Begin VB.TextBox txtE_TIPUS 
         Height          =   285
         Left            =   945
         TabIndex        =   33
         Top             =   630
         Width           =   1170
      End
      Begin VB.TextBox txtE_GYSZAM 
         Height          =   285
         Left            =   945
         TabIndex        =   32
         Top             =   315
         Width           =   1170
      End
   End
   Begin VB.Frame frmVIZMERO 
      Caption         =   "Vízmérõ"
      Height          =   2115
      Left            =   5040
      TabIndex        =   22
      Top             =   6300
      Width           =   3270
      Begin VB.TextBox txtV_PLOMBA 
         Height          =   285
         Left            =   945
         TabIndex        =   31
         Top             =   1260
         Width           =   1170
      End
      Begin VB.TextBox txtV_HITIDO 
         Height          =   285
         Left            =   945
         TabIndex        =   30
         Top             =   945
         Width           =   1170
      End
      Begin VB.TextBox txtV_TIPUS 
         Height          =   285
         Left            =   945
         TabIndex        =   29
         Top             =   630
         Width           =   1170
      End
      Begin VB.TextBox txtV_GYSZAM 
         Height          =   285
         Left            =   945
         TabIndex        =   28
         Top             =   315
         Width           =   1170
      End
   End
   Begin VB.Frame frmHOOSSZEGZO 
      Caption         =   "Hõösszegzõ"
      Height          =   2115
      Left            =   1575
      TabIndex        =   21
      Top             =   6300
      Width           =   3270
      Begin VB.TextBox txtH_PLOMBA 
         Height          =   285
         Left            =   945
         TabIndex        =   27
         Top             =   1260
         Width           =   1170
      End
      Begin VB.TextBox txtH_HITIDO 
         Height          =   285
         Left            =   945
         TabIndex        =   26
         Top             =   945
         Width           =   1170
      End
      Begin VB.TextBox txtH_TIPUS 
         Height          =   285
         Left            =   945
         TabIndex        =   25
         Top             =   630
         Width           =   1170
      End
      Begin VB.TextBox txtH_GYSZAM 
         Height          =   285
         Left            =   945
         TabIndex        =   24
         Top             =   315
         Width           =   1170
      End
   End
   Begin VB.TextBox txtSZLEVEL_SZAM 
      Height          =   330
      Left            =   8715
      TabIndex        =   17
      Top             =   1680
      Width           =   2220
   End
   Begin VB.ComboBox cmbMove 
      Height          =   315
      Left            =   3516
      TabIndex        =   10
      Tag             =   "367"
      Top             =   2715
      Width           =   3000
   End
   Begin VB.CommandButton cmdMove 
      Caption         =   "Mozgatás"
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
      Left            =   2205
      TabIndex        =   9
      ToolTipText     =   "F 5"
      Top             =   2715
      Width           =   1275
   End
   Begin VB.ComboBox cmbALLAPOT 
      Height          =   315
      Left            =   3516
      TabIndex        =   8
      Tag             =   "367"
      Top             =   855
      Width           =   3000
   End
   Begin VB.CheckBox chkFrissit 
      Height          =   285
      Left            =   770
      TabIndex        =   6
      TabStop         =   0   'False
      Top             =   2205
      Width           =   285
   End
   Begin VB.OptionButton optOBJTIP 
      Caption         =   "Hõösszegzõ"
      Height          =   195
      Index           =   0
      Left            =   385
      TabIndex        =   5
      ToolTipText     =   "Lenti 3 listára kerülõ berendezés típusok"
      Top             =   900
      Value           =   -1  'True
      Width           =   1335
   End
   Begin VB.OptionButton optOBJTIP 
      Caption         =   "Érzékelõ"
      Height          =   195
      Index           =   2
      Left            =   385
      TabIndex        =   4
      ToolTipText     =   "Lenti 3 listára kerülõ berendezés típusok"
      Top             =   1470
      Width           =   1335
   End
   Begin VB.OptionButton optOBJTIP 
      Caption         =   "Vízmérõ"
      Height          =   195
      Index           =   1
      Left            =   385
      TabIndex        =   3
      ToolTipText     =   "Lenti 3 listára kerülõ berendezés típusok"
      Top             =   1155
      Width           =   1335
   End
   Begin VB.CommandButton cmdEXIT 
      Caption         =   "Kilépés"
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
      Left            =   128
      TabIndex        =   1
      ToolTipText     =   "E s c "
      Top             =   8040
      Width           =   1275
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
      Left            =   128
      TabIndex        =   0
      ToolTipText     =   "F 5"
      Top             =   3195
      Width           =   1275
   End
   Begin VB.Timer tmrVILLOG 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   450
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
   Begin vsFlexLib.vsFlexArray grdGrid 
      Height          =   2985
      Left            =   1635
      TabIndex        =   2
      Top             =   3195
      Width           =   10095
      _Version        =   196608
      _ExtentX        =   17806
      _ExtentY        =   5265
      _StockProps     =   228
      Appearance      =   1
      ConvInfo        =   1418783674
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
      Left            =   8715
      TabIndex        =   18
      Top             =   2100
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
      Format          =   23134209
      CurrentDate     =   38353
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
      Left            =   7140
      TabIndex        =   20
      Tag             =   "007"
      Top             =   1695
      Width           =   1515
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
      Left            =   7140
      TabIndex        =   19
      Tag             =   "007"
      Top             =   2115
      Width           =   1515
   End
   Begin MSForms.ComboBox cmbDOLG_ID 
      Height          =   315
      Left            =   8730
      TabIndex        =   16
      Tag             =   "334"
      Top             =   1260
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
   Begin VB.Label lblDOLG_ID 
      Alignment       =   1  'Right Justify
      Caption         =   "Dolgozó:"
      Height          =   255
      Left            =   7140
      TabIndex        =   15
      Top             =   1305
      Width           =   1515
   End
   Begin VB.Label lblUGYFELFORM 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "RAKTÁR"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   16.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000001&
      Height          =   420
      Index           =   0
      Left            =   5604
      TabIndex        =   14
      Top             =   45
      Width           =   2665
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H8000000A&
      DrawMode        =   1  'Blackness
      Height          =   2085
      Left            =   105
      Shape           =   4  'Rounded Rectangle
      Top             =   540
      Width           =   12345
   End
   Begin VB.Label lblALLAPOT 
      Alignment       =   1  'Right Justify
      Caption         =   "Állapot:"
      Height          =   240
      Index           =   0
      Left            =   1782
      TabIndex        =   13
      Top             =   900
      Width           =   1654
   End
   Begin VB.Label lblEPUL 
      Alignment       =   1  'Right Justify
      Caption         =   "Épület:"
      Height          =   255
      Left            =   7130
      TabIndex        =   12
      Top             =   900
      Width           =   1509
   End
   Begin MSForms.ComboBox cmbEPUL 
      Height          =   315
      Left            =   8720
      TabIndex        =   11
      Tag             =   "EPUL"
      Top             =   855
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
   Begin MSForms.Label lblFRISSIT 
      Height          =   240
      Left            =   150
      TabIndex        =   7
      Top             =   1875
      Width           =   1500
      Caption         =   "Azonnali frissítés"
      Size            =   "2646;423"
      FontName        =   "Arial"
      FontHeight      =   195
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
End
Attribute VB_Name = "Form002"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public iRefresh As Integer
Public sOBJTIP As String

Public iReturn As Integer
Public lDOLG_ID As Long
Public strSZLEVEL_SZAM As String
Public strSZLEVEL_DATUM As String
Public strMEGJ As String
Public strKovetkezoAllapot As String
    
Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdFRISSIT_Click()
    tmrVILLOG.Enabled = False
    cmdFRISSIT.Caption = "Frissítés"
    GridFeltolt
End Sub

Private Sub cmdMove_Click()
    strKovetkezoAllapot = util.getComboErtek(cmbMove)
    Select Case strKovetkezoAllapot
        Case "D":
            Form002Dolg.Show vbModal
        Case "E", "J":
            Form002Szall.Show vbModal
        Case Else:
            Form002Egyeb.Show vbModal
    End Select
    
    If iReturn = vbOK Then
        util.setAllapot grdGrid.TextMatrix(grdGrid.Row, 1), strKovetkezoAllapot, _
            lDOLG_ID, strSZLEVEL_SZAM, strSZLEVEL_DATUM, strMEGJ
    End If
End Sub

Private Sub grdGrid_SelChange()
    util.LoadInfo Me, grdGrid.TextMatrix(grdGrid.Row, 1)
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

Private Sub Form_Activate()
    KeyPreview = True
End Sub


Private Sub Form_Load()
    Screen.MousePointer = vbHourglass
    
    util.setcombo Me
    iRefresh = 1
    sOBJTIP = HOOSSZEGZO
    frissit
    grdGrid.Rows = 1
    
    Screen.MousePointer = vbDefault
End Sub


Private Sub GridFeltolt()
    Screen.MousePointer = vbHourglass
    
    grdGrid.Redraw = False
    
    util.Gridder grdGrid, sOBJTIP, util.getComboErtek(cmbALLAPOT), Me
    
    grdGrid.Redraw = True
    grdGrid.ExtendLastCol = True
    
    Screen.MousePointer = vbDefault
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

