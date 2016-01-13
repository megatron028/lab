object Form1: TForm1
  Left = 192
  Top = 124
  Width = 540
  Height = 375
  Caption = #1057#1077#1088#1074#1077#1088
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 524
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbl1: TLabel
      Left = 32
      Top = 16
      Width = 25
      Height = 13
      Caption = #1055#1086#1088#1090
    end
    object se1: TSpinEdit
      Left = 64
      Top = 8
      Width = 121
      Height = 22
      MaxValue = 65535
      MinValue = 1
      TabOrder = 0
      Value = 0
    end
    object btn1: TButton
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100
      TabOrder = 1
      OnClick = btn1Click
    end
  end
  object mmo1: TMemo
    Left = 0
    Top = 41
    Width = 185
    Height = 296
    Align = alLeft
    ReadOnly = True
    TabOrder = 1
  end
  object mmo2: TMemo
    Left = 185
    Top = 41
    Width = 339
    Height = 296
    Align = alClient
    ReadOnly = True
    TabOrder = 2
  end
  object ServerSocket: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocketClientConnect
    OnClientDisconnect = ServerSocketClientDisconnect
    OnClientRead = ServerSocketClientRead
    Left = 376
  end
end
