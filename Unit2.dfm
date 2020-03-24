object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'ParsingD'
  ClientHeight = 470
  ClientWidth = 417
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
  object Label1: TLabel
    Left = 13
    Top = 82
    Width = 60
    Height = 13
    Caption = 'Search word'
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 41
    Caption = 'Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 215
    Top = 55
    Width = 194
    Height = 47
    Hint = #1057#1087#1080#1089#1086#1082' '#1092#1072#1081#1083#1086#1074' '#1076#1083#1103' '#1084#1085#1086#1078#1077#1089#1090#1074#1077#1085#1085#1086#1075#1086' '#1072#1085#1072#1083#1080#1079#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 89
    Top = 8
    Width = 320
    Height = 41
    Caption = 'Mode Parse'
    TabOrder = 2
  end
  object RadioButton1: TRadioButton
    Left = 96
    Top = 24
    Width = 113
    Height = 17
    Hint = #1040#1085#1072#1083#1080#1079' '#1074#1089#1077#1093' '#1092#1072#1081#1083#1086#1074' '#1072' '#1087#1072#1087#1082#1077
    Caption = 'Multiple parse'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 288
    Top = 24
    Width = 113
    Height = 17
    Hint = #1040#1085#1072#1083#1080#1079' '#1086#1090#1076#1077#1083#1100#1085#1086#1075#1086' '#1092#1072#1081#1083#1072
    Caption = 'Single parse'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 8
    Top = 432
    Width = 401
    Height = 30
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 5
    Visible = False
  end
  object Edit1: TEdit
    Left = 79
    Top = 78
    Width = 130
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Text = 'Edit1'
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 55
    Width = 49
    Height = 17
    Hint = #1042#1082#1083#1102#1095#1077#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072' '#1088#1077#1075#1091#1083#1103#1088#1085#1099#1093' '#1074#1099#1088#1072#1078#1077#1085#1080#1081' '#1076#1083#1103' '#1095#1090#1077#1085#1080#1103' '#1092#1072#1081#1083#1086#1074
    Caption = 'Filter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = CheckBox1Click
  end
  object Edit2: TEdit
    Left = 79
    Top = 55
    Width = 130
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    Text = 'Edit2'
  end
  object Memo2: TMemo
    Left = 5
    Top = 150
    Width = 404
    Height = 312
    Hint = #1050#1086#1085#1089#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo2')
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
  end
  object ProgressBar1: TProgressBar
    Left = 8
    Top = 105
    Width = 401
    Height = 17
    Hint = #1055#1088#1086#1075#1088#1077#1089#1089' '#1095#1090#1077#1085#1080#1103' '#1092#1072#1081#1083#1072
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
  end
  object ProgressBar2: TProgressBar
    Left = 8
    Top = 127
    Width = 401
    Height = 17
    Hint = #1054#1073#1097#1080#1081' '#1087#1088#1086#1075#1088#1077#1089#1089
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 376
    Top = 344
  end
  object FileOpenDialog2: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 376
    Top = 384
  end
end
