unit uPrintForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	ExtCtrls, quickrpt, Qrctrls, TeeProcs, TeEngine, Chart, DBChart, QrTee,
	Series;

type
  TPrintForm = class(TForm)
		QRP								: TQuickRep;
		Titulo						: TQRLabel;
		EmpresaLab				: TQRLabel;
		ModeloLab					: TQRLabel;
		NumAmostraLab			: TQRLabel;
		QRLabel3					: TQRLabel;
		QRLabel4					: TQRLabel;
		Empresa						: TQRLabel;
		Capacete					: TQRLabel;
		Amostra						: TQRLabel;
		Lote							: TQRLabel;
		Ensaio						: TQRLabel;
		QRI								: TQRImage;
		Limite1						: TQRLabel;
		Limite2						: TQRLabel;
		QRLabel6					: TQRLabel;
		Resultado					: TQRLabel;
		lbResAceleracao		: TQRLabel;
		QRLabel2					: TQRLabel;
		lbNorma						: TQRLabel;
		lbNormaAceleracao	: TQRLabel;
		QRLabel8					: TQRLabel;
		QRLabel9					: TQRLabel;
		QRLabel10					: TQRLabel;
		QRLabel1					: TQRLabel;
		lbResLimite01			: TQRLabel;
		lbResLimite02			: TQRLabel;
		lbNormaLimite01		: TQRLabel;
		lbNormaLimite02		: TQRLabel;
		QRLabel5					: TQRLabel;
		lbVelocidade			: TQRLabel;
	private
		{ Private declarations }
	public
		{ Public declarations }
  end;

var
	PrintForm	:	TPrintForm;


implementation

{$R *.DFM}

end.
