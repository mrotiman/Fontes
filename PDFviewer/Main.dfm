object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 446
  ClientWidth = 897
  Caption = 
    'Unigui PDF Viewer (No plug-ins, do not need to install the PDF c' +
    'lient, support for multiple languages)'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniTreeView1: TUniTreeView
    Left = 0
    Top = 0
    Width = 177
    Height = 446
    Hint = ''
    Items.FontData = {0100000000}
    Align = alLeft
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 0
    Color = clWindow
    OnChange = UniTreeView1Change
    ExplicitHeight = 369
  end
  object UniURLFrame1: TUniURLFrame
    Left = 177
    Top = 0
    Width = 720
    Height = 446
    Hint = ''
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    ParentColor = False
    Color = clBtnFace
    ExplicitHeight = 469
  end
  object UniButton1: TUniButton
    Left = 48
    Top = 413
    Width = 75
    Height = 25
    Hint = ''
    Caption = 'Reload'
    TabOrder = 2
    OnClick = UniButton1Click
  end
end
