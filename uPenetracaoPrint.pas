unit uPenetracaoPrint;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	ExtCtrls, quickrpt, Qrctrls, TeeProcs, TeEngine, Chart, DBChart, QrTee,
	Series;

type
	TfrmPenetracaoPrint = class(TForm)
	qrImpacto: TQuickRep;
    qrShape2: TQRShape;
	Titulo: TQRLabel;
    lbEmpresa: TQRLabel;
    lbModelo: TQRLabel;
    lbLote: TQRLabel;
    lbPosicao: TQRLabel;
    stEmpresa: TQRLabel;
    stCapacete: TQRLabel;
    stAmostra: TQRLabel;
    stLote: TQRLabel;
    stEnsaio: TQRLabel;
    lbNormaUtilizada: TQRLabel;
    lbAceleracaoMaximaNorma: TQRLabel;
    stNormaUtilizada: TQRLabel;
    stPenetracaoNorma: TQRLabel;
    lbVelocidadeImpactoNorma: TQRLabel;
    stVelocidadePenetracaoNorma: TQRLabel;
    lbAceleracaoMaxima: TQRLabel;
    stPenet: TQRLabel;
    QRLabel3: TQRLabel;
    stCondicionamento: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape3: TQRShape;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    stVelReal: TQRLabel;
    QRLabel4: TQRLabel;
    stTamanho: TQRLabel;
    QRBand1: TQRBand;
    lbAmostra: TQRLabel;
    QRLabel6: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPenetracaoPrint: TfrmPenetracaoPrint;

implementation

{$R *.DFM}





end.
