object Form1: TForm1
  Left = 192
  Top = 124
  Width = 696
  Height = 375
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 0
    Top = 0
    Width = 680
    Height = 97
    Align = alTop
    Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1089#1077#1088#1074#1077#1088#1091
    TabOrder = 0
    object lbl1: TLabel
      Left = 24
      Top = 24
      Width = 23
      Height = 13
      Caption = #1061#1086#1089#1090
    end
    object lbl2: TLabel
      Left = 184
      Top = 24
      Width = 25
      Height = 13
      Caption = #1055#1086#1088#1090
    end
    object lbl3: TLabel
      Left = 328
      Top = 24
      Width = 87
      Height = 13
      Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1077#1090#1083#1103
    end
    object edt1: TEdit
      Left = 16
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'localhost'
    end
    object se1: TSpinEdit
      Left = 168
      Top = 48
      Width = 121
      Height = 22
      MaxValue = 653535
      MinValue = 1
      TabOrder = 1
      Value = 0
    end
    object edt2: TEdit
      Left = 328
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object btn1: TButton
      Left = 496
      Top = 40
      Width = 75
      Height = 25
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
      TabOrder = 3
      OnClick = btn1Click
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 97
    Width = 680
    Height = 240
    Align = alClient
    TabOrder = 1
    object mmo1: TMemo
      Left = 1
      Top = 1
      Width = 678
      Height = 48
      Align = alTop
      TabOrder = 0
    end
    object btn2: TButton
      Left = 8
      Top = 56
      Width = 75
      Height = 25
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      Enabled = False
      TabOrder = 1
      OnClick = btn2Click
    end
    object mmo2: TMemo
      Left = 1
      Top = 96
      Width = 678
      Height = 143
      Align = alBottom
      TabOrder = 2
    end
  end
  object ClientSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocketConnect
    OnDisconnect = ClientSocketDisconnect
    OnRead = ClientSocketRead
    OnError = ClientSocketError
    Left = 608
    Top = 48
  end
end
