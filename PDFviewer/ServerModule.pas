unit ServerModule;

interface

uses
  SysUtils, uniGUIServer, uniGUIMainModule, uniGUIApplication;

type
  TUniServerModule = class(TUniGUIServerModule)
    procedure UniGUIServerModuleCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure FirstInit; override;
  public
    { Public declarations }
  end;

function UniServerModule: TUniServerModule;

implementation

{$R *.dfm}

uses
  UniGUIVars;

function UniServerModule: TUniServerModule;
begin
  Result := TUniServerModule(UniGUIServerInstance);
end;

procedure TUniServerModule.FirstInit;
begin
  InitServerModule(Self);
end;

procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject);
begin
  MimeTable.AddMimeType('properties', 'properties');
  MimeTable.AddMimeType('bcmap', 'bcmap');
end;

initialization
  RegisterServerModuleClass(TUniServerModule);
end.

