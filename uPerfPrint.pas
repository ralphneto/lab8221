unit uPerfPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	ExtCtrls, quickrpt, Qrctrls;

type
  TfrmPerfPrint = class(TForm)
    QuickRep1: TQuickRep;
    QRLabel1: TQRLabel;
		qres: TQRLabel;
		qtitle: TQRLabel;
    stEmpresa: TQRLabel;
		lbModelo: TQRLabel;
    stCapacete: TQRLabel;
    stAmostra: TQRLabel;
    stLote: TQRLabel;
    stCondicionamento: TQRLabel;
    QRLabel3: TQRLabel;
    lbLote: TQRLabel;
    lbAmostra: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    stDElast: TQRLabel;
    stEnsaios: TQRLabel;
    QRLabel6: TQRLabel;
    stREnsaios: TQRLabel;
    QRShape2: TQRShape;
    QRLabel8: TQRLabel;
    QRShape3: TQRShape;
    lbEmpresa: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel5: TQRLabel;
    stTamanho: TQRLabel;
  private
		{ Private declarations }
  public
		{ Public declarations }
	end;

var
  frmPerfPrint: TfrmPerfPrint;

implementation

{$R *.DFM}






















end.
