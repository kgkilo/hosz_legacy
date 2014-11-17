VERSION 5.00
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Begin VB.Form Form001a 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   5730
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   11910
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form001a.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5730
   ScaleWidth      =   11910
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox spcOBJTIP 
      Alignment       =   2  'Center
      Enabled         =   0   'False
      Height          =   315
      Left            =   3990
      TabIndex        =   64
      TabStop         =   0   'False
      Top             =   5250
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox txtUJ 
      Alignment       =   2  'Center
      Height          =   315
      Left            =   5670
      TabIndex        =   15
      Top             =   2385
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.TextBox txtFELUJITOTT 
      Alignment       =   2  'Center
      Height          =   315
      Left            =   7290
      TabIndex        =   16
      Top             =   2385
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.CommandButton cmdOSSZESITO 
      Caption         =   "Összesítõ"
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
      Left            =   1485
      TabIndex        =   61
      ToolTipText     =   "Összesítõ nyomatás"
      Top             =   5220
      Width           =   1140
   End
   Begin VB.TextBox txtREF 
      Alignment       =   2  'Center
      Enabled         =   0   'False
      Height          =   315
      Left            =   3510
      TabIndex        =   59
      TabStop         =   0   'False
      Top             =   5265
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox txtLAKAS 
      Appearance      =   0  'Flat
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Height          =   315
      Left            =   3060
      Locked          =   -1  'True
      TabIndex        =   58
      TabStop         =   0   'False
      Top             =   3510
      Width           =   1545
   End
   Begin VB.TextBox txtAllapot 
      Alignment       =   2  'Center
      Enabled         =   0   'False
      Height          =   315
      Left            =   3285
      TabIndex        =   57
      TabStop         =   0   'False
      Top             =   5265
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox txtOBJID 
      Alignment       =   2  'Center
      Enabled         =   0   'False
      Height          =   315
      Left            =   3060
      TabIndex        =   56
      TabStop         =   0   'False
      Top             =   5265
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox txtMTIP 
      Alignment       =   2  'Center
      Enabled         =   0   'False
      Height          =   315
      Left            =   0
      TabIndex        =   55
      TabStop         =   0   'False
      Text            =   "1"
      Top             =   90
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox txtHIBLEIR 
      Height          =   1980
      Left            =   7200
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   29
      Top             =   3015
      Width           =   4605
   End
   Begin VB.CommandButton cmdHELY 
      Caption         =   "Hely módosítás"
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
      Left            =   270
      TabIndex        =   23
      Top             =   4410
      Width           =   4335
   End
   Begin VB.TextBox txt3 
      Appearance      =   0  'Flat
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Height          =   450
      Left            =   270
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   52
      TabStop         =   0   'False
      Top             =   3915
      Width           =   4335
   End
   Begin VB.TextBox txt2 
      Appearance      =   0  'Flat
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Height          =   315
      Left            =   270
      Locked          =   -1  'True
      TabIndex        =   51
      TabStop         =   0   'False
      Top             =   3510
      Width           =   2760
   End
   Begin VB.TextBox txt1 
      Appearance      =   0  'Flat
      BackColor       =   &H8000000F&
      BorderStyle     =   0  'None
      Height          =   315
      Left            =   270
      Locked          =   -1  'True
      TabIndex        =   50
      TabStop         =   0   'False
      Top             =   3105
      Width           =   4335
   End
   Begin VB.Frame Frame1 
      Caption         =   "Hiba helye"
      Height          =   2220
      Left            =   135
      TabIndex        =   49
      Top             =   2790
      Width           =   4605
   End
   Begin VB.TextBox txtIDOIG 
      Alignment       =   2  'Center
      Height          =   315
      Left            =   7020
      TabIndex        =   12
      Top             =   1575
      Width           =   1005
   End
   Begin VB.TextBox txtIDOTOL 
      Alignment       =   2  'Center
      Height          =   315
      Left            =   5670
      TabIndex        =   11
      Top             =   1575
      Width           =   1005
   End
   Begin VB.TextBox txtMUNELV 
      Alignment       =   2  'Center
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "yyyy.MM.dd"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1038
         SubFormatType   =   0
      EndProperty
      Height          =   315
      Left            =   5670
      TabIndex        =   10
      Top             =   1170
      Width           =   1005
   End
   Begin VB.TextBox txtFNEV 
      BackColor       =   &H80000004&
      Height          =   315
      Left            =   8055
      Locked          =   -1  'True
      TabIndex        =   17
      TabStop         =   0   'False
      Top             =   360
      Width           =   3795
   End
   Begin VB.TextBox txtKIALLDAT 
      Alignment       =   2  'Center
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "yyyy.MM.dd"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1038
         SubFormatType   =   0
      EndProperty
      Height          =   315
      Left            =   3195
      TabIndex        =   3
      Top             =   360
      Width           =   1005
   End
   Begin VB.TextBox txtBEJDAT 
      Alignment       =   2  'Center
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "yyyy.MM.dd"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1038
         SubFormatType   =   0
      EndProperty
      Height          =   315
      Left            =   2205
      TabIndex        =   2
      Top             =   360
      Width           =   1005
   End
   Begin VB.TextBox txtNAPSZAM 
      Alignment       =   2  'Center
      Height          =   315
      Left            =   1215
      TabIndex        =   1
      Top             =   360
      Width           =   1005
   End
   Begin VB.TextBox txtSORSZ 
      Alignment       =   2  'Center
      BackColor       =   &H80000004&
      Height          =   315
      Left            =   45
      Locked          =   -1  'True
      TabIndex        =   0
      TabStop         =   0   'False
      Top             =   360
      Width           =   1005
   End
   Begin VB.Frame spcALLAPOT 
      Caption         =   "Állapotjelzõ"
      Height          =   2220
      Left            =   4815
      TabIndex        =   24
      Top             =   2790
      Width           =   2310
      Begin VB.OptionButton optAllapot 
         Caption         =   "Visszaérkezett"
         Height          =   285
         Index           =   4
         Left            =   360
         TabIndex        =   28
         Top             =   1665
         Width           =   1680
      End
      Begin VB.OptionButton optAllapot 
         Caption         =   "Sztornó"
         Enabled         =   0   'False
         Height          =   285
         Index           =   3
         Left            =   360
         TabIndex        =   27
         Top             =   1215
         Width           =   1140
      End
      Begin VB.OptionButton optAllapot 
         Caption         =   "Nyomtatott"
         Height          =   285
         Index           =   2
         Left            =   360
         TabIndex        =   26
         Top             =   765
         Width           =   1725
      End
      Begin VB.OptionButton optAllapot 
         Caption         =   "Elõjegyzett"
         Height          =   285
         Index           =   1
         Left            =   360
         TabIndex        =   25
         Top             =   315
         Value           =   -1  'True
         Width           =   1455
      End
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
      Left            =   10710
      TabIndex        =   31
      ToolTipText     =   "E S C"
      Top             =   5220
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
      TabIndex        =   30
      ToolTipText     =   "F 5"
      Top             =   5220
      Width           =   1135
   End
   Begin VB.TextBox txtBEJNEV 
      Height          =   315
      Left            =   1845
      TabIndex        =   7
      Top             =   1980
      Width           =   2355
   End
   Begin VB.Label lblFELUJITOTT 
      Alignment       =   1  'Right Justify
      Caption         =   "Felújított"
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
      Left            =   6570
      TabIndex        =   63
      Top             =   2430
      Visible         =   0   'False
      Width           =   645
   End
   Begin VB.Label lblUJ 
      Alignment       =   1  'Right Justify
      Caption         =   "Új"
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
      Left            =   5355
      TabIndex        =   62
      Top             =   2430
      Visible         =   0   'False
      Width           =   240
   End
   Begin MSForms.ComboBox cmbPLOMBAZAS 
      Height          =   315
      Left            =   5670
      TabIndex        =   14
      Tag             =   "348"
      Top             =   2385
      Visible         =   0   'False
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
   Begin VB.Label lblPLOMBAZAS 
      Alignment       =   1  'Right Justify
      Caption         =   "Plombázás módja"
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
      Left            =   4275
      TabIndex        =   60
      Top             =   2430
      Visible         =   0   'False
      Width           =   1320
   End
   Begin VB.Label Label19 
      Alignment       =   2  'Center
      Caption         =   "Sorszám"
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
      Left            =   180
      TabIndex        =   54
      Top             =   90
      Width           =   735
   End
   Begin VB.Label lblHIBLEIR 
      Caption         =   "Hiba leírása"
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
      Left            =   7200
      TabIndex        =   53
      Top             =   2790
      Width           =   1050
   End
   Begin VB.Label Label17 
      Alignment       =   1  'Right Justify
      Caption         =   "Végzõ szerv."
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
      Left            =   8190
      TabIndex        =   48
      Top             =   2025
      Width           =   1230
   End
   Begin MSForms.ComboBox cmbMUNSZ 
      Height          =   315
      Left            =   9495
      TabIndex        =   21
      Tag             =   "271"
      Top             =   1980
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
   Begin VB.Label Label16 
      Alignment       =   1  'Right Justify
      Caption         =   "Karbantartás típ."
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
      Left            =   8055
      TabIndex        =   47
      Top             =   2430
      Width           =   1365
   End
   Begin MSForms.ComboBox cmbKARBTIP 
      Height          =   315
      Left            =   9495
      TabIndex        =   22
      Tag             =   "300"
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
   Begin VB.Label Label15 
      Alignment       =   1  'Right Justify
      Caption         =   "Munkavégzés típ."
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
      Left            =   8010
      TabIndex        =   46
      Top             =   1215
      Width           =   1410
   End
   Begin MSForms.ComboBox cmbMUNVEGZ 
      Height          =   315
      Left            =   9495
      TabIndex        =   19
      Tag             =   "306"
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
   Begin VB.Label Label3 
      Alignment       =   1  'Right Justify
      Caption         =   "Szolgáltatás típ."
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
      Left            =   8190
      TabIndex        =   45
      Top             =   1620
      Width           =   1230
   End
   Begin MSForms.ComboBox cmbSZOLTIP 
      Height          =   315
      Left            =   9495
      TabIndex        =   20
      Tag             =   "309"
      Top             =   1575
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
   Begin MSForms.ComboBox cmbMUVEL 
      Height          =   315
      Left            =   9495
      TabIndex        =   18
      Tag             =   "298"
      Top             =   765
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
      Caption         =   "Mûvelet típ."
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
      Left            =   8325
      TabIndex        =   44
      Top             =   810
      Width           =   1095
   End
   Begin VB.Label Label14 
      Alignment       =   1  'Right Justify
      Caption         =   "Munkát felvevõ szerv."
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
      TabIndex        =   43
      Top             =   810
      Width           =   1680
   End
   Begin MSForms.ComboBox cmbSZEREGYS 
      Height          =   315
      Left            =   1845
      TabIndex        =   4
      Tag             =   "271"
      Top             =   765
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
   Begin VB.Line Line1 
      X1              =   6750
      X2              =   6930
      Y1              =   1710
      Y2              =   1710
   End
   Begin VB.Label Label13 
      Alignment       =   1  'Right Justify
      Caption         =   "Munkalapot kapja"
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
      Left            =   4275
      TabIndex        =   42
      Top             =   2025
      Width           =   1320
   End
   Begin MSForms.ComboBox cmbMKAP 
      Height          =   315
      Left            =   5670
      TabIndex        =   13
      Tag             =   "334"
      Top             =   1980
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
   Begin VB.Label Label12 
      Alignment       =   1  'Right Justify
      Caption         =   "Munka idõtartama"
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
      Left            =   4275
      TabIndex        =   41
      Top             =   1620
      Width           =   1320
   End
   Begin VB.Label Label11 
      Alignment       =   1  'Right Justify
      Caption         =   "Munka végezhetõ"
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
      Left            =   4275
      TabIndex        =   40
      Top             =   1215
      Width           =   1320
   End
   Begin MSForms.ComboBox cmbTIPUSH 
      Height          =   315
      Left            =   5670
      TabIndex        =   9
      Tag             =   "293"
      Top             =   765
      Width           =   2355
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "4154;556"
      ListWidth       =   10000
      cColumnInfo     =   1
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      Object.Width           =   "10000"
   End
   Begin VB.Label Label10 
      Alignment       =   1  'Right Justify
      Caption         =   "Típus hiba"
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
      Left            =   4455
      TabIndex        =   39
      Top             =   810
      Width           =   1140
   End
   Begin MSForms.ComboBox cmbSzolgjell 
      Height          =   315
      Left            =   1845
      TabIndex        =   6
      Tag             =   "291"
      Top             =   1575
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
   Begin VB.Label Label9 
      Alignment       =   1  'Right Justify
      Caption         =   "Szolgáltatás jellege"
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
      TabIndex        =   38
      Top             =   1620
      Width           =   1680
   End
   Begin MSForms.ComboBox cmbMFDOLG 
      Height          =   315
      Left            =   1845
      TabIndex        =   5
      Tag             =   "334"
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
   Begin VB.Label Label8 
      Alignment       =   1  'Right Justify
      Caption         =   "Munkát felvevõ dolgozó"
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
      TabIndex        =   37
      Top             =   1215
      Width           =   1725
   End
   Begin MSForms.ComboBox cmbFSZAM 
      Height          =   315
      Left            =   5670
      TabIndex        =   8
      Tag             =   "310a"
      Top             =   360
      Width           =   2355
      VariousPropertyBits=   746604571
      DisplayStyle    =   3
      Size            =   "4154;556"
      ListWidth       =   7000
      ColumnCount     =   2
      cColumnInfo     =   2
      MatchEntry      =   1
      ShowDropButtonWhen=   2
      FontName        =   "Arial"
      FontHeight      =   165
      FontCharSet     =   0
      FontPitchAndFamily=   2
      Object.Width           =   "2000;5000"
   End
   Begin VB.Label Label7 
      Alignment       =   1  'Right Justify
      Caption         =   "Fõkönyvi szám"
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
      Left            =   4455
      TabIndex        =   36
      Top             =   405
      Width           =   1140
   End
   Begin VB.Label Label6 
      Alignment       =   2  'Center
      Caption         =   "Kiállítva"
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
      Left            =   3195
      TabIndex        =   35
      Top             =   90
      Width           =   1005
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "Bejelentve"
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
      Left            =   2205
      TabIndex        =   34
      Top             =   90
      Width           =   1005
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "Napló sz."
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
      Left            =   1215
      TabIndex        =   33
      Top             =   90
      Width           =   1005
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "Bejelentõ neve"
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
      Top             =   2025
      Width           =   1500
   End
End
Attribute VB_Name = "Form001a"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' $Id$

Public mode As Long
Public TipushFriss As Integer

Private Sub cmbFSZAM_Change()
    If cmbFSZAM.ListIndex <> -1 Then
        'util.munkalapfszamvalaszt cmbFSZAM, cmbOBJTIP, cmbOBJID
        txtFNEV = GetComboNev(cmbFSZAM)
        'spcVALASZT.Enabled = False
    Else
        'spcVALASZT.Enabled = True
    End If
End Sub

Private Sub cmbSzolgjell_Change()
    Dim szolgJell As String
    If mode = 0 Then
        szolgJell = GetComboErtek(cmbSzolgjell)
        Select Case szolgJell
            Case "LE", "LA":
                SetComboVal cmbMUVEL, "BHJ"
                SetComboVal cmbFSZAM, "736"
                
            Case "LF":
                SetComboVal cmbMUVEL, "BHJ"
                SetComboVal cmbFSZAM, "737"
                
            Case "HK":
                SetComboVal cmbMUVEL, "BHJ"
                If iWorkMode = DISZPECSER Then
                    If spcOBJTIP = "03" Then
                        SetComboVal cmbFSZAM, "62317"
                    ElseIf spcOBJTIP = "17" Then
                        SetComboVal cmbFSZAM, "62325"
                    End If
                End If
                
            Case Else:
                'setcombo2 cmbMUVEL
                SetComboVal cmbFSZAM, "62317"
        End Select
    End If
End Sub

Private Sub cmbTIPUSH_change()
    Dim tipusHiba As String
    tipusHiba = GetComboErtek(cmbTIPUSH)
    
    If mode = 0 Then
        TipushFriss = 1
    
        If tipusHiba = "" Then
            txtHIBLEIR = ""
        Else
            txtHIBLEIR = cmbTIPUSH
        End If
        
        Select Case tipusHiba
            Case "229":
                SetComboVal cmbMUVEL, "SZV"
                SetComboVal cmbKARBTIP, "1"
    
            Case "007", "008", "009":
                SetComboVal cmbMUVEL, "HIT"
                SetComboVal cmbKARBTIP, "1"
            
            Case "246", "247", "027":
                SetComboVal cmbMUVEL, "SAV"
                SetComboVal cmbKARBTIP, "1"
                
            Case Else:
                SetComboVal cmbMUVEL, ""
                SetComboVal cmbKARBTIP, ""
        End Select
    End If

    Select Case tipusHiba
        Case "272":
            lblPLOMBAZAS.Visible = True
            cmbPLOMBAZAS.Visible = True
        
        Case "028", "029", "015", "016":
            lblFELUJITOTT.Visible = True
            lblUJ.Visible = True
            txtFELUJITOTT.Visible = True
            txtUJ.Visible = True
        
        Case Else:
            lblPLOMBAZAS.Visible = False
            cmbPLOMBAZAS.Visible = False
            lblFELUJITOTT.Visible = False
            lblUJ.Visible = False
            txtFELUJITOTT.Visible = False
            txtUJ.Visible = False
    End Select
End Sub

Private Sub cmdClose_Click()
    Back Me
End Sub

Private Sub cmdHELY_Click()
    Form001b.mode = 0
    Form001b.Show 1
    If iWorkMode = DISZPECSER Then cmbSzolgjell_Change
End Sub

Private Sub cmdOK_Click()
    Screen.MousePointer = vbHourglass
    
    If optAllapot(1) = True Then        'Elojegyzett
        txtAllapot = "1"
    ElseIf optAllapot(2) = True Then    'Nyomtatott
        txtAllapot = "2"
    ElseIf optAllapot(3) = True Then    'Sztorno
        txtAllapot = "3"
    ElseIf optAllapot(4) = True Then    'Visszaerkezett
        txtAllapot = "4"
    End If
    
    If mode = 0 Then
        Dim i As String
        i = util.RekordInsert(Me, "MUNKALAP")
        If MsgBox("Kívánja nyomtatni a munkalapot?", vbQuestion + vbYesNo, "Nyomtatás") = vbYes Then
            util.MunkalapAllapot i, 2
            util.PrintMunkalap "1", i
            Nyomtat "munuf.rpt", 1
        End If
    Else
        util.RekordUpdate Me, "MUNKALAP", mode
    End If
    
    Form001.iRefresh = 1
    Screen.MousePointer = vbDefault
    Back Me
End Sub


Private Sub cmdOSSZESITO_Click()
    Screen.MousePointer = vbHourglass

    Dim tipusHiba As String
    tipusHiba = GetComboErtek(cmbTIPUSH)

    If MsgBox("Biztosan nyomtatni szeretné az összesítõt?", vbYesNo + vbExclamation, "Tisztelt felhasználó!") = vbYes Then
        If tipusHiba = 272 Then 'Vizora plombazas
            util.PrintMunkalapSok txtREF, 1
            Nyomtat "plombossz.rpt", 0
        Else
            util.PrintMunkalapSok txtREF, 2
            Nyomtat "vizoraossz.rpt", 0
        End If
    End If
    
    Screen.MousePointer = vbDefault
End Sub

Private Sub Form_Activate()
    Form001a.Caption = "Munkalap " & AktivForm()
    If txtOBJID <> "" Then util.MunkalapObjKiir Me
    
    If txtREF <> "" Then MsgBox txtREF & ". munkalapról készített másolat! Bizonyos adatai nem módosíthatóak!", vbExclamation, "Tisztelt felhasználó!"
End Sub

Private Sub Form_Load()
    KeyPreview = True
    SetCombo Me
    
    If mode <> 0 Then   'View/Edit record, recordId = mode
        TipushFriss = 0
        util.RekordFeltolt Me, "MUNKALAP", mode
        optAllapot.Item(txtAllapot) = True
        
        'Sztorno munkalapot nem lehet masmilyen allapotura allitani,
        'orokre sztorno marad.
        If txtAllapot = 3 Then spcALLAPOT.Enabled = False
        
        txtKIALLDAT.Locked = True   'Kiallitas datuma nem javithato utolag (altalaban)
        If txtREF <> "" Then    'Ha van mar errol a munkalaprol masolat, azaz a referencia mezo nem ures
            txtNAPSZAM.Locked = True    'egy csomo minden nem javithato utolag.
            txtBEJDAT.Locked = True
            cmbSZEREGYS.Locked = True
            cmbMFDOLG.Locked = True
            cmbSzolgjell.Locked = True
            'txtBEJNEV.Locked = True
            cmbFSZAM.Locked = True
            cmbMKAP.Locked = True
            cmbMUVEL.Locked = True
            cmbMUNVEGZ.Locked = True
            cmbSZOLTIP.Locked = True
            cmbMUNSZ.Locked = True
            cmbKARBTIP.Locked = True
            'Me.txtIDOTOL.Locked = True
            'Me.txtIDOIG.Locked = True
  
            txtMUNELV.Locked = False
            cmbTIPUSH.Locked = False
            txtHIBLEIR.Locked = False
  
           'Osszesito keszitese csak plombazashoz engedelyezett!
           'Plombazas csak bizonyos tipushiba eseten lehetseges,
           'ezert lekerdezzuk, hogy mi is a tipushiba.
           Dim tipusHiba As Integer
           If cmbTIPUSH.ListIndex <> -1 Then
               tipusHiba = GetComboErtek(cmbTIPUSH)
           Else
               tipusHiba = 0
           End If
       
           'If tipusHiba = 272 Then
               ' Me.cmbPLOMBAZAS.Visible = True
               'Me.lblPLOMBAZAS.Visible = True
           'Else
               ' Me.cmbPLOMBAZAS.Visible = False
               ' Me.lblPLOMBAZAS.Visible = False
           'End If
    
            Select Case tipusHiba   'Ezek a plombazassal kapcsolatos tipushibak
                Case "272", "028", "029", "015", "016"
                    cmdOSSZESITO.Enabled = True
            End Select
        Else
            cmdOSSZESITO.Enabled = False
        End If  'txtREF
    
    Else    'Insert new record
        txtBEJDAT = DateValue(Now())
        txtKIALLDAT = DateValue(Now())
        txtMUNELV = DateValue(Now())
        SetComboVal cmbSZEREGYS, "01"
    End If  'mode
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

