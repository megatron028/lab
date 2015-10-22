object Form1: TForm1
  Left = 280
  Top = 312
  Width = 870
  Height = 640
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 152
    Top = 72
    Width = 3
    Height = 13
  end
  object Memo1: TMemo
    Left = 496
    Top = 64
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 112
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 112
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Pause'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 112
    Top = 360
    Width = 75
    Height = 25
    Caption = 'delite'
    TabOrder = 3
    OnClick = Button3Click
  end
end
