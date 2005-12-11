VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form Form003b 
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
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6120
   ScaleWidth      =   8910
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdFeltolt 
      Caption         =   "Feltöltés"
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
      Left            =   4675
      TabIndex        =   1
      ToolTipText     =   "F 5"
      Top             =   105
      Width           =   1135
   End
   Begin VB.TextBox Text1 
      Height          =   435
      Left            =   0
      TabIndex        =   50
      TabStop         =   0   'False
      Top             =   0
      Visible         =   0   'False
      Width           =   225
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
      Caption         =   "Nyomtatás"
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
   Begin MSComCtl2.DTPicker datOSSZESITO 
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
      Left            =   3100
      TabIndex        =   0
      Top             =   105
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
      Format          =   77791233
      CurrentDate     =   37013
   End
   Begin MSForms.ComboBox cmb23 
      Height          =   315
      Left            =   6345
      TabIndex        =   24
      Tag             =   "labor23"
      Top             =   4725
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
   Begin MSForms.ComboBox cmb22 
      Height          =   315
      Left            =   6345
      TabIndex        =   23
      Tag             =   "labor22"
      Top             =   4320
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
   Begin MSForms.ComboBox cmb19 
      Height          =   315
      Left            =   6345
      TabIndex        =   20
      Tag             =   "labor19"
      Top             =   3105
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
   Begin MSForms.ComboBox cmb17 
      Height          =   315
      Left            =   6345
      TabIndex        =   18
      Tag             =   "labor17"
      Top             =   2295
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
   Begin MSForms.ComboBox cmb16 
      Height          =   315
      Left            =   6345
      TabIndex        =   17
      Tag             =   "labor16"
      Top             =   1890
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
   Begin MSForms.ComboBox cmb14 
      Height          =   315
      Left            =   6345
      TabIndex        =   15
      Tag             =   "labor14"
      Top             =   1080
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
   Begin MSForms.ComboBox cmb15 
      Height          =   315
      Left            =   6345
      TabIndex        =   16
      Tag             =   "labor15"
      Top             =   1485
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
   Begin MSForms.ComboBox cmb18 
      Height          =   315
      Left            =   6345
      TabIndex        =   19
      Tag             =   "labor18"
      Top             =   2700
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
   Begin MSForms.ComboBox cmb20 
      Height          =   315
      Left            =   6345
      TabIndex        =   21
      Tag             =   "labor20"
      Top             =   3510
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
   Begin MSForms.ComboBox cmb21 
      Height          =   315
      Left            =   6345
      TabIndex        =   22
      Tag             =   "labor21"
      Top             =   3915
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
   Begin MSForms.ComboBox cmb13 
      Height          =   315
      Left            =   6345
      TabIndex        =   14
      Tag             =   "labor13"
      Top             =   675
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
   Begin MSForms.ComboBox cmb12 
      Height          =   315
      Left            =   1845
      TabIndex        =   13
      Tag             =   "labor12"
      Top             =   5145
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
   Begin MSForms.ComboBox cmb11 
      Height          =   315
      Left            =   1845
      TabIndex        =   12
      Tag             =   "labor11"
      Top             =   4725
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
   Begin MSForms.ComboBox cmb10 
      Height          =   315
      Left            =   1845
      TabIndex        =   11
      Tag             =   "labor10"
      Top             =   4320
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
   Begin MSForms.ComboBox cmb7 
      Height          =   315
      Left            =   1845
      TabIndex        =   8
      Tag             =   "labor7"
      Top             =   3105
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
   Begin MSForms.ComboBox cmb5 
      Height          =   315
      Left            =   1845
      TabIndex        =   6
      Tag             =   "labor5"
      Top             =   2295
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
   Begin MSForms.ComboBox cmb4 
      Height          =   315
      Left            =   1845
      TabIndex        =   5
      Tag             =   "labor4"
      Top             =   1890
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
   Begin MSForms.ComboBox cmb2 
      Height          =   315
      Left            =   1845
      TabIndex        =   3
      Tag             =   "labor2"
      Top             =   1080
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
   Begin VB.Label Label1 
      Alignment       =   1  'Right Justify
      Caption         =   "Rókus erõmû"
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
      Top             =   4770
      Width           =   1605
   End
   Begin VB.Label lbl4 
      Alignment       =   1  'Right Justify
      Caption         =   "Tarján IV."
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
      TabIndex        =   48
      Top             =   1935
      Width           =   1725
   End
   Begin VB.Label lbl12 
      Alignment       =   1  'Right Justify
      Caption         =   "Roosewelt"
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
      TabIndex        =   47
      Top             =   5175
      Width           =   1500
   End
   Begin MSForms.ComboBox cmb9 
      Height          =   315
      Left            =   1845
      TabIndex        =   10
      Tag             =   "labor9"
      Top             =   3915
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
   Begin MSForms.ComboBox cmb8 
      Height          =   315
      Left            =   1845
      TabIndex        =   9
      Tag             =   "labor8"
      Top             =   3510
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
   Begin MSForms.ComboBox cmb6 
      Height          =   315
      Left            =   1845
      TabIndex        =   7
      Tag             =   "labor6"
      Top             =   2700
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
   Begin VB.Label lbl22 
      Alignment       =   1  'Right Justify
      Caption         =   "Felsõváros II."
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
      Top             =   4365
      Width           =   1605
   End
   Begin VB.Label lbl20 
      Alignment       =   1  'Right Justify
      Caption         =   "Rókus"
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
      Top             =   3555
      Width           =   1605
   End
   Begin VB.Label lbl21 
      Alignment       =   1  'Right Justify
      Caption         =   "Rókus sziv. ház"
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
      Top             =   3960
      Width           =   1605
   End
   Begin VB.Label lbl18 
      Alignment       =   1  'Right Justify
      Caption         =   "Észak I/B"
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
      Top             =   2745
      Width           =   1605
   End
   Begin VB.Label lbl19 
      Alignment       =   1  'Right Justify
      Caption         =   "É I/B sziv. ház"
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
      Top             =   3150
      Width           =   1605
   End
   Begin VB.Label lbl14 
      Alignment       =   1  'Right Justify
      Caption         =   "Felsõváros I."
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
      Top             =   1125
      Width           =   1605
   End
   Begin VB.Label lbl15 
      Alignment       =   1  'Right Justify
      Caption         =   "J-ütem"
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
      Top             =   1530
      Width           =   1605
   End
   Begin VB.Label lbl16 
      Alignment       =   1  'Right Justify
      Caption         =   "Észak I/A"
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
      TabIndex        =   39
      Top             =   1935
      Width           =   1605
   End
   Begin VB.Label lbl17 
      Alignment       =   1  'Right Justify
      Caption         =   "Török u."
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
      TabIndex        =   38
      Top             =   2340
      Width           =   1605
   End
   Begin VB.Label lbl13 
      Alignment       =   1  'Right Justify
      Caption         =   "Korányi"
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
      TabIndex        =   37
      Top             =   720
      Width           =   1605
   End
   Begin MSForms.ComboBox cmb1 
      Height          =   315
      Left            =   1845
      TabIndex        =   2
      Tag             =   "labor1"
      Top             =   675
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
   Begin VB.Label lbl10 
      Alignment       =   1  'Right Justify
      Caption         =   "Tisza 40."
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
      TabIndex        =   36
      Top             =   4365
      Width           =   1500
   End
   Begin VB.Label lbl11 
      Alignment       =   1  'Right Justify
      Caption         =   "Berzsenyi"
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
      Top             =   4770
      Width           =   1500
   End
   Begin VB.Label lbl6 
      Alignment       =   1  'Right Justify
      Caption         =   "Tarján VI."
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
      TabIndex        =   34
      Top             =   2745
      Width           =   1500
   End
   Begin VB.Label lbl7 
      Alignment       =   1  'Right Justify
      Caption         =   "Tarján VIII."
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
      Left            =   165
      TabIndex        =   33
      Top             =   3150
      Width           =   1605
   End
   Begin VB.Label lbl8 
      Alignment       =   1  'Right Justify
      Caption         =   "Odessza I."
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
      TabIndex        =   32
      Top             =   3555
      Width           =   1500
   End
   Begin VB.Label lbl9 
      Alignment       =   1  'Right Justify
      Caption         =   "Odessza II."
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
      Left            =   15
      TabIndex        =   31
      Top             =   3960
      Width           =   1755
   End
   Begin VB.Label lbl2 
      Alignment       =   1  'Right Justify
      Caption         =   "Tarján II."
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
      Top             =   1125
      Width           =   1500
   End
   Begin VB.Label lbl1 
      Alignment       =   1  'Right Justify
      Caption         =   "Tarján I."
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
      TabIndex        =   29
      Top             =   720
      Width           =   1680
   End
   Begin MSForms.ComboBox cmb3 
      Height          =   315
      Left            =   1845
      TabIndex        =   4
      Tag             =   "labor3"
      Top             =   1485
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
   Begin VB.Label lbl3 
      Alignment       =   1  'Right Justify
      Caption         =   "Tarján III."
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
      TabIndex        =   28
      Top             =   1530
      Width           =   1725
   End
   Begin VB.Label lbl5 
      Alignment       =   1  'Right Justify
      Caption         =   "Tarján V."
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
      TabIndex        =   27
      Top             =   2340
      Width           =   1500
   End
End
Attribute VB_Name = "Form003b"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdClose_Click()
    Back Me
End Sub

Private Sub cmdFeltolt_Click()
    util.OsszesitoKivalaszt datOSSZESITO.Value, Me
End Sub

Private Sub cmdOK_Click()
    Screen.MousePointer = vbHourglass
    
    If MsgBox("Kívánja nyomtatni az összesítõ jegyzõkönyvet?", vbQuestion + vbYesNo, "Nyomtatás") = vbYes Then
        util.LaborOsszesito sANTSZDir
    End If
    
    Screen.MousePointer = vbDefault
    Back Me
End Sub

Private Sub Form_Activate()
    Form003b.Caption = "Jegyzõkönyv összesítõ " & AktivForm()
End Sub

Private Sub Form_Load()
    KeyPreview = True
    
    datOSSZESITO = DateValue(Now())
    
    'util.OsszesitoFeltolt datOSSZESITO.Value, Me
    'SetCombo Me
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

