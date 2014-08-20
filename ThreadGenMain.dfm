object Form1: TForm1
  Left = 363
  Top = 95
  Width = 849
  Height = 874
  Caption = 'ThreadGen by Kia'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 60
    Height = 13
    Caption = 'Plugin Name'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 35
    Height = 13
    Caption = 'Version'
  end
  object Label3: TLabel
    Left = 16
    Top = 93
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label4: TLabel
    Left = 16
    Top = 528
    Width = 62
    Height = 13
    Caption = 'Thread Code'
  end
  object Label7: TLabel
    Left = 752
    Top = 16
    Width = 3
    Height = 13
  end
  object Label8: TLabel
    Left = 680
    Top = 16
    Width = 137
    Height = 13
    Caption = 'Visit my homepage! Click me!'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    OnClick = OnHomepageLabelClick
  end
  object Label13: TLabel
    Left = 448
    Top = 16
    Width = 105
    Height = 13
    Caption = 'ThreadGen on GitHub'
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    OnClick = Label13Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 32
    Width = 417
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    OnChange = OnPluginNameChange
  end
  object Edit2: TEdit
    Left = 16
    Top = 72
    Width = 417
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
    OnChange = OnVersionChange
  end
  object Memo1: TMemo
    Left = 16
    Top = 112
    Width = 801
    Height = 153
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
    OnChange = OnDescChange
    OnKeyDown = OnDescKeyDown
  end
  object Button1: TButton
    Left = 448
    Top = 72
    Width = 177
    Height = 33
    Caption = 'Generate Thread Code'
    TabOrder = 3
    OnClick = ThreadGenButton_Click
  end
  object Memo2: TMemo
    Left = 16
    Top = 552
    Width = 801
    Height = 265
    Lines.Strings = (
      'Memo2')
    ScrollBars = ssBoth
    TabOrder = 4
    OnKeyDown = OnThreadKeyDown
  end
  object GroupBox1: TGroupBox
    Left = 448
    Top = 280
    Width = 369
    Height = 233
    BiDiMode = bdLeftToRight
    Caption = 'Additional'
    ParentBiDiMode = False
    TabOrder = 5
    object Label5: TLabel
      Left = 8
      Top = 16
      Width = 65
      Height = 13
      Caption = 'Requirements'
    end
    object Label6: TLabel
      Left = 8
      Top = 104
      Width = 32
      Height = 13
      Caption = 'Credits'
    end
    object Label9: TLabel
      Left = 144
      Top = 16
      Width = 86
      Height = 13
      Caption = 'One entry per line!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Memo3: TMemo
      Left = 8
      Top = 32
      Width = 353
      Height = 65
      Lines.Strings = (
        'Memo3')
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object Memo4: TMemo
      Left = 8
      Top = 120
      Width = 353
      Height = 105
      Lines.Strings = (
        'Memo4')
      ScrollBars = ssVertical
      TabOrder = 1
      WordWrap = False
    end
  end
  object Button2: TButton
    Left = 448
    Top = 32
    Width = 177
    Height = 33
    Caption = 'Load Project'
    TabOrder = 6
    OnClick = OnLoadClick
  end
  object Button3: TButton
    Left = 640
    Top = 32
    Width = 177
    Height = 33
    Caption = 'Save Project'
    TabOrder = 7
    OnClick = OnSaveClick
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 280
    Width = 417
    Height = 233
    Caption = 'Changelog'
    TabOrder = 8
    object Label10: TLabel
      Left = 136
      Top = 16
      Width = 70
      Height = 13
      Caption = 'Version History'
    end
    object Label11: TLabel
      Left = 8
      Top = 16
      Width = 35
      Height = 13
      Caption = 'Version'
    end
    object Label12: TLabel
      Left = 136
      Top = 104
      Width = 150
      Height = 13
      Caption = 'Changelog Entries (one per line)'
    end
    object ListBox1: TListBox
      Left = 136
      Top = 32
      Width = 265
      Height = 65
      ItemHeight = 13
      TabOrder = 0
      OnClick = OnListBoxClick
    end
    object Button4: TButton
      Left = 8
      Top = 56
      Width = 121
      Height = 25
      Caption = 'Add Changelog'
      TabOrder = 1
      OnClick = OnChangelogAddClick
    end
    object Button5: TButton
      Left = 8
      Top = 88
      Width = 121
      Height = 25
      Caption = 'Remove Changelog'
      TabOrder = 2
      OnClick = OnRemoveChangelogClick
    end
    object Memo5: TMemo
      Left = 136
      Top = 120
      Width = 265
      Height = 105
      Lines.Strings = (
        'Memo5')
      ScrollBars = ssVertical
      TabOrder = 3
      OnChange = OnChangelogTextChange
    end
    object Edit3: TEdit
      Left = 8
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 4
      Text = 'Edit3'
      OnChange = OnChangelogVersionChange
    end
    object Button6: TButton
      Left = 8
      Top = 120
      Width = 121
      Height = 25
      Caption = 'Modify Changelog'
      Enabled = False
      TabOrder = 5
      OnClick = OnModifyChangelogClick
    end
  end
  object Button7: TButton
    Left = 640
    Top = 72
    Width = 177
    Height = 33
    Caption = 'Open New Thread'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = OnThreadOpenClick
  end
end
