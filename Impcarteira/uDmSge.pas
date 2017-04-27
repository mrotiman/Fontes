unit uDmSge;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet,

  DBClient,
  SqlExpr,
  Provider,
  Controls,
  Forms,
  StdCtrls,
  ComCtrls,
  DateUtils, FireDAC.Phys.MSAcc, FireDAC.Phys.MSAccDef

  ;

type
  Tdm = class(TDataModule)
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Conn: TFDConnection;
    QryG: TFDQuery;
    Qtmp: TFDQuery;
    CdsTmp: TClientDataSet;
    DsProvider: TDataSetProvider;
    ConnAux: TFDConnection;
    ConnGenesis: TFDConnection;
    QryLerMembrosGenesis: TFDQuery;
    DsMembrosGenesis: TDataSource;
    QryInsMembrosSagae: TFDQuery;
    QryGetMembroSagae: TFDQuery;
    QryInsHistorico: TFDQuery;
    QryLerFoto: TFDQuery;
    QryInsFoto: TFDQuery;
    qryLerMembrosSagae: TFDQuery;
    QryAltFoto: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetDataSet(strSQL: String):olevariant;
    function TamFoto(pFileName:String):double;
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function Tdm.GetDataSet(strSQL: String):olevariant;
var
  vCur :TCursor;
Begin
  vCur := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    if Qtmp.Active then
      Qtmp.Close;
    Qtmp.SQL.Text   := strSQL;
    Qtmp.Open;
    Result := DsProvider.Data;
    Qtmp.Close;
  finally
    Screen.Cursor := vCur;
  end;
end;

Function Tdm.TamFoto(pFileName:String):double;
var
  F : File of Byte;
begin
  AssignFile(F,pFileName);
  Reset(F);
  Result:=FileSize(F);
  CloseFile(F);
end;

end.
