unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniPanel, uniURLFrame,
  uniGUIBaseClasses, uniTreeView, IOUtils, Types, uniButton;

type
  TMainForm = class(TUniForm)
    UniTreeView1: TUniTreeView;
    UniURLFrame1: TUniURLFrame;
    UniButton1: TUniButton;
    procedure UniFormCreate(Sender: TObject);
    procedure UniTreeView1Change(Sender: TObject; Node: TUniTreeNode);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
var
  I: Integer;
  Path: string;
  Dir: TDirectory;
  Files: TStringDynArray;
begin
  UniTreeView1.Items.Clear;

  Path := ExtractFilePath(Application.ExeName) + '\Docs\';
  Files := Dir.GetFiles(Path);
  for I := 0 to Length(Files) - 1 do
    UniTreeView1.Items.Add(nil, ExtractFileName(Files[I]));

  if UniTreeView1.Items.Count > 0 then
  begin
    UniTreeView1.Selected := UniTreeView1.Items[0];
    UniTreeView1Change(UniTreeView1, UniTreeView1.Selected);
  end;

end;

procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  UniButton1Click(Self);
end;

procedure TMainForm.UniTreeView1Change(Sender: TObject; Node: TUniTreeNode);
begin
  UniURLFrame1.URL := '/pdf/web/viewer.html?file=../..//Docs//' + Node.Text + '#page=1&zoom=50&time=' + FormatDateTime('yyyymmdhhnnsszzz', Now);
end;

initialization
  RegisterAppFormClass(TMainForm);

end.

