object fMain: TfMain
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'BinViewer'
  ClientHeight = 464
  ClientWidth = 1191
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 55
    Width = 39
    Height = 13
    Caption = 'Channel'
  end
  object Label2: TLabel
    Left = 111
    Top = 55
    Width = 72
    Height = 13
    Caption = 'Discreet Frame'
  end
  object Label3: TLabel
    Left = 262
    Top = 55
    Width = 59
    Height = 13
    Caption = 'Frame index'
  end
  object lAllDiscreetCount: TLabel
    Left = 8
    Top = 33
    Width = 84
    Height = 13
    Caption = '<DiscreetCount>'
  end
  object cbChannelName: TComboBox
    Left = 59
    Top = 52
    Width = 46
    Height = 21
    Style = csDropDownList
    Enabled = False
    ImeMode = imClose
    ItemIndex = 0
    TabOrder = 0
    Text = 'Z'
    OnChange = cbChannelNameChange
    Items.Strings = (
      'Z'
      'X'
      'Y')
  end
  object sePartSize: TSpinEdit
    Left = 186
    Top = 52
    Width = 70
    Height = 22
    Enabled = False
    Increment = 1000
    MaxValue = 100000
    MinValue = 1
    TabOrder = 1
    Value = 1
    OnChange = sePartSizeChange
  end
  object fNameEdit: TAdvFileNameEdit
    Left = 8
    Top = 8
    Width = 986
    Height = 21
    EmptyTextStyle = []
    Flat = False
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Tahoma'
    LabelFont.Style = []
    Lookup.Font.Charset = DEFAULT_CHARSET
    Lookup.Font.Color = clWindowText
    Lookup.Font.Height = -11
    Lookup.Font.Name = 'Arial'
    Lookup.Font.Style = []
    Lookup.Separator = ';'
    Color = clWindow
    Enabled = False
    ReadOnly = False
    TabOrder = 2
    Text = ''
    Visible = True
    OnChange = fNameEditChange
    Version = '1.3.6.0'
    ButtonStyle = bsButton
    ButtonWidth = 18
    Etched = False
    Glyph.Data = {
      CE000000424DCE0000000000000076000000280000000C0000000B0000000100
      0400000000005800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000DDD
      00000077777770DD00000F077777770D00000FF07777777000000FFF00000000
      00000FFFFFFF0DDD00000FFF00000DDD0000D000DDDDD0000000DDDDDDDDDD00
      0000DDDDD0DDD0D00000DDDDDD000DDD0000}
    FilterIndex = 2
    DialogOptions = []
    DialogKind = fdOpen
  end
  object dataGrid: TAdvStringGrid
    Left = 1000
    Top = 8
    Width = 183
    Height = 427
    Cursor = crDefault
    ColCount = 2
    Ctl3D = True
    DrawingStyle = gdsClassic
    RowCount = 2
    ParentCtl3D = False
    ScrollBars = ssBoth
    TabOrder = 3
    HoverRowCells = [hcNormal, hcSelected]
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ColumnHeaders.Strings = (
      'id'
      'Value')
    ColumnSize.Rows = arFixed
    ControlLook.FixedGradientHoverFrom = clGray
    ControlLook.FixedGradientHoverTo = clWhite
    ControlLook.FixedGradientDownFrom = clGray
    ControlLook.FixedGradientDownTo = clSilver
    ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownHeader.Font.Color = clWindowText
    ControlLook.DropDownHeader.Font.Height = -11
    ControlLook.DropDownHeader.Font.Name = 'Tahoma'
    ControlLook.DropDownHeader.Font.Style = []
    ControlLook.DropDownHeader.Visible = True
    ControlLook.DropDownHeader.Buttons = <>
    ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownFooter.Font.Color = clWindowText
    ControlLook.DropDownFooter.Font.Height = -11
    ControlLook.DropDownFooter.Font.Name = 'Tahoma'
    ControlLook.DropDownFooter.Font.Style = []
    ControlLook.DropDownFooter.Visible = True
    ControlLook.DropDownFooter.Buttons = <>
    Filter = <>
    FilterDropDown.Font.Charset = DEFAULT_CHARSET
    FilterDropDown.Font.Color = clWindowText
    FilterDropDown.Font.Height = -11
    FilterDropDown.Font.Name = 'Tahoma'
    FilterDropDown.Font.Style = []
    FilterDropDown.TextChecked = 'Checked'
    FilterDropDown.TextUnChecked = 'Unchecked'
    FilterDropDownClear = '(All)'
    FilterEdit.TypeNames.Strings = (
      'Starts with'
      'Ends with'
      'Contains'
      'Not contains'
      'Equal'
      'Not equal'
      'Larger than'
      'Smaller than'
      'Clear')
    FixedColWidth = 50
    FixedRowHeight = 30
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    HoverButtons.Buttons = <>
    HoverButtons.Position = hbLeftFromColumnLeft
    HTMLSettings.ImageFolder = 'images'
    HTMLSettings.ImageBaseName = 'img'
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'Tahoma'
    PrintSettings.Font.Style = []
    PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
    PrintSettings.FixedFont.Color = clWindowText
    PrintSettings.FixedFont.Height = -11
    PrintSettings.FixedFont.Name = 'Tahoma'
    PrintSettings.FixedFont.Style = []
    PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
    PrintSettings.HeaderFont.Color = clWindowText
    PrintSettings.HeaderFont.Height = -11
    PrintSettings.HeaderFont.Name = 'Tahoma'
    PrintSettings.HeaderFont.Style = []
    PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
    PrintSettings.FooterFont.Color = clWindowText
    PrintSettings.FooterFont.Height = -11
    PrintSettings.FooterFont.Name = 'Tahoma'
    PrintSettings.FooterFont.Style = []
    PrintSettings.PageNumSep = '/'
    SearchFooter.FindNextCaption = 'Find &next'
    SearchFooter.FindPrevCaption = 'Find &previous'
    SearchFooter.Font.Charset = DEFAULT_CHARSET
    SearchFooter.Font.Color = clWindowText
    SearchFooter.Font.Height = -11
    SearchFooter.Font.Name = 'Tahoma'
    SearchFooter.Font.Style = []
    SearchFooter.HighLightCaption = 'Highlight'
    SearchFooter.HintClose = 'Close'
    SearchFooter.HintFindNext = 'Find next occurrence'
    SearchFooter.HintFindPrev = 'Find previous occurrence'
    SearchFooter.HintHighlight = 'Highlight occurrences'
    SearchFooter.MatchCaseCaption = 'Match case'
    SortSettings.DefaultFormat = ssAutomatic
    Version = '8.1.3.0'
    ColWidths = (
      50
      127)
    RowHeights = (
      30
      22)
  end
  object sePartIndex: TSpinEdit
    Left = 327
    Top = 51
    Width = 66
    Height = 22
    Enabled = False
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 0
    OnChange = sePartIndexChange
  end
  object Chart1: TChart
    Left = 8
    Top = 79
    Width = 986
    Height = 380
    Legend.Visible = False
    Title.Text.Strings = (
      'Component signal graph')
    View3D = False
    Zoom.Animated = True
    TabOrder = 5
    DefaultCanvas = 'TGDIPlusCanvas'
    PrintMargins = (
      15
      33
      15
      33)
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Selected.Hover.Visible = False
      Title = 'Component signal'
      Brush.BackColor = clDefault
      LinePen.Color = 10708548
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      TreatNulls = tnIgnore
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object bShowData: TButton
    Left = 399
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Show data'
    Enabled = False
    TabOrder = 6
    OnClick = bShowDataClick
  end
  object bSaveToFile: TButton
    Left = 1056
    Top = 438
    Width = 75
    Height = 25
    Caption = 'Save to file'
    Enabled = False
    TabOrder = 7
    OnClick = bSaveToFileClick
  end
  object saveFileDialog: TSaveTextFileDialog
    DefaultExt = 'dat'
    Filter = 'Dat format|*.dat'
    Left = 1136
    Top = 432
  end
  object MainMenu1: TMainMenu
    Left = 560
    Top = 40
    object Program1: TMenuItem
      Caption = 'Program'
      object mExitProgram: TMenuItem
        Caption = 'Exit'
        OnClick = mExitProgramClick
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
end
