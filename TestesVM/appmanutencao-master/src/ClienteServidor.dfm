object fClienteServidor: TfClienteServidor
  Left = 0
  Top = 0
  Caption = 'Cliente - Servidor'
  ClientHeight = 76
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ProgressBar: TProgressBar
    AlignWithMargins = True
    Left = 3
    Top = 56
    Width = 451
    Height = 17
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 62
    ExplicitWidth = 489
  end
  object btEnviarSemErros: TButton
    Left = 56
    Top = 19
    Width = 113
    Height = 25
    Caption = 'Enviar sem erros'
    TabOrder = 1
    OnClick = btEnviarSemErrosClick
  end
  object btEnviarComErros: TButton
    Left = 175
    Top = 19
    Width = 113
    Height = 25
    Caption = 'Enviar com erros'
    TabOrder = 2
    OnClick = btEnviarComErrosClick
  end
  object btEnviarParalelo: TButton
    Left = 294
    Top = 19
    Width = 113
    Height = 25
    Caption = 'Enviar paralelo'
    TabOrder = 3
    OnClick = btEnviarParaleloClick
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      3B0000009619E0BD0100000018000000010000000000030000003B0003417271
      04004B0000000100075355425459504502004900070042696E617279000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Arq'
        DataType = ftBlob
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 416
    Top = 16
    object ClientDataSet1Arq: TBlobField
      FieldName = 'Arq'
    end
  end
end
