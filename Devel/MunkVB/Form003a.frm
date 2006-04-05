VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Form003a 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   6120
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   8910
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form003a.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6120
   ScaleWidth      =   8910
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox txtMINTA_IDO 
      Height          =   315
      Left            =   1890
      TabIndex        =   52
      TabStop         =   0   'False
      Top             =   0
      Visible         =   0   'False
      Width           =   1515
   End
   Begin VB.TextBox txtERTEKELES 
      Height          =   720
      Left            =   1845
      TabIndex        =   24
      Top             =   4815
      Width           =   6870
   End
   Begin VB.TextBox txtOBJID 
      Height          =   435
      Left            =   210
      TabIndex        =   50
      TabStop         =   0   'False
      Top             =   0
      Visible         =   0   'False
      Width           =   225
   End
   Begin VB.TextBox txtKULSO 
      Height          =   720
      Left            =   6345
      TabIndex        =   23
      Top             =   4005
      Width           =   2355
   End
   Begin VB.TextBox txtNITRAT 
      Height          =   315
      Left            =   6345
      TabIndex        =   21
      Top             =   3195
      Width           =   2355
   End
   Begin VB.TextBox txtNITRIT 
      Height          =   315
      Left            =   6345
      TabIndex        =   22
      Top             =   3600
      Width           =   2355
   End
   Begin VB.TextBox txtOK 
      Height          =   315
      Left            =   6345
      TabIndex        =   19
      Top             =   2385
      Width           =   2355
   End
   Begin VB.TextBox txtAMMONIA 
      Height          =   315
      Left            =   6345
      TabIndex        =   20
      Top             =   2790
      Width           =   2355
   End
   Begin VB.TextBox txtOXI 
      Height          =   315
      Left            =   6345
      TabIndex        =   15
      Top             =   765
      Width           =   2355
   End
   Begin VB.TextBox txtELEKTRO 
      Height          =   315
      Left            =   6345
      TabIndex        =   16
      Top             =   1170
      Width           =   2355
   End
   Begin VB.TextBox txtVAS 
      Height          =   315
      Left            =   6345
      TabIndex        =   17
      Top             =   1575
      Width           =   2355
   End
   Begin VB.TextBox txtKOI 
      Height          =   315
      Left            =   6345
      TabIndex        =   18
      Top             =   1980
      Width           =   2355
   End
   Begin VB.TextBox txtPH 
      Height          =   315
      Left            =   6345
      TabIndex        =   14
      Top             =   360
      Width           =   2355
   End
   Begin VB.TextBox txtVIZSG_KEZD 
      Height          =   315
      Left            =   5040
      TabIndex        =   28
      TabStop         =   0   'False
      Top             =   0
      Visible         =   0   'False
      Width           =   1515
   End
   Begin VB.TextBox txtVIZSG_VEGE 
      Height          =   315
      Left            =   6615
      TabIndex        =   29
      TabStop         =   0   'False
      Top             =   0
      Visible         =   0   'False
      Width           =   1515
   End
   Begin VB.TextBox txtMINTA_ATAD_IDO 
      Height          =   315
      Left            =   3465
      TabIndex        =   27
      TabStop         =   0   'False
      Top             =   0
      Visible         =   0   'False
      Width           =   1515
   End
   Begin VB.TextBox txt2 
      Enabled         =   0   'False
      Height          =   315
      Left            =   1845
      Locked          =   -1  'True
      TabIndex        =   1
      TabStop         =   0   'False
      Top             =   765
      Width           =   2355
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
      Left            =   7565
      TabIndex        =   26
      ToolTipText     =   "E S C"
      Top             =   5670
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
      TabIndex        =   25
      ToolTipText     =   "F 5"
      Top             =   5670
      Width           =   1135
   End
   Begin MSComCtl2.DTPicker spcMINTA_DAT 
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
      Left            =   1845
      TabIndex        =   3
      Top             =   1980
      Width           =   1245
      _ExtentX        =   2196
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
      DateIsNull      =   -1  'True
      Format          =   23068673
      CurrentDate     =   37013
   End
   Begin MSComCtl2.DTPicker spcMINTA_TIM 
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
      Left            =   3165
      TabIndex        =   4
      Top             =   1980
      Width           =   1035
      _ExtentX        =   1826
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
      DateIsNull      =   -1  'True
      Format          =   23068674
      CurrentDate     =   37013
   End
   Begin MSComCtl2.DTPicker spcMINTA_ATAD_DAT 
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
      Left            =   1845
      TabIndex        =   6
      Top             =   2790
      Width           =   1245
      _ExtentX        =   2196
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
      DateIsNull      =   -1  'True
      Format          =   23068673
      CurrentDate     =   37013
   End
   Begin MSComCtl2.DTPicker spcMINTA_ATAD_TIM 
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
      Left            =   3165
      TabIndex        =   7
      Top             =   2790
      Width           =   1035
      _ExtentX        =   1826
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
      DateIsNull      =   -1  'True
      Format          =   23068674
      CurrentDate     =   37013
   End
   Begin MSComCtl2.DTPicker spcVIZSG_KEZD_DAT 
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
      Left            =   1845
      TabIndex        =   10
      Top             =   4005
      Width           =   1245
      _ExtentX        =   2196
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
      DateIsNull      =   -1  'True
      Format          =   23068673
      CurrentDate     =   37013
   End
   Begin MSComCtl2.DTPicker spcVIZSG_KEZD_TIM 
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
      Left            =   3165
      TabIndex        =   11
      Top             =   4005
      Width           =   1035
      _ExtentX        =   1826
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
      DateIsNull      =   -1  'True
      Format          =   23068674
      CurrentDate     =   37013
   End
   Begin MSComCtl2.DTPicker spcVIZSG_VEGE_DAT 
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
      Left            =   1845
      TabIndex        =   12
      Top             =   4410
      Width           =   1245
      _ExtentX        =   2196
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
      DateIsNull      =   -1  'True
      Format          =   23068673
      CurrentDate     =   37013
   End
   Begin MSComCtl2.DTPicker spcVIZSG_VEGE_TIM 
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
      Left            =   3165
      TabIndex        =   13
      Top             =   4410
      Width           =   1035
      _ExtentX        =   1826
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
      DateIsNull      =   -1  'True
      Format          =   23068674
      CurrentDate     =   37013
   End
   Begin VB.Label lblERTEKELES 
      Alignment       =   1  'Right Justify
      Caption         =   "Értékelés"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   270
      TabIndex        =   51
      Top             =   4860
      Width           =   1500
   End
   Begin MSForms.ComboBox cmbVIZSG_NEV 
      Height          =   315
      Left            =   1845
      TabIndex        =   9
      Tag             =   "334"
      Top             =   3600
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
   Begin MSForms.ComboBox cmbMINTA_ATVEVO 
      Height          =   315
      Left            =   1845
      TabIndex        =   8
      Tag             =   "334"
      Top             =   3195
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
   Begin MSForms.ComboBox cmbMINTA_NEV 
      Height          =   315
      Left            =   1845
      TabIndex        =   5
      Tag             =   "334"
      Top             =   2385
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
   Begin VB.Label lblKULSO 
      Alignment       =   1  'Right Justify
      Caption         =   "Külsõ"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4665
      TabIndex        =   49
      Top             =   4050
      Width           =   1605
   End
   Begin VB.Label lblNITRAT 
      Alignment       =   1  'Right Justify
      Caption         =   "Nitrát"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4665
      TabIndex        =   48
      Top             =   3240
      Width           =   1605
   End
   Begin VB.Label lblNITRIT 
      Alignment       =   1  'Right Justify
      Caption         =   "Nitrit"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4665
      TabIndex        =   47
      Top             =   3645
      Width           =   1605
   End
   Begin VB.Label lblOK 
      Alignment       =   1  'Right Justify
      Caption         =   "ÖK"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4665
      TabIndex        =   46
      Top             =   2430
      Width           =   1605
   End
   Begin VB.Label lblAMMONIA 
      Alignment       =   1  'Right Justify
      Caption         =   "Ammónia"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4665
      TabIndex        =   45
      Top             =   2835
      Width           =   1605
   End
   Begin VB.Label lblOXI 
      Alignment       =   1  'Right Justify
      Caption         =   "Oldott oxigén"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4665
      TabIndex        =   44
      Top             =   810
      Width           =   1605
   End
   Begin VB.Label lblELEKTRO 
      Alignment       =   1  'Right Justify
      Caption         =   "Fajl. elektr. vez. kép."
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4665
      TabIndex        =   43
      Top             =   1215
      Width           =   1605
   End
   Begin VB.Label lblVAS 
      Alignment       =   1  'Right Justify
      Caption         =   "Vas tartalom"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4665
      TabIndex        =   42
      Top             =   1620
      Width           =   1605
   End
   Begin VB.Label lblKOI 
      Alignment       =   1  'Right Justify
      Caption         =   "KOI"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4665
      TabIndex        =   41
      Top             =   2025
      Width           =   1605
   End
   Begin VB.Label lblPH 
      Alignment       =   1  'Right Justify
      Caption         =   "pH"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   4665
      TabIndex        =   40
      Top             =   405
      Width           =   1605
   End
   Begin MSForms.ComboBox cmbMUN_SORSZ 
      Height          =   315
      Left            =   1845
      TabIndex        =   0
      Tag             =   "MUNKALAP"
      Top             =   360
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
   Begin VB.Label lblVIZSG_KEZD 
      Alignment       =   1  'Right Justify
      Caption         =   "Vizsgálat kezdete"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   270
      TabIndex        =   39
      Top             =   4050
      Width           =   1500
   End
   Begin VB.Label lblVIZSG_VEGE 
      Alignment       =   1  'Right Justify
      Caption         =   "Vizsgálat vége"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   270
      TabIndex        =   38
      Top             =   4455
      Width           =   1500
   End
   Begin VB.Label lblMINTA_NEV 
      Alignment       =   1  'Right Justify
      Caption         =   "Mintavételezõ neve"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   270
      TabIndex        =   37
      Top             =   2430
      Width           =   1500
   End
   Begin VB.Label lblMINTA_ATAD_IDO 
      Alignment       =   1  'Right Justify
      Caption         =   "Minta beérkezési ideje"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   170
      TabIndex        =   36
      Top             =   2835
      Width           =   1600
   End
   Begin VB.Label lblMINTA_ATVEVO 
      Alignment       =   1  'Right Justify
      Caption         =   "Mintaátvevõ neve"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   270
      TabIndex        =   35
      Top             =   3240
      Width           =   1500
   End
   Begin VB.Label lblVIZSG_NEV 
      Alignment       =   1  'Right Justify
      Caption         =   "Vizsgálatot végzõ neve"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   20
      TabIndex        =   34
      Top             =   3645
      Width           =   1750
   End
   Begin VB.Label lblFUTOMU 
      Alignment       =   1  'Right Justify
      Caption         =   "Fûtõmû"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   270
      TabIndex        =   33
      Top             =   810
      Width           =   1500
   End
   Begin VB.Label lblMUN_SORSZ 
      Alignment       =   1  'Right Justify
      Caption         =   "Munkalap"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   90
      TabIndex        =   32
      Top             =   405
      Width           =   1680
   End
   Begin MSForms.ComboBox cmbTIPUS 
      Height          =   315
      Left            =   1845
      TabIndex        =   2
      Tag             =   "370"
      Top             =   1170
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
   Begin VB.Label lblTIPUS 
      Alignment       =   1  'Right Justify
      Caption         =   "Jegyzõkönyv típusa"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   45
      TabIndex        =   31
      Top             =   1215
      Width           =   1725
   End
   Begin VB.Label lblMINTA_IDO 
      Alignment       =   1  'Right Justify
      Caption         =   "Mintavétel ideje"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   270
      TabIndex        =   30
      Top             =   2025
      Width           =   1500
   End
End
Attribute VB_Name = "Form003a"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' $Id$

Public mode As Long
Public TipushFriss As Integer

Private Sub cmbMUN_SORSZ_Change()
    Dim iMunkalap As Long
    iMunkalap = GetComboErtek(cmbMUN_SORSZ)
    util.RekordFeltolt Me, "MUNKALAP", iMunkalap
    util.MunkalapObjKiir Me
End Sub

Private Sub cmdClose_Click()
    Back Me
End Sub

Private Sub cmdOK_Click()
    Screen.MousePointer = vbHourglass
    
    If mode = 0 Then
        txtMINTA_IDO.Text = spcMINTA_TIM.Value
        txtMINTA_ATAD_IDO.Text = spcMINTA_ATAD_TIM.Value
        txtVIZSG_KEZD.Text = spcVIZSG_KEZD_TIM.Value
        txtVIZSG_VEGE.Text = spcVIZSG_VEGE_TIM.Value
 
        Dim i As String
        i = util.RekordInsert(Me, "LABOR")
        MsgBox "Az új jegyzõkönyv száma: " & CStr(i)
        If MsgBox("Kívánja nyomtatni a jegyzõkönyvet?", vbQuestion + vbYesNo, "Nyomtatás") = vbYes Then
            util.Jegyzokonyv "8", i, sANTSZDir
        End If
    End If
    
    Form003.iRefresh = 1
    Screen.MousePointer = vbDefault
    Back Me
End Sub

Private Sub spcMINTA_ATAD_DAT_LostFocus()
    spcMINTA_ATAD_TIM.Value = spcMINTA_ATAD_DAT.Value
End Sub

Private Sub spcMINTA_DAT_LostFocus()
    spcMINTA_TIM.Value = spcMINTA_DAT.Value
End Sub

Private Sub spcVIZSG_KEZD_DAT_LostFocus()
    spcVIZSG_KEZD_TIM.Value = spcVIZSG_KEZD_DAT.Value
End Sub

Private Sub spcVIZSG_VEGE_DAT_LostFocus()
    spcVIZSG_VEGE_TIM.Value = spcVIZSG_VEGE_DAT.Value
End Sub

Private Sub Form_Activate()
    Form003a.Caption = "Jegyzõkönyv " & AktivForm()
End Sub

Private Sub Form_Load()
    KeyPreview = True
    SetCombo Me
    util.MunkalapszamFeltolt cmbMUN_SORSZ
    
    If mode <> 0 Then
        util.RekordFeltolt Me, "LABOR", mode
        For Each Control In Me.Controls
            Control.Enabled = False
        Next
        cmdCLOSE.Enabled = True
    Else
        dNow = DateValue(Now())
        spcMINTA_DAT = dNow
        spcMINTA_DAT.Hour = 6
        spcMINTA_TIM = dNow
        spcMINTA_TIM.Hour = 6
        spcMINTA_ATAD_DAT = dNow
        spcMINTA_ATAD_DAT.Hour = 7
        spcMINTA_ATAD_TIM = dNow
        spcMINTA_ATAD_TIM.Hour = 7
        spcVIZSG_KEZD_DAT = dNow
        spcVIZSG_KEZD_DAT.Hour = 8
        spcVIZSG_KEZD_TIM = dNow
        spcVIZSG_KEZD_TIM.Hour = 8
        spcVIZSG_VEGE_DAT = dNow
        spcVIZSG_VEGE_DAT.Hour = 8
        spcVIZSG_VEGE_TIM = dNow
        spcVIZSG_VEGE_TIM.Hour = 8
'        txtKIALLDAT = DateValue(Now())
'        txtMUNELV = DateValue(Now())
    End If
End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
    KeyCommand KeyCode
    'Keycode = 0
End Sub

Private Sub KeyCommand(KeyCode As Integer)
    Static CtrlKey As Boolean
    Select Case KeyCode
        Case vbKeyF1:
        Case vbKeyX:
            If CtrlKey Then
                Unload Me
            End If
        Case vbKeyEscape: cmdClose_Click
        Case vbKeyF5: cmdOK_Click
    End Select
    
    If KeyCode = vbKeyControl Then
        CtrlKey = True
    Else
        CtrlKey = False
    End If
End Sub

Private Sub checkForPoint(oControl As Control)
    If InStr(oControl.Text, ".") <> 0 Then
        MsgBox "Ez a beviteli mezõ csak számértéket és tizedes vesszõt tartalmazhat!", vbExclamation, "Tisztelt felhasználó!"
        oControl.SetFocus
        oControl.SelStart = 0
        oControl.SelLength = Len(oControl.Text)
    End If
End Sub

Private Sub txtAMMONIA_LostFocus()
    checkForPoint txtAMMONIA
End Sub

Private Sub txtELEKTRO_LostFocus()
    checkForPoint txtELEKTRO
End Sub

Private Sub txtKOI_LostFocus()
    checkForPoint txtKOI
End Sub

Private Sub txtNITRAT_LostFocus()
    checkForPoint txtNITRAT
End Sub

Private Sub txtNITRIT_LostFocus()
    checkForPoint txtNITRIT
End Sub

Private Sub txtOK_LostFocus()
    checkForPoint txtOK
End Sub

Private Sub txtOXI_LostFocus()
    checkForPoint txtOXI
End Sub

Private Sub txtPH_LostFocus()
    checkForPoint txtPH
End Sub

Private Sub txtVAS_LostFocus()
    checkForPoint txtVAS
End Sub
