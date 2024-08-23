object frmOrganizer: TfrmOrganizer
  Left = 245
  Top = 165
  Width = 805
  Height = 505
  Caption = 'Tabela'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000700000000000000000000000000000180
    FFFFFFFFFFFFFFFFFF00000000000180FFFFFFFFFFFFFFFFFF00000000000180
    FFFFFFFFFFFFFFFFFF00000000000180FFFFFFFFFFFFFFFFFF00000000000180
    77777777777777777700000000000180FFFFFFFFFFFFFFFFF800000000000180
    77777777777777777700000000000180FFFFFFFFFFFFFFF88800000000000180
    77777777777777777700000000000180FFFFFFFFFFFFF8888800000000000180
    77777777777777777700000000000180FFFFFFFFFFF888888800000000000180
    77777777777777777700000000000180FFFFF000000000000000000000000180
    77777099999999999999999990000180FFFF0595959595959595959500000180
    77770959595959595959595900000180FFF09595959595959595959000000180
    77705959595959595959595000000180FF059595959595959595950000000180
    77095959595959595959590000000180F0959595959595959595900000000180
    7059595959595959595950000000018005959595959595959595000000000180
    0959595959595959595900000000017095959595959595959590000000000010
    5001001001001001001000000000001108008008008008008000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFC00003FF800001FF800001FF800001FF800001FF800001FF800001FF8000
    01FF800001FF800001FF800001FF800001FF800001FF800001FF800000038000
    000380000007800000078000000F8000000F8000001F8000001F8000003F8000
    003F8000007F8000007F800000FFC00000FFC00001FFF92493FFFFFFFFFF}
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object splOrganizer: TSplitter
    Left = 537
    Top = 27
    Width = 2
    Height = 451
    Cursor = crHSplit
    Align = alRight
    AutoSnap = False
    MinSize = 150
  end
  object scbOrganizer: TScrollBox
    Left = 539
    Top = 27
    Width = 258
    Height = 451
    HorzScrollBar.Smooth = True
    VertScrollBar.Smooth = True
    VertScrollBar.Tracking = True
    Align = alRight
    Color = clWindow
    ParentColor = False
    TabOrder = 0
    object lblDane: TLabel
      Left = 8
      Top = 8
      Width = 159
      Height = 13
      Caption = 'Dane personalne                          '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object lblNazwisko: TLabel
      Left = 8
      Top = 56
      Width = 49
      Height = 13
      Caption = 'Nazwisko:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblImie: TLabel
      Left = 8
      Top = 32
      Width = 22
      Height = 13
      Caption = 'Imiê:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblFirma: TLabel
      Left = 8
      Top = 80
      Width = 28
      Height = 13
      Caption = 'Firma:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblAdres: TLabel
      Left = 8
      Top = 112
      Width = 159
      Height = 13
      Caption = 'Adres                                            '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object lblUlica: TLabel
      Left = 8
      Top = 136
      Width = 27
      Height = 13
      Caption = 'Ulica:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblMiasto: TLabel
      Left = 8
      Top = 160
      Width = 34
      Height = 13
      Caption = 'Miasto:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblTelefonyTitle: TLabel
      Left = 8
      Top = 192
      Width = 161
      Height = 13
      Caption = 'Telefony                                        '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object lblTelefon: TLabel
      Left = 8
      Top = 216
      Width = 39
      Height = 13
      Caption = 'Telefon:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblKom: TLabel
      Left = 8
      Top = 240
      Width = 47
      Height = 13
      Caption = 'Tel. kom.:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblFax: TLabel
      Left = 8
      Top = 264
      Width = 20
      Height = 13
      Caption = 'Fax:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblInfoTitle: TLabel
      Left = 8
      Top = 296
      Width = 160
      Height = 13
      Caption = 'Informacje                                     '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object lblGrupaEdit: TLabel
      Left = 8
      Top = 344
      Width = 32
      Height = 13
      Caption = 'Grupa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblNotatki: TLabel
      Left = 8
      Top = 368
      Width = 37
      Height = 13
      Caption = 'Notatki:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblEmail: TLabel
      Left = 8
      Top = 320
      Width = 31
      Height = 13
      Caption = 'E-mail:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object dbmInformacje: TDBMemo
      Tag = 12
      Left = 64
      Top = 368
      Width = 169
      Height = 41
      TabStop = False
      BorderStyle = bsNone
      DataField = 'INFORMACJE'
      DataSource = srcOrganizer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 255
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
      OnKeyDown = dbeUlicaKeyDown
      OnKeyPress = dbeImieKeyPress
    end
    object dbeImie: TDBEdit
      Tag = 1
      Left = 64
      Top = 32
      Width = 169
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      DataField = 'IMIE'
      DataSource = srcOrganizer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      OnKeyDown = dbeUlicaKeyDown
      OnKeyPress = dbeImieKeyPress
    end
    object dbeNazwisko: TDBEdit
      Tag = 2
      Left = 64
      Top = 56
      Width = 169
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      DataField = 'NAZWISKO'
      DataSource = srcOrganizer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnKeyDown = dbeUlicaKeyDown
      OnKeyPress = dbeImieKeyPress
    end
    object dbeFirma: TDBEdit
      Tag = 3
      Left = 64
      Top = 80
      Width = 169
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      DataField = 'FIRMA'
      DataSource = srcOrganizer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      OnKeyDown = dbeUlicaKeyDown
      OnKeyPress = dbeImieKeyPress
    end
    object dbeUlica: TDBEdit
      Tag = 4
      Left = 64
      Top = 136
      Width = 169
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      DataField = 'ADRES'
      DataSource = srcOrganizer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      OnKeyDown = dbeUlicaKeyDown
      OnKeyPress = dbeImieKeyPress
    end
    object dbeKod: TDBEdit
      Tag = 5
      Left = 64
      Top = 160
      Width = 49
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      DataField = 'KOD'
      DataSource = srcOrganizer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      OnKeyDown = dbeUlicaKeyDown
      OnKeyPress = dbeKodKeyPress
    end
    object dbeTel: TDBEdit
      Tag = 7
      Left = 64
      Top = 216
      Width = 169
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      DataField = 'TEL'
      DataSource = srcOrganizer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      OnKeyDown = dbeUlicaKeyDown
      OnKeyPress = dbeImieKeyPress
    end
    object dbeKom: TDBEdit
      Tag = 8
      Left = 64
      Top = 240
      Width = 169
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      DataField = 'KOM'
      DataSource = srcOrganizer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      OnKeyDown = dbeUlicaKeyDown
      OnKeyPress = dbeImieKeyPress
    end
    object dbeFax: TDBEdit
      Tag = 9
      Left = 64
      Top = 264
      Width = 169
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      DataField = 'FAX'
      DataSource = srcOrganizer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      OnKeyDown = dbeUlicaKeyDown
      OnKeyPress = dbeImieKeyPress
    end
    object btnCancel: TButton
      Tag = 14
      Left = 158
      Top = 418
      Width = 75
      Height = 25
      Action = actCancel
      Cancel = True
      TabOrder = 13
    end
    object btnSave: TButton
      Tag = 13
      Left = 78
      Top = 418
      Width = 75
      Height = 25
      Action = actApply
      TabOrder = 12
    end
    object ledMiasto: TRxLookupEdit
      Tag = 6
      Left = 116
      Top = 160
      Width = 117
      Height = 21
      DropDownCount = 15
      LookupDisplay = 'NAZWA'
      LookupField = 'INDEKS'
      LookupSource = srcMiasto
      PopupOnlyLocate = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 14
      Visible = False
      OnKeyDown = dbeUlicaKeyDown
      OnKeyPress = dbeImieKeyPress
    end
    object dbeMiasto: TDBEdit
      Left = 116
      Top = 160
      Width = 117
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      DataField = '_MIASTO'
      DataSource = srcOrganizer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
    end
    object dbeGrupa: TDBEdit
      Left = 64
      Top = 344
      Width = 169
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      DataField = '_GRUPA'
      DataSource = srcOrganizer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
    end
    object dbxGrupa: TDBLookupComboBox
      Tag = 11
      Left = 64
      Top = 344
      Width = 169
      Height = 21
      DataField = 'GRUPA'
      DataSource = srcOrganizer
      DropDownRows = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      KeyField = 'INDEKS'
      ListField = 'NAZWA'
      ListFieldIndex = 1
      ListSource = srcGrupa
      ParentFont = False
      TabOrder = 10
      Visible = False
      OnKeyDown = dbxGrupaKeyDown
      OnKeyPress = dbeImieKeyPress
    end
    object dbeEmail: TDBEdit
      Tag = 10
      Left = 64
      Top = 320
      Width = 169
      Height = 21
      TabStop = False
      BorderStyle = bsNone
      DataField = 'EMAIL'
      DataSource = srcOrganizer
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
      OnKeyDown = dbeUlicaKeyDown
      OnKeyPress = dbeImieKeyPress
    end
  end
  object dbgOrganizer: TDBGridExt
    Left = 0
    Top = 27
    Width = 537
    Height = 451
    FocusBrush.Color = clHighlight
    FocusFont.Charset = DEFAULT_CHARSET
    FocusFont.Color = clHighlightText
    FocusFont.Height = -11
    FocusFont.Name = 'MS Sans Serif'
    FocusFont.Style = [fsBold]
    LineBrush.Color = clBtnFace
    LineFont.Charset = DEFAULT_CHARSET
    LineFont.Color = clWindowText
    LineFont.Height = -11
    LineFont.Name = 'MS Sans Serif'
    LineFont.Style = [fsBold]
    Align = alClient
    DataSource = srcOrganizer
    DefaultDrawing = False
    Options = [dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = dbgOrganizerKeyDown
    OnKeyPress = dbgOrganizerKeyPress
    OnTitleClick = dbgOrganizerTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'IMIE'
        Title.Caption = 'Imiê'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAZWISKO'
        Title.Caption = 'Nazwisko'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIRMA'
        Title.Caption = 'Firma'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ADRES'
        Title.Caption = 'Adres'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOD'
        Title.Caption = 'Kod'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = '_MIASTO'
        Title.Caption = 'Miasto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Title.Caption = 'E-mail'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TEL'
        Title.Caption = 'Telefon'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FAX'
        Title.Caption = 'Fax'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'KOM'
        Title.Caption = 'Komórka'
        Width = 100
        Visible = True
      end>
  end
  object barTools: TToolBar
    Left = 0
    Top = 0
    Width = 797
    Height = 27
    ButtonHeight = 21
    Caption = 'barTools'
    TabOrder = 2
    Wrapable = False
    object lblSearch: TLabel
      Left = 0
      Top = 2
      Width = 41
      Height = 21
      AutoSize = False
      Caption = ' &Szukaj:'
      Layout = tlCenter
    end
    object edtSearch: TEdit
      Left = 41
      Top = 2
      Width = 193
      Height = 21
      Anchors = []
      AutoSelect = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtSearchChange
      OnKeyDown = edtSearchKeyDown
    end
    object sep1: TToolButton
      Left = 234
      Top = 2
      Width = 8
      Caption = 'sep1'
      Style = tbsSeparator
    end
    object lblGrupa: TLabel
      Left = 242
      Top = 2
      Width = 36
      Height = 21
      AutoSize = False
      Caption = '&Grupa: '
      Layout = tlCenter
    end
    object cbxGrupa: TComboBox
      Left = 278
      Top = 2
      Width = 164
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
      OnChange = cbxGrupaChange
      OnKeyDown = cbxGrupaKeyDown
    end
  end
  object tabOrganizer: TIBTable
    Database = frmData.dbOrganizer
    Transaction = frmData.traOrganizer
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NAZWISKO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IMIE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FIRMA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'EMAIL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ADRES'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'KOD'
        DataType = ftInteger
      end
      item
        Name = 'MIASTO'
        DataType = ftInteger
      end
      item
        Name = 'TEL'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FAX'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'KOM'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'INFORMACJE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'GRUPA'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN31'
        Fields = 'MIASTO'
      end
      item
        Name = 'RDB$FOREIGN32'
        Fields = 'GRUPA'
      end>
    StoreDefs = True
    TableName = 'ORGANIZER'
    Left = 16
    Top = 80
    object tabOrganizerNAZWISKO: TIBStringField
      FieldName = 'NAZWISKO'
      Size = 30
    end
    object tabOrganizerIMIE: TIBStringField
      FieldName = 'IMIE'
      Size = 30
    end
    object tabOrganizerFIRMA: TIBStringField
      FieldName = 'FIRMA'
      Size = 50
    end
    object tabOrganizerADRES: TIBStringField
      FieldName = 'ADRES'
      Size = 50
    end
    object tabOrganizerKOD: TIntegerField
      Alignment = taLeftJustify
      DisplayWidth = 5
      FieldName = 'KOD'
      DisplayFormat = '00'#39'-'#39'000'
    end
    object tabOrganizerMIASTO: TIntegerField
      FieldName = 'MIASTO'
    end
    object tabOrganizerTEL: TIBStringField
      FieldName = 'TEL'
      Size = 30
    end
    object tabOrganizerFAX: TIBStringField
      FieldName = 'FAX'
      Size = 30
    end
    object tabOrganizerKOM: TIBStringField
      FieldName = 'KOM'
      Size = 30
    end
    object tabOrganizerINFORMACJE: TIBStringField
      FieldName = 'INFORMACJE'
      Size = 255
    end
    object tabOrganizerNM: TIBStringField
      FieldKind = fkCalculated
      FieldName = 'NM'
      OnGetText = tabOrganizerNMGetText
      Size = 65
      Calculated = True
    end
    object tabOrganizerKM: TStringField
      FieldKind = fkCalculated
      FieldName = 'KM'
      OnGetText = tabOrganizerKMGetText
      Size = 40
      Calculated = True
    end
    object tabOrganizer_MIASTO: TStringField
      FieldKind = fkLookup
      FieldName = '_MIASTO'
      LookupDataSet = tabMiasto
      LookupKeyFields = 'INDEKS'
      LookupResultField = 'NAZWA'
      KeyFields = 'MIASTO'
      Lookup = True
    end
    object tabOrganizerGRUPA: TIntegerField
      FieldName = 'GRUPA'
    end
    object tabOrganizer_GRUPA: TStringField
      FieldKind = fkLookup
      FieldName = '_GRUPA'
      LookupDataSet = tabGrupa
      LookupKeyFields = 'INDEKS'
      LookupResultField = 'NAZWA'
      KeyFields = 'GRUPA'
      Lookup = True
    end
    object tabOrganizerEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 50
    end
  end
  object srcOrganizer: TDataSource
    DataSet = tabOrganizer
    OnDataChange = srcOrganizerDataChange
    Left = 16
    Top = 112
  end
  object tabMiasto: TIBTable
    Database = frmData.dbOrganizer
    Transaction = frmData.traOrganizer
    AfterInsert = tabMiastoAfterInsert
    BeforeInsert = tabMiastoBeforeInsert
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'INDEKS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAZWA'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY24'
        Fields = 'INDEKS'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'NAZWA'
    StoreDefs = True
    TableName = 'MIASTO'
    Left = 80
    Top = 80
  end
  object srcMiasto: TDataSource
    DataSet = tabMiasto
    Left = 80
    Top = 112
  end
  object tabGrupa: TIBTable
    Database = frmData.dbOrganizer
    Transaction = frmData.traOrganizer
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'INDEKS'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAZWA'
        DataType = ftString
        Size = 30
      end>
    Filter = 'INDEKS > 0'
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY30'
        Fields = 'INDEKS'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'GRUPA'
    Left = 48
    Top = 80
  end
  object actList: TActionList
    Left = 16
    Top = 424
    object actApply: TAction
      Caption = 'Modyfikuj'
      Enabled = False
      ShortCut = 16397
      Visible = False
      OnExecute = actApplyExecute
    end
    object actCancel: TAction
      Caption = 'Anuluj'
      Enabled = False
      ShortCut = 27
      Visible = False
      OnExecute = actCancelExecute
    end
    object actGrupa: TAction
      Caption = 'Grupa'
      ShortCut = 32839
      OnExecute = actGrupaExecute
    end
    object actSzukaj: TAction
      Caption = 'actSzukaj'
      ShortCut = 32851
      OnExecute = actSzukajExecute
    end
  end
  object srcGrupa: TDataSource
    DataSet = tabGrupa
    Left = 48
    Top = 112
  end
end
