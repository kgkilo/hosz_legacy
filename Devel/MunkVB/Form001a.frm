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
      Height          =   315
      Left            =   3195
      TabIndex        =   3
      Top             =   360
      Width           =   1005
   End
   Begin VB.TextBox txtBEJDAT 
      Alignment       =   2  'Center
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
      Begin VB.OptionButton Option1 
         Caption         =   "Visszaérkezett"
         Height          =   285
         Index           =   4
         Left            =   360
         TabIndex        =   28
         Top             =   1665
         Width           =   1680
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Sztornó"
         Height          =   285
         Index           =   3
         Left            =   360
         TabIndex        =   27
         Top             =   1215
         Width           =   1140
      End
      Begin VB.OptionButton Option1 
         Caption         =   "Nyomtatott"
         Height          =   285
         Index           =   2
         Left            =   360
         TabIndex        =   26
         Top             =   765
         Width           =   1725
      End
      Begin VB.OptionButton Option1 
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
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
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   3330
      TabIndex        =   35
      Top             =   90
      Width           =   735
   End
   Begin VB.Label Label5 
      Alignment       =   2  'Center
      Caption         =   "Bejelentve"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   2340
      TabIndex        =   34
      Top             =   90
      Width           =   735
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "Napló sz."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   238
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   1350
      TabIndex        =   33
      Top             =   90
      Width           =   735
   End
   Begin VB.Label Label2 
      Alignment       =   1  'Right Justify
      Caption         =   "Bejelentõ neve"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
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
Public mode As Long
Public TipushFriss As Integer

Private Sub cmbFSZAM_Change()
If cmbFSZAM.ListIndex <> -1 Then
    'util.munkalapfszamvalaszt cmbFSZAM, cmbOBJTIP, cmbOBJID
    txtFNEV = util.getcombonev(cmbFSZAM)
    'spcVALASZT.Enabled = False
 Else
    'spcVALASZT.Enabled = True
 End If
End Sub


Private Sub cmbSzolgjell_Change()
Dim ggg As String
If mode = 0 Then
 ggg = util.getcomboertek(cmbSZOLGJELL)
 If ggg = "LE" Or ggg = "LF" Or ggg = "LA" Then
  util.setcomboVal cmbMUVEL, "BHJ"
  util.setcomboVal cmbFSZAM, "736"
 Else
  'util.setcombo2 cmbMUVEL
  util.setcomboVal cmbFSZAM, "62317"
 End If
End If
End Sub

Private Sub cmbTIPUSH_change()
Dim www As String
www = util.getcomboertek(cmbTIPUSH)
 If mode = 0 Then
  Me.TipushFriss = 1
 End If
If mode = 0 Then
 If cmbTIPUSH.ListIndex <> -1 And Me.TipushFriss = 1 Then
  txtHIBLEIR = cmbTIPUSH
 End If
 Me.TipushFriss = 1
 
 
 If www = "229" Then
  util.setcomboVal cmbMUVEL, "SZV"
  util.setcomboVal cmbKARBTIP, "1"
 End If
 If www = "007" Or www = "008" Or www = "009" Then
  util.setcomboVal cmbMUVEL, "HIT"
  util.setcomboVal cmbKARBTIP, "1"
 End If
 If www = "246" Or www = "247" Or www = "027" Then
  util.setcomboVal cmbMUVEL, "SAV"
  util.setcomboVal cmbKARBTIP, "1"
 End If
End If
 If www = "272" Then
  Me.lblPLOMBAZAS.Visible = True
  Me.cmbPLOMBAZAS.Visible = True
 Else
  Me.lblPLOMBAZAS.Visible = False
  Me.cmbPLOMBAZAS.Visible = False
 End If

 If www = "028" Or www = "029" Or www = "015" Or www = "016" Then
  Me.lblFELUJITOTT.Visible = True
  Me.lblUJ.Visible = True
  Me.txtFELUJITOTT.Visible = True
  Me.txtUJ.Visible = True
 Else
  Me.lblFELUJITOTT.Visible = False
  Me.lblUJ.Visible = False
  Me.txtFELUJITOTT.Visible = False
  Me.txtUJ.Visible = False
 End If

End Sub

Private Sub cmdClose_Click()
 Back Me
End Sub

Private Sub cmdHELY_Click()
 Form001b.mode = 0
 Form001b.Show 1
End Sub

Private Sub cmdOK_Click()
Screen.MousePointer = vbHourglass
If Option1(1) = True Then
    txtAllapot = "1"
ElseIf Option1(2) = True Then
    txtAllapot = "2"
ElseIf Option1(3) = True Then
    txtAllapot = "3"
ElseIf Option1(4) = True Then
    txtAllapot = "4"
End If
If mode = 0 Then
 Dim i As String
 i = util.rekordinsert(Me, "MUNKALAP")
 If MsgBox("Kívánja nyomtatni a munkalapot?", vbQuestion + vbYesNo, "Nyomtatás") = vbYes Then
   util.munkalapallapot i, 2
   util.printmunkalap "1", i
   Nyomtat "munuf.rpt", 1
 End If
Else
  util.rekordupdate Me, "MUNKALAP", mode
End If
Form001.iRefresh = 1
Screen.MousePointer = vbDefault
Back Me
End Sub

Private Sub cmdOSSZESITO_Click()
Dim ZZZ As String
Screen.MousePointer = vbHourglass
ZZZ = util.getcomboertek(cmbTIPUSH)

If MsgBox("Biztosan nyomtatni szeretné az összesítõt?", vbYesNo + vbExclamation, "Tisztelt felhasználó!") = vbYes Then
 If ZZZ = 272 Then
   util.printmunkalapsok txtREF, 1
   Nyomtat "plombossz.rpt", 0
 Else
  util.printmunkalapsok txtREF, 2
  Nyomtat "vizoraossz.rpt", 0
 End If
End If
Screen.MousePointer = vbDefault
End Sub

Private Sub Form_Activate()
 Form001a.Caption = "Munkalap " & AktivForm()
 If txtOBJID <> "" Then
  util.munkalapobjkiir Me
 End If
 If Me.txtREF <> "" Then
  MsgBox txtREF & ". munkalopról készített másolat! Bizonyos adatai nem módosíthatóak!", vbExclamation, "Tisztelt felhasználó!"
 End If
End Sub

Private Sub Form_Load()
 
 KeyPreview = True
 util.setcombo Me
 If mode <> 0 Then
  Me.TipushFriss = 0
  util.rekordfeltolt Me, "MUNKALAP", mode
  Option1.Item(txtAllapot) = True
  If txtAllapot = 3 Then
   spcALLAPOT.Enabled = False
  End If
 If Me.txtREF <> "" Then
   Me.txtNAPSZAM.Locked = True
   Me.txtBEJDAT.Locked = True
   Me.txtKIALLDAT.Locked = True
   Me.cmbSZEREGYS.Locked = True
   Me.cmbMFDOLG.Locked = True
   Me.cmbSZOLGJELL.Locked = True
   'Me.txtBEJNEV.Locked = True
   Me.cmbFSZAM.Locked = True
   Me.cmbTIPUSH.Locked = True
   Me.txtMUNELV.Locked = True
   'Me.txtIDOTOL.Locked = True
   'Me.txtIDOIG.Locked = True
   Me.cmbMKAP.Locked = True
   Me.cmbMUVEL.Locked = True
   Me.cmbMUNVEGZ.Locked = True
   Me.cmbSZOLTIP.Locked = True
   Me.cmbMUNSZ.Locked = True
   Me.cmbKARBTIP.Locked = True
   Me.txtHIBLEIR.Locked = True
 End If
  
  Dim plomb As Integer
  If cmbTIPUSH.ListIndex <> -1 Then
   plomb = util.getcomboertek(cmbTIPUSH)
  Else
   plomb = 0
  End If
 'If plomb = 272 Then
 ' Me.cmbPLOMBAZAS.Visible = True
  'Me.lblPLOMBAZAS.Visible = True
 'Else
 ' Me.cmbPLOMBAZAS.Visible = False
 ' Me.lblPLOMBAZAS.Visible = False
 'End If
 
 'If plomb = "028" Or plomb = "029" Or plomb = "015" Or plomb = "016" Then
 ' MsgBox "Vízóra"
 'Else
 'End If
 
 
 If plomb = 272 Or plomb = "028" Or plomb = "029" Or plomb = "015" Or plomb = "016" And Me.txtREF <> "" Then
  Me.cmdOSSZESITO.Enabled = True
 Else
  Me.cmdOSSZESITO.Enabled = False
 End If
 Else
  Me.txtBEJDAT = Date
  Me.txtKIALLDAT = Date
  Me.txtMUNELV = Date
 End If
End Sub

Private Sub Form_KeyDown(Keycode As Integer, Shift As Integer)
 KeyCommand Keycode
 'Keycode = 0
End Sub

Private Sub KeyCommand(Keycode As Integer)
 Static CtrlKey As Boolean
 Select Case Keycode
  Case vbKeyF1:
  Case vbKeyX:
             If CtrlKey Then
              Unload Me
             End If
  Case vbKeyEscape: cmdClose_Click
  Case vbKeyF5: cmdOK_Click
 End Select
 If Keycode = vbKeyControl Then
  CtrlKey = True
 Else
  CtrlKey = False
 End If
End Sub


