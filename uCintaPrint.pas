unit uCintaPrint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  quickrpt, Qrctrls, ExtCtrls;

type
	TfrmCintaPrint = class(TForm)
    qrCinta: TQuickRep;
    QRLabel1: TQRLabel;
		eres: TQRLabel;
		qtitle: TQRLabel;
    QRLabel2: TQRLabel;
		pres: TQRLabel;
    lbEmpresa: TQRLabel;
    stEmpresa: TQRLabel;
    stCapacete: TQRLabel;
    stAmostra: TQRLabel;
    stLote: TQRLabel;
    stCondicionamento: TQRLabel;
    QRLabel3: TQRLabel;
    lbLote: TQRLabel;
    lbAmostra: TQRLabel;
    lbModelo: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    stDPlast: TQRLabel;
    stDElast: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape4: TQRShape;
    QRSysData1: TQRSysData;
    QRLabel8: TQRLabel;
    stTamanho: TQRLabel;
  private
    { Private declarations }
	public
		{ Public declarations }
	end;
var
	frmCintaPrint: TfrmCintaPrint;

implementation

{$R *.DFM}

end.
