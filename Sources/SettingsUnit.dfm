object frmSettings: TfrmSettings
  Left = 284
  Top = 200
  Width = 418
  Height = 290
  BorderIcons = [biSystemMenu]
  Caption = 'Ustawienia programu'
  Color = clBtnFace
  Constraints.MinHeight = 290
  Constraints.MinWidth = 418
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001001010100000000000280100001600000028000000100000002000
    00000100040000000000C0000000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000100000007000000001
    0000070000000000100070000000000001070000000000000070000000000000
    0701000000000000700010000300000000000100033000000000000330000000
    000000333000000000000033300000000000330000000000000000000000FFFF
    0000FFFF00009FCF00008F8F0000C71F0000E23F0000F07F0000F8FF0000F07B
    0000023100000700000067810000E7830000C7030000FC070000FE1F0000}
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object bevTop: TBevel
    Left = 0
    Top = 0
    Width = 410
    Height = 2
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object pgcSettings: TPageControl
    Left = 6
    Top = 6
    Width = 398
    Height = 217
    ActivePage = tabGeneral
    Anchors = [akLeft, akTop, akRight, akBottom]
    Constraints.MinHeight = 197
    Constraints.MinWidth = 370
    MultiLine = True
    RaggedRight = True
    TabOrder = 0
    object tabGeneral: TTabSheet
      Caption = 'Ogólne'
      object grpGeneral: TGroupBox
        Left = 8
        Top = 5
        Width = 374
        Height = 175
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        object chkShowList: TCheckBox
          Left = 11
          Top = 16
          Width = 265
          Height = 17
          Caption = ' &Poka¿ listê po zalogowaniu u¿ytkownika'
          TabOrder = 0
          OnClick = chkShowListClick
        end
        object chkMaximizeList: TCheckBox
          Left = 11
          Top = 40
          Width = 174
          Height = 17
          Caption = ' &Maksymalizuj rozmiar okna listy '
          TabOrder = 1
          OnClick = chkShowListClick
        end
        object chkFullScreen: TCheckBox
          Left = 11
          Top = 64
          Width = 158
          Height = 17
          Caption = ' &Otwórz na pe³nym ekranie'
          TabOrder = 2
          OnClick = chkShowListClick
        end
      end
    end
    object tabLogin: TTabSheet
      Caption = 'Logowanie'
      ImageIndex = 1
      object chkAutoLogin: TCheckBox
        Left = 8
        Top = 8
        Width = 425
        Height = 17
        Caption = 
          ' &Automatycznie zaloguj u¿ytkownika podczas uruchamiania program' +
          'u '
        TabOrder = 0
        OnClick = chkAutoLoginClick
      end
      object grpUserInfo: TGroupBox
        Left = 8
        Top = 32
        Width = 374
        Height = 148
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Informacje o u¿ytkowniku '
        TabOrder = 1
        object lblUser: TLabel
          Left = 16
          Top = 32
          Width = 58
          Height = 13
          Caption = '&U¿ytkownik:'
          Enabled = False
          FocusControl = edtUser
        end
        object lblPasswd: TLabel
          Left = 16
          Top = 64
          Width = 32
          Height = 13
          Caption = '&Has³o:'
          Enabled = False
          FocusControl = edtPasswd
        end
        object edtUser: TEdit
          Left = 96
          Top = 24
          Width = 153
          Height = 21
          Color = clBtnFace
          Enabled = False
          MaxLength = 31
          TabOrder = 0
          OnChange = edtUserChange
        end
        object edtPasswd: TEdit
          Left = 96
          Top = 56
          Width = 153
          Height = 21
          Color = clBtnFace
          Enabled = False
          MaxLength = 31
          PasswordChar = '*'
          TabOrder = 1
          OnChange = edtUserChange
        end
        object btnSetUser: TButton
          Left = 11
          Top = 110
          Width = 182
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Ustaw &bierz¹cego u¿ytkownika'
          Enabled = False
          TabOrder = 2
          OnClick = btnSetUserClick
        end
      end
    end
    object tabDatabase: TTabSheet
      Caption = 'Baza danych'
      ImageIndex = 3
      object rbtLocal: TRadioButton
        Left = 8
        Top = 8
        Width = 65
        Height = 17
        Caption = ' &Lokalna '
        TabOrder = 0
        OnClick = rbtLocalClick
      end
      object rbtRemote: TRadioButton
        Left = 88
        Top = 8
        Width = 57
        Height = 17
        Caption = ' &Zdalna '
        TabOrder = 1
        OnClick = rbtLocalClick
      end
      object grpDatabase: TGroupBox
        Left = 8
        Top = 32
        Width = 374
        Height = 148
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Informacje o bazie danych '
        TabOrder = 2
        object lblDatabase: TLabel
          Left = 16
          Top = 32
          Width = 65
          Height = 13
          Caption = '&Baza danych:'
          Enabled = False
          FocusControl = edtDataBase
        end
        object lblServer: TLabel
          Left = 16
          Top = 64
          Width = 36
          Height = 13
          Caption = '&Serwer:'
          Enabled = False
          FocusControl = edtServer
        end
        object btnBrowse: TSpeedButton
          Left = 306
          Top = 24
          Width = 23
          Height = 21
          Enabled = False
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
            DADAADADADADADADADAD00000000000ADADA003333333330ADAD0B0333333333
            0ADA0FB03333333330AD0BFB03333333330A0FBFB000000000000BFBFBFBFB0A
            DADA0FBFBFBFBF0DADAD0BFB0000000ADADAA000ADADADAD000DDADADADADADA
            D00AADADADAD0DAD0D0DDADADADAD000DADAADADADADADADADAD}
          OnClick = btnBrowseClick
        end
        object lblProtocol: TLabel
          Left = 16
          Top = 96
          Width = 44
          Height = 13
          Caption = '&Protokó³:'
          Enabled = False
          FocusControl = cbxProtocol
        end
        object edtDataBase: TEdit
          Left = 96
          Top = 24
          Width = 209
          Height = 21
          Color = clBtnFace
          Enabled = False
          MaxLength = 31
          TabOrder = 0
          OnChange = edtDataBaseChange
        end
        object edtServer: TEdit
          Left = 96
          Top = 56
          Width = 153
          Height = 21
          Color = clBtnFace
          Enabled = False
          MaxLength = 31
          TabOrder = 1
          OnChange = edtDataBaseChange
        end
        object cbxProtocol: TComboBox
          Left = 96
          Top = 88
          Width = 153
          Height = 21
          Style = csDropDownList
          Color = clBtnFace
          Enabled = False
          ItemHeight = 13
          TabOrder = 2
          OnChange = edtDataBaseChange
          Items.Strings = (
            'TCP'
            'SPX'
            'Microsoft Network')
        end
      end
    end
  end
  object btnOk: TButton
    Left = 169
    Top = 231
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 249
    Top = 231
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Anuluj'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object btnApply: TButton
    Left = 329
    Top = 231
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Zastosuj'
    Enabled = False
    TabOrder = 3
    OnClick = btnApplyClick
  end
  object dlgOpen: TOpenDialog
    Filter = '*.gdb|*.gdb'
    Left = 24
    Top = 128
  end
end
