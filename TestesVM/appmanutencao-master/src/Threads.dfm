object fThreads: TfThreads
  Left = 0
  Top = 0
  Caption = 'fThreads'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object edtQtdMaxThreads: TEdit
    Left = 72
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtTempoMaximo: TEdit
    Left = 280
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 407
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object ProgressBar: TProgressBar
    AlignWithMargins = True
    Left = -2
    Top = 53
    Width = 629
    Height = 17
    TabOrder = 3
  end
  object Memo1: TMemo
    Left = 0
    Top = 76
    Width = 627
    Height = 215
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 4
  end
end
