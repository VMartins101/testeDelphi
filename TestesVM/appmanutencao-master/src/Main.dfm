object fMain: TfMain
  Left = 0
  Top = 0
  Caption = 'Foo'
  ClientHeight = 186
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btDatasetLoop: TButton
    Left = 64
    Top = 47
    Width = 169
    Height = 25
    Caption = 'Dataset Loop'
    TabOrder = 0
    OnClick = btDatasetLoopClick
  end
  object btThreads: TButton
    Left = 64
    Top = 109
    Width = 169
    Height = 25
    Caption = 'Threads'
    TabOrder = 1
    OnClick = btThreadsClick
  end
  object btStreams: TButton
    Left = 64
    Top = 78
    Width = 169
    Height = 25
    Caption = 'ClienteServidor'
    TabOrder = 2
    OnClick = btStreamsClick
  end
  object Button1: TButton
    Left = 214
    Top = 153
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ApplicationEvents1: TApplicationEvents
    OnException = ApplicationEvents1Exception
    Left = 16
    Top = 144
  end
end
