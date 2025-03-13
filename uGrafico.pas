unit uGrafico;


interface


uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	TeEngine, Series, ExtCtrls, TeeProcs, Chart, ComCtrls, ToolWin, ExtDlgs,
  ImgList, StdCtrls;


type
	TfrmGrafico = class(TForm)
		tcGrafico	: TChart;
		lsLinha		: TLineSeries;
    ilGrafico: TImageList;
		dlgSalvarGrafico: TSavePictureDialog;
    dlgPrinterSetup: TPrinterSetupDialog;
		lsX: TLineSeries;
		lsY: TLineSeries;
		lsZ: TLineSeries;
    tmrZoom: TTimer;
    lsResult: TLineSeries;
    Panel1: TPanel;
    tbGrafico: TToolBar;
    tbtnImprimir: TToolButton;
    tbtnSalvar: TToolButton;
    btnXYZ: TToolButton;
    Shape3: TShape;
    Label13: TLabel;
    Shape4: TShape;
    Label14: TLabel;
    Shape5: TShape;
    Label15: TLabel;
    Shape6: TShape;
    Label17: TLabel;
    tbVoltar: TToolButton;
		procedure tbtnSalvarClick(Sender: TObject);
		procedure tbtnImprimirClick(Sender: TObject);
		procedure tbVoltarClick(Sender: TObject);
		procedure btnXYZClick(Sender: TObject);
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
	frmGrafico		:	TfrmGrafico;


implementation

uses
			uImpactoPrint, uNovoEnsaio, uHelmet ;

{$R *.DFM}


{===============================================================================

===============================================================================}
procedure TfrmGrafico.tbtnSalvarClick(Sender: TObject);
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

procedure TfrmGrafico.tbtnImprimirClick(Sender: TObject);
begin
	// Salva gráfico e coloca no report
	frmGrafico.tcGrafico.SaveToMetafile('HMTGRAF.WMF') ;
	frmImpactoPrint.qrGrafico.Picture.LoadFromFile('HMTGRAF.WMF') ;
	//frmHelmet.SaveImpacto('UltimoEnsaio.hmi');
	if dlgPrinterSetup.Execute then
    begin
    	frmImpactoPrint.qrImpacto.ShowProgress := true ;
			frmImpactoPrint.qrImpacto.Print ;
    	//frmImpactoPrint.qrImpacto.EndPage ;
    	{ while FileExists('E'+FormatFloat('00000', frmHelmet.ESCount)) do
        begin
        	frmHelmet.EScount := frmHelmet.ESCount + 1 ;
        end; }
    end;
end;

procedure TfrmGrafico.tbVoltarClick(Sender: TObject);
begin
	//frmImpactoPrint.Show ;
        Close();
end;

procedure TfrmGrafico.btnXYZClick(Sender: TObject);
begin

	if btnXYZ.caption = 'Mostra XYZ' then
	begin
		tcGrafico.Series[0].active := true ;
                tcGrafico.Series[4].active := true ;
		tcGrafico.Series[1].active := true ;
		tcGrafico.Series[2].active := true ;
		tcGrafico.Series[3].active := true ;
		btnXYZ.ImageIndex := 3;
		btnXYZ.Caption := 'Apaga XYZ' ;
	end
	else
	begin
		tcGrafico.Series[0].active := true ;
                tcGrafico.Series[4].active := true ;
		tcGrafico.Series[1].active := false ;
		tcGrafico.Series[2].active := false ;
		tcGrafico.Series[3].active := false ;
        btnXYZ.ImageIndex := 2;
		btnXYZ.Caption := 'Mostra XYZ' ;
	end ;
end;

procedure TfrmGrafico.ZoomIn ;
begin
	frmNovoEnsaio.Zoom( frmNovoEnsaio.dMax, frmNovoEnsaio.PosicaoX ) ;
end;

procedure TfrmGrafico.FormShow(Sender: TObject);
begin
	tcGrafico.UndoZoom ;
    //ZoomIn;
	tmrZoom.enabled := true ;
        Sleep(1000);
end;

procedure TfrmGrafico.tmrZoomTimer(Sender: TObject);
begin
	tmrZoom.enabled := false ;
	//frmNovoEnsaio.Zoom( frmNovoEnsaio.dMax, frmNovoEnsaio.PosicaoX+100 ) ;
        frmNovoEnsaio.Zoom( frmNovoEnsaio.dMax, 65) ;
        frmGrafico.tcGrafico.SaveToMetafile(ExtractFilePath(Application.ExeName) + '\GRAFTMP.WMF');
end;

	procedure TfrmGrafico.tcGraficoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        //ShowMessage('X: ' + IntToStr(X));
        //ShowMessage('Y: ' + IntToStr(Y));
end;

procedure TfrmGrafico.FormCreate(Sender: TObject);
begin
	tcGrafico.UndoZoom ;
    //ZoomIn;
	tmrZoom.enabled := true ;
end;

end.
