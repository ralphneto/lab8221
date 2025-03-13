unit uGraficoTrans;


interface


uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	TeEngine, Series, ExtCtrls, TeeProcs, Chart, ComCtrls, ToolWin, ExtDlgs,
  ImgList, StdCtrls;


type
	TfrmGraficoTrans = class(TForm)
		tcGrafico	: TChart;
    ilGrafico: TImageList;
		dlgSalvarGrafico: TSavePictureDialog;
    dlgPrinterSetup: TPrinterSetupDialog;
		lsX: TLineSeries;
    tmrZoom: TTimer;
    Panel1: TPanel;
    tbGrafico: TToolBar;
    tbtnImprimir: TToolButton;
    tbtnSalvar: TToolButton;
    Shape3: TShape;
    Label13: TLabel;
    tbVoltar: TToolButton;
		procedure tbtnSalvarClick(Sender: TObject);
		procedure tbtnImprimirClick(Sender: TObject);
		procedure tbVoltarClick(Sender: TObject);
		procedure ZoomIn ;
    procedure FormShow(Sender: TObject);
    procedure tmrZoomTimer(Sender: TObject);
    procedure tcGraficoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
	private
	public
	end;


var
	frmGraficoTrans		:	TfrmGraficoTrans;


implementation

uses
			uImpactoPrint, uNovoEnsaio, uHelmet, uGrafico, uTransmissaoPrint ;

{$R *.DFM}


{===============================================================================

===============================================================================}
procedure TfrmGraficoTrans.tbtnSalvarClick(Sender: TObject);
var
	sExt , sFile	:	string;
begin
        sFile := inputbox ('Salvar Gráfico', 'Nome do Arquivo', 'GRAFICO.WMF');
        if (sFile = '') then exit;
        tcGrafico.SaveToMetafile(sFile);
	//if not dlgSalvarGrafico.Execute then Exit;
        //tcGrafico.SaveToMetafile('GRAFICO.WMF');
{	sExt := ExtractFileExt(dlgSalvarGrafico.FileName);
	sExt := Copy(UpperCase(sExt), 2, 3);
	if (sExt='WMF') then
		tcGrafico.SaveToMetafile(dlgSalvarGrafico.FileName)
	else if (sExt='EMF') then
		tcGrafico.SaveToMetafileEnh(dlgSalvarGrafico.FileName)
	else if (sExt='BMP') then
		tcGrafico.SaveToBitMapFile(dlgSalvarGrafico.FileName); }
end;

procedure TfrmGraficoTrans.tbtnImprimirClick(Sender: TObject);
begin
	// Salva gráfico e coloca no report
	frmGraficoTrans.tcGrafico.SaveToMetafile('HMTGRAF.WMF') ;
	frmTransmissaoPrint.qrGrafico.Picture.LoadFromFile('HMTGRAF.WMF') ;
	//frmHelmet.SaveImpacto('UltimoEnsaio.hmi');
	if dlgPrinterSetup.Execute then
        begin
    	        frmTransmissaoPrint.qrImpacto.ShowProgress := true ;
		frmTransmissaoPrint.qrImpacto.Print ;
        end;
end;

procedure TfrmGraficoTrans.tbVoltarClick(Sender: TObject);
begin
	//frmImpactoPrint.Show ;
        Close();
end;

procedure TfrmGraficoTrans.ZoomIn ;
begin
	frmNovoEnsaio.Zoom( frmNovoEnsaio.dMax, frmNovoEnsaio.PosicaoX ) ;
end;

procedure TfrmGraficoTrans.FormShow(Sender: TObject);
begin
	tcGrafico.UndoZoom ;
    //ZoomIn;
	tmrZoom.enabled := true ;
        Sleep(1000);
end;

procedure TfrmGraficoTrans.tmrZoomTimer(Sender: TObject);
begin
	tmrZoom.enabled := false ;
	//frmNovoEnsaio.Zoom( frmNovoEnsaio.dMax, frmNovoEnsaio.PosicaoX+100 ) ;
        frmNovoEnsaio.Zoom( frmNovoEnsaio.dMax, 65) ;
        frmGrafico.tcGrafico.SaveToMetafile(ExtractFilePath(Application.ExeName) + '\GRAFTMP.WMF');
end;

	procedure TfrmGraficoTrans.tcGraficoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        //ShowMessage('X: ' + IntToStr(X));
        //ShowMessage('Y: ' + IntToStr(Y));
end;

procedure TfrmGraficoTrans.FormCreate(Sender: TObject);
begin
	tcGrafico.UndoZoom ;
    //ZoomIn;
	tmrZoom.enabled := true ;
end;

end.
