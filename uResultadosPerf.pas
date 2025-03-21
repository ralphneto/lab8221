unit uResultadosPerf;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	StdCtrls, ExtCtrls, Buttons, ToolWin, ComCtrls;

type
	TfrmResultadosPerf = class(TForm)
	nbPages: TNotebook;
    lbResult: TLabel;
	GroupBox1: TGroupBox;
	Label1: TLabel;
    lbMaximo: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    lbNMaximo: TLabel;
    Label4: TLabel;
    lbNorma: TLabel;
    gbPrimeiroLimite: TGroupBox;
    lbDesacPrimLimite: TLabel;
	lbUnidDesacPrimLimite: TLabel;
    lbTempoPrimLimite: TLabel;
    lbUnidTempoPrimLimite: TLabel;
    edDesacPrimLimite: TEdit;
	edTempoPrimLimite: TEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edDesacSegLimite: TEdit;
    edTempoSegLimite: TEdit;
    Label8: TLabel;
	Label9: TLabel;
    Label10: TLabel;
    lbTempo1: TLabel;
    lbTempo2: TLabel;
	Label16: TLabel;
	lbAltImp: TLabel;
	lbVelImp: TLabel;
	Label18: TLabel;
	Label19: TLabel;
	Label20: TLabel;
	Label21: TLabel;
	Label22: TLabel;
	lbEmpresa: TLabel;
	lbModelo: TLabel;
	lbAmostra: TLabel;
	lbLote: TLabel;
	lbEnsaio: TLabel;
	Shape1: TShape;
	Shape2: TShape;
	cool: TCoolBar;
    lbEnsaios: TLabel;
    LabelX: TLabel;
    lbCondicionamento: TLabel;
    Label11: TLabel;
    lbTemp: TLabel;
    secminor: TLabel;
    secmajor: TLabel;
    yu: TSpeedButton;
    Label12: TLabel;
    lbResReal: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    sbGeral: TSpeedButton;
    Label23: TLabel;
    lbTamanho: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    lbObs: TLabel;
    Panel1: TPanel;
    imgGraf: TImage;
    spBtnSalvar: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label27: TLabel;
    lbSituacao: TLabel;
	procedure spBtnSalvarClick(Sender: TObject);
	procedure coolClick(Sender: TObject);
    procedure secminorDblClick(Sender: TObject);
    procedure secmajorDblClick(Sender: TObject);
    procedure yuClick(Sender: TObject);
    procedure sbGeralClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
	private
		{ Private declarations }
	public
		{ Public declarations }
	end;

var
	frmResultadosPerf: TfrmResultadosPerf;

implementation
uses uGrafico, uImpactoPrint, uMisc, uAbout, uHelmet, uNovoEnsaio, uGeral ;

{$R *.DFM}

procedure TfrmResultadosPerf.coolClick(Sender: TObject);
begin
	frmAbout.Show ;
end;


procedure TfrmResultadosPerf.spBtnSalvarClick(Sender: TObject);
var AppPath: string;
begin
        // Salva gr�fico e coloca no report
//(*
        frmGrafico.WindowState := wsMaximized ;
	frmGrafico.tcGrafico.Series[1].active := false ;
	frmGrafico.tcGrafico.Series[2].active := false ;
	frmGrafico.tcGrafico.Series[3].active := false ;
	frmGrafico.tcGrafico.UndoZoom ;
    Application.ProcessMessages ;
    frmNovoEnsaio.Zoom( frmNovoEnsaio.dMax, frmNovoEnsaio.PosicaoX ) ;
	frmGrafico.tcGrafico.SaveToMetafile('HMTGRAF.WMF') ;
	frmImpactoPrint.qrGrafico.Picture.LoadFromFile('HMTGRAF.WMF') ;

	frmGrafico.dlgPrinterSetup.Execute ;
    frmImpactoPrint.qrImpacto.ShowProgress := true ;
    frmImpactoPrint.qrImpacto.Print ;
    //frmImpactoPrint.qrImpacto.EndPage ;
    frmHelmet.SaveImpacto('E'+formatfloat('00000', frmHelmet.ESCount));
    frmHelmet.ESCount := frmHelmet.ESCount + 1;
//*)
    AppPath := extractfilepath(application.exename);
    if not frmHelmet.dlgSalvar.Execute then Exit;
    frmHelmet.SaveImpacto(frmHelmet.dlgSalvar.FileName);
    //frmHelmet.SaveImpacto(AppPath+'UltimoEnsaio.hmi');
end;

procedure TfrmResultadosPerf.secminorDblClick(Sender: TObject);
begin
     uMisc.Realities ;
end;

procedure TfrmResultadosPerf.secmajorDblClick(Sender: TObject);
begin
     uMisc.Realities ;
end;

procedure TfrmResultadosPerf.yuClick(Sender: TObject);
begin
	frmGrafico.WindowState := wsMaximized ;
	frmGrafico.Show ;
end;

procedure TfrmResultadosPerf.sbGeralClick(Sender: TObject);
begin
  frmGeral.tblAtual.Active := true;
  frmGeral.tblAtual.Refresh;
  frmGeral.lbEmpresa.Caption := lbEmpresa.Caption;
  frmGeral.lbNorma.Caption := lbNorma.Caption;
	frmGeral.show;
end;



procedure TfrmResultadosPerf.FormActivate(Sender: TObject);
begin
     imgGraf.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + '\GRAFTMP.WMF');
end;

procedure TfrmResultadosPerf.SpeedButton2Click(Sender: TObject);
begin
        Close();
end;

end.
