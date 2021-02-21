object fAbout: TfAbout
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 57
  ClientWidth = 214
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
    Left = 16
    Top = 8
    Width = 167
    Height = 13
    Caption = 'Created by Michael Chernov, 2020'
  end
  object Label2: TLabel
    Left = 19
    Top = 27
    Width = 164
    Height = 13
    Caption = 'Email: mihail.tchernov@yandex.ru'
  end
end
