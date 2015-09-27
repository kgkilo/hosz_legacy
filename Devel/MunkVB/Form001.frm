VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{00025600-0000-0000-C000-000000000046}#5.1#0"; "crystl32.ocx"
Object = "{8AE029D0-08E3-11D1-BAA2-444553540000}#3.0#0"; "VSFLEX3.OCX"
Begin VB.Form Form001 
   ClientHeight    =   8595
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   238
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form001.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   8595
   ScaleMode       =   0  'User
   ScaleWidth      =   12718.25
   StartUpPosition =   3  'Windows Default
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdMASOL 
      Caption         =   "Másolat"
      Enabled         =   0   'False
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
      Left            =   120
      TabIndex        =   7
      ToolTipText     =   "Munkalapok összekapcsolása (plombázás)"
      Top             =   7155
      Width           =   1275
   End
   Begin VB.TextBox txtMUNKALAPID 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Left            =   3285
      MaxLength       =   10
      TabIndex        =   14
      Top             =   2925
      Width           =   1050
   End
   Begin VB.CommandButton cmdCSOPLIST 
      Caption         =   "Csop. nyomt"
      Enabled         =   0   'False
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
      Left            =   120
      TabIndex        =   6
      ToolTipText     =   "Csoportos nyomtatás"
      Top             =   6540
      Width           =   1275
   End
   Begin VB.CommandButton cmdUJ 
      Caption         =   "Új munkalap"
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
      Left            =   120
      TabIndex        =   2
      ToolTipText     =   "I n s e r t"
      Top             =   4110
      Width           =   1275
   End
   Begin VB.CommandButton cmdMODOSIT 
      Caption         =   "Módosítás"
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
      Left            =   120
      TabIndex        =   3
      ToolTipText     =   "F 2"
      Top             =   4725
      Width           =   1275
   End
   Begin VB.CommandButton cmdVISSZAI 
      Caption         =   "Visszaírás"
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
      Left            =   120
      TabIndex        =   4
      Top             =   5325
      Width           =   1275
   End
   Begin VB.CommandButton cmdLIST 
      Caption         =   "Nyomtatás"
      Enabled         =   0   'False
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
      Left            =   120
      TabIndex        =   5
      ToolTipText     =   "Egyedi munkalap nyomtatása"
      Top             =   5940
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
      Left            =   120
      TabIndex        =   1
      ToolTipText     =   "F 5"
      Top             =   3510
      Width           =   1275
   End
   Begin VB.TextBox txtMUNOSZ 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   360
      Locked          =   -1  'True
      TabIndex        =   38
      TabStop         =   0   'False
      Top             =   1575
      Width           =   960
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
      Left            =   120
      TabIndex        =   23
      ToolTipText     =   "E s c "
      Top             =   8040
      Width           =   1275
   End
   Begin VB.TextBox txtTALALAT 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000004&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   360
      Locked          =   -1  'True
      TabIndex        =   27
      TabStop         =   0   'False
      Top             =   900
      Width           =   960
   End
   Begin VB.Timer tmrVILLOG 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   2382
      Top             =   90
   End
   Begin VB.CheckBox chkFrissit 
      Height          =   285
      Left            =   720
      TabIndex        =   22
      TabStop         =   0   'False
      Top             =   2565
      Width           =   285
   End
   Begin vsFlexLib.vsFlexArray grdMUNKALAP 
      Height          =   4875
      Left            =   1530
      TabIndex        =   0
      Top             =   3510
      Width           =   10095
      _Version        =   196608
      _ExtentX        =   17806
      _ExtentY        =   8599
      _StockProps     =   228
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Appearance      =   1
      ConvInfo        =   1418783674
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
   Begin MSComCtl2.DTPicker datMUNDATTOL 
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
      Left            =   8145
      TabIndex        =   19
      Top             =   2475
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
      Format          =   23068673
      CurrentDate     =   37013
   End
   Begin MSComCtl2.DTPicker datMUNDATIG 
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
      Left            =   9945
      TabIndex        =   20
      Top             =   2475
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
      Format          =   23068673
      CurrentDate     =   37013
   End
   Begin MSComCtl2.DTPicker datDATUMTOL 
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
      Left            =   3285
      TabIndex        =   12
      Top             =   2482
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
      Format          =   23068673
      CurrentDate     =   37013
   End
   Begin MSComCtl2.DTPicker datDATUMIG 
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
      Left            =   5085
      TabIndex        =   13
      Top             =   2482
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
      Format          =   23068673
      CurrentDate     =   37013
   End
   Begin MSComCtl2.DTPicker datMUNELV 
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "yyyy. MM. dd."
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1038
         SubFormatType   =   0
      EndProperty
      Height          =   330
      Left            =   5085
      TabIndex        =   42
      Top             =   2925
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
      Format          =   23068673
      CurrentDate     =   37013
   End
   Begin VB.Label lblMUNELV 
      Alignment       =   1  'Right Justify
      Caption         =   "Végezh.:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   3465
      TabIndex        =   43
      Top             =   2970
      Width           =   1650
   End
   Begin MSForms.ComboBox cmbTELEPHSZ 
      Height          =   315
      Left            =   8145
      TabIndex        =   21
      Tag             =   "TELEPHSZ"
      Top             =   2925
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
   Begin VB.Line Line1 
      X1              =   5178.297
      X2              =   5322.823
      Y1              =   2640
      Y2              =   2640
   End
   Begin VB.Label lblTELEPHSZ 
      Alignment       =   1  'Right Justify
      Caption         =   "Telepítési helyszám"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   6435
      TabIndex        =   41
      Top             =   2970
      Width           =   1650
   End
   Begin VB.Label lblMUNKALAPID 
      Alignment       =   1  'Right Justify
      Caption         =   "Munkalap száma"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   1575
      TabIndex        =   40
      Top             =   2970
      Width           =   1650
   End
   Begin MSForms.Label lblMUNOSZ 
      Height          =   240
      Left            =   405
      TabIndex        =   39
      Top             =   1305
      Width           =   915
      Caption         =   "Munkaóra"
      Size            =   "1614;423"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
   End
   Begin VB.Label lblMUNDAT 
      Alignment       =   1  'Right Justify
      Caption         =   "Visszaírás dátuma"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   6435
      TabIndex        =   37
      Top             =   2520
      Width           =   1650
   End
   Begin VB.Line Line2 
      X1              =   10381.22
      X2              =   10525.74
      Y1              =   2640
      Y2              =   2640
   End
   Begin VB.Label lblMUNIDO 
      Alignment       =   1  'Right Justify
      Caption         =   "Kiállítás dátuma"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   1575
      TabIndex        =   36
      Top             =   2520
      Width           =   1650
   End
   Begin VB.Label lblKAPCSOLAT 
      Alignment       =   1  'Right Justify
      Caption         =   "Dolgozó"
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
      Index           =   5
      Left            =   6660
      TabIndex        =   35
      Top             =   2115
      Width           =   1410
   End
   Begin MSForms.ComboBox cmbDOLGID 
      Height          =   315
      Left            =   8145
      TabIndex        =   18
      Tag             =   "334"
      Top             =   2070
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
   Begin VB.Label lblKAPCSOLAT 
      Alignment       =   1  'Right Justify
      Caption         =   "Berendezés megn."
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
      Left            =   6660
      TabIndex        =   34
      Top             =   1710
      Width           =   1410
   End
   Begin VB.Label lblALLAPOT 
      Alignment       =   1  'Right Justify
      Caption         =   "Állapot jelzõ"
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
      Index           =   0
      Left            =   6660
      TabIndex        =   33
      Top             =   900
      Width           =   1410
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
      Left            =   6660
      TabIndex        =   32
      Top             =   1275
      Width           =   1410
   End
   Begin MSForms.ComboBox cmbALLAPOT 
      Height          =   315
      Left            =   8145
      TabIndex        =   15
      Tag             =   "335"
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
   Begin MSForms.ComboBox cmbOBJTIP 
      Height          =   315
      Left            =   8145
      TabIndex        =   16
      Tag             =   "296"
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
   Begin MSForms.ComboBox cmbOBJID 
      Height          =   315
      Left            =   8145
      TabIndex        =   17
      Tag             =   "MEGNEV"
      Top             =   1665
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
   Begin VB.Label lblMLAPTIP 
      Alignment       =   1  'Right Justify
      Caption         =   "Munkalap típus"
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
      Index           =   2
      Left            =   1800
      TabIndex        =   31
      Top             =   2115
      Width           =   1410
   End
   Begin MSForms.ComboBox cmbMLAPTIP 
      Height          =   315
      Left            =   3285
      TabIndex        =   11
      Tag             =   "337"
      Top             =   2070
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
   Begin VB.Label lblFSZAM 
      Alignment       =   1  'Right Justify
      Caption         =   "Fõkönyvi szám"
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
      Index           =   0
      Left            =   1800
      TabIndex        =   30
      Top             =   1710
      Width           =   1410
   End
   Begin MSForms.ComboBox cmbFSZAM 
      Height          =   315
      Left            =   3285
      TabIndex        =   10
      Tag             =   "310a"
      Top             =   1665
      Width           =   3255
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "5741;556"
      ListWidth       =   10000
      ColumnCount     =   2
      cColumnInfo     =   2
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      Object.Width           =   "2000;8000"
   End
   Begin MSForms.Label lblFRISSIT 
      Height          =   240
      Left            =   135
      TabIndex        =   29
      Top             =   2295
      Width           =   1500
      Caption         =   "Azonnali frissítés"
      Size            =   "2646;423"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
   End
   Begin MSForms.Label lblTALALAT 
      Height          =   240
      Left            =   450
      TabIndex        =   28
      Top             =   630
      Width           =   825
      Caption         =   "Találatok"
      Size            =   "1455;423"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      ParagraphAlign  =   3
   End
   Begin MSForms.ComboBox cmbTIPUSH 
      Height          =   315
      Left            =   3285
      TabIndex        =   9
      Tag             =   "293"
      Top             =   1260
      Width           =   3255
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "5741;556"
      ListWidth       =   10000
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
   End
   Begin MSForms.ComboBox cmbSZOLGJELL 
      Height          =   315
      Left            =   3285
      TabIndex        =   8
      Tag             =   "291"
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
   Begin VB.Shape Shape1 
      BorderColor     =   &H8000000A&
      DrawMode        =   1  'Blackness
      Height          =   2850
      Left            =   90
      Shape           =   4  'Rounded Rectangle
      Top             =   540
      Width           =   11535
   End
   Begin VB.Label lblUGYFELFORM 
      BackStyle       =   0  'Transparent
      Caption         =   "Munkalapok"
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
      Left            =   5235
      TabIndex        =   26
      Top             =   45
      Width           =   2490
   End
   Begin VB.Label lblSZOLGJELL 
      Alignment       =   1  'Right Justify
      Caption         =   "Szolgáltatás jellege"
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
      Index           =   0
      Left            =   1665
      TabIndex        =   25
      Top             =   870
      Width           =   1545
   End
   Begin VB.Label lblTIPUSH 
      Alignment       =   1  'Right Justify
      Caption         =   "Típus hiba"
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
      Left            =   1800
      TabIndex        =   24
      Top             =   1305
      Width           =   1410
   End
End
Attribute VB_Name = "Form001"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' $Id

Public iRefresh As Integer

Private Sub frissit()
    If iRefresh = 1 Then
        If chkFrissit = 1 Then
            grdMUNKALAP.Redraw = False
            util.GridderX grdMUNKALAP, "MUNKALAP", Me
            grdMUNKALAP.Redraw = True
        Else
            tmrVILLOG.Enabled = True
        End If
    End If
    iRefresh = 0
End Sub

Private Sub cmbOBJTIP_Change()
    If cmbOBJTIP.ListIndex <> -1 Then
        Screen.MousePointer = vbHourglass
        util.MegnevFeltolt cmbOBJID, cmbOBJTIP, "MEGNEV"
        util.TelephszFeltolt cmbTELEPHSZ, cmbOBJTIP, "TELEPHSZ"
        Screen.MousePointer = vbDefault
    End If
End Sub

Private Sub cmbOBJTIP_GotFocus()
    cmbOBJTIP = Null
    cmbOBJID = Null
    cmbTELEPHSZ = Null
End Sub

Private Sub cmdCSOPLIST_Click()
    If MsgBox("Biztosan nyomtatni szeretné a választott munkalapokat?", vbYesNo + vbExclamation, "Tisztelt felhasználó!") = vbYes Then
        Dim i As Integer
        With grdMUNKALAP
            If GetComboErtek(cmbMLAPTIP) = 1 Then
                For i = 1 To grdMUNKALAP.Rows - 1
                    util.PrintMunkalap "1", .TextMatrix(i, 1)
                    Nyomtat "munuf.rpt", 1
                    util.MunkalapAllapot .TextMatrix(i, 1), 2
                Next i
            Else
                For i = 1 To .Rows - 1
                    util.PrintMunkalap "2", .TextMatrix(i, 1)
                    Nyomtat "munue.rpt", 1
                    util.MunkalapAllapot .TextMatrix(i, 1), 2
                Next i
            End If
        End With
    End If
End Sub

Private Sub cmdEXIT_Click()
    Unload Form001
    Unload FormStart
End Sub

Private Sub cmdLIST_Click()
    If MsgBox("Biztosan nyomtatni szeretné a választott munkalapot?", vbYesNo + vbExclamation, "Tisztelt felhasználó!") = vbYes Then
        util.MunkalapAllapot grdMUNKALAP.TextMatrix(grdMUNKALAP.Row, 1), 2
        util.PrintMunkalap "1", grdMUNKALAP.TextMatrix(grdMUNKALAP.Row, 1)
        Nyomtat "munuf.rpt", 1
    End If
End Sub

Private Sub cmdMASOL_Click()
    Screen.MousePointer = vbHourglass
    util.DuplikalMunk grdMUNKALAP.TextMatrix(grdMUNKALAP.Row, 1)
    cmdFRISSIT_Click
    Screen.MousePointer = vbDefault
End Sub

Private Sub cmdVISSZAI_Click()
    Form002.mode = grdMUNKALAP.TextMatrix(grdMUNKALAP.Row, 1)
    Form002.txtID = grdMUNKALAP.TextMatrix(grdMUNKALAP.Row, 1)
    Form002.Show 1
    frissit
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyCommand KeyCode
End Sub

Private Sub grdmunkalap_GotFocus()
    KeyPreview = False
End Sub

Private Sub grdmunkalap_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyCommand KeyCode
End Sub

Private Sub grdmunkalap_LostFocus()
    KeyPreview = True
End Sub

Private Sub tmrVILLOG_Timer()
    If cmdFRISSIT.Caption = "F5" Then
        cmdFRISSIT.Caption = "Frissítés"
    Else
        cmdFRISSIT.Caption = "F5"
    End If
End Sub

Private Sub cmdFRISSIT_Click()
    Screen.MousePointer = vbHourglass
    
    util.GridderX grdMUNKALAP, "MUNKALAP", Me
    
    Dim iOra As Long
    Dim i As Long
    Dim t As String
    iOra = 0
    With grdMUNKALAP
        For i = 1 To .Rows - 1
            t = .TextMatrix(i, 14)
            If t <> "" Then iOra = iOra + CLng(t)
        Next i
    End With
    txtMUNOSZ = iOra
    
    tmrVILLOG.Enabled = False
    cmdFRISSIT.Caption = "Frissítés"
    enableCsoportosNyomtatas
    Screen.MousePointer = vbDefault
End Sub

Private Sub cmdMODOSIT_Click()
    Form001a.mode = grdMUNKALAP.TextMatrix(grdMUNKALAP.Row, 1)
    Form001a.Show 1
    frissit
End Sub

Private Sub cmdUJ_Click()
    Form001a.mode = 0
    Form001a.Show 1
    frissit
End Sub

Private Sub Form_Activate()
    Form001.Caption = "Munkalap nyilvántartás  " & AktivForm()
    
    KeyPreview = True
End Sub

Private Sub Form_Load()
    Screen.MousePointer = vbHourglass
    iRefresh = 0
    
    Select Case iWorkMode
        Case DISZPECSER
            cmdCSOPLIST.Enabled = False
            cmdMASOL.Enabled = False
        Case VISSZAIR
            cmdUJ.Enabled = False
            cmdMODOSIT.Enabled = False
            cmdLIST.Enabled = False
            cmdCSOPLIST.Enabled = False
            cmdMASOL.Enabled = False
        Case Else
            cmdMASOL.Enabled = True
    End Select
    
    SetCombo Me
    datDATUMIG.Value = DateValue(Now())
    If iWorkMode = DISZPECSER Then
        datDATUMTOL.Value = DateValue(Now())
    Else
        datDATUMTOL.Value = DateValue(DateAdd("m", -1, Now()))
    End If
    datMUNDATTOL.Value = DateValue(Now())
    datMUNDATIG.Value = DateValue(Now())
    datMUNELV.Value = DateValue(Now())
    datMUNDATTOL.Value = ""
    datMUNDATIG.Value = ""
    datMUNELV.Value = ""
    SetComboVal cmbMLAPTIP, "1"
    SetComboVal cmbALLAPOT, "5"
    Screen.MousePointer = vbDefault
End Sub

Private Sub grdmunkalap_DblClick()
    cmdVISSZAI_Click
End Sub

Private Sub KeyCommand(KeyCode As Integer)
    Static CtrlKey As Boolean
 
    Select Case KeyCode
        Case vbKeyF1:
        Case vbKeyX:
            If CtrlKey Then
                Unload Form001
                Unload FormStart
            End If
        Case vbKeyEscape:
            cmdEXIT_Click
        Case vbKeyInsert:
            If iWorkMode <> VISSZAIR Then cmdUJ_Click
        Case vbKeyF2:
            If iWorkMode <> VISSZAIR Then cmdMODOSIT_Click
        Case vbKeyF3:
            cmdVISSZAI_Click
        Case vbKeyHome:
            grdMUNKALAP.SetFocus
        Case vbKeyF5:
            cmdFRISSIT_Click
    End Select
 
    If KeyCode = vbKeyControl Then
        CtrlKey = True
    Else
        CtrlKey = False
    End If
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
   Dim Msg
   Msg = "Valóban ki szeretne lépni a rendszerbõl?"
   If MsgBox(Msg, vbQuestion + vbYesNo, "Tisztelt felhasználó!") = vbNo Then Cancel = True
End Sub

Sub enableCsoportosNyomtatas()
    If cmbMLAPTIP.ListIndex <> -1 And GetComboErtek(cmbALLAPOT) = "1" Then
        If iWorkMode <> DISZPECSER Then cmdCSOPLIST.Enabled = True
        cmdLIST.Enabled = True
    Else
        cmdCSOPLIST.Enabled = False
        cmdLIST.Enabled = False
    End If
End Sub

