object frmLog: TfrmLog
  Left = 174
  Top = 137
  Width = 696
  Height = 480
  Caption = 'Dziennik zdarzeñ'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lstErrors: TListBox
    Left = 0
    Top = 0
    Width = 688
    Height = 453
    Align = alClient
    ItemHeight = 16
    Style = lbOwnerDrawFixed
    TabOrder = 0
  end
end
