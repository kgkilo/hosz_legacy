VERSION 5.00
Object = "{00025600-0000-0000-C000-000000000046}#5.1#0"; "crystl32.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Object = "{0D452EE1-E08F-101A-852E-02608C4D0BB4}#2.0#0"; "FM20.DLL"
Object = "{8AE029D0-08E3-11D1-BAA2-444553540000}#3.0#0"; "Vsflex3.ocx"
Begin VB.Form Form001 
   Caption         =   "Raktár"
   ClientHeight    =   8100
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8880
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   ScaleHeight     =   3.61061e5
   ScaleMode       =   0  'User
   ScaleWidth      =   6.20711e6
   ShowInTaskbar   =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.CommandButton cmdRaktarLista 
      Caption         =   "Raktár lista"
      Height          =   480
      Left            =   5430
      TabIndex        =   93
      TabStop         =   0   'False
      ToolTipText     =   "Listát készít a raktáron lévõ berendezésekrõl"
      Top             =   30
      Width           =   1035
   End
   Begin VB.CommandButton cmdKarbantartandoLista 
      Caption         =   "Karbantart.          lista"
      Enabled         =   0   'False
      Height          =   480
      Left            =   6660
      TabIndex        =   92
      TabStop         =   0   'False
      ToolTipText     =   "Listát készít az ebben az évben még hátralévõ karbantartásokról"
      Top             =   30
      Width           =   1035
   End
   Begin VB.CommandButton cmdSZALLITO 
      Caption         =   "Szállítólevél"
      Height          =   480
      Left            =   4200
      TabIndex        =   91
      TabStop         =   0   'False
      ToolTipText     =   "Szállítólevelet nyomtat a kijelölt típusú berendezésekrõl, amelyekrõl eddig még nem készült ilyen."
      Top             =   30
      Width           =   1035
   End
   Begin VB.CommandButton cmdNEM_FELSZERELHETO 
      Caption         =   "N F"
      Height          =   375
      Left            =   3600
      TabIndex        =   90
      TabStop         =   0   'False
      ToolTipText     =   "A raktárban kijelölt berendezést 'Nem felszerelhetõ' állapotúvá teszi."
      Top             =   3082
      Width           =   615
   End
   Begin VB.CommandButton cmdSELEJT 
      Caption         =   "Selejt"
      Height          =   375
      Left            =   7680
      TabIndex        =   89
      TabStop         =   0   'False
      ToolTipText     =   "A raktárban kijelölt berendezést selejtté teszi."
      Top             =   3082
      Width           =   615
   End
   Begin VB.ComboBox spcR_ALLAPOT 
      Height          =   315
      Left            =   4200
      TabIndex        =   88
      Tag             =   "367"
      ToolTipText     =   "Kiválasztható, hogy a raktárban lévõ berendezések közül melyeket mutassa (mind, selejt, nem felszerelhetõ, felszerelhetõ)."
      Top             =   840
      Width           =   3495
   End
   Begin VB.CommandButton cmdSzallitonal2Felszerelt 
      Caption         =   "<<<"
      Height          =   375
      Left            =   7680
      TabIndex        =   12
      ToolTipText     =   "Felszerelt"
      Top             =   3855
      Width           =   615
   End
   Begin VB.CommandButton cmdFelszerelt2Szallitonal 
      Caption         =   ">>>"
      Height          =   375
      Left            =   3600
      TabIndex        =   8
      ToolTipText     =   "Szállítóhoz"
      Top             =   3855
      Width           =   615
   End
   Begin VB.CommandButton cmdSzallitonal2Raktar 
      Caption         =   "<"
      Height          =   375
      Left            =   7680
      TabIndex        =   11
      ToolTipText     =   "Raktárba"
      Top             =   2310
      Width           =   615
   End
   Begin VB.CommandButton cmdRaktar2Szallitonal 
      Caption         =   ">"
      Height          =   375
      Left            =   7680
      TabIndex        =   10
      ToolTipText     =   "Szállítóhoz"
      Top             =   1710
      Width           =   615
   End
   Begin VB.CommandButton cmdRaktar2Felszerelt 
      Caption         =   "<"
      Height          =   375
      Left            =   3600
      TabIndex        =   7
      ToolTipText     =   "Felszerelt"
      Top             =   2310
      Width           =   615
   End
   Begin VB.CommandButton cmdFelszerelt2Raktar 
      Caption         =   ">"
      Height          =   375
      Left            =   3600
      TabIndex        =   6
      ToolTipText     =   "Raktárba"
      Top             =   1710
      Width           =   615
   End
   Begin VB.CheckBox chkFrissit 
      Height          =   285
      Left            =   3240
      TabIndex        =   4
      TabStop         =   0   'False
      ToolTipText     =   "Ha be van kapcsolva, a Frissítés gomb megnyomása nélkül, minden változás után azonnal frissül a lenti 3 lista"
      Top             =   795
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
      TabIndex        =   3
      ToolTipText     =   "Lenti 3 lista frissítése"
      Top             =   360
      Width           =   1755
   End
   Begin VB.Frame boxERZEKELO 
      Caption         =   "Érzékelõ"
      Height          =   3920
      Left            =   8280
      TabIndex        =   49
      Top             =   4320
      Width           =   3495
      Begin VB.TextBox txtE_ID 
         Height          =   300
         Left            =   3195
         TabIndex        =   87
         TabStop         =   0   'False
         Text            =   "ID"
         Top             =   585
         Visible         =   0   'False
         Width           =   195
      End
      Begin VB.CommandButton cmdE_SAVE 
         Caption         =   "Mentés"
         Height          =   285
         Left            =   2580
         TabIndex        =   46
         Top             =   2490
         Width           =   810
      End
      Begin VB.TextBox txtE_PLOMBA2 
         Height          =   285
         Left            =   1035
         MaxLength       =   12
         TabIndex        =   45
         ToolTipText     =   "2. plomba száma"
         Top             =   2850
         Width           =   1365
      End
      Begin VB.TextBox txtE_PLOMBA 
         Height          =   285
         Left            =   1035
         MaxLength       =   12
         TabIndex        =   44
         ToolTipText     =   "Plomba száma"
         Top             =   2490
         Width           =   1365
      End
      Begin VB.TextBox txtE_SZUKSHOSSZ 
         Height          =   285
         Left            =   1035
         TabIndex        =   43
         ToolTipText     =   "Szükséges hossz"
         Top             =   2130
         Width           =   810
      End
      Begin VB.TextBox txtE_VEZHOSSZ 
         Height          =   285
         Left            =   2580
         TabIndex        =   42
         ToolTipText     =   "Hossz"
         Top             =   1770
         Width           =   810
      End
      Begin VB.TextBox txtE_BENYHOSSZ 
         Height          =   285
         Left            =   1035
         TabIndex        =   41
         ToolTipText     =   "Szonda hossza"
         Top             =   1770
         Width           =   810
      End
      Begin VB.TextBox txtE_ELHELYEZ 
         Height          =   285
         Left            =   1035
         MaxLength       =   25
         TabIndex        =   40
         ToolTipText     =   "Elhelyezkedés"
         Top             =   1410
         Width           =   2355
      End
      Begin VB.TextBox txtE_TIPUS 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1035
         MaxLength       =   20
         TabIndex        =   39
         ToolTipText     =   "Típus"
         Top             =   975
         Width           =   2355
      End
      Begin VB.TextBox txtE_GYSZAM 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1035
         MaxLength       =   15
         TabIndex        =   37
         ToolTipText     =   "Gyári szám"
         Top             =   240
         Width           =   2355
      End
      Begin MSComCtl2.DTPicker datE_HITIDO 
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
         Left            =   1035
         TabIndex        =   38
         ToolTipText     =   "Hitelesítés ideje"
         Top             =   585
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   582
         _Version        =   393216
         Enabled         =   0   'False
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
         Format          =   23461889
         CurrentDate     =   37013
      End
      Begin VB.Line Line3 
         X1              =   185
         X2              =   3390
         Y1              =   1335
         Y2              =   1335
      End
      Begin VB.Label lblSZUKS_HOSSZ 
         Caption         =   "Szüks. h:"
         Height          =   255
         Left            =   165
         TabIndex        =   81
         Top             =   2145
         Width           =   900
      End
      Begin VB.Label lblE_VEZHOSSZ 
         Caption         =   "Hossz:"
         Height          =   255
         Left            =   2010
         TabIndex        =   80
         Top             =   1785
         Width           =   525
      End
      Begin VB.Label lblE_PLOMBA2 
         Caption         =   "Plomba 2:"
         Height          =   255
         Left            =   165
         TabIndex        =   79
         Top             =   2865
         Width           =   900
      End
      Begin VB.Label lblE_PLOMBA 
         Caption         =   "Plomba 1:"
         Height          =   255
         Left            =   165
         TabIndex        =   78
         Top             =   2505
         Width           =   900
      End
      Begin VB.Label lblE_BENYHOSSZ 
         Caption         =   "Sz. hossz:"
         Height          =   255
         Left            =   165
         TabIndex        =   77
         Top             =   1785
         Width           =   900
      End
      Begin VB.Label lblE_ELHELYEZ 
         Caption         =   "Hely:"
         Height          =   255
         Left            =   165
         TabIndex        =   76
         Top             =   1425
         Width           =   900
      End
      Begin VB.Label lblE_TIPUS 
         Caption         =   "Típus:"
         Height          =   255
         Left            =   165
         TabIndex        =   75
         Top             =   990
         Width           =   900
      End
      Begin VB.Label lblE_HITIDO 
         Caption         =   "Hit. idõ:"
         Height          =   255
         Left            =   165
         TabIndex        =   74
         Top             =   630
         Width           =   900
      End
      Begin VB.Label lblE_GYSZAM 
         Caption         =   "Gy.szám:"
         Height          =   255
         Left            =   165
         TabIndex        =   73
         Top             =   270
         Width           =   915
      End
   End
   Begin VB.Frame boxVIZMERO 
      Caption         =   "Vízmérõ"
      Height          =   3920
      Left            =   4200
      TabIndex        =   48
      Top             =   4320
      Width           =   3495
      Begin VB.TextBox txtV_ID 
         Height          =   300
         Left            =   3195
         TabIndex        =   86
         TabStop         =   0   'False
         Text            =   "ID"
         Top             =   585
         Visible         =   0   'False
         Width           =   195
      End
      Begin VB.CommandButton cmdV_SAVE 
         Caption         =   "Mentés"
         Height          =   285
         Left            =   2580
         TabIndex        =   34
         Top             =   2490
         Width           =   810
      End
      Begin VB.TextBox txtV_MEGJ 
         Height          =   285
         Left            =   1035
         TabIndex        =   36
         ToolTipText     =   "Megjegyzés"
         Top             =   3570
         Width           =   2355
      End
      Begin VB.TextBox txtV_KULCS 
         Height          =   285
         Left            =   1035
         TabIndex        =   35
         ToolTipText     =   "Kulcs található"
         Top             =   3210
         Width           =   2355
      End
      Begin VB.TextBox txtV_PLOMBA 
         Height          =   285
         Left            =   1035
         MaxLength       =   12
         TabIndex        =   33
         ToolTipText     =   "Plomba száma"
         Top             =   2490
         Width           =   1365
      End
      Begin VB.TextBox txtV_TOMEGARAM 
         Height          =   285
         Left            =   1035
         TabIndex        =   32
         ToolTipText     =   "Tervezett tömegáram"
         Top             =   2130
         Width           =   810
      End
      Begin VB.TextBox txtV_ATMERO 
         Height          =   285
         Left            =   2580
         TabIndex        =   31
         ToolTipText     =   "Átmérõ"
         Top             =   1770
         Width           =   810
      End
      Begin VB.TextBox txtV_IMPULZUS 
         Height          =   285
         Left            =   1035
         TabIndex        =   30
         ToolTipText     =   "liter / impulzus"
         Top             =   1770
         Width           =   810
      End
      Begin VB.TextBox txtV_ELHELYEZ 
         Height          =   285
         Left            =   1035
         MaxLength       =   25
         TabIndex        =   29
         ToolTipText     =   "Elhelyezkedés"
         Top             =   1410
         Width           =   2355
      End
      Begin VB.TextBox txtV_TIPUS 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1035
         MaxLength       =   20
         TabIndex        =   28
         ToolTipText     =   "Típus"
         Top             =   975
         Width           =   2355
      End
      Begin VB.TextBox txtV_GYSZAM 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1035
         MaxLength       =   15
         TabIndex        =   26
         ToolTipText     =   "Gyári szám"
         Top             =   255
         Width           =   2355
      End
      Begin MSComCtl2.DTPicker datV_HITIDO 
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
         Left            =   1035
         TabIndex        =   27
         ToolTipText     =   "Hitelesítés ideje"
         Top             =   585
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   582
         _Version        =   393216
         Enabled         =   0   'False
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
         Format          =   23461889
         CurrentDate     =   37013
      End
      Begin VB.Line Line2 
         X1              =   185
         X2              =   3390
         Y1              =   1335
         Y2              =   1335
      End
      Begin VB.Label lblV_TOMEGARAM 
         Caption         =   "Terv. t.á.:"
         Height          =   255
         Left            =   165
         TabIndex        =   72
         Top             =   2145
         Width           =   900
      End
      Begin VB.Label lblV_ATMERO 
         Caption         =   "Átmérõ:"
         Height          =   255
         Left            =   1980
         TabIndex        =   71
         Top             =   1785
         Width           =   525
      End
      Begin VB.Label lblV_MEGJ 
         Caption         =   "Megjegyzés:"
         Height          =   255
         Left            =   165
         TabIndex        =   70
         Top             =   3585
         Width           =   900
      End
      Begin VB.Label lblV_KULCS 
         Caption         =   "Kulcs:"
         Height          =   255
         Left            =   165
         TabIndex        =   69
         Top             =   3225
         Width           =   900
      End
      Begin VB.Label lblV_PLOMBA 
         Caption         =   "Plomba:"
         Height          =   255
         Left            =   165
         TabIndex        =   68
         Top             =   2505
         Width           =   900
      End
      Begin VB.Label lblV_IMPULZUS 
         Caption         =   "Impulzus:"
         Height          =   255
         Left            =   165
         TabIndex        =   67
         Top             =   1785
         Width           =   900
      End
      Begin VB.Label lblV_ELHELYEZ 
         Caption         =   "Hely:"
         Height          =   255
         Left            =   165
         TabIndex        =   66
         Top             =   1425
         Width           =   900
      End
      Begin VB.Label lblV_TIPUS 
         Caption         =   "Típus:"
         Height          =   255
         Left            =   165
         TabIndex        =   65
         Top             =   990
         Width           =   900
      End
      Begin VB.Label lblV_HITIDO 
         Caption         =   "Hit. idõ:"
         Height          =   255
         Left            =   165
         TabIndex        =   64
         Top             =   630
         Width           =   900
      End
      Begin VB.Label lblV_GYSZAM 
         Caption         =   "Gy.szám:"
         Height          =   255
         Left            =   165
         TabIndex        =   63
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
      ToolTipText     =   "Lenti 3 listára kerülõ berendezés típusok"
      Top             =   600
      Width           =   1335
   End
   Begin VB.OptionButton optOBJTIP 
      Caption         =   "Érzékelõ"
      Height          =   195
      Index           =   2
      Left            =   240
      TabIndex        =   2
      ToolTipText     =   "Lenti 3 listára kerülõ berendezés típusok"
      Top             =   840
      Width           =   1335
   End
   Begin VB.OptionButton optOBJTIP 
      Caption         =   "Hõösszegzõ"
      Height          =   195
      Index           =   0
      Left            =   240
      TabIndex        =   0
      ToolTipText     =   "Lenti 3 listára kerülõ berendezés típusok"
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
      TabIndex        =   53
      Top             =   195
      Width           =   3495
      Begin MSForms.Label lblFRISSIT 
         Height          =   240
         Left            =   1560
         TabIndex        =   54
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
      TabIndex        =   9
      ToolTipText     =   "Raktáron lévõ berendezések"
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
      TabIndex        =   5
      ToolTipText     =   "Felszerelt berendezések"
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
      TabIndex        =   13
      ToolTipText     =   "Szállítónál lévõ berendezések"
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
      TabIndex        =   47
      Top             =   4320
      Width           =   3495
      Begin VB.TextBox txtH_ID 
         Enabled         =   0   'False
         Height          =   300
         Left            =   3210
         TabIndex        =   85
         TabStop         =   0   'False
         Text            =   "ID"
         Top             =   615
         Visible         =   0   'False
         Width           =   195
      End
      Begin VB.CommandButton cmdH_SAVE 
         Caption         =   "Mentés"
         Height          =   285
         Left            =   2565
         TabIndex        =   23
         Top             =   2490
         Width           =   810
      End
      Begin VB.TextBox txtH_MEGJ 
         Height          =   285
         Left            =   1035
         TabIndex        =   25
         ToolTipText     =   "Megjegyzés"
         Top             =   3570
         Width           =   2355
      End
      Begin VB.TextBox txtH_KULCS 
         Height          =   285
         Left            =   1035
         TabIndex        =   24
         ToolTipText     =   "Kulcs található"
         Top             =   3210
         Width           =   2355
      End
      Begin VB.TextBox txtH_PLOMBA 
         Height          =   285
         Left            =   1035
         MaxLength       =   12
         TabIndex        =   22
         ToolTipText     =   "Plomba száma"
         Top             =   2490
         Width           =   1365
      End
      Begin VB.TextBox txtH_IMPULZUS 
         Height          =   285
         Left            =   1035
         TabIndex        =   18
         ToolTipText     =   "liter / impulzus"
         Top             =   1770
         Width           =   810
      End
      Begin VB.TextBox txtH_ELHELYEZ 
         Height          =   285
         Left            =   1035
         MaxLength       =   25
         TabIndex        =   17
         ToolTipText     =   "Elhelyezkedés"
         Top             =   1410
         Width           =   2355
      End
      Begin VB.TextBox txtH_TIPUS 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1035
         MaxLength       =   20
         TabIndex        =   16
         ToolTipText     =   "Típus"
         Top             =   975
         Width           =   2355
      End
      Begin VB.TextBox txtH_GYSZAM 
         BackColor       =   &H8000000F&
         Enabled         =   0   'False
         Height          =   285
         Left            =   1035
         MaxLength       =   15
         TabIndex        =   14
         ToolTipText     =   "Gyári szám"
         Top             =   255
         Width           =   2355
      End
      Begin MSComCtl2.DTPicker datH_HITIDO 
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
         Left            =   1035
         TabIndex        =   15
         ToolTipText     =   "Hitelesítés ideje"
         Top             =   585
         Width           =   1455
         _ExtentX        =   2566
         _ExtentY        =   582
         _Version        =   393216
         Enabled         =   0   'False
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
         Format          =   23658497
         CurrentDate     =   37013
      End
      Begin VB.Line Line1 
         X1              =   185
         X2              =   3390
         Y1              =   1335
         Y2              =   1335
      End
      Begin MSForms.ComboBox cmbH_ELEKTRONIKA 
         Height          =   315
         Left            =   2565
         TabIndex        =   21
         Tag             =   "366"
         ToolTipText     =   "Elektronika"
         Top             =   2100
         Width           =   825
         VariousPropertyBits=   746604571
         DisplayStyle    =   3
         Size            =   "1455;556"
         MatchEntry      =   1
         ShowDropButtonWhen=   2
         FontName        =   "Arial"
         FontHeight      =   165
         FontCharSet     =   0
         FontPitchAndFamily=   2
      End
      Begin MSForms.ComboBox cmbH_HELYZET 
         Height          =   315
         Left            =   1035
         TabIndex        =   20
         Tag             =   "365"
         ToolTipText     =   "Helyzet"
         Top             =   2100
         Width           =   825
         VariousPropertyBits=   746604571
         DisplayStyle    =   3
         Size            =   "1455;556"
         MatchEntry      =   1
         ShowDropButtonWhen=   2
         FontName        =   "Arial"
         FontHeight      =   165
         FontCharSet     =   0
         FontPitchAndFamily=   2
      End
      Begin MSForms.ComboBox cmbH_LEOLV 
         Height          =   315
         Left            =   2565
         TabIndex        =   19
         Tag             =   "316"
         ToolTipText     =   "Leolvasás"
         Top             =   1770
         Width           =   825
         VariousPropertyBits=   746604571
         DisplayStyle    =   3
         Size            =   "1455;556"
         MatchEntry      =   1
         ShowDropButtonWhen=   2
         FontName        =   "Arial"
         FontHeight      =   165
         FontCharSet     =   0
         FontPitchAndFamily=   2
      End
      Begin VB.Label lblH_IMPULZUS 
         Caption         =   "l / impulzus:"
         Height          =   255
         Left            =   180
         TabIndex        =   84
         Top             =   1785
         Width           =   900
      End
      Begin VB.Label lblH_LEOLV 
         Caption         =   "Leolv.:"
         Height          =   255
         Left            =   2025
         TabIndex        =   83
         Top             =   1785
         Width           =   525
      End
      Begin VB.Label lblH_ELEKTRONIKA 
         Caption         =   "Elektr.:"
         Height          =   255
         Left            =   2025
         TabIndex        =   82
         Top             =   2145
         Width           =   525
      End
      Begin VB.Label lblH_MEGJ 
         Caption         =   "Megjegyzés:"
         Height          =   255
         Left            =   180
         TabIndex        =   62
         Top             =   3585
         Width           =   900
      End
      Begin VB.Label lblH_KULCS 
         Caption         =   "Kulcs:"
         Height          =   255
         Left            =   180
         TabIndex        =   61
         Top             =   3225
         Width           =   900
      End
      Begin VB.Label lblH_PLOMBA 
         Caption         =   "Plomba:"
         Height          =   255
         Left            =   180
         TabIndex        =   60
         Top             =   2505
         Width           =   900
      End
      Begin VB.Label lblH_HELYZET 
         Caption         =   "Helyzet:"
         Height          =   255
         Left            =   180
         TabIndex        =   59
         Top             =   2145
         Width           =   900
      End
      Begin VB.Label lblH_ELHELYEZ 
         Caption         =   "Hely:"
         Height          =   255
         Left            =   180
         TabIndex        =   58
         Top             =   1425
         Width           =   900
      End
      Begin VB.Label lblH_TIPUS 
         Caption         =   "Típus:"
         Height          =   255
         Left            =   185
         TabIndex        =   57
         Top             =   990
         Width           =   895
      End
      Begin VB.Label lblH_HITIDO 
         Caption         =   "Hit. idõ:"
         Height          =   255
         Left            =   185
         TabIndex        =   56
         Top             =   630
         Width           =   895
      End
      Begin VB.Label lblH_GYSZAM 
         Caption         =   "Gy.szám:"
         Height          =   255
         Left            =   165
         TabIndex        =   55
         Top             =   270
         Width           =   915
      End
   End
   Begin VB.Label lblSZALLITONAL 
      Alignment       =   2  'Center
      Caption         =   "S Z Á L L Í T Ó N Á L"
      Height          =   255
      Left            =   8280
      TabIndex        =   52
      Top             =   1200
      Width           =   3495
   End
   Begin VB.Label lblRAKTARON 
      Alignment       =   2  'Center
      Caption         =   "R A K T Á R O N"
      Height          =   255
      Left            =   4200
      TabIndex        =   51
      Top             =   1200
      Width           =   3495
   End
   Begin VB.Label lblFELSZERELVE 
      Alignment       =   2  'Center
      Caption         =   "F E L S Z E R E L V E"
      Height          =   255
      Left            =   120
      TabIndex        =   50
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

Private Sub cmdE_SAVE_Click()
    util.Save Me, ERZEKELO
End Sub

Private Sub cmdFelszerelt2Szallitonal_Click()
    util.athelyez "Felszerelt", "Szallito", grdFelszerelt.TextMatrix(grdFelszerelt.Row, 1)
    frissit
End Sub

Private Sub cmdFelszerelt2Raktar_Click()
    util.athelyez "Felszerelt", "Raktar", grdFelszerelt.TextMatrix(grdFelszerelt.Row, 1)
    frissit
End Sub

Private Sub cmdH_SAVE_Click()
    util.Save Me, HOOSSZEGZO
End Sub

Private Sub cmdKarbantartandoLista_Click()
    util.prepareTAB "R02"
    Nyomtat "TAB_R02.rpt", 0
End Sub

Private Sub cmdNEM_FELSZERELHETO_Click()
    util.setallapot grdRaktaron.TextMatrix(grdRaktaron.Row, 1), "N"
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

Private Sub cmdRaktarLista_Click()
    util.prepareTAB "R01"
    Nyomtat "TAB_R01.rpt", 0
End Sub

Private Sub cmdSELEJT_Click()
    util.setallapot grdRaktaron.TextMatrix(grdRaktaron.Row, 1), "S"
    frissit
End Sub

Private Sub cmdSZALLITO_Click()
    util.prepareTAB "R03", sOBJTIP
    Nyomtat "TAB_R03.rpt", 0
End Sub

Private Sub cmdSzallitonal2Felszerelt_Click()
    util.athelyez "Szallito", "Felszerelt", grdSzallitonal.TextMatrix(grdSzallitonal.Row, 1)
    frissit
End Sub

Private Sub cmdSzallitonal2Raktar_Click()
    util.athelyez "Szallito", "Raktar", grdSzallitonal.TextMatrix(grdSzallitonal.Row, 1)
    frissit
End Sub

Private Sub cmdV_SAVE_Click()
    util.Save Me, VIZORA
End Sub

Private Sub grdFelszerelt_SelChange()
    If grdFelszerelt.Rows > 0 Then
        InfoTorol
        util.LoadInfo Me, grdFelszerelt.TextMatrix(grdFelszerelt.Row, 1), sOBJTIP, "Felszerelt"
    End If
End Sub

Private Sub grdRaktaron_SelChange()
    If grdRaktaron.Rows > 0 Then
        InfoTorol
        util.LoadInfo Me, grdRaktaron.TextMatrix(grdRaktaron.Row, 1), sOBJTIP, "Raktar"
    End If
End Sub

Private Sub grdSzallitonal_SelChange()
    If grdSzallitonal.Rows > 0 Then
        InfoTorol
        util.LoadInfo Me, grdSzallitonal.TextMatrix(grdSzallitonal.Row, 1), sOBJTIP, "Szallitonal"
    End If
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
    
    util.setcombo Me
    util.setcomboval spcR_ALLAPOT, "A"
    iRefresh = 1
    sOBJTIP = HOOSSZEGZO
    frissit
    
    grdFelszerelt.Rows = 1
    grdRaktaron.Rows = 1
    grdSzallitonal.Rows = 1
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

Private Sub GridFeltolt()
    Screen.MousePointer = vbHourglass
    
    grdFelszerelt.Redraw = False
    grdRaktaron.Redraw = False
    grdSzallitonal.Redraw = False
    
    util.Gridder grdFelszerelt, "FELSZERELT", sOBJTIP
    util.Gridder grdRaktaron, "RAKTAR", sOBJTIP, util.GetComboErtek(spcR_ALLAPOT)
    util.Gridder grdSzallitonal, "SZALLITONAL", sOBJTIP
    
    grdFelszerelt.Redraw = True
    grdRaktaron.Redraw = True
    grdSzallitonal.Redraw = True
    
    grdFelszerelt.ExtendLastCol = True
    grdRaktaron.ExtendLastCol = True
    grdSzallitonal.ExtendLastCol = True
    
    Screen.MousePointer = vbDefault
End Sub

Private Sub InfoTorol()
    Dim oControl As Control
    For Each oControl In Controls
        Select Case Left(oControl.Name, 5)
            Case "txtH_", "txtV_", "txtE_"
                oControl.Text = ""
                
            Case "cmbH_", "cmbV_", "cmbE_"
                oControl = Null
                
            Case "datH_", "datV_", "datE_"
                oControl.Value = ""
        End Select
    Next
End Sub

Sub Nyomtat(reportName As String, iDestination As Integer)
    With Form001.rep
        .Destination = iDestination ' 0 - privjú ablak, 1 - közvetlenül nyomtat
        .WindowBorderStyle = 3
        .WindowState = 2
        .Connect = sConnectString
        .ReportFileName = sReportDir & reportName
        .Action = 1
    End With
End Sub

