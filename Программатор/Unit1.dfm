object Form1: TForm1
  Left = 193
  Top = 120
  Width = 1198
  Height = 660
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 208
    Top = 192
    Width = 232
    Height = 16
    Caption = #1087#1085#1088#1087#1085#1087#1096#1085#1087#1084#1085#1077#1085#1075'89'#1085#1075'9'#1085'9'#1085#1075'9'#1085#1075'9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnDblClick = Label1DblClick
  end
  object Button1: TButton
    Left = 248
    Top = 104
    Width = 113
    Height = 41
    Caption = 'OpenHexFile'
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object FtComboBox: TComboBox
    Left = 40
    Top = 16
    Width = 201
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = #1053#1072#1081#1090#1080' FT'
    OnChange = FtComboBoxChange
    OnDropDown = FtComboBoxDropDown
    Items.Strings = (
      '1'
      '2'
      '3')
  end
  object FTSpeed: TComboBox
    Left = 248
    Top = 16
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 2
    Text = #1057#1082#1086#1088#1086#1089#1090#1100' '#1086#1073#1084#1077#1085#1072
    OnChange = FTSpeedChange
    OnDropDown = FTSpeedDropDown
  end
  object Edit1: TEdit
    Left = 208
    Top = 216
    Width = 297
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
    OnDblClick = Edit1DblClick
    OnKeyPress = Edit1KeyPress
  end
  object Button2: TButton
    Left = 504
    Top = 16
    Width = 81
    Height = 33
    Caption = 'LOAI'
    TabOrder = 4
    OnClick = Button2Click
  end
  object RichEdit1: TRichEdit
    Left = 584
    Top = 16
    Width = 561
    Height = 585
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'Select command'
      '<-'
      ''
      '<-'
      ''
      '<-')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object Button3: TButton
    Left = 504
    Top = 48
    Width = 81
    Height = 33
    Caption = 'LOAV'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 504
    Top = 80
    Width = 81
    Height = 33
    Caption = 'LOA0'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 512
    Top = 568
    Width = 73
    Height = 33
    Caption = 'Clear'
    TabOrder = 8
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 504
    Top = 112
    Width = 81
    Height = 33
    Caption = 'LOAD'
    TabOrder = 9
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 504
    Top = 368
    Width = 81
    Height = 33
    Hint = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1085#1080#1078#1085#1077#1081' '#1095#1072#1089#1090#1080' '#1087#1072#1084#1103#1090#1080
    Caption = 'LOAd'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = Button7Click
  end
  object UpDown1: TUpDown
    Left = 569
    Top = 400
    Width = 16
    Height = 21
    Associate = Edit2
    Min = 1
    Position = 1
    TabOrder = 11
    Wrap = False
  end
  object Edit2: TEdit
    Left = 504
    Top = 400
    Width = 65
    Height = 21
    TabOrder = 12
    Text = '1'
    OnChange = Edit2Change
  end
  object CheckBox1: TCheckBox
    Left = 504
    Top = 424
    Width = 81
    Height = 17
    Caption = 'Auto'
    TabOrder = 13
  end
  object Edit3: TEdit
    Left = 40
    Top = 40
    Width = 329
    Height = 21
    TabOrder = 14
    Text = 'HexName'
    OnDblClick = Edit3DblClick
  end
  object Edit4: TEdit
    Left = 40
    Top = 16
    Width = 201
    Height = 21
    Enabled = False
    TabOrder = 15
    Text = 'FtName'
  end
  object ProgressBar1: TProgressBar
    Left = 32
    Top = 304
    Width = 449
    Height = 25
    Min = 0
    Max = 64
    Position = 64
    TabOrder = 16
  end
  object Edit5: TEdit
    Left = 248
    Top = 16
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 17
    Text = 'Edit5'
  end
  object Button8: TButton
    Left = 40
    Top = 368
    Width = 177
    Height = 41
    Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 18
    OnClick = Button8Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'HexFiles|*.hex'
    Left = 216
    Top = 104
  end
  object MainMenu1: TMainMenu
    object N1: TMenuItem
      Caption = #1050#1086#1085#1090#1088#1086#1083#1083#1077#1088
      object N2: TMenuItem
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
      end
      object N3: TMenuItem
        Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1080#1088#1086#1074#1072#1090#1100
      end
      object N5: TMenuItem
        Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      end
    end
    object N4: TMenuItem
      Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100
    end
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 72
    Top = 264
  end
end
