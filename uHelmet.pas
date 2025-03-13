unit uHelmet;


interface


uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	OleCtrls, ToolWin, ComCtrls, Menus, StdCtrls, ExtCtrls, Buttons, Registry, CBW32, IniFiles,
  jpeg, TeEngine, Series, TeeProcs, Chart, CPort
	;


type
	TfrmHelmet = class(TForm)
		mnuMain: TMainMenu;
		mnuEnsaio: TMenuItem;
		mnuConfiguracoes: TMenuItem;
		mnuAjuda: TMenuItem;
		dlgAbrir: TOpenDialog;
		dlgSalvar: TSaveDialog;
		mnuNovo: TMenuItem;
		mnuAbrir: TMenuItem;
		mnuSalvar: TMenuItem;
		N1: TMenuItem;
		N2: TMenuItem;
		mnuConfigurarImpressora: TMenuItem;
		N3: TMenuItem;
		mnuSair: TMenuItem;
		mnuEmpresas: TMenuItem;
		mnuConteudo: TMenuItem;
		N5: TMenuItem;
		mnuSobre: TMenuItem;
		mnuNormas: TMenuItem;
		mnuSalvarComo: TMenuItem;
		mnuCapacetes: TMenuItem;
		dlgPrinterSetup: TPrinterSetupDialog;
    Timer1: TTimer;
    mnuPos: TMenuItem;
    Condicionamentos1: TMenuItem;
    Atrito1: TMenuItem;
    Acelermetros1: TMenuItem;
    Perfurao1: TMenuItem;
    N4: TMenuItem;
    Hardware1: TMenuItem;
    mainPanel: TPanel;
    Ferramentas1: TMenuItem;
    Diagnstico1: TMenuItem;
    Opes1: TMenuItem;
    DesabilitarPorta1: TMenuItem;
    DesabilitarSensordeVelocidade1: TMenuItem;
    leftPanel: TPanel;
    nbStatus: TNotebook;
    buttonPanel: TPanel;
    bbNovoEnsaio: TBitBtn;
    bbAbrirEnsaio: TBitBtn;
    pnStatusHeader: TPanel;
    GroupBox3: TGroupBox;
    ledPortaOff: TImage;
    ledGarraOff: TImage;
    ledCordaOff: TImage;
    ledFcbOff: TImage;
    ledFcaOff: TImage;
    ledEmergenciaOff: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ledPortaOn: TImage;
    ledGarraOn: TImage;
    ledCordaOn: TImage;
    ledVelocidadeOn: TImage;
    ledFcbOn: TImage;
    ledFcaOn: TImage;
    ledEmergenciaOn: TImage;
    ledVelocidadeOff: TImage;
    GroupBox2: TGroupBox;
    btnGarraOff: TImage;
    btnCordaOff: TImage;
    btnVelocidadeOff: TImage;
    btnPortaOff: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnGarraOn: TImage;
    btnCordaOn: TImage;
    btnVelocidadeOn: TImage;
    btnPortaOn: TImage;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    //lbReguaPos: TLabel;
    GroupBox5: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    panelResults: TPanel;
    nbResults: TNotebook;
    panelResultsHeader: TPanel;
    Label18: TLabel;
    Label4: TLabel;
    Label17: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    LabelX: TLabel;
    Label27: TLabel;
    lbObs: TLabel;
    lbCondicionamento: TLabel;
    lbEnsaio: TLabel;
    lbAmostra: TLabel;
    lbLote: TLabel;
    lbTamanho: TLabel;
    lbModelo: TLabel;
    lbEmpresa: TLabel;
    Label28: TLabel;
    GroupBox1: TGroupBox;
    Shape1: TShape;
    Label29: TLabel;
    lbMaximo: TLabel;
    Label31: TLabel;
    lbTempo1: TLabel;
    lbTempo2: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    lbTemp: TLabel;
    Label34: TLabel;
    lbSituacao: TLabel;
    tmrStatus: TTimer;
    tcGrafico: TChart;
    lsLinha: TLineSeries;
    lsX: TLineSeries;
    lsY: TLineSeries;
    lsZ: TLineSeries;
    lsResult: TLineSeries;
    Label35: TLabel;
    lbEmpresaRet: TLabel;
    lbModeloRet: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    lbCond: TLabel;
    lbTam: TLabel;
    lbLoteRet: TLabel;
    lbAmostraRet: TLabel;
    Label46: TLabel;
    lbObsRet: TLabel;
    GroupBox4: TGroupBox;
    Label48: TLabel;
    lbDElast: TLabel;
    Label49: TLabel;
    lbDPlast: TLabel;
    GroupBox6: TGroupBox;
    Label50: TLabel;
    Label51: TLabel;
    stRes: TLabel;
    edPlast: TEdit;
    edElast: TEdit;
    Panel1: TPanel;
    pnMainResults: TPanel;
    Panel2: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    Image3: TImage;
    Image4: TImage;
    lstMotor: TMemo;
    Label2: TLabel;
    ledFMOn: TImage;
    ledFMOff: TImage;
    MemoData: TMemo;
    Label3: TLabel;
    Edit11: TEdit;
    Edit10: TEdit;
    Label9: TLabel;
    Label30: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    btnResultados: TBitBtn;
		procedure FormCreate(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure mnuSairClick(Sender: TObject);
		procedure mnuNormasClick(Sender: TObject);
		procedure bbNovoEnsaioClick(Sender: TObject);
		procedure mnuEmpresasClick(Sender: TObject);
		procedure mnuCapacetesClick(Sender: TObject);
		procedure FormDestroy(Sender: TObject);
		procedure FormResize(Sender: TObject);
		procedure bbSalvarEnsaioClick(Sender: TObject);
		procedure bbExibirGraficoClick(Sender: TObject);
		procedure bbAbrirEnsaioClick(Sender: TObject);
		procedure bbResultadosEnsaioClick(Sender: TObject);
    procedure mnuSobreClick(Sender: TObject);
    procedure mnuConfigurarImpressoraClick(Sender: TObject);
    procedure bbContinuarEnsaioClick(Sender: TObject);
		procedure Timer1Timer(Sender: TObject);
    procedure mnuPosClick(Sender: TObject);
    procedure Condicionamentos1Click(Sender: TObject);
    procedure mnuConteudoClick(Sender: TObject);
    procedure Atrito1Click(Sender: TObject);
    procedure Acelermetros1Click(Sender: TObject);
    procedure Perfurao1Click(Sender: TObject);
    procedure Diagnstico1Click(Sender: TObject);
    procedure DesabilitarPorta1Click(Sender: TObject);
    procedure DesabilitarSensordeVelocidade1Click(Sender: TObject);
    procedure tmrStatusTimer(Sender: TObject);
    procedure btnVelocidadeOnClick(Sender: TObject);
    procedure btnGarraOnClick(Sender: TObject);
    procedure btnPortaOnClick(Sender: TObject);
    procedure btnCordaOnClick(Sender: TObject);
    procedure btnLampadaOnClick(Sender: TObject);
    procedure btnVelocidadeOffClick(Sender: TObject);
    procedure btnGarraOffClick(Sender: TObject);
    procedure btnPortaOffClick(Sender: TObject);
    procedure btnCordaOffClick(Sender: TObject);
    procedure btnLampadaOffClick(Sender: TObject);
    procedure btnResultadosClick(Sender: TObject);
	private
		procedure WMGetMinMaxInfo(var MSG: Tmessage); message WM_GetMinMaxInfo;
	public
                sEnsaio: string;
                DesPorta: boolean;
                DesSensVel: boolean;
		NormaAtual : integer ;
                ESCount : extended;
		procedure ResizeControls;
		procedure SaveImpacto(FileName: TFileName);
                procedure SaveTransmissao(FileName: TFileName);
                procedure SavePenetracao(FileName: TFileName);
                procedure SaveCalibracao(FileName: TFileName);
                procedure SaveRetencao(FileName: TFileName);
		procedure LoadImpacto(FileName: TFileName);
                procedure LoadTransmissao(FileName: TFileName);
                procedure LoadPenetracao(FileName: TFileName);
                procedure LoadCalibracao(FileName: TFileName);
                procedure LoadRetencao(FileName: TFileName);
		function ScanForLimits( limite : double ) : double ;
	end;


var
	frmHelmet	: TfrmHelmet;
	FileName	:	TFileName;
	lPontosImpacto	:	longint = 10000 ; //RateChange
	EnsaioAtual			:	(eaNone, eaImpacto, eaTransmissao, eaPenetracao, eaCalibracao, eaViseira, eaCinta);
		SavCount : TIniFile ;


const
	IMPACTO_ID			=	'HMTIM';
        TRANSMISSAO_ID			=	'HMTTR';
        PENETRACAO_ID			=	'HMTPE';
        CALIBRACAO_ID			=	'HMTCA';
	PERFURACAO_ID		=	'HMTPE';
	VISEIRA_ID			=	'HMTVI';   // 8221 vira FORCA
	ScreenWidth			=	1024;
	ScreenHeight		=	768;





implementation


uses uNormas, uNovoEnsaio, uEmpresas, uCapacetes, uMachineControl,
		 uGrafico, uImpactoPrint, uResultados, uAbout, uProgress, uPos,
		 uCondicionamento, uAtrito, uAcelerometros, uP, uDiagnostico, uAutoTeste,
  uGeral, uCintaRes, uCintaPrint, uResultadosTrans,
  uGraficoTrans, uTransmissaoPrint, uResultadosPenet, uPenetracaoPrint,
  uResultadosCal, uCalibracaoPrint;


{$R *.DFM}


{===============================================================================
===============================================================================}
procedure TfrmHelmet.FormCreate(Sender: TObject);
var
	rgApp		:	TRegistry;
begin
        lstMotor.Lines.LoadFromFile('MOTOR.DAT');

        DesPorta := False;
        DesSensVel := False;
        //Configura bits 0 a 3, Board 0 como entrada  8221
        cbDConfigBit(0, AUXPORT, 0, DIGITALIN);
        cbDConfigBit(0, AUXPORT, 1, DIGITALIN);
        cbDConfigBit(0, AUXPORT, 2, DIGITALIN);
        cbDConfigBit(0, AUXPORT, 3, DIGITALIN);

        //Configura bits 4 a 7, Board 0 como saida    8221
        if cbDConfigBit(0, AUXPORT, 4, DIGITALOUT) <> 0 then
                ShowMessage('Erro configurando Bit 4 como saída!');
        if cbDConfigBit(0, AUXPORT, 5, DIGITALOUT) <> 0 then
                ShowMessage('Erro configurando Bit 5 como saída!');
        if cbDConfigBit(0, AUXPORT, 6, DIGITALOUT) <> 0 then
                ShowMessage('Erro configurando Bit 6 como saída!');
        if cbDConfigBit(0, AUXPORT, 7, DIGITALOUT) <> 0 then
                ShowMessage('Erro configurando Bit 7 como saída!');

        btnGarraOn.Visible := false;
        btnGarraOff.Visible := true;
        btnPortaOn.Visible := true;
        btnPortaOff.Visible := false;

	FileName := '';
	rgApp := TRegistry.Create;
	if rgApp.OpenKey('\Software\Access\Helmet', False) then
	begin
		try
			Self.Height := StrToInt(rgApp.ReadString('Height'));
			Self.Left := StrToInt(rgApp.ReadString('Left'));
			Self.Top := StrToInt(rgApp.ReadString('Top'));
			Self.Width := StrToInt(rgApp.ReadString('Width'));
			Self.WindowState := TWindowState(StrToInt(rgApp.ReadString('State')));
		except
		end;
	end;
	rgApp.Free;
	ResizeControls;
        Self.Caption := 'ACCESS HELMET LAB SYSTEM - '+DateToStr(Now);
    SavCount := TIniFile.Create('SAVCNT.INI');
    EScount := strtofloat(SavCount.ReadString('VALOR', 'Count', '00000'));
    //frmMachineControl.ComandoMotor(#13'ST1'#13) ;
    //CbDBitOut(0, FIRSTPORTA, 23, 1) ;  // Liga Fonte +24V
    {Delay(4000);
				CbDBitOut(0, AUXPORT, 2, 1) ;  // Liga Fonte do motor
               	//CbDBitOut(0, AUXPORT, 3, 1) ;  //coloca em modo normal
				frmMachineControl.Delay(2000);
				frmMachineControl.Comm.StartComm ;
				frmMachineControl.Delay(2000);
				frmMachineControl.ComandoMotor(#13'ST1'#13) ;
				frmMachineControl.Comm.StopComm ; }
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.mnuSairClick(Sender: TObject);
begin
	Close;
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.mnuNormasClick(Sender: TObject);
begin
	frmNormas.ShowModal;
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
        tmrStatus.Enabled := false;
        frmMachineControl.ComPort1.Close();
	// Implementar código para gravar configurações
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.bbNovoEnsaioClick(Sender: TObject);
begin
        tmrStatus.Enabled := false;
	frmNovoEnsaio.ShowModal;
	frmNovoEnsaio.iImpactos := 0 ;
	frmNovoEnsaio.nbPages.PageIndex := 0 ;
	frmNovoEnsaio.nbPages.ActivePage := 'Tipo' ;
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.mnuEmpresasClick(Sender: TObject);
begin
	frmEmpresas.ShowModal;
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.mnuCapacetesClick(Sender: TObject);
begin
	frmCapacetes.ShowModal;
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.FormDestroy(Sender: TObject);        // 8221
var
	rgApp		:	TRegistry;
begin
	//cbDBitOut(0, AUXPORT, 2, 1); // Desliga fonte do motor
	//cbDBitOut(0, FIRSTPORTA, 16, 0); // Desliga S.Veloc.
        CbDBitOut(0, AUXPORT, 6, 0) ;      // 8221
	//cbDBitOut(0, FIRSTPORTA, 17, 0); // Abre Garra
        CbDBitOut(0, AUXPORT, 5, 0) ; // RGJ   8221   Fecha garra
	//cbDBitOut(0, FIRSTPORTA, 18, 0); // Abre Porta
        CbDBitOut(0, AUXPORT, 4, 1) ;     // 8221
	//cbDBitOut(0, FIRSTPORTA, 19, 0); // Desliga Pulso Aferoção 8221
        CbDBitOut(0, AUXPORT, 7, 0) ;      // 8221
	//cbDBitOut(0, FIRSTPORTA, 20, 0); // Desliga Lampada Retencao
        //CbDBitOut(1, FIRSTPORTA, 21, 0) ;

	rgApp := TRegistry.Create;
	if rgApp.OpenKey('\Software\Access\Helmet', True) then
	begin
		rgApp.WriteString('Height', IntToStr(Self.Height));
		rgApp.WriteString('Left'  , IntToStr(Self.Left));
		rgApp.WriteString('Top'   , IntToStr(Self.Top));
		rgApp.WriteString('Width' , IntToStr(Self.Width));
		rgApp.WriteString('State' , IntToStr(Integer(Self.WindowState)));
	end;
	rgApp.Free;
    SavCount.WriteString('VALOR', 'Count', formatfloat('00000',EScount));
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.FormResize(Sender: TObject);
begin
	ResizeControls;
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.ResizeControls;
var
	iSecondColumnLefts,
	iSecondRowTop,
	iThirdRowTop,
	iButtonWidth,
	iButtonHeight,
	iClientWidth,
	iClientHeight	:	integer;
begin
	iClientWidth := Self.ClientWidth;
	iClientHeight := Self.ClientHeight;

	iButtonHeight := (iClientHeight - 40) div 3;
	iButtonWidth := (iClientWidth - 30) div 2;
	iSecondColumnLefts := 20 + iButtonWidth;
	iSecondRowTop := 20 + iButtonHeight;
	iThirdRowTop := iSecondRowTop + 10 + iButtonHeight;

        (*with leftPanel do
        begin
                Height := iClientHeight - 170;
        end;*)

	(*with bbNovoEnsaio do
	begin
		Top := 10;
		Left := 10;
		Height := iButtonHeight;
		Width := iButtonWidth;
	end;*)

	(*with bbAbrirEnsaio do
	begin
		Top := iSecondRowTop;
		Left := 10;
		Height := iButtonHeight;
		Width := iButtonWidth;
	end;*)

	(*with bbSalvarEnsaio do
	begin
		Top := iThirdRowTop;
		Left := 10;
		Height := iButtonHeight;
		Width := iButtonWidth;
	end;*)

	(*with bbExibirGrafico do
	begin
		Top := 10;
		Left := iSecondColumnLefts;
		Height := iButtonHeight;
		Width := iButtonWidth;
	end;*)

	(*with bbResultadosEnsaio do
	begin
		Top := iThirdRowTop;
		Left := 10;
		Height := iButtonHeight;
		Width := iButtonWidth;
	end;*)

	(*with bbContinuarEnsaio do
	begin
		Top := iThirdRowTop;
		Left := iSecondColumnLefts;
		Height := iButtonHeight;
		Width := iButtonWidth;
	end;*)

        //RGN 2017-06-22
        (*with PanelInfo do
	begin
		Top := 10;
		Left := iSecondColumnLefts;
		Height := (3 * iButtonHeight) + 20;
		Width := iButtonWidth;
	end;*)

	Self.Font.Size := (bbNovoEnsaio.Width + bbNovoEnsaio.Height) div 20;
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.WMGetMinMaxInfo(var MSG: Tmessage);
begin
	inherited;
	with PMinMaxInfo(MSG.lparam)^ do
	begin
		with ptMinTrackSize do
		begin
			X := 215;
      Y := 320;
    end;
		with ptMaxTrackSize do
		begin
      X := 1600;
      Y := 1240;
		end;
	end;
end;


{===============================================================================

===============================================================================}
// Retorna string iLen espaços
function Spaces(iLen: integer): string;
var
	i	:	integer;
begin
	for i:=1 to iLen do
		Result := Result + #32;
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.SaveImpacto(FileName: TFileName);
var
	fsImp		:	TFileStream;
	i				:	integer;
	dfX			:	single;
	dfY			:	single;
	xPos		: integer ;
	sTxt		: string ;
	// Escreve string sValue na stream fsImp +
	// (iSize - Length(sValue)) spaces
	procedure WriteString(sValue: string; iSize: integer);
	var
		sTemp		:	string ;
		szTemp	:	array [0..255] of char;
	begin
		sTemp := sValue + Spaces(iSize - Length(sValue));
		StrPCopy(szTemp, sTemp);
		fsImp.Write(szTemp, iSize);
	end;

begin
	if (FileName='') then Exit;
	fsImp := TFileStream.Create(FileName, fmCreate);
	WriteString(IMPACTO_ID, 5);

	WriteString(FloatToStr(frmNovoEnsaio.dMax),5) ;
	WriteString(IntToStr(frmNovoEnsaio.PosicaoX),5) ;

	WriteString(frmNovoEnsaio.cbEmpresa.Text, 64);
	WriteString(frmNovoEnsaio.cbModeloCapacete.Text, 16);
	WriteString(frmNovoEnsaio.edNumeroAmostra.Text, 16);
	WriteString(frmNovoEnsaio.edNumeroLote.Text, 16);
	WriteString(frmNovoEnsaio.edPosicaoEnsaio.Text, 16);
	WriteString(frmNovoEnsaio.edCondicionamento.Text, 64);
        WriteString(frmNovoEnsaio.edTamanho.Text, 2);
	WriteString(frmNovoEnsaio.cbNormaUtilizar.Text, 16);
	WriteString(frmResultados.lbEnsaios.Caption, 12);
       	WriteString(frmResultados.lbObs.Caption, 200);

	xPos := Pos(' ',frmResultados.lbMaximo.Caption) ;
	sTxt := frmResultados.lbMaximo.Caption ;
	Delete(sTxt,XPos,5);
	WriteString(sTxt, 7);

	xPos := Pos(' ',frmResultados.lbNMaximo.Caption) ;
	sTxt := frmResultados.lbNMaximo.Caption ;
	Delete(sTxt,XPos,5);
	WriteString(sTxt, 5);

	xPos := Pos(' ',frmResultados.lbAltImp.Caption) ;
	sTxt := frmResultados.lbAltImp.Caption ;
	Delete(sTxt,XPos, 5) ;
	WriteString(sTxt, 5);

	xPos := Pos(' ',frmResultados.lbResReal.Caption) ;
	sTxt := frmResultados.lbResReal.Caption ;
	Delete(sTxt, XPos, 5) ;
	WriteString(sTxt, 5);

	xPos := Pos(' ',frmResultados.lbVelImp.Caption) ;
	sTxt := frmResultados.lbVelImp.Caption ;
	Delete(sTxt, XPos, 5) ;
	WriteString(sTxt, 5);

	xPos := Pos(' ',frmResultados.lbTemp.Caption) ;
	sTxt := frmResultados.lbTemp.Caption ;
	Delete(sTxt, XPos, 5) ;
	WriteString(sTxt, 5);

	WriteString(frmResultados.edDesacPrimLimite.Text, 3);
	WriteString(frmResultados.edDesacSegLimite.Text, 3);
	WriteString(frmResultados.edTempoPrimLimite.Text, 3);
	WriteString(frmResultados.edTempoSegLimite.Text, 3);

	xPos := Pos(' ',frmResultados.lbTempo1.Caption) ;
	sTxt := frmResultados.lbTempo1.Caption ;
	Delete(sTxt, XPos, 5) ;
	WriteString(sTxt, 5);

        if not (frmResultados.lbTempo2.Caption='Não aplicável') then
        begin
		xPos := Pos(' ',frmResultados.lbTempo2.Caption) ;
		sTxt := frmResultados.lbTempo2.Caption ;
		Delete(sTxt, XPos, 5) ;
		WriteString(sTxt, 5)
        end
        else
                WriteString('     ', 5);

	WriteString(frmNovoEnsaio.sResVel, 4) ;
	//Conforme ou não conforme
	//if frmResultados.lbResult.Caption = 'CONFORME' then
        if frmResultados.lbSituacao.Caption = 'CONFORME' then
	        WriteString('cc', 2)
        else
                WriteString('nc', 2) ;

	fsImp.Write(lPontosImpacto, SizeOf(lPontosImpacto));
	for i:=0 to lPontosImpacto-1 do
	begin
		dfX := frmGrafico.lsResult.XValue[i];
		dfY := frmGrafico.lsResult.YValue[i];
		fsImp.Write(dfX, SizeOf(dfX));
		fsImp.Write(dfY, SizeOf(dfY));
	end;
	fsImp.Free;
end;

{===============================================================================
SAVE TRANSMISSAO
===============================================================================}
procedure TfrmHelmet.SaveTransmissao(FileName: TFileName);
var
	fTrans	        :	TextFile;
	i		:	integer;
	dfX		:	single;
	dfY		:	single;
	sTxt		: string ;
        sLeituras       : string;
        lLeituras       : longint;

begin
        sLeituras := '10000';
        lLeituras := 10000;
	if (FileName='') then Exit;

	AssignFile(fTrans, FileName);
        {$I-}
	        ReWrite(fTrans);
        {$I+}
        if IOResult <> 0 then
        begin
                {$I-}
                        CloseFile(fTrans);
                        ReWrite(fTrans);
                {$I+}
                if IOResult <> 0 then
                begin
                        ShowMessage('Erro abrindo arquivo ' + FileName);
                        Exit;
                end;
        end;

        WriteLn(fTrans, TRANSMISSAO_ID);
        WriteLn(fTrans, FormatFloat('###000.00', frmNovoEnsaio.dMax));
        WriteLn(fTrans, frmNovoEnsaio.cbEmpresa.Text);
        WriteLn(fTrans, frmNovoEnsaio.cbModeloCapacete.Text);
        WriteLn(fTrans, frmNovoEnsaio.edNumeroAmostra.Text);
        WriteLn(fTrans, frmNovoEnsaio.edNumeroLote.Text);
        WriteLn(fTrans, frmNovoEnsaio.edPosicaoEnsaio.Text);
        WriteLn(fTrans, frmNovoEnsaio.edCondicionamento.Text);
        WriteLn(fTrans, frmNovoEnsaio.edTamanho.Text);
        WriteLn(fTrans, frmNovoEnsaio.cbNormaUtilizar.Text);
        WriteLn(fTrans, frmResultadosTrans.lbEnsaios.Caption);
        WriteLn(fTrans, frmResultadosTrans.lbObs.Caption);
        WriteLn(fTrans, frmResultadosTrans.lbMaximo.Caption);
        WriteLn(fTrans, frmResultadosTrans.lbNMaximo.Caption);
        WriteLn(fTrans, frmResultadosTrans.lbAltImp.Caption);
        WriteLn(fTrans, frmResultadosTrans.lbResReal.Caption);
        WriteLn(fTrans, frmResultadosTrans.lbVelImp.Caption);
        WriteLn(fTrans, frmNovoEnsaio.sResVel);
        WriteLn(fTrans, frmResultadosTrans.lbSituacao.Caption);
        WriteLn(fTrans, sLeituras);
	for i:=0 to lLeituras-1 do
	begin
		dfX := frmGraficoTrans.lsX.XValue[i];
		dfY := frmGraficoTrans.lsX.YValue[i];
		WriteLn(fTrans, FloatToStr(dfX));
		WriteLn(fTrans, FloatToStr(dfY));
	end;

        CloseFile(fTrans);
end;

{===============================================================================
SAVE PENETRACAO
===============================================================================}
procedure TfrmHelmet.SavePenetracao(FileName: TFileName);
var
	fPenet	        :	TextFile;
	i		:	integer;
	dfX		:	single;
	dfY		:	single;
	sTxt		: string ;
        sLeituras       : string;
        lLeituras       : longint;

begin
        sLeituras := '10000';
        lLeituras := 10000;
	if (FileName='') then Exit;

	AssignFile(fPenet, FileName);
        {$I-}
	        ReWrite(fPenet);
        {$I+}
        if IOResult <> 0 then
        begin
                {$I-}
                        CloseFile(fPenet);
                        ReWrite(fPenet);
                {$I+}
                if IOResult <> 0 then
                begin
                        ShowMessage('Erro abrindo arquivo ' + FileName);
                        Exit;
                end;
        end;

        WriteLn(fPenet, PENETRACAO_ID);
        WriteLn(fPenet, FormatFloat('###000.00', frmNovoEnsaio.dMax));
        WriteLn(fPenet, frmNovoEnsaio.cbEmpresa.Text);
        WriteLn(fPenet, frmNovoEnsaio.cbModeloCapacete.Text);
        WriteLn(fPenet, frmNovoEnsaio.edNumeroAmostra.Text);
        WriteLn(fPenet, frmNovoEnsaio.edNumeroLote.Text);
        WriteLn(fPenet, frmNovoEnsaio.edPosicaoEnsaio.Text);
        WriteLn(fPenet, frmNovoEnsaio.edCondicionamento.Text);
        WriteLn(fPenet, frmNovoEnsaio.edTamanho.Text);
        WriteLn(fPenet, frmNovoEnsaio.cbNormaUtilizar.Text);
        WriteLn(fPenet, frmResultadosPenet.lbEnsaios.Caption);
        WriteLn(fPenet, frmResultadosPenet.lbObs.Caption);
        WriteLn(fPenet, frmResultadosPenet.lbPenet.Caption);
        WriteLn(fPenet, frmResultadosPenet.lbAltImp.Caption);
        WriteLn(fPenet, frmResultadosPenet.lbResReal.Caption);
        WriteLn(fPenet, frmResultadosPenet.lbVelImp.Caption);
        WriteLn(fPenet, frmNovoEnsaio.sResVel);
        WriteLn(fPenet, frmResultadosPenet.lbSituacao.Caption);

        CloseFile(fPenet);
end;

{===============================================================================
SAVE CALIBRACAO
===============================================================================}
procedure TfrmHelmet.SaveCalibracao(FileName: TFileName);
var
	fCal	        :	TextFile;
	i		:	integer;
	dfX		:	single;
	dfY		:	single;
	sTxt		: string ;
        sLeituras       : string;
        lLeituras       : longint;

begin
        sLeituras := '20000';
        lLeituras := 20000;
	if (FileName='') then Exit;

	AssignFile(fCal, FileName);
        {$I-}
	        ReWrite(fCal);
        {$I+}
        if IOResult <> 0 then
        begin
                {$I-}
                        CloseFile(fCal);
                        ReWrite(fCal);
                {$I+}
                if IOResult <> 0 then
                begin
                        ShowMessage('Erro abrindo arquivo ' + FileName);
                        Exit;
                end;
        end;

        WriteLn(fCal, CALIBRACAO_ID);
        WriteLn(fCal, FormatFloat('###000.00', frmNovoEnsaio.dMax));
        WriteLn(fCal, frmNovoEnsaio.cbEmpresa.Text);
        WriteLn(fCal, frmNovoEnsaio.cbModeloCapacete.Text);
        WriteLn(fCal, frmNovoEnsaio.edNumeroAmostra.Text);
        WriteLn(fCal, frmNovoEnsaio.edNumeroLote.Text);
        WriteLn(fCal, frmNovoEnsaio.edPosicaoEnsaio.Text);
        WriteLn(fCal, frmNovoEnsaio.edCondicionamento.Text);
        WriteLn(fCal, frmNovoEnsaio.edTamanho.Text);
        WriteLn(fCal, frmNovoEnsaio.cbNormaUtilizar.Text);
        WriteLn(fCal, frmResultadosCal.lbEnsaios.Caption);
        WriteLn(fCal, frmResultadosCal.lbObs.Caption);
        WriteLn(fCal, frmResultadosCal.lbMaxZG.Caption);
        WriteLn(fCal, frmResultadosCal.lbMaxZ.Caption);
        WriteLn(fCal, frmResultadosCal.lbMaxN.Caption);
        WriteLn(fCal, frmResultadosCal.lbDifZN.Caption);
        WriteLn(fCal, frmResultadosCal.lbDifMax.Caption); //Diferença Máxima Norma
        WriteLn(fCal, frmResultadosCal.lbAltImp.Caption);
        WriteLn(fCal, frmResultadosCal.lbResReal.Caption);
        WriteLn(fCal, frmResultadosCal.lbVelImp.Caption);
        WriteLn(fCal, frmNovoEnsaio.sResVel);
        WriteLn(fCal, frmResultadosCal.lbSituacao.Caption);
        (*WriteLn(fCal, sLeituras);
	for i:=0 to lLeituras-1 do
	begin
		dfX_Z := frmGraficoCal.lsZ.XValue[i];
		dfY_Z := frmGraficoCal.lsZ.YValue[i];
		WriteLn(fCal, FloatToStr(dfX_Z));
		WriteLn(fCal, FloatToStr(dfY_Z));

                dfX_N := frmGraficoCal.lsN.XValue[i];
		dfY_N := frmGraficoCal.lsN.YValue[i];
		WriteLn(fCal, FloatToStr(dfX_N));
		WriteLn(fCal, FloatToStr(dfY_N));

	end;*)

        CloseFile(fCal);
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.SaveRetencao(FileName: TFileName);
var
	fsImp		:	TFileStream;
	i				:	integer;
	dfX			:	single;
	dfY			:	single;
	xPos		: integer ;
	sTxt		: string ;
	// Escreve string sValue na stream fsImp +
	// (iSize - Length(sValue)) spaces
	procedure WriteString(sValue: string; iSize: integer);
	var
		sTemp		:	string ;
		szTemp	:	array [0..255] of char;
	begin
		sTemp := sValue + Spaces(iSize - Length(sValue));
		StrPCopy(szTemp, sTemp);
		fsImp.Write(szTemp, iSize);
	end;

begin
	if (FileName='') then Exit;
	fsImp := TFileStream.Create(FileName, fmCreate);
	WriteString(VISEIRA_ID, 5);

	WriteString(frmCintaRes.lbEmpresa.Caption, 64);
	WriteString(frmCintaRes.lbModelo.Caption, 16);
        WriteString(frmCintaRes.lbTam.Caption, 2);
	WriteString(frmCintaRes.lbLote.Caption, 16);
	WriteString(frmCintaRes.lbAmostra.Caption, 16);
	WriteString(frmCintaRes.lbCondicionamento.Caption, 64);
       	WriteString(frmCintaRes.lbObs.Caption, 200);

        WriteString(frmCintaRes.lbDElast.Caption, 2);
        WriteString(frmCintaRes.lbDPlast.Caption, 2);

        WriteString(frmCintaRes.edElast.Text, 2);
        WriteString(frmCintaRes.edPlast.Text, 2);

        WriteString(frmCintaRes.stRes.Caption, 12);
	fsImp.Free;
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.LoadImpacto(FileName: TFileName);
var
	fsImp		:	TFileStream;
	i				:	integer;
	dfX			:	single;
	dfY			:	single;
	sBuff		:	string;
	xPos		: integer ;
        dVelReal        : double;
        dVelNorma        : double;

    //Valores temporários lidos do arquivo
    AMax : string ;
    TLim1 : string ;
    TLim2 : string ;


	procedure ReadString(var sValue: string; iSize: integer);
	var
		sTemp		:	string;
	begin
		sTemp := Spaces(iSize);
		fsImp.Read(sTemp[1], iSize);
		sValue := sTemp;
	end;

begin
	if (FileName='') then Exit;
	fsImp := TFileStream.Create(FileName, fmOpenRead);
	ReadString(sBuff, 5);
	if (sBuff<>IMPACTO_ID) then
	begin
		//ShowMessage('Formato de arquivo inválido');
		fsImp.Free;
		Exit;
	end;

        EnsaioAtual := eaImpacto;

	ReadString(sBuff,5) ;
	xPos := Pos(' ', sBuff) ;
	if xPos <> 0 then Delete(sBuff, xPos, 5) ;
	frmNovoEnsaio.dMax := StrToFloat(sBuff) ;
	ReadString(sBuff,5) ;
	xPos := Pos(' ', sBuff) ;
	if xPos <> 0 then Delete(sBuff, xPos, 5) ;
 	frmNovoEnsaio.PosicaoX := StrToInt(sBuff) ;

	ReadString(sBuff, 64);
	frmNovoEnsaio.cbEmpresa.Text := sBuff;
	frmResultados.lbEmpresa.Caption := sBuff;
        lbEmpresa.Caption := sBuff;
	frmImpactoPrint.stEmpresa.Caption := sBuff ;
	ReadString(sBuff, 16);
	frmNovoEnsaio.cbModeloCapacete.Text := sBuff;
	frmResultados.lbModelo.Caption := sBuff ;
        lbModelo.Caption := sBuff ;
	frmImpactoPrint.stCapacete.Caption := sBuff ;
	ReadString(sBuff, 16);
	frmNovoEnsaio.edNumeroAmostra.Text := sBuff;
	frmResultados.lbAmostra.Caption := sBuff ;
        lbAmostra.Caption := sBuff ;
	frmImpactoPrint.stAmostra.Caption := sBuff ;
	ReadString(sBuff, 16);
	frmNovoEnsaio.edNumeroLote.Text := sBuff;
	frmResultados.lbLote.Caption := sBuff ;
        lbLote.Caption := sBuff ;
	frmImpactoPrint.stLote.Caption := sBuff ;
	ReadString(sBuff, 16);
	frmNovoEnsaio.edPosicaoEnsaio.Text := sBuff;
	frmResultados.lbEnsaio.Caption := sBuff ;
        lbEnsaio.Caption := sBuff ;
	frmImpactoPrint.stEnsaio.Caption := sBuff ;
	ReadString(sBuff, 64);
	frmNovoEnsaio.edCondicionamento.Text := sBuff;
	frmResultados.lbCondicionamento.Caption := sBuff;
	lbCondicionamento.Caption := sBuff;
	frmImpactoPrint.stCondicionamento.Caption := sBuff;
        ReadString(sBuff, 2);
        frmNovoEnsaio.edTamanho.Text := sBuff;
        frmResultados.lbTamanho.Caption := sBuff;
        lbTamanho.Caption := sBuff;
        frmImpactoPrint.stTamanho.Caption := sBuff;
	ReadString(sBuff, 16);
	frmResultados.lbNorma.Caption := sBuff;
        //lbNorma.Caption := sBuff;
	frmImpactoPrint.stNormaUtilizada.Caption := sBuff;
	ReadString(sBuff, 12);
	frmResultados.lbEnsaios.Caption := sBuff ;
        //lbEnsaios.Caption := sBuff ;
        ReadString(sBuff, 200);
        frmGeral.mmObs.Lines.Add(sBuff);
        frmResultados.lbObs.Caption := sBuff;
        lbObs.Caption := sBuff;
	//frmImpactoPrint.stPage.Caption := sBuff;

	ReadString(sBuff, 7);
	frmResultados.lbMaximo.Caption := sBuff + 'g';
        lbMaximo.Caption := sBuff + 'g';
	frmImpactoPrint.stAceleracaoMaxima.Caption := sBuff + ' g' ;
	AMax := sBuff ;
	ReadString(sBuff, 5);
	frmResultados.lbNMaximo.Caption := sBuff + 'g';
        //lbNMaximo.Caption := sBuff + 'g';
	frmImpactoPrint.stAceleracaoMaximaNorma.Caption := sBuff + ' g' ;
        if strtofloat(AMax) > strtofloat(sBuff) then
        begin
    	        frmResultados.lbMaximo.Font.Color := clRed ;
                lbMaximo.Font.Color := clRed ;
    	        frmImpactoPrint.stAceleracaoMaxima.Font.Color := clRed ;
        end
        else
        begin
    	        frmResultados.lbMaximo.Font.Color := RGB(0,255,0) ;
                lbMaximo.Font.Color := RGB(0,255,0) ;
    	        frmImpactoPrint.stAceleracaoMaxima.Font.Color := clBlue ;
        end;
	ReadString(sBuff, 5);
	frmResultados.lbAltImp.Caption := sBuff + ' m';
        //lbAltImp.Caption := sBuff + ' m';
	//frmImpactoPrint.stAlturaImpactoNorma.Caption := sBuff + ' m';
	ReadString(sBuff, 5);
        //dVelReal := StrToFloat(sBuff);

	frmResultados.lbResReal.Caption := sBuff + 'm/s';
        //lbResReal.Caption := sBuff + 'm/s';
	//frmImpactoPrint.stAlturaRealNorma.Caption := sBuff + ' m/s';

	ReadString(sBuff, 5);
        dVelNorma := StrToFloat(sBuff);
	frmResultados.lbVelImp.Caption := sBuff + 'm/s';
        //lbVelReal.Caption := sBuff + 'm/s';
	frmImpactoPrint.stVelocidadeImpactoNorma.Caption := sBuff + ' m/s';

	ReadString(sBuff, 5);
        dVelReal := StrToFloat(sBuff);
	frmResultados.lbTemp.Caption := sBuff + 'm/s';
        lbTemp.Caption := sBuff + 'm/s';
	frmImpactoPrint.stVelReal.Caption := sBuff + ' m/s';

	ReadString(sBuff, 3);
	frmResultados.edDesacPrimLimite.Text := sBuff ;
        //edDesacPrimLimite.Text := sBuff ;
	//frmImpactoPrint.stTempoIS1Norma.Caption := sBuff ;
	ReadString(sBuff, 3);
	frmResultados.edDesacSegLimite.Text := sBuff ;
        //edDesacSegLimite.Text := sBuff ;
	//frmImpactoPrint.stTempoIS2Norma.Caption := sBuff ;
	ReadString(sBuff, 3) ;
        TLim1 := sBuff ;
        TLim1 := '0';
        If (TLim1 = '0ms ') then
        begin
                TLim1 := '0';
        end;
	frmResultados.edTempoPrimLimite.Text := sBuff ;
        //edTempoPrimLimite.Text := sBuff ;
	//frmImpactoPrint.stTempoIS1Norma.Caption :=
	//frmImpactoPrint.stTempoIS1Norma.Caption + ' - ' + sBuff ;
	ReadString(sBuff, 3) ;
        TLim2 := sBuff ;
        TLim2 := '0';
	frmResultados.edTempoSegLimite.Text := sBuff ;
        //edTempoSegLimite.Text := sBuff ;
	//frmImpactoPrint.stTempoIS2Norma.Caption :=
	//frmImpactoPrint.stTempoIS2Norma.Caption + ' - ' + sBuff ;

	ReadString(sBuff, 5) ;
	frmResultados.lbTempo1.Caption := sBuff + ' ms';
        lbTempo1.Caption := sBuff + ' ms';
	//frmImpactoPrint.stTempoS1.Caption := sBuff + ' ms';

        (*if (sBuff = '0ms  ') then
        begin
                sBuff := '0';
        end;
        try
                try
                        strtofloat(sbuff);
                Except
                        sbuff := '0';
                end;
         Finally
                sbuff := '0';
         end;*)

        sBuff := '0';

        if strtofloat(sBuff) > strtofloat(TLim1) then
        begin
                frmResultados.lbTempo1.Font.Color := clRed ;
                lbTempo1.Font.Color := clRed ;
                //frmImpactoPrint.stTempoS1.Font.Color := clRed ;
        end
        else
        begin
                frmResultados.lbTempo1.Font.Color := RGB(0,255,0) ;
                lbTempo1.Font.Color := RGB(0,255,0) ;
                //frmImpactoPrint.stTempoS1.Font.Color := clBlue ;
        end;
	ReadString(sBuff, 5) ;
        {if sBuff <> '     ' then
        begin
                if strtofloat(sBuff) > strtofloat(TLim2) then
                begin
	                frmResultados.lbTempo2.Font.Color := clRed ;
                        lbTempo2.Font.Color := clRed ;
	                frmImpactoPrint.stTempoS2.Font.Color := clRed ;
                end
                else
                begin
	                frmResultados.lbTempo2.Font.Color := RGB(0,255,0) ;
                        lbTempo2.Font.Color := RGB(0,255,0) ;
	                frmImpactoPrint.stTempoS2.Font.Color := clBlue ;
                end;

	        frmResultados.lbTempo2.Caption := sBuff + ' ms';
                lbTempo2.Caption := sBuff + ' ms';
	        frmImpactoPrint.stTempoS2.Caption := sBuff + ' ms';
        end
        else
        begin
	        frmResultados.lbTempo2.Font.Color := RGB(0,255,0) ;
                lbTempo2.Font.Color := RGB(0,255,0) ;
	        frmImpactoPrint.stTempoS2.Font.Color := clBlack ;

    	        frmResultados.lbTempo2.Caption := 'Não aplicável' ;
                lbTempo2.Caption := 'Não aplicável' ;
                frmImpactoPrint.stTempoS2.Caption := 'Não aplicável' ;
        end;}
	ReadString(sBuff, 4) ;
	//frmResultados.lbTemp.Caption := sBuff + ' m/s' ;
        //lbTemp.Caption := sBuff + ' m/s' ;
        //frmImpactoPrint.stVelReal.Caption := sBuff + ' m/s' ;

	ReadString(sBuff, 2) ;
	if sBuff = 'nc' then
	begin
		//frmResultados.lbResult.Font.Color := RGB(255, 0, 0) ;
		//frmResultados.lbResult.Caption := 'NÃO CONFORME' ;
                frmResultados.lbSituacao.Font.Color := RGB(255, 0, 0) ;
                lbSituacao.Font.Color := RGB(255, 0, 0) ;
		frmResultados.lbSituacao.Caption := 'NÃO CONFORME' ;
                lbSituacao.Caption := 'NÃO CONFORME' ;
		//frmImpactoPrint.stResultado.Font.Color := RGB(255, 0, 0) ;
		//frmImpactoPrint.stResultado.Caption := 'NÃO CONFORME' ;
	end
	else
	begin
		//frmResultados.lbResult.Font.Color := RGB(0, 0, 255) ;
		//frmResultados.lbResult.Caption := 'CONFORME' ;
                frmResultados.lbSituacao.Font.Color := RGB(0, 255, 0) ;
                lbSituacao.Font.Color := RGB(0, 255, 0) ;
		frmResultados.lbSituacao.Caption := 'CONFORME' ;
                lbSituacao.Caption := 'CONFORME' ;
		//frmImpactoPrint.stResultado.Font.Color := RGB(0, 0, 255) ;
		//frmImpactoPrint.stResultado.Caption := 'CONFORME' ;
	end;

        if ((dVelReal >= (dVelNorma+0.2)) or (dVelReal <= (dVelNorma-0.2))) then
        begin
                frmResultados.lbSituacao.Font.Color := RGB(255, 0, 0) ;
                lbSituacao.Font.Color := RGB(255, 0, 0) ;
		frmResultados.lbSituacao.Caption := 'Teste Inválido' ;
                lbSituacao.Caption := 'Teste Inválido' ;
        end;

	fsImp.Read(lPontosImpacto, SizeOf(lPontosImpacto));
        lPontosImpacto := 10000;
	frmProgress.pbOpen.Position := 0 ;
	frmProgress.Show ;
	frmProgress.Animate.Active := true ;
	frmGrafico.lsResult.Clear ;
        lsResult.Clear ;
	for i:=0 to lPontosImpacto-1 do
	begin
		fsImp.Read(dfX, SizeOf(dfX));
		fsImp.Read(dfY, SizeOf(dfY));
        //if dfy > strtoint(edit1.text) then
        //dfy:=StrToFloat(InputBox('Graphic Value','Valor: '+FloatToStr(dfy)+' Pos: '+InttoStr(i), FloatToStr(dfy)));
//                frmGrafico.lsResult.XValues.Value[i] := dfX;
//                frmGrafico.lsResult.YValues.Value[i] := dfY;
                frmGrafico.lsResult.AddXY(dfX, dfY);
                lsResult.AddXY(dfX, dfY);
//		frmGrafico.lsResult.XValue[i] := dfX;
//		frmGrafico.lsResult.YValue[i] := dfY;
		frmProgress.pbOpen.Position := frmProgress.pbOpen.Position + 1 ;
	end;
	frmProgress.Animate.Active := true ;
	frmProgress.Close ;
	fsImp.Free;
        frmGrafico.tcGrafico.Series[1].active := false ;
	frmGrafico.tcGrafico.Series[2].active := false ;
	frmGrafico.tcGrafico.Series[3].active := false ;
        frmGrafico.tcGrafico.UndoZoom();
        //Application.ProcessMessages;
        //frmNovoEnsaio.Zoom( frmNovoEnsaio.dMax, 65) ;
        //Application.ProcessMessages;
        frmGrafico.tcGrafico.SaveToMetafile(ExtractFilePath(Application.ExeName) + '\GRAFTMP.WMF');
        //frmGrafico.tcGrafico.UndoZoom();
        frmResultados.ShowModal;
end;

{===============================================================================
LOAD TRANSMISSÃO
===============================================================================}
procedure TfrmHelmet.LoadTransmissao(FileName: TFileName);
var
	fTrans	        :	TextFile;
        sBuff           :       String;
	i	        :	integer;
	dfX             :	single;
	dfY		:	single;
        dVelReal        : double;
        dVelNorma       : double;

        //Valores temporários lidos do arquivo
        AMax : string ;
        TLim1 : string ;
        TLim2 : string ;
begin
	if (FileName='') then Exit;

	AssignFile(fTrans, FileName);
        {$I-}
	        Reset(fTrans);
        {$I+}
        if IOResult <> 0 then
        begin
                ShowMessage('Erro abrindo arquivo ' + FileName);
                Exit;
        end;

      	ReadLn(fTrans, sBuff); //TRANSMISSAO_ID
	if (sBuff<>TRANSMISSAO_ID) then
	begin
		ShowMessage('Formato de arquivo inválido');
                CloseFile(fTrans);
                Exit;
	end;
        EnsaioAtual := eaTransmissao;

      	ReadLn(fTrans, sBuff); //dMax
	frmNovoEnsaio.dMax := StrToFloat(sBuff) ;

        ReadLn(fTrans, sBuff); //Empresa
        frmNovoEnsaio.cbEmpresa.Text := sBuff;
	frmResultadosTrans.lbEmpresa.Caption := sBuff;
	frmTransmissaoPrint.stEmpresa.Caption := sBuff ;

        ReadLn(fTrans, sBuff); //Modelo
	frmNovoEnsaio.cbModeloCapacete.Text := sBuff;
	frmResultadosTrans.lbModelo.Caption := sBuff ;
	frmTransmissaoPrint.stCapacete.Caption := sBuff ;

        ReadLn(fTrans, sBuff); //Numero Amostra
	frmNovoEnsaio.edNumeroAmostra.Text := sBuff;
	frmResultadosTrans.lbAmostra.Caption := sBuff ;
	frmTransmissaoPrint.stAmostra.Caption := sBuff ;

        ReadLn(fTrans, sBuff); //Numero Lote
	frmNovoEnsaio.edNumeroLote.Text := sBuff;
	frmResultadosTrans.lbLote.Caption := sBuff ;
	frmTransmissaoPrint.stLote.Caption := sBuff ;

        ReadLn(fTrans, sBuff); //Posicao
	frmNovoEnsaio.edPosicaoEnsaio.Text := sBuff;
	frmResultadosTrans.lbEnsaio.Caption := sBuff ;
	frmTransmissaoPrint.stEnsaio.Caption := sBuff ;

        ReadLn(fTrans, sBuff); //Condicionamento
	frmNovoEnsaio.edCondicionamento.Text := sBuff;
	frmResultadosTrans.lbCondicionamento.Caption := sBuff;
        frmTransmissaoPrint.stCondicionamento.Caption := sBuff;

        ReadLn(fTrans, sBuff); //Tamanho
        frmNovoEnsaio.edTamanho.Text := sBuff;
        frmResultadosTrans.lbTamanho.Caption := sBuff;
        frmTransmissaoPrint.stTamanho.Caption := sBuff;

        ReadLn(fTrans, sBuff); //Norma
	frmResultadosTrans.lbNorma.Caption := sBuff;
	frmTransmissaoPrint.stNormaUtilizada.Caption := sBuff;

        ReadLn(fTrans, sBuff); //lbEnsaios
	frmResultadosTrans.lbEnsaios.Caption := sBuff ;

        ReadLn(fTrans, sBuff); //lbObs
        frmGeral.mmObs.Lines.Add(sBuff);
        frmResultadosTrans.lbObs.Caption := sBuff;

        ReadLn(fTrans, sBuff); //lbMaximo
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosTrans.lbMaximo.Caption := sBuff + ' N';
	frmTransmissaoPrint.stAceleracaoMaxima.Caption := sBuff + ' N' ;
	AMax := sBuff ;

        ReadLn(fTrans, sBuff); //lbNMaximo
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosTrans.lbNMaximo.Caption := sBuff + ' N';
	frmTransmissaoPrint.stAceleracaoMaximaNorma.Caption := sBuff + ' N' ;
        if strtofloat(AMax) > strtofloat(sBuff) then
        begin
    	        frmResultadosTrans.lbMaximo.Font.Color := clRed ;
    	        frmTransmissaoPrint.stAceleracaoMaxima.Font.Color := clRed ;
        end
        else
        begin
    	        frmResultadosTrans.lbMaximo.Font.Color := RGB(0,255,0) ;
    	        frmTransmissaoPrint.stAceleracaoMaxima.Font.Color := clBlue ;
        end;

        ReadLn(fTrans, sBuff); //lbAltImp
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosTrans.lbAltImp.Caption := sBuff + ' m';

        ReadLn(fTrans, sBuff); //lbResReal
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosTrans.lbResReal.Caption := sBuff + ' m';

        ReadLn(fTrans, sBuff); //lbVelImp
        Delete(sBuff, StrLen(PChar(sBuff))-3, 4);
        dVelNorma := StrToFloat(sBuff);
	frmResultadosTrans.lbVelImp.Caption := sBuff + ' m/s';
	frmTransmissaoPrint.stVelocidadeImpactoNorma.Caption := sBuff + ' m/s';

        ReadLn(fTrans, sBuff); //sResVel
        dVelReal := StrToFloat(sBuff);
	frmResultadosTrans.lbTemp.Caption := sBuff + ' m/s' ;
        frmTransmissaoPrint.stVelReal.Caption := sBuff + ' m/s' ;

        ReadLn(fTrans, sBuff); //lbSituacao
       	if sBuff = 'NÃO CONFORME' then
	begin
                frmResultadosTrans.lbSituacao.Font.Color := RGB(255, 0, 0) ;
		frmResultadosTrans.lbSituacao.Caption := 'NÃO CONFORME' ;
	end
	else if sBuff = 'CONFORME' then
	begin
                frmResultadosTrans.lbSituacao.Font.Color := RGB(0, 255, 0) ;
		frmResultadosTrans.lbSituacao.Caption := 'CONFORME' ;
	end
        else
	begin
                frmResultadosTrans.lbSituacao.Font.Color := RGB(255, 0, 0) ;
		frmResultadosTrans.lbSituacao.Caption := 'TESTE INVÁLIDO' ;
	end;


        ReadLn(fTrans, sBuff); //sLeituras
	lPontosImpacto := StrToInt(sBuff);

        //Pontos do Gráfico
       	frmProgress.pbOpen.Position := 0 ;
	frmProgress.Show ;
	frmProgress.Animate.Active := true ;
	frmGraficoTrans.lsX.Clear ;
	for i:=0 to lPontosImpacto-1 do
	begin
                ReadLn(fTrans, sBuff);
		dfX := StrToFloat(sBuff);
                ReadLn(fTrans, sBuff);
                dfY := StrToFloat(sBuff);
                frmGraficoTrans.lsX.AddXY(dfX, dfY);
		frmProgress.pbOpen.Position := frmProgress.pbOpen.Position + 1 ;
	end;
	frmProgress.Animate.Active := true ;
	frmProgress.Close ;

        CloseFile(fTrans);

        frmResultadosTrans.Show;
end;

{===============================================================================
LOAD PENETRACAO
===============================================================================}
procedure TfrmHelmet.LoadPenetracao(FileName: TFileName);
var
	fPenet	        :	TextFile;
        sBuff           :       String;
        dVelReal        : double;
        dVelNorma       : double;
begin
	if (FileName='') then Exit;

	AssignFile(fPenet, FileName);
        {$I-}
	        Reset(fPenet);
        {$I+}
        if IOResult <> 0 then
        begin
                ShowMessage('Erro abrindo arquivo ' + FileName);
                Exit;
        end;

      	ReadLn(fPenet, sBuff); //PENETRACAO_ID
	if (sBuff<>PENETRACAO_ID) then
	begin
		ShowMessage('Formato de arquivo inválido');
                CloseFile(fPenet);
                Exit;
	end;
        EnsaioAtual := eaPenetracao;

      	ReadLn(fPenet, sBuff); //dMax
	frmNovoEnsaio.dMax := StrToFloat(sBuff) ;

        ReadLn(fPenet, sBuff); //Empresa
        frmNovoEnsaio.cbEmpresa.Text := sBuff;
	frmResultadosPenet.lbEmpresa.Caption := sBuff;
	frmPenetracaoPrint.stEmpresa.Caption := sBuff ;

        ReadLn(fPenet, sBuff); //Modelo
	frmNovoEnsaio.cbModeloCapacete.Text := sBuff;
	frmResultadosPenet.lbModelo.Caption := sBuff ;
	frmPenetracaoPrint.stCapacete.Caption := sBuff ;

        ReadLn(fPenet, sBuff); //Numero Amostra
	frmNovoEnsaio.edNumeroAmostra.Text := sBuff;
	frmResultadosPenet.lbAmostra.Caption := sBuff ;
	frmPenetracaoPrint.stAmostra.Caption := sBuff ;

        ReadLn(fPenet, sBuff); //Numero Lote
	frmNovoEnsaio.edNumeroLote.Text := sBuff;
	frmResultadosPenet.lbLote.Caption := sBuff ;
	frmPenetracaoPrint.stLote.Caption := sBuff ;

        ReadLn(fPenet, sBuff); //Posicao
	frmNovoEnsaio.edPosicaoEnsaio.Text := sBuff;
	frmResultadosPenet.lbEnsaio.Caption := sBuff ;
	frmPenetracaoPrint.stEnsaio.Caption := sBuff ;

        ReadLn(fPenet, sBuff); //Condicionamento
	frmNovoEnsaio.edCondicionamento.Text := sBuff;
	frmResultadosPenet.lbCondicionamento.Caption := sBuff;
        frmPenetracaoPrint.stCondicionamento.Caption := sBuff;

        ReadLn(fPenet, sBuff); //Tamanho
        frmNovoEnsaio.edTamanho.Text := sBuff;
        frmResultadosPenet.lbTamanho.Caption := sBuff;
        frmPenetracaoPrint.stTamanho.Caption := sBuff;

        ReadLn(fPenet, sBuff); //Norma
	frmResultadosPenet.lbNorma.Caption := sBuff;
	frmPenetracaoPrint.stNormaUtilizada.Caption := sBuff;

        ReadLn(fPenet, sBuff); //lbEnsaios
	frmResultadosPenet.lbEnsaios.Caption := sBuff ;

        ReadLn(fPenet, sBuff); //lbObs
        frmGeral.mmObs.Lines.Add(sBuff);
        frmResultadosPenet.lbObs.Caption := sBuff;

        ReadLn(fPenet, sBuff); //lbOcorre
	frmResultadosPenet.lbPenet.Caption := sBuff;
	frmPenetracaoPrint.stPenet.Caption := sBuff;

        ReadLn(fPenet, sBuff); //lbAltImp
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosPenet.lbAltImp.Caption := sBuff + ' m';

        ReadLn(fPenet, sBuff); //lbResReal
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosPenet.lbResReal.Caption := sBuff + ' m';

        ReadLn(fPenet, sBuff); //lbVelImp
        Delete(sBuff, StrLen(PChar(sBuff))-3, 4);
        dVelNorma := StrToFloat(sBuff);
	frmResultadosPenet.lbVelImp.Caption := sBuff + ' m/s';
	frmPenetracaoPrint.stVelocidadePenetracaoNorma.Caption := sBuff + ' m/s';

        ReadLn(fPenet, sBuff); //sResVel
        dVelReal := StrToFloat(sBuff);
	frmResultadosPenet.lbTemp.Caption := sBuff + ' m/s' ;
        frmPenetracaoPrint.stVelReal.Caption := sBuff + ' m/s' ;

        ReadLn(fPenet, sBuff); //lbSituacao
       	if sBuff = 'NÃO CONFORME' then
	begin
                frmResultadosPenet.lbSituacao.Font.Color := RGB(255, 0, 0) ;
		frmResultadosPenet.lbSituacao.Caption := 'NÃO CONFORME' ;
	end
	else if sBuff = 'CONFORME' then
	begin
                frmResultadosPenet.lbSituacao.Font.Color := RGB(0, 255, 0) ;
		frmResultadosPenet.lbSituacao.Caption := 'CONFORME' ;
	end
        else
	begin
                frmResultadosPenet.lbSituacao.Font.Color := RGB(255, 0, 0) ;
		frmResultadosPenet.lbSituacao.Caption := 'TESTE INVÁLIDO' ;
	end;

        CloseFile(fPenet);

        frmResultadosPenet.Show;
end;

{===============================================================================
LOAD CALIBRACAO
===============================================================================}
procedure TfrmHelmet.LoadCalibracao(FileName: TFileName);
var
	fCal	        :	TextFile;
        sBuff           :       String;
	i	        :	integer;
	dfX             :	single;
	dfY		:	single;
        dVelReal        : double;
        dVelNorma       : double;

        //Valores temporários lidos do arquivo
        AMax : string ;
        TLim1 : string ;
        TLim2 : string ;
begin
	if (FileName='') then Exit;

	AssignFile(fCal, FileName);
        {$I-}
	        Reset(fCal);
        {$I+}
        if IOResult <> 0 then
        begin
                ShowMessage('Erro abrindo arquivo ' + FileName);
                Exit;
        end;

      	ReadLn(fCal, sBuff); //CALIBRACAO_ID
	if (sBuff<>CALIBRACAO_ID) then
	begin
		ShowMessage('Formato de arquivo inválido');
                CloseFile(fCal);
                Exit;
	end;
        EnsaioAtual := eaTransmissao;

      	ReadLn(fCal, sBuff); //dMax
	frmNovoEnsaio.dMax := StrToFloat(sBuff) ;

        ReadLn(fCal, sBuff); //Empresa
        frmNovoEnsaio.cbEmpresa.Text := sBuff;
	frmResultadosCal.lbEmpresa.Caption := sBuff;
	frmCalibracaoPrint.stEmpresa.Caption := sBuff ;

        ReadLn(fCal, sBuff); //Modelo
	frmNovoEnsaio.cbModeloCapacete.Text := sBuff;
	frmResultadosCal.lbModelo.Caption := sBuff ;
	frmCalibracaoPrint.stCapacete.Caption := sBuff ;

        ReadLn(fCal, sBuff); //Numero Amostra
	frmNovoEnsaio.edNumeroAmostra.Text := sBuff;
	frmResultadosCal.lbAmostra.Caption := sBuff ;
	frmCalibracaoPrint.stAmostra.Caption := sBuff ;

        ReadLn(fCal, sBuff); //Numero Lote
	frmNovoEnsaio.edNumeroLote.Text := sBuff;
	frmResultadosCal.lbLote.Caption := sBuff ;
	frmCalibracaoPrint.stLote.Caption := sBuff ;

        ReadLn(fCal, sBuff); //Posicao
	frmNovoEnsaio.edPosicaoEnsaio.Text := sBuff;
	frmResultadosCal.lbEnsaio.Caption := sBuff ;
	frmCalibracaoPrint.stEnsaio.Caption := sBuff ;

        ReadLn(fCal, sBuff); //Condicionamento
	frmNovoEnsaio.edCondicionamento.Text := sBuff;
	frmResultadosCal.lbCondicionamento.Caption := sBuff;
        frmCalibracaoPrint.stCondicionamento.Caption := sBuff;

        ReadLn(fCal, sBuff); //Tamanho
        frmNovoEnsaio.edTamanho.Text := sBuff;
        frmResultadosCal.lbTamanho.Caption := sBuff;
        frmCalibracaoPrint.stTamanho.Caption := sBuff;

        ReadLn(fCal, sBuff); //Norma
	frmResultadosCal.lbNorma.Caption := sBuff;
	frmCalibracaoPrint.stNorma.Caption := sBuff;

        ReadLn(fCal, sBuff); //lbEnsaios
	frmResultadosCal.lbEnsaios.Caption := sBuff ;

        ReadLn(fCal, sBuff); //lbObs
        frmGeral.mmObs.Lines.Add(sBuff);
        frmResultadosCal.lbObs.Caption := sBuff;

        ReadLn(fCal, sBuff); //lbMaxZG
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosCal.lbMaxZG.Caption := sBuff + ' g';
	frmCalibracaoPrint.stMaxZG.Caption := sBuff + ' g' ;

        ReadLn(fCal, sBuff); //lbMaxZ
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosCal.lbMaxZ.Caption := sBuff + ' N';
	frmCalibracaoPrint.stMaxZ.Caption := sBuff + ' N' ;

        ReadLn(fCal, sBuff); //lbMaxN
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosCal.lbMaxN.Caption := sBuff + ' N';
	frmCalibracaoPrint.stMaxN.Caption := sBuff + ' N' ;

        ReadLn(fCal, sBuff); //lbDifZN
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosCal.lbDifZN.Caption := sBuff + ' N';
	frmCalibracaoPrint.stDif.Caption := sBuff + ' N';

        ReadLn(fCal, sBuff); //lbDifZNNorma
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosCal.lbDifMax.Caption := sBuff + ' %';
	frmCalibracaoPrint.stDifNorma.Caption := sBuff + ' %';

        ReadLn(fCal, sBuff); //lbAltImp
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosCal.lbAltImp.Caption := sBuff + ' m';
        frmCalibracaoPrint.stAlturaNorma.Caption := sBuff + ' m';

        ReadLn(fCal, sBuff); //lbResReal
        Delete(sBuff, StrLen(PChar(sBuff))-1, 2);
	frmResultadosCal.lbResReal.Caption := sBuff + ' m';

        ReadLn(fCal, sBuff); //lbVelImp
        Delete(sBuff, StrLen(PChar(sBuff))-3, 4);
        dVelNorma := StrToFloat(sBuff);
	frmResultadosCal.lbVelImp.Caption := sBuff + ' m/s';
	frmCalibracaoPrint.stVelocidadeCalibracaoNorma.Caption := sBuff + ' m/s';

        ReadLn(fCal, sBuff); //sResVel
        dVelReal := StrToFloat(sBuff);
	frmResultadosCal.lbTemp.Caption := sBuff + ' m/s' ;
        frmCalibracaoPrint.stVelReal.Caption := sBuff + ' m/s' ;

        ReadLn(fCal, sBuff); //lbSituacao
       	if sBuff = 'NÃO CONFORME' then
	begin
                frmResultadosCal.lbSituacao.Font.Color := RGB(255, 0, 0) ;
		frmResultadosCal.lbSituacao.Caption := 'NÃO CONFORME' ;
                frmCalibracaoPrint.stSituacao.Caption := 'NÃO CONFORME' ;
	end
	else if sBuff = 'CONFORME' then
	begin
                frmResultadosCal.lbSituacao.Font.Color := RGB(0, 255, 0) ;
		frmResultadosCal.lbSituacao.Caption := 'CONFORME' ;
                frmCalibracaoPrint.stSituacao.Caption := 'CONFORME' ;
	end
        else
	begin
                frmResultadosCal.lbSituacao.Font.Color := RGB(255, 0, 0) ;
		frmResultadosCal.lbSituacao.Caption := 'TESTE INVÁLIDO' ;
                frmCalibracaoPrint.stSituacao.Caption := 'TESTE INVÁLIDO' ;
	end;

        (*ReadLn(fCal, sBuff); //sLeituras
	lPontosImpacto := StrToInt(sBuff);

        //Pontos do Gráfico
       	frmProgress.pbOpen.Position := 0 ;
	frmProgress.Show ;
	frmProgress.Animate.Active := true ;
	frmGraficoTrans.lsX.Clear ;
	for i:=0 to lPontosImpacto-1 do
	begin
                ReadLn(fCal, sBuff);
		dfX_Z := StrToFloat(sBuff);
                ReadLn(fCal, sBuff);
                dfY_Z := StrToFloat(sBuff);
                frmGraficoCal.lsZ.AddXY(dfX, dfY);

                ReadLn(fCal, sBuff);
		dfX_N := StrToFloat(sBuff);
                ReadLn(fCal, sBuff);
                dfY_N := StrToFloat(sBuff);
                frmGraficoCal.lsN.AddXY(dfX, dfY);

		frmProgress.pbOpen.Position := frmProgress.pbOpen.Position + 1 ;
	end;
	frmProgress.Animate.Active := true ;
	frmProgress.Close ;*)

        CloseFile(fCal);

        frmResultadosCal.Show;
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.LoadRetencao(FileName: TFileName);
var
	fsImp		:	TFileStream;
	i				:	integer;
	dfX			:	single;
	dfY			:	single;
	sBuff		:	string;
	xPos		: integer ;

    //Valores temporários lidos do arquivo
    AMax : string ;
    TLim1 : string ;
    TLim2 : string ;


	procedure ReadString(var sValue: string; iSize: integer);
	var
		sTemp		:	string;
	begin
		sTemp := Spaces(iSize);
		fsImp.Read(sTemp[1], iSize);
		sValue := sTemp;
	end;

begin
	if (FileName='') then Exit;
	fsImp := TFileStream.Create(FileName, fmOpenRead);
	ReadString(sBuff, 5);
	if (sBuff<>VISEIRA_ID) then
	begin
		//ShowMessage('Formato de arquivo inválido');
		fsImp.Free;
		Exit;
	end;

       	ReadString(sBuff, 64);
	//frmNovoEnsaio.cbEmpresa.Text := sBuff;
	frmCintaRes.lbEmpresa.Caption := sBuff;
        lbEmpresaRet.Caption := sBuff;
	frmCintaPrint.stEmpresa.Caption := sBuff ;

	ReadString(sBuff, 16);
	//frmNovoEnsaio.cbModeloCapacete.Text := sBuff;
	frmCintaRes.lbModelo.Caption := sBuff ;
        lbModeloRet.Caption := sBuff ;
	frmCintaPrint.stCapacete.Caption := sBuff ;

        ReadString(sBuff, 2);
        //frmNovoEnsaio.edTamanho.Text := sBuff;
        frmCintaRes.lbTam.Caption := sBuff;
        lbTam.Caption := sBuff;
        frmCintaPrint.stTamanho.Caption := sBuff;

        ReadString(sBuff, 16);
	//frmNovoEnsaio.edNumeroLote.Text := sBuff;
	frmCintaRes.lbLote.Caption := sBuff ;
        lbLoteRet.Caption := sBuff ;
	frmCintaPrint.stLote.Caption := sBuff ;

	ReadString(sBuff, 16);
	//frmNovoEnsaio.edNumeroAmostra.Text := sBuff;
	frmCintaRes.lbAmostra.Caption := sBuff ;
        lbAmostraRet.Caption := sBuff ;
	frmCintaPrint.stAmostra.Caption := sBuff ;

        ReadString(sBuff, 64);
	//frmNovoEnsaio.edCondicionamento.Text := sBuff;
	frmCintaRes.lbCondicionamento.Caption := sBuff;
	lbCond.Caption := sBuff;
	frmCintaPrint.stCondicionamento.Caption := sBuff;

        ReadString(sBuff, 200);
        frmCintaRes.lbObs.Caption := sBuff;
        lbObsRet.Caption := sBuff;
	//frmCintaPrint.stPage.Caption := sBuff;

        ReadString(sBuff, 2);
        frmCintaRes.lbDElast.Caption := sBuff;
        lbDElast.Caption := sBuff;
	//frmCintaPrint.stPage.Caption := sBuff;

        ReadString(sBuff, 2);
        frmCintaRes.lbDPlast.Caption := sBuff;
        lbDPlast.Caption := sBuff;
	//frmCintaPrint.stPage.Caption := sBuff;

        ReadString(sBuff, 2);
        frmCintaRes.edElast.Text := sBuff;
        edElast.Text := sBuff;
	//frmCintaPrint.stPage.Caption := sBuff;

        ReadString(sBuff, 2);
        frmCintaRes.edPlast.Text := sBuff;
        edPlast.Text := sBuff;
	//frmCintaPrint.stPage.Caption := sBuff;

        ReadString(sBuff, 12);
        frmCintaRes.stRes.Caption := sBuff;
        stRes.Caption := sBuff;
	//frmCintaPrint.stPage.Caption := sBuff;

	fsImp.Free;

        if (strtofloat(edElast.text) > strtofloat(lbDElast.Caption)) then
        begin
                frmCintaPrint.eres.Font.Color := clRed ;
                frmCintaRes.edElast.Font.Color := clRed ;
                edElast.Font.Color := clRed ;
        end
        else
        begin
             	frmCintaPrint.eres.Font.Color := clBlue ;
                frmCintaRes.edElast.Font.Color := clBlue ;
                edElast.Font.Color := clBlue ;
        end;

        if (strtofloat(edPlast.text) > strtofloat(lbDPlast.Caption)) then
        begin
                frmCintaPrint.pres.Font.Color := clRed ;
                frmCintaRes.edPlast.Font.Color := clRed ;
                edPlast.Font.Color := clRed ;
        end
        else
        begin
             	frmCintaPrint.pres.Font.Color := clBlue ;
                frmCintaRes.edPlast.Font.Color := clBlue ;
                edPlast.Font.Color := clBlue ;
        end;

        if (stRes.Caption = 'CONFORME') then
                stRes.Font.Color := clBlue
        else
                stRes.Font.Color := clRed;


end;



{===============================================================================

===============================================================================}
procedure TfrmHelmet.bbSalvarEnsaioClick(Sender: TObject);
begin
	if EnsaioAtual=eaNone then Exit;
	if not dlgSalvar.Execute then Exit;
	case EnsaioAtual of
		eaImpacto:	SaveImpacto(dlgSalvar.FileName);
        	eaTransmissao:	SaveTransmissao(dlgSalvar.Filename) ;
        	eaPenetracao:		SavePenetracao(dlgSalvar.Filename) ;
        	eaCalibracao:      SaveCalibracao(dlgSalvar.Filename) ;
	end;
end;


{===============================================================================

===============================================================================}
procedure TfrmHelmet.bbExibirGraficoClick(Sender: TObject);
begin
	frmGrafico.Left := Left;
	frmGrafico.Top := Top;
	frmGrafico.Width := Width;
	frmGrafico.Height := Height;
	frmGrafico.WindowState := WindowState;
	frmGrafico.Show;
end;

procedure TfrmHelmet.bbAbrirEnsaioClick(Sender: TObject);
begin
        if not dlgAbrir.Execute then Exit;
        case dlgAbrir.FilterIndex of
                1 : LoadImpacto(dlgAbrir.FileName);
                2 : LoadTransmissao(dlgAbrir.FileName);
                3 : LoadPenetracao(dlgAbrir.FileName);
                4 : LoadCalibracao(dlgAbrir.FileName);
        end;
end;

procedure TfrmHelmet.bbResultadosEnsaioClick(Sender: TObject);
begin
	//frmSelEnsaio.ShowModal ;
end;

function TfrmHelmet.ScanForLimits( limite : double ) : double ;
	var tempo,i : integer ;
			iY : double ;
begin
		tempo := 0 ;
		for i := 0 to 9999 do // RateChange
		begin
			iY := frmGrafico.lsLinha.YValue[i];
			if iY >= limite then	inc(tempo) ;
		end;
		ScanForLimits := (tempo * 0.1) ; // Resultado em milissegundos
end ;
procedure TfrmHelmet.mnuSobreClick(Sender: TObject);
begin
	frmAbout.Show ;
end;

procedure TfrmHelmet.mnuConfigurarImpressoraClick(Sender: TObject);
begin
	frmHelmet.dlgPrinterSetup.Execute ;
end;

procedure TfrmHelmet.bbContinuarEnsaioClick(Sender: TObject);
begin
	frmNovoEnsaio.nbPages.ActivePage := 'Formulário Geral' ;
	frmNovoEnsaio.nbPages.PageIndex := 1 ;
	frmNovoEnsaio.Show ;
end;

procedure TfrmHelmet.Timer1Timer(Sender: TObject);
begin
				timer1.enabled := false ;
				//CbDBitOut(0, AUXPORT, 2, 0) ;  // Liga Fonte do motor
       	//CbDBitOut(0, AUXPORT, 3, 1) ;  //coloca em modo normal
				frmMachineControl.Delay(2000);
       {try
	        frmMachineControl.ComPort1.Close ;
			frmMachineControl.ComPort1.Open;
        except end;
					frmMachineControl.Delay(2000);
					frmMachineControl.ComandoMotor(#13'ST1'#13) ;
					//frmMachineControl.Comm.Close ;}
end;



procedure TfrmHelmet.mnuPosClick(Sender: TObject);
begin
	frmPos.ShowModal ;
end;

procedure TfrmHelmet.Condicionamentos1Click(Sender: TObject);
begin
	frmCondicionamento.ShowModal ;
end;

procedure TfrmHelmet.mnuConteudoClick(Sender: TObject);
begin
	Application.HelpContext(101);
end;

procedure TfrmHelmet.Atrito1Click(Sender: TObject);
begin
	frmAtrito.Show ;
end;

procedure TfrmHelmet.Acelermetros1Click(Sender: TObject);
begin
	frmAcelerometros.Show;
end;

procedure TfrmHelmet.Perfurao1Click(Sender: TObject);
begin
	frmP.Show;
end;

procedure TfrmHelmet.Diagnstico1Click(Sender: TObject);
begin
        frmDiagnostico.ShowModal();
end;

procedure TfrmHelmet.DesabilitarPorta1Click(Sender: TObject);
begin
        if DesPorta = false then
        begin
                DesabilitarPorta1.Caption := 'Habilitar Porta';
                DesPorta := True;
        end
        else
        begin
                DesabilitarPorta1.Caption := 'Desabilitar Porta';
                DesPorta := False;
        end;
end;

procedure TfrmHelmet.DesabilitarSensordeVelocidade1Click(Sender: TObject);
begin
        if DesSensVel = false then
        begin
                DesabilitarSensordeVelocidade1.Caption := 'Habilitar Sensor de Velocidade';
                DesSensVel := True;
        end
        else
        begin
                DesabilitarSensordeVelocidade1.Caption := 'Desabilitar Sensor de Velocidade';
                DesSensVel := False;
        end;

end;

procedure TfrmHelmet.tmrStatusTimer(Sender: TObject);
var bitValue: Integer;
 dataValue: Word;
begin
        // Reseta operações de background
        cbStopBackground(0) ;

        cbDBitIn(0, AUXPORT, 1, bitValue);          // 8221
        //bitValue := frmMachineControl.readStatus();
        if (bitValue) = 1 then
        begin
                ledPortaOff.Visible := true;
                ledPortaOn.Visible := false;
        end
        else
        begin
                ledPortaOff.Visible := false;
                ledPortaOn.Visible := true;
        end;

        //cbDBitIn(0, AUXPORT, 1, bitValue);          // 8221
        //bitValue := frmMachineControl.readTravaGarra();
        {if (bitValue and 32) = 32 then
        begin
                ledGarraOff.Visible := true;
                ledGarraOn.Visible := false;
        end
        else
        begin
                ledGarraOff.Visible := false;
                ledGarraOn.Visible := true;
        end; }

        if (cbAIn(0, 6, BIP5VOLTS, DataValue) <> 0) then
        begin
                ShowMessage('Erro Lendo Sensor da Trava!');
                //tmrStatus.Enabled := false;
        end
        else
        begin
                if (DataValue) > 49152 then   // equiv. à 2,5V
                begin
                        ledGarraOff.Visible := true;
                        ledGarraOn.Visible := false;
                end
                else
                begin
                        ledGarraOff.Visible := false;
                        ledGarraOn.Visible := true;
                end
        end;

        cbDBitIn(0, AUXPORT, 2, bitValue);          // 8221
        //bitValue := frmMachineControl.readSensVel();
        if (bitValue) = 1 then
        begin
                ledFMOff.Visible := true;
                ledFMOn.Visible := false;
        end
        else
        begin
                ledFMOff.Visible := false;
                ledFMOn.Visible := true;
        end;

        cbDBitIn(0, AUXPORT, 3, bitValue);          // 8221
        //bitValue := frmMachineControl.readSensVel();
        if (bitValue) = 1 then
        begin
                ledVelocidadeOff.Visible := true;
                ledVelocidadeOn.Visible := false;
        end
        else
        begin
                ledVelocidadeOff.Visible := false;
                ledVelocidadeOn.Visible := true;
        end;

        cbDBitIn(0, AUXPORT, 0, bitValue);          // 8221
        if (bitValue) = 1 then
        begin
                ledEmergenciaOff.Visible := true;
                ledEmergenciaOn.Visible := false;
        end
        else
        begin
                ledEmergenciaOff.Visible := false;
                ledEmergenciaOn.Visible := true;
        end;

        //cbDBitIn(0, FIRSTPORTA, 13, bitValue);
        //bitValue := frmMachineControl.readFCB();
        {if (bitValue and 2) = 2 then                    // 8221
        begin
                ledFcbOff.Visible := true;
                ledFcbOn.Visible := false;
        end
        else
        begin
                ledFcbOff.Visible := false;
                ledFcbOn.Visible := true;
        end;  }

        if (cbAIn(0, 4, BIP5VOLTS, DataValue) <> 0) then
        begin
                ShowMessage('Erro Lendo FCB!');
                //tmrStatus.Enabled := false;
        end
        else
        begin
                if (DataValue) > 49152 then   // equiv. à 2,5V
                begin
                        ledFcbOff.Visible := true;
                        ledFcbOn.Visible := false;
                end
                else
                begin
                        ledFcbOff.Visible := false;
                        ledFcbOn.Visible := true;
                end
        end;

        //cbDBitIn(0, FIRSTPORTA, 14, bitValue);
        //bitValue := frmMachineControl.readFCA();
        {if (bitValue and 64) = 64 then
        begin
                ledFcaOff.Visible := true;
                ledFcaOn.Visible := false;
        end
        else
        begin
                ledFcaOff.Visible := false;
                ledFcaOn.Visible := true;
        end; }

        if (cbAIn(0, 5, BIP5VOLTS, DataValue) <> 0) then
        begin
                ShowMessage('Erro Lendo FCA!');
                //tmrStatus.Enabled := false;
        end
        else
        begin
                if (DataValue) > 49152 then   // equiv. à 2,5V
                begin
                        ledFcaOff.Visible := true;
                        ledFcaOn.Visible := false;
                end
                else
                begin
                        ledFcaOff.Visible := false;
                        ledFcaOn.Visible := true;
                end
        end;

        if (cbAIn(0, 7, BIP5VOLTS, DataValue) <> 0) then
        begin
                ShowMessage('Erro Lendo Contato Punção!');
                //tmrStatus.Enabled := false;
        end
        else
        begin
                if (DataValue) > 49152 then   // equiv. à 2,5V
                begin
                        ledCordaOff.Visible := true;
                        ledCordaOn.Visible := false;
                end
                else
                begin
                        ledCordaOff.Visible := false;
                        ledCordaOn.Visible := true;
                end
        end;

        //Acelerometros e trnsdutor de força    8221
        if (cbAIn(0, 0, BIP5VOLTS, DataValue) <> 0) then
                MemoData.Lines.Add('Erro Lendo Acelerômetro X!')
        else
        Begin
                Edit3.Text := FormatFloat('0.0', (((DataValue * 10)/65535)-5)*1000);
                Edit6.Text := FormatFloat('0.0', StrToFloat(Edit3.Text) / 10);
        End;


        if (cbAIn(0, 1, BIP5VOLTS, DataValue) <> 0) Then
                MemoData.Lines.Add('Erro Lendo Acelerômetro Y!')
        else
        Begin
                Edit4.Text := FormatFloat('0.0', (((DataValue * 10)/65535)-5)*1000);
                Edit7.Text := FormatFloat('0.0', StrToFloat(Edit4.Text) / 10);
        End;

        if (cbAIn(0, 2, BIP5VOLTS, DataValue) <> 0) then
                MemoData.Lines.Add('Erro Lendo Acelerômetro Z!')
        else
        Begin
                Edit5.Text := FormatFloat('0.0', (((DataValue * 10)/65535)-5)*1000);
                Edit8.Text := FormatFloat('0.0', StrToFloat(Edit5.Text) / 10);
        End;

        if (cbAIn(0, 3, BIP5VOLTS, DataValue) <> 0) then
                MemoData.Lines.Add('Erro Lendo Trandutor de Força!')
        else
        Begin
                Edit10.Text := FormatFloat('0.0', (((DataValue * 10)/65535)-5)*1000);
                Edit11.Text := FormatFloat('0.0', (4903/5000) * StrToFloat(Edit10.Text));
        End;
end;

procedure TfrmHelmet.btnVelocidadeOnClick(Sender: TObject);
begin
        cbDBitOut(0, AUXPORT, 6, 0);        // 8221
        btnVelocidadeOn.Visible := false;
        btnVelocidadeOff.Visible := true;
end;

procedure TfrmHelmet.btnGarraOnClick(Sender: TObject);
begin
        cbDBitOut(0, AUXPORT, 5, 0);       // 8221
        btnGarraOn.Visible := false;
        btnGarraOff.Visible := true;
end;

procedure TfrmHelmet.btnPortaOnClick(Sender: TObject);
begin
        cbDBitOut(0, AUXPORT, 4, 0);       // 8221
        btnPortaOn.Visible := false;
        btnPortaOff.Visible := true;
end;

procedure TfrmHelmet.btnCordaOnClick(Sender: TObject);   // 8221   Pulso Aferição
begin
        cbDBitOut(0, AUXPORT, 7, 0);
        btnCordaOn.Visible := false;
        btnCordaOff.Visible := true;
end;

procedure TfrmHelmet.btnLampadaOnClick(Sender: TObject);  // 221
begin
{        CbDBitOut(1, FIRSTPORTA, 21, 0) ;
        btnLampadaOn.Visible := false;
        btnLampadaOff.Visible := true;  }
end;

procedure TfrmHelmet.btnVelocidadeOffClick(Sender: TObject);  // 8221
begin
        cbDBitOut(0, AUXPORT, 6, 1);
        btnVelocidadeOn.Visible := true;
        btnVelocidadeOff.Visible := false;
end;

procedure TfrmHelmet.btnGarraOffClick(Sender: TObject);   // 8221
begin
        cbDBitOut(0, AUXPORT, 5, 1);
        btnGarraOn.Visible := true;
        btnGarraOff.Visible := false;
end;

procedure TfrmHelmet.btnPortaOffClick(Sender: TObject);   // 8221
begin
        cbDBitOut(0, AUXPORT, 4, 1);
        btnPortaOn.Visible := true;
        btnPortaOff.Visible := false;
end;

procedure TfrmHelmet.btnCordaOffClick(Sender: TObject);  // 8221   Pulso Aferição
begin
        cbDBitOut(0, AUXPORT, 7, 1);
        btnCordaOn.Visible := true;
        btnCordaOff.Visible := false;
end;

procedure TfrmHelmet.btnLampadaOffClick(Sender: TObject);  // 8221
begin
{        CbDBitOut(1, FIRSTPORTA, 21, 1) ;
        btnLampadaOn.Visible := true;
        btnLampadaOff.Visible := false;  }
end; 

procedure TfrmHelmet.btnResultadosClick(Sender: TObject);
begin
        frmGeral.showModal();
end;

end.
