object fLicKey: TfLicKey
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Activation'
  ClientHeight = 63
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCanResize = FormCanResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 85
    Height = 13
    Caption = 'Enter License Key'
  end
  object eLicKey: TEdit
    Left = 99
    Top = 5
    Width = 520
    Height = 21
    TabOrder = 0
  end
  object bEnter: TButton
    Left = 264
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 1
    OnClick = bEnterClick
  end
end
