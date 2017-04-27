unit uImpCarteira;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, ppBands, ppCache,
  ppClass, ppDesignLayer, ppParameter, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport,
  ppCtrls, ppPrnabl;

type
  TfCarteira = class(TForm)
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    QryListaMembros: TFDQuery;
    dsLista: TDataSource;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCarteira: TfCarteira;

implementation

{$R *.dfm}

end.
