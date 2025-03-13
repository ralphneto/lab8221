unit uCalibracaoPrint;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	ExtCtrls, quickrpt, Qrctrls, TeeProcs, TeEngine, Chart, DBChart, QrTee,
	Series;

type
	TfrmCalibracaoPrint = class(TForm)
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
    stNorma: TQRLabel;
    stAlturaNorma: TQRLabel;
    lbVelocidadeImpactoNorma: TQRLabel;
    stVelocidadeCalibracaoNorma: TQRLabel;
    lbAceleracaoMaxima: TQRLabel;
    stSituacao: TQRLabel;
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
    QRLabel7: TQRLabel;
    stMaxZg: TQRLabel;
    stMaxZ: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel8: TQRLabel;
    stMaxN: TQRLabel;
    QRLabel11: TQRLabel;
    stDif: TQRLabel;
    QRLabel9: TQRLabel;
    stDifNorma: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalibracaoPrint: TfrmCalibracaoPrint;

implementation

{$R *.DFM}





end.
