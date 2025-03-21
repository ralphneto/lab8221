unit uNovoEnsaio;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Spin, Cbw32,  Db,
  DBTables, Mask, DBCtrls, CPort;


type
	TfrmNovoEnsaio = class(TForm)
		nbPages: TNotebook;
		lbTipoEnsaio: TLabel;
		btnImpacto: TButton;
    btnTransmissao: TButton;
    btnPenetracao: TButton;
		lbEmpresa: TLabel;
		lbModeloCapacete: TLabel;
		lbNumeroAmostra: TLabel;
		lbNumeroLote: TLabel;
		lbPosicaoEnsaio: TLabel;
		lbNormaUtilizar: TLabel;
		cbEmpresa: TComboBox;
		cbModeloCapacete: TComboBox;
		edNumeroAmostra: TEdit;
		edNumeroLote: TEdit;
		cbNormaUtilizar: TComboBox;
		btnFormularioGeralContinuar: TButton;
		lbAjusteCapacete: TLabel;
		lbFecharPorta: TLabel;
		btnFecharPorta: TButton;
		tgarra: TTimer;
		edUpDown: TEdit;
		Button1: TButton;
		tmrParar: TTimer;
		btFinalizar1: TButton;
		Label2: TLabel;
		Button2: TButton;
		Label4: TLabel;
		btnDescer: TButton;
		btnDescerAbrir: TButton;
		btnAbrir: TButton;
		Button3: TButton;
		Button4: TButton;
		Label5: TLabel;
		Button5: TButton;
		Label6: TLabel;
		Label7: TLabel;
		Button6: TButton;
		Label8: TLabel;
		Button7: TButton;
    btnCalibracao: TButton;
		Label9: TLabel;
		Button8: TButton;
		Label10: TLabel;
		Button9: TButton;
		edCondicionamento: TComboBox;
		edPosicaoEnsaio: TComboBox;
		btnCancel: TButton;
		Button10: TButton;
		Button12: TButton;
		Button11: TButton;
		Button13: TButton;
		Button14: TButton;
		Button15: TButton;
		tmrDanger: TTimer;
		lbRest: TLabel;
		Label11: TLabel;
		btnFecharPorta2: TButton;
		btnFecharPorta3: TButton;
		//Porta_1: TPorts;
		//Regua: TVSSComm32;
		Button16: TButton;
		tmrLeitura: TTimer;
		Status: TStatusBar;
    Table1: TTable;
	tbNum: TDBEdit;
    tbTam: TDBEdit;
    tbCon: TDBEdit;
    tbPos: TDBEdit;
    tbVel: TDBEdit;
    tbMax: TDBEdit;
    tb1Lm: TDBEdit;
    tb2Lm: TDBEdit;
    DataSource1: TDataSource;
		Label12: TLabel;
    edTamanho: TEdit;
    //Porta_1: TPorts;
    timerP: TTimer;
    lbCount: TLabel;
    lbDin: TLabel;
    lbRes: TLabel;
    btnCC: TSpeedButton;
    tmrPerf: TTimer;
    lbIni: TLabel;
    edRPos: TLabel;
    btnSobe: TSpeedButton;
    btnDesce: TSpeedButton;
    tbModel: TDBEdit;
    tmrImpTimeout: TTimer;
    Label3: TLabel;
    edObs: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label13: TLabel;
    tmrDesligaMotor: TTimer;
    Label1: TLabel;
    Label14: TLabel;
    btnIniciarTransmissao1: TButton;
    btnIniciarTransmissao2: TButton;
    Button19: TButton;
    StatusTrans: TStatusBar;
    btnFinalizarTransmissao: TButton;
    StatusPenet: TStatusBar;
    Button17: TButton;
    btnIniciarPenetracao2: TButton;
    btnIniciarPenetracao1: TButton;
    Label15: TLabel;
    Label16: TLabel;
    btnFinalizarPenetracao: TButton;
    Label17: TLabel;
    Label18: TLabel;
    btnIniciarCalibracao1: TButton;
    btnIniciarCalibracao2: TButton;
    Button21: TButton;
    StatusCal: TStatusBar;
    btnFinalizarCalibracao: TButton;
    Button18: TButton;
    Button20: TButton;
		procedure FormShow(Sender: TObject);
		procedure btnImpactoClick(Sender: TObject);
		procedure btnTransmissaoClick(Sender: TObject);
		procedure btnPenetracaoClick(Sender: TObject);
		procedure btnFormularioGeralContinuarClick(Sender: TObject);
		procedure updownClick(Sender: TObject; Button: TUDBtnType);
		procedure Button1Click(Sender: TObject);
		procedure btnFecharPortaClick(Sender: TObject);
                procedure fcnIniciarEnsaioTransmissao(Sender: TObject);
                procedure fcnIniciarEnsaioPenetracao(Sender: TObject);
                procedure fcnIniciarCalibracao(Sender: TObject);
		procedure btnFecharPorta1Click(Sender: TObject);
		procedure tgarraTimer(Sender: TObject);
		procedure FormCreate(Sender: TObject);
		procedure btFinalizar1Click(Sender: TObject);
		procedure btFinalizar2Click(Sender: TObject);
		procedure udSpeedClick(Sender: TObject; Button: TUDBtnType);
		procedure Button2Click(Sender: TObject);
		procedure GetNormaValues ;
                procedure GetNormaRepetValues ;
                procedure GetNormaTransmissaoValues ;
                procedure GetNormaPenetracaoTopoValues ;
                procedure GetNormaPenetracaoExcValues ;
                procedure GetNormaCalibracao1Values ;
                procedure GetNormaCalibracao2Values ;
		procedure WriteMainPage ;
		procedure WriteMainPagePenet ;
                procedure WriteMainPageTrans ;
                procedure WriteMainPageCal ;
		procedure Delay (iMSecs: integer);
        procedure DelayRegua (iMSecs: integer);
		procedure btnDescerClick(Sender: TObject);
		procedure btnDescerAbrirClick(Sender: TObject);
		procedure btnAbrirClick(Sender: TObject);
		procedure Button3Click(Sender: TObject);
		procedure Button4Click(Sender: TObject);
		procedure Zoom(PicoMaximo : double ; PosicaoX : LongInt) ;
		procedure Button5Click(Sender: TObject);
		//procedure ReguaReceiveData(Buffer: Pointer; BufferLength: Word);
		procedure Button6Click(Sender: TObject);
		procedure Button7Click(Sender: TObject);
		procedure btnCalibracaoClick(Sender: TObject);
                procedure LoadNorma8221Values(FileName: TFileName);
		procedure GetNCintaValues ;
		procedure GetNViseiraValues ;
		procedure GetNPerfValues ;
		procedure Button8Click(Sender: TObject);
		procedure Button9Click(Sender: TObject);
		procedure btnCancelClick(Sender: TObject);
		procedure Button10Click(Sender: TObject);
		procedure Button12Click(Sender: TObject);
		procedure Button11Click(Sender: TObject);
		procedure tmrDangerTimer(Sender: TObject);
		procedure btnFecharPorta2Click(Sender: TObject);
		procedure btnFecharPorta3Click(Sender: TObject);
		function  ReadForward : byte ;
		function  ReadAbsolute : word ;
		function  CheckOD : boolean ;
		procedure ResetOD ;
		procedure Button16Click(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure tmrLeituraTimer(Sender: TObject);
		procedure tmrPararTimer(Sender: TObject);
		procedure SetStatus(str : string);
				procedure GetCombos;
    procedure timerPTimer(Sender: TObject);
    procedure btnCCClick(Sender: TObject);
    procedure tmrPerfTimer(Sender: TObject);
    procedure btnSobeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSobeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDesceMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDesceMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmrImpTimeoutTimer(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tmrDesligaMotorTimer(Sender: TObject);
    procedure btnIniciarTransmissao1Click(Sender: TObject);
    //procedure btnFinalizarEnsaioTransmissaoClick(Sender: TObject);
    procedure btnFinalizarTransmissaoClick(Sender: TObject);
    procedure btnIniciarPenetracao1Click(Sender: TObject);
    procedure btnIniciarPenetracao2Click(Sender: TObject);
    procedure btnFinalizarPenetracaoClick(Sender: TObject);
    procedure btnIniciarCalibracao1Click(Sender: TObject);
    procedure btnIniciarCalibracao2Click(Sender: TObject);
    procedure btnFinalizarCalibracaoClick(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
	private
		{ Private declarations }
	public
		_1stPerf : boolean;
		ADData		: array[0..30000] of word ; //RateChange
		iImpactos : integer ;
		PosicaoX  : LongInt ;
		dMax, dMin, dMaxN			: double 	;
		sResVel 	: string  ;
		vel 			: double ;
		sVeloc  	: string  ;
		sVeloc2   : string	;
		sVeloc3		: string	;
		AcelX			: extended ;
		AcelY     : extended ;
		AcelZ     : extended ;
		valObs    : string;
	end;


var
	// t = (Rate * (HighChan-LowChan)) / Count
    GlobalReads : array[1..2000000] of byte;
    GRIndex : longint;
	sEnsaio : string ;
	frmNovoEnsaio	: TfrmNovoEnsaio;
	//iOldPos				:	integer;
	MemHandle			: integer;
	//sReg    	: string	;
	//STempo 		: string  ;
	sAcelMax, sForcaMax,//sNumImpactos,
	sType, sType2, sType3,
	sAltura , sAltura2,sAltura3, sAlturap,
	sTAlt1, sTAlt2, sTAlt3,
	sLimite1,	sLimite2, sAltSens,
	sTlimite1, sTLimite2 : string ; // Valores da norma de Impacto
	sCEst, sCDin : string ;					// Valores da norma de Cinta
	sVDin : string ;								// Valores da norma de Viseira
	sVno : string ;
	iVno : integer ;
	iPVezes : integer = 0;
	sPDin : string;									// Valores da norma de Perfura��o
	sPno : string ;
	iPno : integer ;
	bCNC : boolean = false;
	bCNCmax : boolean = false ;
	bCNCGlobal : boolean = true ;
	Tinv : boolean = false ;
        bPenet : boolean = false;
	bParar : boolean = false ;
	dVlup, dVldn : double ;
	Pzero, Pelast, Pplast : byte ;
	CPzero, CPelast, CPplast : byte ; //, PTemp : currency;
        Leitura, MaxROCinta : word;
        stopReadROCinta: bool;
	espera : bool ;
	PCNC : bool = true;
	GlobalPicked :  bool = false;
	MTimeout : integer = 30; //timeout ajuste fino motor.
	parcial  : boolean = true ;
	tmpP : byte = 0;
        StopTimerP : boolean = false;
	bCD : boolean = false;
        ImpTimeout : boolean = false; //timeout de ensaio de impacto (queda)
        //Vari�veis de leitura do arquivo 8221.cfg
        sAlturaAI1, sAlturaAI2: string;
        sAlturaTR: string;
        sAlturaPE1, SAlturaPE2: string;
        sAlturaCA1, sAlturaCA2: string;
        sVelocAI1, sVelocAI2: string;
        sVelocTR: string;
        sVelocPE1, SVelocPE2: string;
        sVelocCA1, sVelocCA2: string;
        sTmrMotorAI1, sTmrMotorAI2: string;
        sTmrMotorTR: string;
        sTmrMotorPE1, STmrMotorPE2: string;
        sTmrMotorCA1, sTmrMotorCA2: string;
        sMultiplicadorAI1, sMultiplicadorAI2: string;
        sMultiplicadorTR: string;
        sMultiplicadorPE1, SMultiplicadorPE2: string;
        sMultiplicadorCA1, sMultiplicadorCA2: string;
        sSensCC: string;

const
	FirstPoint : LongInt = 0 ;
	LowChan	   : Integer = 0 ;
	HighChan   : Integer = 2 ;
	Count	   : Integer = 30000 ; // RateChange
        CountTrans : Integer = 10000 ; // RateChange
	Rate	   : LongInt = 10000 ; // Setar p/ (30000-45000) leituras por segundo RateChange
	Range	   : Integer = BIP5VOLTS  ;
	Options	   : Integer = BACKGROUND ;
	LPTControl : word = $0280 ;
	LPTAddress : word = $0278 ;


	implementation


uses uNormas, uCapacetes, uEmpresas, uMachineControl, uGrafico,
	uHelmet, uImpactoPrint, uResultados, uNormaImpacto, uPerfRes, uMisc,
	uPerfPrint, uCintaRes, uCintaPrint, uPos, uCondicionamento, uInvalid, uAtrito, uGeral, uP,
  uDiagnostico, uAutoTeste, uResultadosTrans, uTransmissaoPrint,
  uGraficoTrans, uResultadosPenet, uPenetracaoPrint, uResultadosCal,
  uCalibracaoPrint ;

{$R *.DFM}

{===============================================================================
  DELAY DELAY DELAY DELAY DELAY DELAY DELAY DELAY DELAY DELAY DELAY DELAY DELAY
===============================================================================}
procedure TfrmNovoEnsaio.Delay (iMSecs: integer);
var
	lFirstTickCount	: longint;
begin
	lFirstTickCount := GetTickCount;
	repeat
		Application.ProcessMessages ;
	until ((GetTickCount - lFirstTickCount) >= longint(iMSecs));
        frmHelmet.tmrStatus.Enabled := false;   // RGN
end;

procedure TfrmNovoEnsaio.DelayRegua (iMSecs: integer);
var
	lFirstTickCount	: longint;
begin
	lFirstTickCount := GetTickCount;
	repeat
	until ((GetTickCount - lFirstTickCount) >= longint(iMSecs));
end;



{===============================================================================
	FORMCREATE FORMCREATE FORMCREATE FORMCREATE FORMCREATE FORMCREATE
===============================================================================}
procedure TfrmNovoEnsaio.FormCreate(Sender : TObject);
begin
        CbDBitOut(0, AUXPORT, 6, 0) ;  // 8221
        CbDBitOut(0, AUXPORT, 4, 1) ;  // 8221

	frmMachineControl.ComandoMotor('AM10'+#13) ;
	_1stPerf := true;
        nbPages.PageIndex := 0;

        LoadNorma8221Values(extractfilepath(application.exename)+'8221.cfg');
end;


{===============================================================================
    FORMSHOW FORMSHOW FORMSHOW FORMSHOW FORMSHOW FORMSHOW FORMSHOW FORMSHOW
===============================================================================}
procedure TfrmNovoEnsaio.FormShow(Sender: TObject);
begin
		GetCombos;
end;


{===============================================================================
	IMPACTOCLICK IMPACTOCLICK IMPACTOCLICK IMPACTOCLICK IMPACTOCLICK
===============================================================================}
procedure TfrmNovoEnsaio.btnImpactoClick(Sender: TObject);
var
	iItem	:	integer;
begin
        //frmAutoTeste.ShowModal();      // 250219 tira AutoTeste

	sEnsaio := 'IMPACTO' ;
        cbStopBackground(0);
	tmrParar.enabled := true;
        bCNC := true;
	nbPages.PageIndex := 1;
	// Manda Porta abrir
	//cbDBitOut( 0, FIRSTPORTA, 18, 0) ;
        CbDBitOut(0, AUXPORT, 4, 1) ;    // 8221

end;


{===============================================================================
	PERFURACAOCLICK PERFURACAOCLICK PERFURACAOCLICK PERFURACAOCLICK
===============================================================================}
procedure TfrmNovoEnsaio.btnTransmissaoClick(Sender: TObject);
var iItem	:	integer;
begin
	sEnsaio := 'TRANSMISSAO';
        cbStopBackground(0);
	tmrParar.enabled := true;
        bCNC := true;
	nbPages.PageIndex := 1;
	// Manda Porta abrir
        CbDBitOut(0, AUXPORT, 4, 1) ;    // 8221
end;


{===============================================================================
	VISEIRACLICK VISEIRACLICK VISEIRACLICK VISEIRACLICK VISEIRACLICK
===============================================================================}
procedure TfrmNovoEnsaio.btnPenetracaoClick(Sender: TObject);
var iItem	:	integer;
begin
	sEnsaio := 'PENETRACAO';
        cbStopBackground(0);
	tmrParar.enabled := true;
        bCNC := true;
	nbPages.PageIndex := 1;
	// Manda Porta abrir
        CbDBitOut(0, AUXPORT, 4, 1) ;    // 8221
end;


{===============================================================================
	FORMULARIOGERALCONTINUARCLICK FORMULARIOGERALCONTINUARCLICK
===============================================================================}
procedure TfrmNovoEnsaio.btnFormularioGeralContinuarClick(Sender: TObject);
var iNormasCount : integer ;
	mbox : string;
        iFMO : integer;
begin
        frmMachineControl.ComandoMotor('SO1H'+#13);

	if sEnsaio = 'IMPACTO' then
	begin
                valObs := edObs.Text;
		MTimeout := 240 ;
		tmrDanger.enabled := true ;
		nbPages.PageIndex := 2;
	end;


	if sEnsaio = 'TRANSMISSAO' then
	begin
                valObs := edObs.Text;
                GetNormaTransmissaoValues ;
		WriteMainPageTrans ;
		MTimeout := 240 ;
		tmrDanger.enabled := true ;
		nbPages.PageIndex := 2;
	end;


	if sEnsaio = 'PENETRACAO' then
	begin
                valObs := edObs.Text;
		MTimeout := 240 ;
		tmrDanger.enabled := true ;
		nbPages.PageIndex := 2;
	end;


	if sEnsaio = 'CALIBRACAO' then
	begin
                valObs := edObs.Text;
		MTimeout := 240 ;
		tmrDanger.enabled := true ;
		nbPages.PageIndex := 2;
	end;

	if sEnsaio = 'VISEIRA' then
	begin
		for iNormasCount := 0 to (frmNormas.lvNormasViseira.Items.Count-1) do
		begin
        		if cbNormaUtilizar.text = frmNormas.lvNormasViseira.Items.Item[(iNormasCount)].caption then
			begin
				frmHelmet.NormaAtual := iNormasCount ;
				GetNViseiraValues ;
			end;
		end;
		ResetOD;
		if (frmP.cbAlways.Enabled = true or _1stPerf = true) then
		begin
			tmrPerf.enabled := true;
			nbPages.PageIndex := 6;
		end
                else
                        nbPages.PageIndex := 7;
	end;

	if sEnsaio = 'PERFURACAO' then
	begin
		for iNormasCount := 0 to (frmNormas.lvNormasPerfuracao.Items.Count-1) do
		begin
			if cbNormaUtilizar.text = frmNormas.lvNormasPerfuracao.Items.Item[(iNormasCount)].caption then
			begin
				frmHelmet.NormaAtual := iNormasCount ;
				GetNPerfValues ;
			end;
        	end;
	        ResetOD;

                if _1stPerf=true then
                begin
                        tmrPerf.enabled:=true;
                        nbPages.PageIndex:=6;
                end
                else
                begin
            	        mbox:=('Deseja manter a posi��o inicial anterior?'+#13#10+'>>'+inttostr(Pzero)+#13#10+'Obs: Obrigat�rio se houve troca de cabe�a.');
            	        if ID_YES=Application.MessageBox(PChar(mbox), 'Posi��o inicial', mb_applmodal+mb_iconquestion+mb_yesno+mb_defbutton1) then
                                nbPages.PageIndex := 7 else nbPages.PageIndex := 6;
                end;

		//if (frmP.cbAlways.Enabled = true or _1stPerf = true) then
		//begin
		//	tmrPerf.enabled := true;
		//	nbPages.PageIndex := 6;
		//end else nbPages.PageIndex := 7;
        end;

	if sEnsaio = 'CINTA' then
	begin
		for iNormasCount := 0 to (frmNormas.lvNormasCinta.Items.Count-1) do
		begin
			if cbNormaUtilizar.text = frmNormas.lvNormasCinta.Items.Item[(iNormasCount)].caption then
			begin
				frmHelmet.NormaAtual := iNormasCount ;
				GetNCintaValues ;
			end;
                end;
			tmrLeitura.enabled := true ;
			nbPages.PageIndex := 9;
        end;

end;


{===============================================================================
	UPDOWNCLICK UPDOWNCLICK UPDOWNCLICK UPDOWNCLICK UPDOWNCLICK UPDOWNCLICK
===============================================================================}
procedure TfrmNovoEnsaio.updownClick(Sender: TObject; Button: TUDBtnType);
begin
	frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[6]+#13) ;
        // 6 - 1cm Move
	if button = btNext then
	begin
		//frmMachineControl.ComandoMotor(#13'H- G'#13);
                frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[4]+#13) ; //MOTOR.RGJ
                // 4 - Move Up
	end
		else
	begin
		if button = btPrev then
			begin
					//frmMachineControl.ComandoMotor(#13'H+ G'#13);
                                        frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[5]+#13) ; //MOTOR.RGJ
                                        // 5 - Move Down
			end;
	end;

end;


{===============================================================================
	ABRIRPORTACLICK ABRIRPORTACLICK ABRIRPORTACLICK ABRIRPORTACLICK
===============================================================================}
procedure TfrmNovoEnsaio.Button1Click(Sender: TObject);
begin
	tmrDanger.Enabled := false ;
        MTimeout := 30;
        lbRest.Caption := '30';

        if (sEnsaio = 'PENETRACAO') then
                nbPages.PageIndex := 13
        else if (sEnsaio = 'TRANSMISSAO') then
                nbPages.PageIndex := 11
        else if (sEnsaio = 'CALIBRACAO') then
                nbPages.PageIndex := 15
        else
                nbPages.PageIndex := 3;
end;

{===============================================================================
	FECHARPORTACLICK FECHARPORTACLICK FECHARPORTACLICK FECHARPORTACLICK
===============================================================================}
procedure TfrmNovoEnsaio.btnFecharPortaClick(Sender: TObject);
	var 	        iGarra  : word;
                        iPorta  : integer;
                        iFMO  : integer;
			sMotor  : string    ;
			laltura : longint   ;
			temp1   : integer;
                        temp2   : word ;
			vezes,x	: integer   ;
			mili		: extended  ;
			gx, gy, gz : double ;
			actual, last, temp : double ;
			n				: double		;
			sForm		: string		;
			iStatus : integer		;
			iCurIndex : integer ;
			iCurCount : integer ;
			iErr			: integer ;
			ways : integer ;
                        max : integer;
                        tempoIni : longint;
                        iStepsM: longint;
                        iVelCtr: longint;
begin
        frmMachineControl.ComandoMotor('AM10'+#13);
        // frmMachineControl.ComandoMotor('SO1H'+#13);

        //Antes de tudo, verificar Garra Presa
        iGarra := frmMachineControl.readTravaGarra();

        if iGarra = -1 then
        begin
                ShowMessage('Erro Lendo Sensor da Trava!');
                Exit;
        end;

        if iGarra = 1 then
        begin
                ShowMessage('Prenda a trava antes de iniciar o ensaio.');
                Exit;
        end;

	//Inicializa vari�veis
	bParar := False ;
	x			 := 0			;
	n 		 := 0 		;
	temp1  := 65535 ;
	temp2  := 0 		;
	vezes  := 0 		;
	iPorta := 1 		;
	iGarra := 0			;
	iStatus := RUNNING ;
	actual := -500	;
	ways := 0;
        ImpTimeout := False;
	MemHandle := cbWinBufAlloc(Count) ;
			frmNovoEnsaio.btnFecharPorta.Enabled  := false ; //aqui
			frmNovoEnsaio.btnFecharPorta2.Enabled := false ; //aqui
			frmNovoEnsaio.btnFecharPorta3.Enabled := false ; //aqui
	SetStatus('');

	espera := false ;

	// Reseta opera��es de background
        cbStopBackground(0) ;

        if frmHelmet.DesPorta = false then
        begin
        	// Manda Porta fechar
                SetStatus('Closing door...');
                cbDBitOut(0, AUXPORT, 4, 0);
        end;

	// N�o prosseguir enquanto n�o fechar totalmente a porta
        if frmHelmet.DesPorta = false then
        begin
        	SetStatus('Waiting for door closed..');
                //iPorta := frmMachineControl.readPorta();
                cbDBitIn(0, AUXPORT, 1, iPorta);
	        while iPorta = 1 do
        	begin
	        	Application.ProcessMessages ;
                        //iPorta := frmMachineControl.readPorta();
                        cbDBitIn(0, AUXPORT, 1, iPorta);
                        frmMachineControl.Delay(50);  // RGJ
        		if (bParar = true) then exit ;
	        end;
        end;

    	// Configura par�metros para subida do motor
	SetStatus('Configuring step motor parameters..');

        tmrDanger.enabled := false ;
        tmrDesligaMotor.enabled := false ;

	// Mandar motor subir
        iStepsM := 151359; // 11- Steps/M: 250000
        laltura := Trunc(iStepsM * StrToFloat(sAltura)) ; //MOTOR.RGJ
        sMotor := inttostr(laltura);

        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL'+inttostr(laltura)+#13);
//        frmMachineControl.ComandoMotor('DC'+inttostr(laltura-10)+#13);
//        frmMachineControl.ComandoMotor('FO1L'+#13);
	SetStatus('Motor command ('+sMotor+') - Estimated Time:' + floattostr(Trunc((StrToFloat(sAltura) * iStepsM)))); //MOTOR.RGJ
        //frmMachineControl.Delay(5000);       // MUDAR e acrescentar al�m do tempo certo o FCA
        if sAltura = '3,5' then
                frmMachineControl.Delay(StrToInt(sTmrMotorAI1))
        else
                frmMachineControl.Delay(StrToInt(sTmrMotorAI2));



        //frmMachineControl.ComandoMotor('FL'+inttostr(laltura)+#13); // 4 - Move Up MOTOR.RGJ

{        //Aguarda Subida do Motor
        cbDBitIn(0, AUXPORT, 2, iFMO);
        while (iFMO = 1) do
	begin
                Application.ProcessMessages;
                cbDBitIn(0, AUXPORT, 2, iFMO);
        end;
        frmNovoEnsaio.Delay (500) ; //MOTOR.RGJ
        frmMachineControl.ComandoMotor('SO1H'+#13);
}
	if (bParar = true) then exit ;

       // Seta o tempo do timer e habilita
	//tmrParar.Interval :=  9000;
	//tmrParar.enabled := true ;

        if frmHelmet.desSensVel = false then
                CbDBitOut(0, AUXPORT, 6, 1) ; //Ligar Sensor de Velocidade

	SetStatus('Command Open hook');
        //Abrir Garra
        frmMachineControl.AbrirGarra();

	iGarra := 0;
	SetStatus('Waiting for falling support...');
	while ((iGarra = 0) and (bParar = false)) do //Espera at� garra abrir totalmente
	begin
		Application.ProcessMessages ;
                iGarra := frmMachineControl.readTravaGarra();
                frmMachineControl.Delay(50);
		Application.ProcessMessages ;
	end;

	tmrParar.enabled := false ;
	if (bParar = true) then
	begin // Sai da funcao e vai para tela de emergencia
		frmNovoEnsaio.nbPages.PageIndex := 5;
		frmNovoEnsaio.nbPages.ActivePage := 'Emerg�ncia' ;
		Application.ProcessMessages;
		exit ;
	end;

        tmrImpTimeout.enabled := True; //Ativa timer de timeout de queda

	SetStatus('Starting analog reading...');
	// Habilita o timer que ap�s .5 seg. fecha novamente a garra
	tgarra.enabled := true ;


        tmrParar.enabled := false;
	// Inicia leitura do aceler�metro
	iErr := cbAInScan( 0, LowChan, HighChan, Count, Rate, BIP5VOLTS, MemHandle, Options) ;
	if iErr <> 0 then ShowMessage('Erro inciando leitura anal�gica') ;

        vel := 0;
        if frmHelmet.DesSensVel = false then
        begin
                temp2:=0;
        	iErr := cbCLoad(0, LOADREG, 0);
	        if iErr <> 0 then ShowMessage('Erro ao carregar sensor de Velocidade.');
                CbDBitOut(0, AUXPORT, 7, 1) ; // permite contar

	        // Entra no Loop de Velocidade
        	SetStatus('Waiting for velocity changing');
                temp1 := 0;
                //Esperar pelo sinal do sensor de velocidade
                while (temp1 = 0) do
                begin
                      cbDBitIn(0, AUXPORT, 3, temp1);
                end;

                //Esperar pelo t�rmino do sinal do sensor de velocidade
                while (temp1 = 1) do
                begin
                        cbDBitIn(0, AUXPORT, 3, temp1);
                end;

	        // Le velocidade
                cbCin(0, LOADREG,temp2);
        	SetStatus('Velocity measured');
                // frmMachineControl.Delay(60);

	        sAltSens  := '25';
                iVelCtr := strtoint(frmHelmet.lstMotor.Lines[13]); // 13- Velocity Pulse Adjust
                if sAltura = '3,5' then
	                mili   := temp2 / 1000 * StrToFloat(sMultiplicadorAI1)     //250218 velocidade
                else
                        mili   := temp2 / 1000 * StrToFloat(sMultiplicadorAI2);
                vel := (strtofloat(sAltSens)) / mili;
                //vel := 3.7;

                //Desligar Sensor de Velocidade
                CbDBitOut(0, AUXPORT, 6, 0);
        end;

	SetStatus('Setting result form values..');
	frmResultados.lbTemp.Font.Color := clLime ;
	Tinv := false;
        if frmHelmet.DesSensVel = false then
        begin
        	if not ((vel <= (strtofloat(sVeloc)+dVlup)) and (vel >= (strtofloat(sVeloc)-dVldn))) then
	        begin
		        frmInvalid.Show ;
        		bCNC := false ;
	        	Tinv := true;
		        frmResultados.lbTemp.Font.Color := clRed ;
        	end ;
        end;

	sVeloc := formatfloat('###0.00', vel) ;
	sResVel := sVeloc ;
	frmResultados.lbTemp.Caption := sVeloc + ' m/s' ;
        frmImpactoPrint.stVelReal.Caption := sVeloc + ' m/s' ;

	// Pega valores do aceler�metro na placa
	setStatus('Getting analog board data...');

	repeat
                cbGetStatus( 0, iStatus, iCurCount, iCurIndex) ;
                if ImpTimeout then
                begin
                        ShowMessage('Tempo de Ensaio Excedido.');
                        break;
                end;
	until iStatus = IDLE ;

	cbWinBufToArray(MemHandle, ADData[0], FirstPoint, Count) ;
        cbStopBackground(0);
        //tmrParar.enabled := true;

	// Tra�a gr�fico
	frmGrafico.lsX.Clear ;
	frmGrafico.lsY.Clear ;
	frmGrafico.lsZ.Clear ;
	frmGrafico.lsLinha.Clear ;
        frmGrafico.lsResult.Clear;
	SetStatus('Formatting graphic values..');
        max := 0;
	while x < 30000 do // RateChange
	begin
                //if ImpTimeout then
                        //exit;
                if ADData[x] > max then
                        max := ADData[x];

                if ADData[x+1] > max then
                        max := ADData[x+1];

                if ADData[x+2] > max then
                        max := ADData[x+2];

                //gx :=  ((((ADData[x] * 10)/65535)-5)*1000)/10;
                gx :=  ((((ADData[x] * 10)/65535)-5)*1000)/AcelX;
                //gy :=  ((((ADData[x+1] * 10)/65535)-5)*1000)/10;
                gy :=  ((((ADData[x+1] * 10)/65535)-5)*1000)/AcelY;
                //gz :=  ((((ADData[x+2] * 10)/65535)-5)*1000)/10;
                gz :=  ((((ADData[x+2] * 10)/65535)-5)*1000)/AcelZ;

                frmGrafico.lsX.AddXY(n, gx, '', RGB (255,0,0)) ;
                frmGrafico.lsY.AddXY(n, gy, '', RGB (0,255,0)) ;
                frmGrafico.lsZ.AddXY(n, gz, '', RGB (255,255,0)) ;

                temp := sqr(gx)+ sqr(gy) + sqr(gz) ;
                last := sqrt(temp) ;
                if last > actual then
                begin
                        actual := last;
                        PosicaoX := Trunc(1 + (( x + 2) / 3 )) ;
                end;

                frmGrafico.lsLinha.AddXY (n, last, '', RGB (0, 0, 255));
                frmGrafico.lsResult.AddXY (n, last, '', RGB (0, 0, 255));
                Inc(x, 3);
                n := (n + strtofloat('0,1')); // Alterar incremento RateChange
                dmax := actual ;
        end;

        frmNovoEnsaio.btnFecharPorta.Enabled := true ;
        // Exibe resultados

        tmrImpTimeout.Enabled := False;
        // Passa para pr�xima tela
        SetStatus('End process.');
        nbPages.PageIndex := 4 ;
end;

procedure TfrmNovoEnsaio.fcnIniciarEnsaioTransmissao(Sender: TObject);
	var 	        iGarra  : word;
                        iPorta  : integer;
                        iFMO  : integer;
			sMotor  : string    ;
			laltura : longint   ;
			temp1   : integer;
                        temp2   : word ;
			vezes,x	: integer   ;
			mili		: extended  ;
                        dataValueIni, dataValueFinal: longint;
                        dataValue : word;
			gx, gy, gz : double ;
			actual, last, temp : double ;
			n				: double		;
			sForm		: string		;
			iStatus : integer		;
			iCurIndex : integer ;
			iCurCount : integer ;
			iErr			: integer ;
			ways : integer ;
                        max : integer;
                        tempoIni : longint;
                        iStepsM: longint;
                        iVelCtr: longint;
                        dMiliVolts: double;
begin
        frmMachineControl.ComandoMotor('AM10'+#13);
//        frmMachineControl.ComandoMotor('SO1H'+#13);

        //Antes de tudo, verificar Garra Presa
        iGarra := frmMachineControl.readTravaGarra();

{        if iGarra = -1 then
        begin
                ShowMessage('Erro Lendo Sensor da Trava!');
                Exit;
        end;
}
        if iGarra = 1 then
        begin
                ShowMessage('Prenda a trava antes de iniciar o ensaio.');
                Exit;
        end;

	//Inicializa vari�veis
	bParar := False ;
	x := 0;
	n := 0;
	temp1  := 65535 ;
	temp2  := 0;
	vezes  := 0;
	iPorta := 1;
	iGarra := 0;
	iStatus := RUNNING ;
	actual := -500	;
	ways := 0;
        ImpTimeout := False;
	MemHandle := cbWinBufAlloc(CountTrans) ;
	frmNovoEnsaio.btnIniciarTransmissao1.Enabled  := false;
	frmNovoEnsaio.btnIniciarTransmissao2.Enabled := false;

	SetStatus('');

	espera := false ;

	// Reseta opera��es de background
        cbStopBackground(0) ;

        if frmHelmet.DesPorta = false then
        begin
        	// Manda Porta fechar
                SetStatus('Closing door...');
                cbDBitOut(0, AUXPORT, 4, 0);
        end;

	// N�o prosseguir enquanto n�o fechar totalmente a porta
        if frmHelmet.DesPorta = false then
        begin
        	SetStatus('Waiting for door closed..');
                //iPorta := frmMachineControl.readPorta();
                cbDBitIn(0, AUXPORT, 1, iPorta);
	        while iPorta = 1 do
        	begin
	        	Application.ProcessMessages ;
                        //iPorta := frmMachineControl.readPorta();
                        cbDBitIn(0, AUXPORT, 1, iPorta);
                        frmMachineControl.Delay(50);  // RGJ
        		if (bParar = true) then exit ;
	        end;
        end;

    	// Configura par�metros para subida do motor
	SetStatus('Configuring step motor parameters..');

        tmrDanger.enabled := false ;
        tmrDesligaMotor.enabled := false ;

	// Mandar motor subir
        iStepsM := 151359; // 11- Steps/M: 250000
        laltura := Trunc(iStepsM * StrToFloat(sAltura)) ; //MOTOR.RGJ     '1,543'
        // laltura := Trunc(iStepsM * StrToFloat('0,543')) ; //MOTOR.RGJ     '1,543'
        sMotor := inttostr(laltura);

        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL'+inttostr(laltura)+#13);
	SetStatus('Motor command ('+sMotor+') - Estimated Time:' + floattostr(Trunc((StrToFloat(sAltura) * iStepsM)))); //MOTOR.RGJ

        //frmMachineControl.Delay(12000);         // MUDAR e acrescentar al�m do tempo certo o FCA
        frmMachineControl.Delay(StrToInt(sTmrMotorTR));

{
        frmMachineControl.ComandoMotor('DI'+inttostr(laltura)+#13);
        frmMachineControl.ComandoMotor('DC'+inttostr(laltura-1000)+#13);
        frmMachineControl.ComandoMotor('FO1L'+#13);
        frmMachineControl.Delay(11000);         // MUDAR e acrescentar al�m do tempo certo o FCA
        frmMachineControl.ComandoMotor('SO1L'+#13);

        //frmMachineControl.ComandoMotor('FL'+inttostr(laltura)+#13); // 4 - Move Up MOTOR.RGJ
	SetStatus('Motor command ('+sMotor+') - Estimated Time:' + floattostr(Trunc((StrToFloat(sAltura) * iStepsM)))); //MOTOR.RGJ

        //Aguarda Subida do Motor
        cbDBitIn(0, AUXPORT, 2, iFMO);
        while (iFMO = 1) do
	begin
                Application.ProcessMessages;
                cbDBitIn(0, AUXPORT, 2, iFMO);
        end;

	SetStatus('Motor command ('+sMotor+') - Estimated Time:' + floattostr(Trunc((StrToFloat(sAltura) * iStepsM)))); //MOTOR.RGJ
        frmNovoEnsaio.Delay (1000) ; //MOTOR.RGJ
        frmMachineControl.ComandoMotor('SO1H'+#13);
}
	if (bParar = true) then exit ;

        if frmHelmet.desSensVel = false then
                CbDBitOut(0, AUXPORT, 6, 1) ; //Ligar Sensor de Velocidade

	SetStatus('Command Open hook');
        //Abrir Garra
        frmMachineControl.AbrirGarra();

	iGarra := 0;
	SetStatus('Waiting for falling support...');
	while ((iGarra = 0) and (bParar = false)) do //Espera at� garra abrir totalmente
	begin
		Application.ProcessMessages ;
                iGarra := frmMachineControl.readTravaGarra();
                frmMachineControl.Delay(50);
		Application.ProcessMessages ;
	end;

	if (bParar = true) then
	begin // Sai da funcao e vai para tela de emergencia
		frmNovoEnsaio.nbPages.PageIndex := 5;
		frmNovoEnsaio.nbPages.ActivePage := 'Emerg�ncia' ;
		Application.ProcessMessages;
		exit ;
	end;

        tmrImpTimeout.enabled := True; //Ativa timer de timeout de queda

	SetStatus('Starting analog reading...');
	// Habilita o timer que ap�s .5 seg. fecha novamente a garra
	// tgarra.enabled := true ;

        tmrParar.enabled := false;
	// Inicia leitura do aceler�metro

        //Neto descontar valor inicial - Ler Valor Inicial
        if (cbAIn(0, 3, BIP5VOLTS, dataValue) <> 0) then
                ShowMessage('Erro Lendo Transdutor de For�a!');

        dataValueIni := dataValue - 32768;


	iErr := cbAInScan( 0, 3, 3, CountTrans, Rate, BIP5VOLTS, MemHandle, Options) ;
	if iErr <> 0 then ShowMessage('Erro inciando leitura anal�gica') ;

        vel := 0;
        if frmHelmet.DesSensVel = false then
        begin
                temp2:=0;
        	iErr := cbCLoad(0, LOADREG, 0);
	        if iErr <> 0 then ShowMessage('Erro ao carregar sensor de Velocidade.');
                CbDBitOut(0, AUXPORT, 7, 1) ; // permite contar

	        // Entra no Loop de Velocidade
        	SetStatus('Waiting for velocity changing');
                temp1 := 0;
                //Esperar pelo sinal do sensor de velocidade
                while (temp1 = 0) do
                begin
                      cbDBitIn(0, AUXPORT, 3, temp1);
                end;

                //Esperar pelo t�rmino do sinal do sensor de velocidade
                while (temp1 = 1) do
                begin
                        cbDBitIn(0, AUXPORT, 3, temp1);
                end;

	        // Le velocidade
                cbCin(0, LOADREG,temp2);
        	SetStatus('Velocity measured');
                // frmMachineControl.Delay(60);    evitar repique

	        sAltSens  := '25';
                iVelCtr := strtoint(frmHelmet.lstMotor.Lines[13]); // 13- Velocity Pulse Adjust
                mili   := temp2 / 1000 * StrToFloat(sMultiplicadorTR);

                vel := (strtofloat(sAltSens)) / mili;
                //vel := 5.5;

                //Desligar Sensor de Velocidade
                CbDBitOut(0, AUXPORT, 6, 0);
        end;

	SetStatus('Setting result form values..');
	frmResultadosTrans.lbTemp.Font.Color := clLime ;
	Tinv := false;
        if frmHelmet.DesSensVel = false then
        begin
        	if not ((vel <= (strtofloat(sVeloc)+dVlup)) and (vel >= (strtofloat(sVeloc)-dVldn))) then
	        begin
		        frmInvalid.Show ;
        		bCNC := false ;
	        	Tinv := true;
		        frmResultadosTrans.lbTemp.Font.Color := clRed ;
        	end ;
        end;

	sVeloc := formatfloat('###0.00', vel) ;
	sResVel := sVeloc ;
	frmResultadosTrans.lbTemp.Caption := sVeloc + ' m/s' ;
        frmTransmissaoPrint.stVelReal.Caption := sVeloc + ' m/s' ;

	// Pega valores do aceler�metro na placa
	setStatus('Getting analog board data...');

	repeat
                cbGetStatus( 0, iStatus, iCurCount, iCurIndex) ;
                if ImpTimeout then
                begin
                        ShowMessage('Tempo de Ensaio Excedido.');
                        break;
                end;
	until iStatus = IDLE ;

	cbWinBufToArray(MemHandle, ADData[0], FirstPoint, CountTrans) ;
        cbStopBackground(0);
        //tmrParar.enabled := true;
	// Tra�a gr�fico
	frmGraficoTrans.lsX.Clear ;
	SetStatus('Formatting graphic values..');
        max := 0;
	while x < 10000 do // RateChange
	begin
                //Neto descontar valor inicial - Desvontar Valor Inicial

                dataValueFinal := ADData[x] - dataValueIni;
                
                if dataValueFinal > max then
                        max := dataValueFinal;

                dMiliVolts := (((dataValueFinal * 10)/65535)-5)*1000;

                gx := (4903/5000) * dMiliVolts;

                frmGraficoTrans.lsX.AddXY(n, gx, '', RGB (255,0,0)) ;
                temp := gx;
                last := gx;
                if last > actual then
                begin
                        actual := last;
                        PosicaoX := Trunc(1 + (( x + 2) / 3 )) ;
                end;

                Inc(x, 1);
                n := (n + strtofloat('0,1')); // Alterar incremento RateChange
                dmax := actual ;
        end;

        frmNovoEnsaio.btnIniciarTransmissao1.Enabled := true ;
        frmNovoEnsaio.btnIniciarTransmissao2.Enabled := true ;
        // Exibe resultados

        tmrImpTimeout.Enabled := False;
        // Passa para pr�xima tela
        SetStatus('End process.');
        nbPages.PageIndex := 12 ;
end;

procedure TfrmNovoEnsaio.fcnIniciarEnsaioPenetracao(Sender: TObject);
	var 	        iGarra  : word;
                        iPorta  : integer;
                        iFMO  : integer;
			sMotor  : string    ;
			laltura : longint   ;
			temp1   : integer;
                        temp2   : word ;
			vezes,x	: integer   ;
			mili		: extended  ;
			gx, gy, gz : double ;
			actual, last, temp : double ;
			n				: double		;
			sForm		: string		;
			iStatus : integer		;
			iCurIndex : integer ;
			iCurCount : integer ;
			iErr			: integer ;
			ways : integer ;
                        max, min : integer;
                        tempoIni : longint;
                        iStepsM: longint;
                        iVelCtr: longint;
                        dMiliVolts: double;
                        dataValue: word;
                        lTempoIni: longint;
begin
        frmMachineControl.ComandoMotor('AM10'+#13);
//        frmMachineControl.ComandoMotor('SO1H'+#13);

        //Antes de tudo, verificar Garra Presa
        iGarra := frmMachineControl.readTravaGarra();

        if iGarra = -1 then
        begin
                ShowMessage('Erro Lendo Sensor da Trava!');
                Exit;
        end;

        if iGarra = 1 then
        begin
                ShowMessage('Prenda a trava antes de iniciar o ensaio.');
                Exit;
        end;

	//Inicializa vari�veis
	bParar := False ;
	x := 0;
	n := 0;
	temp1  := 65535 ;
	temp2  := 0;
	vezes  := 0;
	iPorta := 1;
	iGarra := 0;
	iStatus := RUNNING ;
	actual := -500	;
	ways := 0;
        bPenet := false;
        ImpTimeout := False;
	MemHandle := cbWinBufAlloc(Count) ;
	frmNovoEnsaio.btnIniciarPenetracao1.Enabled  := false;
	frmNovoEnsaio.btnIniciarPenetracao2.Enabled := false;

	SetStatus('');

	espera := false ;

	// Reseta opera��es de background
        cbStopBackground(0) ;

        if frmHelmet.DesPorta = false then
        begin
        	// Manda Porta fechar
                SetStatus('Closing door...');
                cbDBitOut(0, AUXPORT, 4, 0);
        end;

	// N�o prosseguir enquanto n�o fechar totalmente a porta
        if frmHelmet.DesPorta = false then
        begin
        	SetStatus('Waiting for door closed..');
                //iPorta := frmMachineControl.readPorta();
                cbDBitIn(0, AUXPORT, 1, iPorta);
	        while iPorta = 1 do
        	begin
	        	Application.ProcessMessages ;
                        //iPorta := frmMachineControl.readPorta();
                        cbDBitIn(0, AUXPORT, 1, iPorta);
                        frmMachineControl.Delay(50);  // RGJ
        		if (bParar = true) then exit ;
	        end;
        end;

    	// Configura par�metros para subida do motor
	SetStatus('Configuring step motor parameters..');

        tmrDanger.enabled := false ;
        tmrDesligaMotor.enabled := false ;

	// Mandar motor subir
        iStepsM := 151359; // 11- Steps/M: 250000
        laltura := Trunc(iStepsM * StrToFloat(sAltura)) ; //MOTOR.RGJ
        sMotor := inttostr(laltura);

        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL'+inttostr(laltura)+#13);
       	SetStatus('Motor command ('+sMotor+') - Estimated Time:' + floattostr(Trunc((StrToFloat(sAltura) * iStepsM)))); //MOTOR.RGJ

        if sAlturap = '2,5' then
                //frmMachineControl.Delay(19000)         // MUDAR e acrescentar al�m do tempo certo o FCA
                frmMachineControl.Delay(StrToInt(sTmrMotorPE1))
        else
                //frmMachineControl.Delay(10000);         // MUDAR e acrescentar al�m do tempo certo o FCA
                frmMachineControl.Delay(StrToInt(sTmrMotorPE2));


{        frmMachineControl.ComandoMotor('DI'+inttostr(laltura)+#13);
        frmMachineControl.ComandoMotor('DC'+inttostr(laltura-1000)+#13);
        frmMachineControl.ComandoMotor('FO1L'+#13);
        frmMachineControl.Delay(10000);         // MUDAR e acrescentar al�m do tempo certo o FCA
        frmMachineControl.ComandoMotor('SO1L'+#13);

        //frmMachineControl.ComandoMotor('FL'+inttostr(laltura)+#13); // 4 - Move Up MOTOR.RGJ
	SetStatus('Motor command ('+sMotor+') - Estimated Time:' + floattostr(Trunc((StrToFloat(sAltura) * iStepsM)))); //MOTOR.RGJ

        //Aguarda Subida do Motor
        cbDBitIn(0, AUXPORT, 2, iFMO);
        while (iFMO = 1) do
	begin
                Application.ProcessMessages;
                cbDBitIn(0, AUXPORT, 2, iFMO);
        end;
        frmNovoEnsaio.Delay (1000) ; //MOTOR.RGJ
        frmMachineControl.ComandoMotor('SO1H'+#13);
}
	if (bParar = true) then exit ;

        if frmHelmet.desSensVel = false then
                CbDBitOut(0, AUXPORT, 6, 1) ; //Ligar Sensor de Velocidade

	SetStatus('Command Open hook');
        //Abrir Garra
        frmMachineControl.AbrirGarra();

	iGarra := 0;
	SetStatus('Waiting for falling support...');
	while ((iGarra = 0) and (bParar = false)) do //Espera at� garra abrir totalmente
	begin
		Application.ProcessMessages ;
                iGarra := frmMachineControl.readTravaGarra();
                frmMachineControl.Delay(50);
		Application.ProcessMessages ;
	end;

	if (bParar = true) then
	begin // Sai da funcao e vai para tela de emergencia
		frmNovoEnsaio.nbPages.PageIndex := 5;
		frmNovoEnsaio.nbPages.ActivePage := 'Emerg�ncia' ;
		Application.ProcessMessages;
		exit ;
	end;

        tmrImpTimeout.enabled := True; //Ativa timer de timeout de queda

	SetStatus('Starting analog reading...');
	// Habilita o timer que ap�s .5 seg. fecha novamente a garra
	tgarra.enabled := true ;


	tmrParar.enabled := false ;
	// Inicia leitura do aceler�metro
        Rate := Count;
	iErr := cbAInScan( 0, 7, 7, Count, Rate, BIP5VOLTS, MemHandle, Options) ;
	if iErr <> 0 then ShowMessage('Erro inciando leitura anal�gica') ;

        vel := 0;
        if frmHelmet.DesSensVel = false then
        begin
                temp2:=0;
        	iErr := cbCLoad(0, LOADREG, 0);
	        if iErr <> 0 then ShowMessage('Erro ao carregar sensor de Velocidade.');
                CbDBitOut(0, AUXPORT, 7, 1) ; // permite contar

	        // Entra no Loop de Velocidade
        	SetStatus('Waiting for velocity changing');
                temp1 := 0;
                //Esperar pelo sinal do sensor de velocidade
                while (temp1 = 0) do
                begin
                      cbDBitIn(0, AUXPORT, 3, temp1);
                end;

                //Esperar pelo t�rmino do sinal do sensor de velocidade
                while (temp1 = 1) do
                begin
                        cbDBitIn(0, AUXPORT, 3, temp1);
                end;

	        // Le velocidade
                cbCin(0, LOADREG,temp2);
        	SetStatus('Velocity measured');
                // frmMachineControl.Delay(60);

                //verificar contato pun��o
                {max := 0;
                lTempoIni := GetTickCount;
                while GetTickCount-lTempoIni < 500 do
                begin
                        if (cbAIn(0, 1, BIP5VOLTS, DataValue) <> 0) then
                        begin
                                //ShowMessage('Erro Lendo Contato Pun��o!');
                                SetStatus('Erro Lendo Contato Pun��o!');
                                bParar := true;
                        end
                        else
                        begin
                                if (DataValue) > max then
                                        max := DataValue
                        end;
                end;}

	        sAltSens  := '25';
                iVelCtr := strtoint(frmHelmet.lstMotor.Lines[13]); // 13- Velocity Pulse Adjust
                if sAlturap = '2,5' then
                        mili   := temp2 / 1000 * StrToFloat(sMultiplicadorPE1)       //250218 velocidade
                else
                        mili   := temp2 / 1000 * StrToFloat(sMultiplicadorPE2) ;     //250218 velocidade

                vel := (strtofloat(sAltSens)) / mili;
                //vel := 5.5;

                //Desligar Sensor de Velocidade
                CbDBitOut(0, AUXPORT, 6, 0);

        end;

	SetStatus('Setting result form values..');
	frmResultadosPenet.lbTemp.Font.Color := clLime ;
	Tinv := false;
        if frmHelmet.DesSensVel = false then
        begin
        	if not ((vel <= (strtofloat(sVeloc)+dVlup)) and (vel >= (strtofloat(sVeloc)-dVldn))) then
	        begin
		        frmInvalid.Show ;
        		bCNC := false ;
	        	Tinv := true;
		        frmResultadosPenet.lbTemp.Font.Color := clRed ;
        	end ;
        end;

	sVeloc := formatfloat('###0.00', vel) ;
	sResVel := sVeloc ;
	frmResultadosPenet.lbTemp.Caption := sVeloc + ' m/s' ;
        frmPenetracaoPrint.stVelReal.Caption := sVeloc + ' m/s' ;

	// Pega valores do aceler�metro na placa
	setStatus('Getting analog board data...');

	repeat
                cbGetStatus( 0, iStatus, iCurCount, iCurIndex) ;
                if ImpTimeout then
                begin
                        ShowMessage('Tempo de Ensaio Excedido.');
                        break;
                end;
	until iStatus = IDLE ;

	cbWinBufToArray(MemHandle, ADData[0], FirstPoint, Count) ;
        cbStopBackground(0);
       	//tmrParar.enabled := true;


	// Verifica se houve penetra��o (contato pun��o)
	max := 0;
        min := 65535;
	while x < Count do // RateChange
	begin
                if ADData[x] > max then
                        max := ADData[x];
                if ADData[x] < min then
                        min := ADData[x];

                Inc(x, 1);
        end;
        dmax := max;
        dmin := min;

        frmNovoEnsaio.btnIniciarPenetracao1.Enabled := true ;
        frmNovoEnsaio.btnIniciarPenetracao2.Enabled := true ;
        // Exibe resultados

        tmrImpTimeout.Enabled := False;
        // Passa para pr�xima tela
        SetStatus('End process.');
        nbPages.PageIndex := 14 ;
end;


{===============================================================================
	fcnIniciarCalibracao
===============================================================================}
procedure TfrmNovoEnsaio.fcnIniciarCalibracao(Sender: TObject);
	var 	        iGarra  : word;
                        iPorta  : integer;
                        iFMO  : integer;
			sMotor  : string    ;
			laltura : longint   ;
			temp1   : integer;
                        temp2   : word ;
			vezes,x	: integer   ;
			mili		: extended  ;
			gn, gz : double ;
                        dataValueIni, dataValueFinal: longint;
                        dataValue: word;
			actual, last, temp : double ;
			n				: double		;
			sForm		: string		;
			iStatus : integer		;
			iCurIndex : integer ;
			iCurCount : integer ;
			iErr			: integer ;
			ways : integer ;
                        maxG : double;
                        maxN : double;
                        tempoIni : longint;
                        iStepsM: longint;
                        iVelCtr: longint;
                        dMiliVolts: double;
begin
        frmMachineControl.ComandoMotor('AM10'+#13);
//        frmMachineControl.ComandoMotor('SO1H'+#13);

        //Antes de tudo, verificar Garra Presa
        iGarra := frmMachineControl.readTravaGarra();

        if iGarra = -1 then
        begin
                ShowMessage('Erro Lendo Sensor da Trava!');
                Exit;
        end;

        if iGarra = 1 then
        begin
                ShowMessage('Prenda a trava antes de iniciar o ensaio.');
                Exit;
        end;

	//Inicializa vari�veis
	bParar := False ;
	x			 := 0			;
	n 		 := 0 		;
	temp1  := 65535 ;
	temp2  := 0 		;
	vezes  := 0 		;
	iPorta := 1 		;
	iGarra := 0			;
	iStatus := RUNNING ;
	actual := -500	;
	ways := 0;
        ImpTimeout := False;
	MemHandle := cbWinBufAlloc(Count) ;
	frmNovoEnsaio.btnIniciarCalibracao1.Enabled  := false ;
        frmNovoEnsaio.btnIniciarCalibracao2.Enabled  := false ;

	SetStatus('');

	espera := false ;

	// Reseta opera��es de background
        cbStopBackground(0) ;

        if frmHelmet.DesPorta = false then
        begin
        	// Manda Porta fechar
                SetStatus('Closing door...');
                cbDBitOut(0, AUXPORT, 4, 0);
        end;

	// N�o prosseguir enquanto n�o fechar totalmente a porta
        if frmHelmet.DesPorta = false then
        begin
        	SetStatus('Waiting for door closed..');
                //iPorta := frmMachineControl.readPorta();
                cbDBitIn(0, AUXPORT, 1, iPorta);
	        while iPorta = 1 do
        	begin
	        	Application.ProcessMessages ;
                        //iPorta := frmMachineControl.readPorta();
                        cbDBitIn(0, AUXPORT, 1, iPorta);
                        frmMachineControl.Delay(50);  // RGJ
        		if (bParar = true) then exit ;
	        end;
        end;

    	// Configura par�metros para subida do motor
	SetStatus('Configuring step motor parameters..');

        tmrDanger.enabled := false ;
        tmrDesligaMotor.enabled := false ;

	// Mandar motor subir
        iStepsM := 151359; // 11- Steps/M: 250000
        laltura := Trunc(iStepsM * StrToFloat(sAltura)) ; //MOTOR.RGJ
        sMotor := inttostr(laltura);

        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL'+inttostr(laltura)+#13);
//        frmMachineControl.ComandoMotor('DC'+inttostr(laltura-10)+#13);
//        frmMachineControl.ComandoMotor('FO1L'+#13);
	SetStatus('Motor command ('+sMotor+') - Estimated Time:' + floattostr(Trunc((StrToFloat(sAltura) * iStepsM)))); //MOTOR.RGJ

        if sAlturap = '1,0' then
                //frmMachineControl.Delay(8000)         // MUDAR e acrescentar al�m do tempo certo o FCA
                frmMachineControl.Delay(StrToInt(sTmrMotorCA1))
        else
                //frmMachineControl.Delay(5000);         // MUDAR e acrescentar al�m do tempo certo o FCA
                frmMachineControl.Delay(StrToInt(sTmrMotorCA2));


        //frmMachineControl.ComandoMotor('FL'+inttostr(laltura)+#13); // 4 - Move Up MOTOR.RGJ

{        //Aguarda Subida do Motor
        cbDBitIn(0, AUXPORT, 2, iFMO);
        while (iFMO = 1) do
	begin
                Application.ProcessMessages;
                cbDBitIn(0, AUXPORT, 2, iFMO);
        end;
        frmNovoEnsaio.Delay (500) ; //MOTOR.RGJ
        frmMachineControl.ComandoMotor('SO1H'+#13);
}
	if (bParar = true) then exit ;

        if frmHelmet.desSensVel = false then
                CbDBitOut(0, AUXPORT, 6, 1) ; //Ligar Sensor de Velocidade

	SetStatus('Command Open hook');
        //Abrir Garra
        frmMachineControl.AbrirGarra();

	iGarra := 0;
	SetStatus('Waiting for falling support...');
	while ((iGarra = 0) and (bParar = false)) do //Espera at� garra abrir totalmente
	begin
		Application.ProcessMessages ;
                iGarra := frmMachineControl.readTravaGarra();
                frmMachineControl.Delay(50);
		Application.ProcessMessages ;
	end;

	tmrParar.enabled := false ;
	if (bParar = true) then
	begin // Sai da funcao e vai para tela de emergencia
		frmNovoEnsaio.nbPages.PageIndex := 5;
		frmNovoEnsaio.nbPages.ActivePage := 'Emerg�ncia' ;
		Application.ProcessMessages;
		exit ;
	end;

        tmrImpTimeout.enabled := True; //Ativa timer de timeout de queda

	SetStatus('Starting analog reading...');
	// Habilita o timer que ap�s .5 seg. fecha novamente a garra
	tgarra.enabled := true ;


        tmrParar.enabled := false;

        //Neto descontar valor inicial - Ler Valor Inicial
        if (cbAIn(0, 3, BIP5VOLTS, dataValue) <> 0) then
                ShowMessage('Erro Lendo Transdutor de For�a!');

        dataValueIni := dataValue - 32768;


	// Inicia leitura do aceler�metro
        rate := 10000;
	iErr := cbAInScan( 0, 2, 3, 20000, rate, BIP5VOLTS, MemHandle, Options) ;
	if iErr <> 0 then ShowMessage('Erro inciando leitura anal�gica') ;

        vel := 0;
        if frmHelmet.DesSensVel = false then
        begin
                temp2:=0;
        	iErr := cbCLoad(0, LOADREG, 0);
	        if iErr <> 0 then ShowMessage('Erro ao carregar sensor de Velocidade.');
                CbDBitOut(0, AUXPORT, 7, 1) ; // permite contar

	        // Entra no Loop de Velocidade
        	SetStatus('Waiting for velocity changing');
                temp1 := 0;
                //Esperar pelo sinal do sensor de velocidade
                while (temp1 = 0) do
                begin
                      cbDBitIn(0, AUXPORT, 3, temp1);
                end;

                //Esperar pelo t�rmino do sinal do sensor de velocidade
                while (temp1 = 1) do
                begin
                        cbDBitIn(0, AUXPORT, 3, temp1);
                end;

	        // Le velocidade
                cbCin(0, LOADREG,temp2);
        	SetStatus('Velocity measured');
                // frmMachineControl.Delay(60);

	        sAltSens  := '25';
                iVelCtr := strtoint(frmHelmet.lstMotor.Lines[13]); // 13- Velocity Pulse Adjust
	        //mili   := temp2 / 1000 * 0.96 ;     //250218 velocidade
                if sAlturap = '1,0' then
	                mili   := temp2 / 1000 * StrToFloat(sMultiplicadorCA1)     //250218 velocidade
                else
                        mili   := temp2 / 1000 * StrToFloat(sMultiplicadorCA2);

                vel := (strtofloat(sAltSens)) / mili;
                //vel := 3.7;

                //Desligar Sensor de Velocidade
                CbDBitOut(0, AUXPORT, 6, 0);
        end;

	SetStatus('Setting result form values..');
	frmResultadosCal.lbTemp.Font.Color := clLime ;
	Tinv := false;
        if frmHelmet.DesSensVel = false then
        begin
        	if not ((vel <= (strtofloat(sVeloc)+dVlup)) and (vel >= (strtofloat(sVeloc)-dVldn))) then
	        begin
		        frmInvalid.Show ;
        		bCNC := false ;
	        	Tinv := true;
		        frmResultadosCal.lbTemp.Font.Color := clRed ;
        	end ;
        end;

	sVeloc := formatfloat('###0.00', vel) ;
	sResVel := sVeloc ;
	frmResultadosCal.lbTemp.Caption := sVeloc + ' m/s' ;
        frmCalibracaoPrint.stVelReal.Caption := sVeloc + ' m/s' ;

	// Pega valores do aceler�metro na placa
	setStatus('Getting analog board data...');

	repeat
                cbGetStatus( 0, iStatus, iCurCount, iCurIndex) ;
                if ImpTimeout then
                begin
                        ShowMessage('Tempo de Ensaio Excedido.');
                        break;
                end;
	until iStatus = IDLE ;

	cbWinBufToArray(MemHandle, ADData[0], FirstPoint, Count) ;
        cbStopBackground(0);

	SetStatus('Formatting graphic values..');
        maxG := -10000;
        maxN := -10000;
	while x < 20000 do // RateChange
	begin
                gz :=  ((((ADData[x] * 10)/65535)-5)*1000)/AcelZ;
                gz := 3.6*(gz*9.8); //F = m.a a = acelz(g) * 9,8m/s� m = Massa = 3,6Kg

                //Neto//Neto descontar valor inicial - Desvontar Valor Inicial
                dataValueFinal := ADData[x+1] - dataValueIni;

                dMiliVolts := (((dataValueFinal * 10)/65535)-5)*1000;
                gn := (4903/5000) * dMiliVolts;

                //frmGrafico.lsZ.AddXY(n, gz, '', RGB (255,255,0)) ;

                if (gz > maxG) then
                        maxG := gz ;
                if (gn > maxN) then
                        maxN := gn;

                Inc(x, 2);
                n := (n + strtofloat('0,1')); // Alterar incremento RateChange
        end;
        dmax := maxG;
        dmaxN := maxN;

        frmNovoEnsaio.btnIniciarCalibracao1.Enabled := true ;
        frmNovoEnsaio.btnIniciarCalibracao2.Enabled := true ;
        // Exibe resultados

        tmrImpTimeout.Enabled := False;
        // Passa para pr�xima tela
        SetStatus('End process.');
        nbPages.PageIndex := 16;
end;


{===============================================================================
	TGARRATIMER TGARRATIMER TGARRATIMER TGARRATIMER TGARRATIMER TGARRATIMER
===============================================================================}
procedure TfrmNovoEnsaio.tgarraTimer(Sender: TObject);
begin
	tgarra.enabled := false ;
	//cbDBitOut( 0, FIRSTPORTA, 17, 0) ;
        CbDBitOut(0, AUXPORT, 5, 0) ;         // 8221
end;

{===============================================================================
	FINALIZAR2CLICK FINALIZAR2CLICK FINALIZAR2CLICK FINALIZAR2CLICK
===============================================================================}
procedure TfrmNovoEnsaio.btFinalizar2Click(Sender: TObject);
begin
	parcial := false ;
	btFinalizar1Click(Sender);
end;

{===============================================================================
	FINALIZAR1CLICK FINALIZAR1CLICK FINALIZAR1CLICK FINALIZAR1CLICK
===============================================================================}
procedure TfrmNovoEnsaio.btFinalizar1Click(Sender: TObject);
	 var dTLim1, dTLim2 : double ;
			 sdMax : string ;
             ss100:string;
             straux, straux2: string;
             AppPath: string;
             laltura: longint;
             sMotor: string;
             iStepsM: longint;
             iFMO: integer;
begin
	// Desce o motor novamente
        iStepsM := 151359; // 11- Steps/M: 250000
        laltura := Trunc(iStepsM * StrToFloat(sAltura)) ; //MOTOR.RGJ
        sMotor := inttostr(laltura); //MOTOR.RGJ

        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL-'+inttostr(laltura)+#13);
//        frmMachineControl.ComandoMotor('DC-'+inttostr(laltura-1000)+#13);
//        frmMachineControl.ComandoMotor('FO1L'+#13);
	SetStatus('Motor command ('+sMotor+') - Estimated Time:' + floattostr(Trunc((StrToFloat(sAltura) * iStepsM)))); //MOTOR.RGJ

//        frmMachineControl.Delay(5000);         // MUDAR e acrescentar al�m do tempo certo o FCA

	// Incrementa quantidade de ensaios efetuados
	Inc(iImpactos) ;
	// Se atingiu impactos da norma
	{if parcial = false then // Finalizar Global
	begin
	// Seta var GlobalPicked, desabilita continuar, e habilita novo
		GlobalPicked := true ;
		//frmHelmet.bbContinuarEnsaio.enabled := False ;
		frmHelmet.bbNovoEnsaio.Enabled := True ;
	end
	else
	begin
	// Se n�o atingiu, habilita bot�o continuar, desab novo
		GlobalPicked := false ;
		//frmHelmet.bbContinuarEnsaio.enabled := false ;
		//frmHelmet.bbNovoEnsaio.Enabled := False ;
	end;}

	// Quantidade de ensaios
	frmResultados.lbEnsaios.Caption := 'Ensaio '+inttostr(iImpactos)+'.';

	// Desacelera��o m�xima
	if (dMax >= strtoint(sAcelMax)) then
	begin
		bCNCmax := false ;
		frmResultados.lbMaximo.Font.Color := RGB(255,0,0) ;
		frmImpactoPrint.stAceleracaoMaxima.Font.Color := RGB(255,0,0) ;
	end
	else
	begin
		bCNCmax := true ;
		frmResultados.lbMaximo.Font.Color := RGB(0,255,0) ;
		frmImpactoPrint.stAceleracaoMaxima.Font.Color := RGB(0,0,255) ;
	end;
	sdMax := (floattostr(dMax)) ;
	Delete(sdMax, 6, 100) ;
	frmResultados.lbMaximo.caption :=  sdMax + ' g' ;
	frmImpactoPrint.stAceleracaoMaxima.caption := sdMax + ' g' ;

	// Ensaio Atual
	EnsaioAtual := eaImpacto ;

	// Atualiza resultados individuais
	begin
                if (Tinv = true) then
                begin
                        frmResultados.lbSituacao.Font.Color := RGB(255,0,0) ;
                        frmResultados.lbSituacao.caption := 'TESTE INV�LIDO';
                        bCNCGlobal := false ;
                end
                else
                begin
        		if ((bCNC and bCNCmax) = true) then
	        	begin
		                // Se tudo estiver conforme, Global = conforme
                                frmResultados.lbSituacao.Font.Color := RGB(0,255,0) ;
		        	frmResultados.lbSituacao.caption := 'CONFORME' ;
			        bCNCGlobal := true ;
        		end
	        	else
		        begin
        		        // Se n�o estiver conforme, Global = n�o conforme
                                frmResultados.lbSituacao.Font.Color := RGB(255,0,0) ;
				frmResultados.lbSituacao.caption := 'N�O CONFORME' ;
                                bCNCGlobal := false ;
			end;
		end ;
	end ;

	// Adiciona resultado na tabela global
        table1.tablename := extractfilepath(application.exename)+'HELMET.DB';
	table1.Active := true;
	table1.append;
	tbNum.Text := frmResultados.lbAmostra.Caption;
        tbModel.Text := 'AI/'+frmResultados.lbModelo.Caption;
	tbTam.Text := edTamanho.Text;
	tbCon.Text := frmResultados.lbCondicionamento.Caption;
	tbPos.Text := frmResultados.lbEnsaio.Caption;
	tbVel.Text := frmResultados.lbTemp.Caption;
	tbMax.Text := frmResultados.lbMaximo.Caption;
        tb2Lm.Text := frmResultados.lbSituacao.Caption;
//
        ss100 := frmResultados.lbTempo1.Caption;
        //tb1Lm.Text := Copy( frmresultados.lbTempo1.Caption, 0, Length(ss100)-2);
	//tb1Lm.Text := frmResultados.lbTempo1.Caption; //edTempoPrimLimite.Text;
	//if frmNormaImpacto.use2nd.checked then
	//tb2Lm.Text := frmResultados.edTempoSegLimite.Text else
	//tb2Lm.Text := 'N/A';
	table1.post;
	table1.Active := false;

	//Atualiza valores na tela geral
	frmGeral.mmObs.Lines.Clear;
	frmGeral.mmObs.Lines.Add(valObs);
	frmGeral.lbEmpresa.caption := frmResultados.lbEmpresa.Caption;
	frmGeral.lbModelo.caption := frmresultados.lbModelo.caption;
	frmGeral.lbNorma.caption := frmResultados.lbNorma.caption;

	// Volta para tela inicial
	nbPages.ActivePage := 'Tipo';
	//frmNovoEnsaio.Close ;
	parcial := true ;

        AppPath := extractfilepath(application.exename);
        //Salva ensaio
        straux := FormatDateTime('yymmdd', Now);
        {$I-}
            mkdir(AppPath+'Ensaios');
        {$I+}

        {$I-}
            mkdir(AppPath+'Ensaios\'+straux);
        {$I+}
        straux2 := FormatDateTime('hhmmss', now);

        //frmGrafico.tcGrafico.SaveToMetafile(AppPath+'Ensaios\'+straux+'\'+straux2+'.WMF') ;
        frmHelmet.SaveImpacto(AppPath+'UltimoEnsaio.hmi');
	frmHelmet.SaveImpacto(AppPath+'Ensaios\'+straux+'\'+straux2+'.hmi');
        //JOTA
        frmMachineControl.Delay(200);
        //FIMJOTA
        frmResultados.Show ;

{        //Aguarda Descida do Motor
        cbDBitIn(0, AUXPORT, 2, iFMO);
        while ((iFMO = 1) and (bParar = false)) do
	begin
                cbDBitIn(0, AUXPORT, 2, iFMO);
                Application.ProcessMessages;
        end;
}
        CbDBitOut(0, AUXPORT, 4, 1) ;  // 8221  sobe porta

        //frmNovoEnsaio.Delay (5000) ; //MOTOR.RGJ
        if sAltura = '3,5' then
                //frmMachineControl.Delay(19000)         // MUDAR e acrescentar al�m do tempo certo o FCA
                frmMachineControl.Delay(StrToInt(sTmrMotorAI1))
        else
                //frmMachineControl.Delay(10000);         // MUDAR e acrescentar al�m do tempo certo o FCA
                frmMachineControl.Delay(StrToInt(sTmrMotorAI2));

        CbDBitOut(0, AUXPORT, 5, 1) ;  // 8221  abre trava
        frmNovoEnsaio.Delay (500) ; //MOTOR.RGJ
        frmMachineControl.ComandoMotor('MD'+#13); // 4 - Move Up MOTOR.RGJ
        tmrParar.enabled := false;

        btnFecharPorta.Enabled := true;
        btnFecharPorta2.Enabled := true;

        Close();
end;

{===============================================================================
	10 MILIMETROS 10 MILIMETROS 10 MILIMETROS 10 MILIMETROS 10 MILIMETROS
===============================================================================}
procedure TfrmNovoEnsaio.udSpeedClick(Sender: TObject; Button: TUDBtnType);
begin
        frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[6]+#13); // 6 - 1cm Move MOTOR.RGJ
	if button = btNext then
	begin
                frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[4]+#13); // 4 - Move Up MOTOR.RGJ
	end
		else
	begin
		if button = btPrev then
			begin
			 frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[5]+#13); // 5 - Move Down MOTOR.RGJ
			end;
	end;
end;

{===============================================================================
	PARAR PARAR PARAR PARAR PARAR PARAR PARAR PARAR PARAR PARAR PARAR PARAR
===============================================================================}
procedure TfrmNovoEnsaio.Button2Click(Sender: TObject);
begin
	//frmMachineControl.ComandoMotor(#13'S ST1'#13) ;
        //frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[1]+#13); // 1 - Shutdown MOTOR.RGJ
        tmrDesligaMotor.enabled := true;
	bParar := True ;
	frmNovoEnsaio.nbPages.PageIndex := 5 ;
	frmNovoEnsaio.nbPages.ActivePage := 'Emerg�ncia' ;
end;

{===============================================================================
	GERAR RESULTADOS GERAR RESULTADOS GERAR RESULTADOS GERAR RESULTADOS
===============================================================================}
procedure TfrmNovoEnsaio.WriteMainPage ;
begin
		// Atualiza principal tela resultados
		frmResultados.lbEmpresa.Caption := cbEmpresa.Text ; 								// Empresa
		frmImpactoPrint.stEmpresa.Caption := cbEmpresa.Text ;

		frmResultados.lbModelo.Caption := cbModeloCapacete.Text ; 					// Modelo
		frmImpactoPrint.stCapacete.Caption := cbModeloCapacete.Text ;

		frmResultados.lbAmostra.Caption := edNumeroAmostra.Text ; 					// Numero
		frmImpactoPrint.stAmostra.Caption := edNumeroAmostra.Text ;

		frmResultados.lbLote.Caption := edNumeroLote.Text ; 								// Lote
		frmImpactoPrint.stLote.Caption := edNumeroLote.Text ;

		frmResultados.lbEnsaio.Caption := edPosicaoEnsaio.Text ; 						// Posicao
		frmImpactoPrint.stEnsaio.Caption := edPosicaoEnsaio.Text ;

		frmResultados.lbNorma.Caption := cbNormaUtilizar.Text ; 						// Norma
		frmImpactoPrint.stNormaUtilizada.Caption := cbNormaUtilizar.Text ;

		frmResultados.lbCondicionamento.Caption := edCondicionamento.Text ; // Condicionamento
		frmImpactoPrint.stCondicionamento.Caption := edCondicionamento.Text ;

		frmResultados.lbTamanho.Caption := edTamanho.Text;  								// Tamanho
		frmImpactoPrint.stTamanho.Caption := edTamanho.Text;

                frmResultados.lbObs.Caption := valObs; //Observa��o
end;

procedure TfrmNovoEnsaio.WriteMainPagePenet ;
begin
		// Atualiza principal tela resultados
		frmResultadosPenet.lbEmpresa.Caption := cbEmpresa.Text ; 								// Empresa
		frmPenetracaoPrint.stEmpresa.Caption := cbEmpresa.Text ;

		frmResultadosPenet.lbModelo.Caption := cbModeloCapacete.Text ; 					// Modelo
		frmPenetracaoPrint.stCapacete.Caption := cbModeloCapacete.Text ;

		frmResultadosPenet.lbAmostra.Caption := edNumeroAmostra.Text ; 					// Numero
		frmPenetracaoPrint.stAmostra.Caption := edNumeroAmostra.Text ;

		frmResultadosPenet.lbLote.Caption := edNumeroLote.Text ; 								// Lote
		frmPenetracaoPrint.stLote.Caption := edNumeroLote.Text ;

		frmResultadosPenet.lbEnsaio.Caption := edPosicaoEnsaio.Text ; 						// Posicao
		frmPenetracaoPrint.stEnsaio.Caption := edPosicaoEnsaio.Text ;

		frmResultadosPenet.lbNorma.Caption := cbNormaUtilizar.Text ; 						// Norma
		frmPenetracaoPrint.stNormaUtilizada.Caption := cbNormaUtilizar.Text ;

		frmResultadosPenet.lbCondicionamento.Caption := edCondicionamento.Text ; // Condicionamento
		frmPenetracaoPrint.stCondicionamento.Caption := edCondicionamento.Text ;

		frmResultadosPenet.lbTamanho.Caption := edTamanho.Text;  								// Tamanho
		frmPenetracaoPrint.stTamanho.Caption := edTamanho.Text;

                frmResultadosPenet.lbObs.Caption := valObs; //Observa��o
end;

procedure TfrmNovoEnsaio.WriteMainPageTrans ;
begin
		// Atualiza principal tela resultados de transmiss�o
		frmResultadosTrans.lbEmpresa.Caption := cbEmpresa.Text ; 								// Empresa
		frmTransmissaoPrint.stEmpresa.Caption := cbEmpresa.Text ;

		frmResultadosTrans.lbModelo.Caption := cbModeloCapacete.Text ; 					// Modelo
		frmTransmissaoPrint.stCapacete.Caption := cbModeloCapacete.Text ;

		frmResultadosTrans.lbAmostra.Caption := edNumeroAmostra.Text ; 					// Numero
		frmTransmissaoPrint.stAmostra.Caption := edNumeroAmostra.Text ;

		frmResultadosTrans.lbLote.Caption := edNumeroLote.Text ; 								// Lote
		frmTransmissaoPrint.stLote.Caption := edNumeroLote.Text ;

		frmResultadosTrans.lbEnsaio.Caption := edPosicaoEnsaio.Text ; 						// Posicao
		frmTransmissaoPrint.stEnsaio.Caption := edPosicaoEnsaio.Text ;

		frmResultadosTrans.lbNorma.Caption := cbNormaUtilizar.Text ; 						// Norma
		frmTransmissaoPrint.stNormaUtilizada.Caption := cbNormaUtilizar.Text ;

		frmResultadosTrans.lbCondicionamento.Caption := edCondicionamento.Text ; // Condicionamento
		frmTransmissaoPrint.stCondicionamento.Caption := edCondicionamento.Text ;

		frmResultadosTrans.lbTamanho.Caption := edTamanho.Text;  								// Tamanho
		frmTransmissaoPrint.stTamanho.Caption := edTamanho.Text;

                frmResultadosTrans.lbObs.Caption := valObs; //Observa��o
end;

procedure TfrmNovoEnsaio.WriteMainPageCal;
begin
		// Atualiza principal tela resultados
		frmResultadosCal.lbEmpresa.Caption := cbEmpresa.Text ; 								// Empresa
		frmCalibracaoPrint.stEmpresa.Caption := cbEmpresa.Text ;

		frmResultadosCal.lbModelo.Caption := cbModeloCapacete.Text ; 					// Modelo
		frmCalibracaoPrint.stCapacete.Caption := cbModeloCapacete.Text ;

		frmResultadosCal.lbAmostra.Caption := edNumeroAmostra.Text ; 					// Numero
		frmCalibracaoPrint.stAmostra.Caption := edNumeroAmostra.Text ;

		frmResultadosCal.lbLote.Caption := edNumeroLote.Text ; 								// Lote
		frmCalibracaoPrint.stLote.Caption := edNumeroLote.Text ;

		frmResultadosCal.lbEnsaio.Caption := edPosicaoEnsaio.Text ; 						// Posicao
		frmCalibracaoPrint.stEnsaio.Caption := edPosicaoEnsaio.Text ;

		frmResultadosCal.lbNorma.Caption := cbNormaUtilizar.Text ; 						// Norma
		//frmCalibracaoPrint.stNormaUtilizada.Caption := cbNormaUtilizar.Text ;

		frmResultadosCal.lbCondicionamento.Caption := edCondicionamento.Text ; // Condicionamento
		frmCalibracaoPrint.stCondicionamento.Caption := edCondicionamento.Text ;

		frmResultadosCal.lbTamanho.Caption := edTamanho.Text;  								// Tamanho
		frmCalibracaoPrint.stTamanho.Caption := edTamanho.Text;

                frmResultadosCal.lbObs.Caption := valObs; //Observa��o
end;


{===============================================================================
	PEGAR VALORES DA NORMA PEGAR VALORES DA NORMA PEGAR VALORES DA NORMA
===============================================================================}
procedure TfrmNovoEnsaio.GetNormaValues ;
begin
	(*sTAlt1 := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[2];
	sTAlt2 := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[6];
	sTAlt3 := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[10];
	sAcelMax  := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[0];
	sType  := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[1];
	sAltura   := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[4];
	sVeloc		:= frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[3];
	sType2 := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[5];
	sAltura2  := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[8];
	sVeloc2   := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[7];
	sType3 := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[9];
	sAltura3  := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[12];
	sVeloc3   := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[11];
	sAltSens  := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[13];
	sLimite1  := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[14];
	sTlimite1 := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[15];
	sLimite2  := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[16];
	sTLimite2 := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[17];
	dVlup := strtofloat(frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[18]);
	dVldn := strtofloat(frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[19]);*)



        dVlup := 0.5;
        dVldn := 0.5;
        sAcelMax  := '150';
	sType     := 'NBR 8221';
	sAltura   := sAlturaAI1;
	sVeloc	  := sVelocAI1;
        sAltSens := '25';
	btnFecharPorta.caption := sType ;
	btnFecharPorta2.caption := sType + 'Repetibilidade 3 m/s';
	btnFecharPorta3.caption := '';

	if ((sAltura ='') or (sVeloc ='')) then btnFecharPorta.enabled := false
		else btnFecharPorta.enabled := true;

        btnFecharPorta2.enabled := false;
        btnFecharPorta3.enabled := false;

	frmResultados.lbNorma.caption := cbNormaUtilizar.text ;
	frmImpactoPrint.stNormaUtilizada.Caption := cbNormaUtilizar.text ;

	frmResultados.lbNMaximo.caption := sAcelMax + ' g' ;
	frmImpactoPrint.stAceleracaoMaximaNorma.Caption := sAcelMax + ' g' ;

	frmResultados.lbResReal.caption := sAltura + ' m' ;

	frmResultados.lbAltImp.caption := sAltura + ' m';//aqui

	frmResultados.lbVelImp.caption := sVeloc + ' m/s';
	frmImpactoPrint.stVelocidadeImpactoNorma.Caption := sVeloc + ' m/s' ;

end;

procedure TfrmNovoEnsaio.GetNormaRepetValues ;
begin
        dVlup := 0.5;
        dVldn := 0.5;
        sAcelMax  := '150';
	sType     := 'NBR 8221' + 'Repetibilidade 3 m/s';
	sAltura   := sAlturaAI2;
	sVeloc	  := sVelocAI2;
        sAltSens := '25';
	btnFecharPorta.caption := sType ;
	btnFecharPorta2.caption := sType;
	btnFecharPorta3.caption := '';

	if ((sAltura ='') or (sVeloc ='')) then btnFecharPorta.enabled := false
		else btnFecharPorta.enabled := true;

        btnFecharPorta2.enabled := false;

	frmResultados.lbNorma.caption := cbNormaUtilizar.text ;
	frmImpactoPrint.stNormaUtilizada.Caption := cbNormaUtilizar.text ;

	frmResultados.lbNMaximo.caption := sAcelMax + ' g' ;
	frmImpactoPrint.stAceleracaoMaximaNorma.Caption := sAcelMax + ' g' ;

	frmResultados.lbResReal.caption := sAltura + ' m' ;

	frmResultados.lbAltImp.caption := sAltura + ' m';//aqui

	frmResultados.lbVelImp.caption := sVeloc + ' m/s';
	frmImpactoPrint.stVelocidadeImpactoNorma.Caption := sVeloc + ' m/s' ;

end;

procedure TfrmNovoEnsaio.GetNormaPenetracaoTopoValues;
begin
        dVlup := 0.5;
        dVldn := 0.5;
        sAcelMax  := '0';
	sType     := 'NBR 8221';
	sAltura   := sAlturaPE1;
	sAlturap  := sAlturaPE1;
	sVeloc	  := sVelocPE1;
        sAltSens := '25';
	btnIniciarPenetracao1.caption := sType + ' TOPO';

	frmResultadosPenet.lbNorma.caption := cbNormaUtilizar.text ;
	frmPenetracaoPrint.stNormaUtilizada.Caption := cbNormaUtilizar.text ;

	frmResultadosPenet.lbNPenet.caption := 'N�O OCORRE';
	frmPenetracaoPrint.stPenetracaoNorma.Caption := 'N�O OCORRE';

	frmResultadosPenet.lbResReal.caption := sAltura + ' m' ;

	frmResultadosPenet.lbAltImp.caption := sAltura + ' m';//aqui

	frmResultadosPenet.lbVelImp.caption := sVeloc + ' m/s';
	frmPenetracaoPrint.stVelocidadePenetracaoNorma.Caption := sVeloc + ' m/s' ;

end;

procedure TfrmNovoEnsaio.GetNormaPenetracaoExcValues;
begin
        dVlup := 0.5;
        dVldn := 0.5;
        sAcelMax  := '0';
	sType     := 'NBR 8221';
	sAltura   := sAlturaPE2;
	sAlturap  := sAlturaPE2;
	sVeloc	  := sVelocPE2;
        sAltSens := '25';
	btnIniciarPenetracao1.caption := sType + ' EXC�NTRICA';

	frmResultadosPenet.lbNorma.caption := cbNormaUtilizar.text ;
	frmPenetracaoPrint.stNormaUtilizada.Caption := cbNormaUtilizar.text ;

	frmResultadosPenet.lbNPenet.caption := 'N�O OCORRE';
	frmPenetracaoPrint.stPenetracaoNorma.Caption := 'N�O OCORRE';

	frmResultadosPenet.lbResReal.caption := sAltura + ' m' ;

	frmResultadosPenet.lbAltImp.caption := sAltura + ' m';//aqui

	frmResultadosPenet.lbVelImp.caption := sVeloc + ' m/s';
	frmPenetracaoPrint.stVelocidadePenetracaoNorma.Caption := sVeloc + ' m/s' ;

end;


procedure TfrmNovoEnsaio.GetNormaCalibracao1Values;
begin
        dVlup := 0.5;
        dVldn := 0.5;
        sAcelMax  := '0';
	sType     := 'NBR 8221 - 0,6 M';
	sAltura   := sAlturaCA1;
	sAlturap  := sAlturaCA1;
	sVeloc	  := sVelocCA1;
        sAltSens := '25';

	frmResultadosCal.lbNorma.caption := cbNormaUtilizar.text ;
	//frmCalibracaoPrint.stNormaUtilizada.Caption := cbNormaUtilizar.text ;

	frmResultadosCal.lbDifMax.caption := '2,5 %';
	//frmCalibracaoPrint.stDifNorma.Caption := '2,5';

	frmResultadosCal.lbResReal.caption := sAltura + ' m' ;

	frmResultadosCal.lbAltImp.caption := sAltura + ' m';//aqui

	frmResultadosCal.lbVelImp.caption := sVeloc + ' m/s';
	frmCalibracaoPrint.stVelocidadeCalibracaoNorma.Caption := sVeloc + ' m/s' ;

end;

procedure TfrmNovoEnsaio.GetNormaCalibracao2Values;
begin
        dVlup := 0.5;
        dVldn := 0.5;
        sAcelMax  := '0';
	sType     := 'NBR 8221 - 1,0 M';
	sAltura   := sAlturaCA2;
	sAlturap  := sAlturaCA2;
	sVeloc	  := sVelocCA2;
        sAltSens := '25';

	frmResultadosCal.lbNorma.caption := cbNormaUtilizar.text ;
	//frmCalibracaoPrint.stNormaUtilizada.Caption := cbNormaUtilizar.text ;

	frmResultadosCal.lbDifMax.caption := '2,5 %';
	//frmCalibracaoPrint.stDifNorma.Caption := '2,5';

	frmResultadosCal.lbResReal.caption := sAltura + ' m' ;

	frmResultadosCal.lbAltImp.caption := sAltura + ' m';//aqui

	frmResultadosCal.lbVelImp.caption := sVeloc + ' m/s';
	frmCalibracaoPrint.stVelocidadeCalibracaoNorma.Caption := sVeloc + ' m/s' ;

end;


procedure TfrmNovoEnsaio.GetNormaTransmissaoValues;
begin
        dVlup := 0.5;
        dVldn := 0.5;
        sForcaMax  := '4450';
	sType     := 'NBR 8221';
	sAltura   := sAlturaTR;
	sVeloc	  := sVelocTR;
        sAltSens := '25';
	btnIniciarTransmissao1.caption := sType ;
	btnIniciarTransmissao2.caption := '';

	if ((sAltura ='') or (sVeloc ='')) then btnIniciarTransmissao1.enabled := false
		else btnIniciarTransmissao1.enabled := true;

        btnIniciarTransmissao2.visible := false;
        btnIniciarTransmissao2.enabled := false;


	frmResultadosTrans.lbNorma.caption := cbNormaUtilizar.text ;
	frmTransmissaoPrint.stNormaUtilizada.Caption := cbNormaUtilizar.text ;

	frmResultadosTrans.lbNMaximo.caption := sForcaMax + ' N' ;
	frmTransmissaoPrint.stAceleracaoMaximaNorma.Caption := sForcaMax + ' N' ;

	frmResultadosTrans.lbResReal.caption := sAltura + ' m' ;

	frmResultadosTrans.lbAltImp.caption := sAltura + ' m';//aqui

	frmResultadosTrans.lbVelImp.caption := sVeloc + ' m/s';
	frmTransmissaoPrint.stVelocidadeImpactoNorma.Caption := sVeloc + ' m/s' ;

end;



{===============================================================================
	DESCER O SUPORTE  DESCER O SUPORTE  DESCER O SUPORTE  DESCER O SUPORTE
===============================================================================}
procedure TfrmNovoEnsaio.btnDescerClick(Sender: TObject);
var laltura : longint   ;
    sMotor: string;
    iStepsM: longint;
begin
	// Desce o suporte
	//frmMachineControl.ComandoMotor(#13'ST0 D0 G'#13) ;
        iStepsM := strtoint(frmHelmet.lstMotor.Lines[11]); // 11- Steps/M: 1677812
        laltura := Trunc(iStepsM * StrToFloat(sAltura)) ; //MOTOR.RGJ
        sMotor := #13+frmHelmet.lstMotor.Lines[8]+inttostr(laltura)+frmHelmet.lstMotor.Lines[10]+#13; //MOTOR.RGJ
	// Mandar motor DESCER
//	frmMachineControl.ComandoMotor( sMotor ) ; //MOTOR.RGJ
//        frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[5]+#13); // 5 - Move Down MOTOR.RGJ
        tmrDesligaMotor.enabled := true;


end;

{===============================================================================
	DESCER E ABRIR A PORTA  DESCER E ABRIR A PORTA  DESCER E ABRIR A PORTA
===============================================================================}
procedure TfrmNovoEnsaio.btnDescerAbrirClick(Sender: TObject);
begin
	// Desce o suporte
	//frmMachineControl.ComandoMotor(#13'ST0 D0 G'#13) ;
	// Abre a porta
	//cbDBitOut( 0, FIRSTPORTA, 18, 0) ;
        CbDBitOut(0, AUXPORT, 4, 1) ;             // 8221
end;

{===============================================================================
	ABRIR A PORTA  ABRIR A PORTA  ABRIR A PORTA  ABRIR A PORTA  ABRIR A PORTA
===============================================================================}
procedure TfrmNovoEnsaio.btnAbrirClick(Sender: TObject);
begin
	// Abre a porta
	//cbDBitOut( 0, FIRSTPORTA, 18, 0) ;
        CbDBitOut(0, AUXPORT, 4, 1) ;        // 8221
end;

{===============================================================================
	EMERG�NCIA CONTINUAR  EMERG�NCIA CONTINUAR  EMERG�NCIA CONTINUAR
===============================================================================}
procedure TfrmNovoEnsaio.Button3Click(Sender: TObject);
begin
    frmNovoEnsaio.nbPages.PageIndex := 0 ;
    tmrDanger.Enabled := true;
    bParar := False ;
    if btnFecharPorta.enabled = false then
	btnFecharPorta.enabled := true ;
    if btnFecharPorta2.enabled = false then
        btnFecharPorta2.enabled := true ;
    if btnIniciarTransmissao1.enabled = false then
	btnIniciarTransmissao1.enabled := true ;
    if btnIniciarTransmissao2.enabled = false then
	btnIniciarTransmissao2.enabled := true ;
    if btnIniciarPenetracao1.enabled = false then
	btnIniciarPenetracao1.enabled := true ;
    if btnIniciarPenetracao2.enabled = false then
	btnIniciarPenetracao2.enabled := true ;
    if btnIniciarCalibracao1.enabled = false then
	btnIniciarCalibracao1.enabled := true ;
    if btnIniciarCalibracao2.enabled = false then
	btnIniciarCalibracao2.enabled := true ;

    frmNovoEnsaio.Close;

end;

{===============================================================================
	EMERG�NCIA SAIR  EMERG�NCIA SAIR  EMERG�NCIA SAIR  EMERG�NCIA SAIR
===============================================================================}
procedure TfrmNovoEnsaio.Button4Click(Sender: TObject);
begin
        Application.Terminate;
end;

{===============================================================================
	ZOOM ZOOM ZOOM ZOOM ZOOM ZOOM ZOOM ZOOM ZOOM ZOOM ZOOM ZOOM ZOOM ZOOM ZOOM
===============================================================================}
procedure TfrmNovoEnsaio.Zoom(PicoMaximo : double ; PosicaoX : LongInt) ;
var x1,x2,y1,y2 : integer ;
    Aux: Integer;
    d_XPixels, d_YPixels : Double;
begin
        //RGN - 2017/05/06 - Refeito para Zoom funcionar direito e com qualquer resolu��o
        d_XPixels := Screen.Width / 1000;
        d_YPixels := Screen.Height / 1000;
        x1 := Trunc((50 + ( PosicaoX * d_XPixels )) )  ;
        y1 := Trunc(500 * (d_YPixels)) - 10;
        x2 := x1 + Trunc( ( 50 * d_XPixels ) );
        y2 := Trunc ( (1000-(500 + PicoMaximo)) * d_YPixels )  - 20;
        frmGrafico.tcGrafico.ZoomRect( Rect( x1, y1, x2, y2) ) ;
end;

{===============================================================================
    POSICAO INICIAL  POSICAO INICIAL  POSICAO INICIAL  POSICAO INICIAL
===============================================================================}
procedure TfrmNovoEnsaio.Button5Click(Sender: TObject);
begin
		tmrPerf.enabled := false;
		if not CheckOD then
		begin
			Application.MessageBox('Erro de leitura do m�dulo �tico - Poss�veis causas:'+#13#10+''+#13#10+'- R�gua �tica desligada'+#13#10+'- Chave seletora fora de posi��o'+#13#10+'- Cabos desconectados ou mau posicionados', '------- ERRO --------', mb_applmodal+mb_iconerror+mb_ok+mb_defbutton1);
			exit ;
		end;
		ResetOD;
		Pzero := ReadAbsolute ;
		if Pzero = 0 then
        begin
        	ShowMessage('Posi��o inicial menor do que 1');
            Exit;
        end;
	_1stPerf := false;
	nbPages.PageIndex := 7 ;
end;

{===============================================================================
    FINALIZAR ENSAIO  FINALIZAR ENSAIO  FINALIZAR ENSAIO  FINALIZAR ENSAIO
===============================================================================}
procedure TfrmNovoEnsaio.Button6Click(Sender: TObject);
// Finalizar Perfura��o
begin
		//timerP.enabled := false;
        //StopTimerP := true;
		Pelast := ReadForward  ;
		if tmpP>Pelast then Pelast := tmpP;
		tmpP := 0;

		if (Pelast<>0) then
		begin
			if (Pelast > 50) then ShowMessage('Erro: Leitura acima de 50 u.m.');
			if ((Pzero-Pelast) > strtoint(frmPerfRes.lbDElast.Caption)) then
				begin
					frmPerfRes.edElast.Font.Color := clBlue ;
					frmPerfPrint.qres.Font.Color := clBlue ;
				end
				else
				begin
					frmPerfRes.edElast.Font.Color := clRed ;
						frmPerfPrint.qres.Font.Color := clRed ;
				end;
		frmPerfRes.edElast.text := InttoStr(Pzero-Pelast);
		frmPerfPrint.qres.caption := frmPerfRes.edElast.text ;
		end
		else
		begin
			// Maior que - N�o chegou a interromper o elemento �tico
			Application.MessageBox('A medida real excedeu ao'+#13#10+
						'limite de leitura da r�gua �tica.'+#13#10+
                        '( obstrutor n�o atingiu nem 1)', 'Helmet', mb_systemmodal+mb_ok+mb_defbutton1);
			frmPerfRes.edElast.text := InttoStr(Pzero);
			frmPerfPrint.qres.caption := frmPerfRes.edElast.text ;
		end;
	if sEnsaio = 'VISEIRA' then
	begin
		frmPerfRes.Caption := 'Resultados do Ensaio de Viseira';
		frmPerfPrint.qtitle.caption := 'Ensaio de Viseira';
		frmPerfRes.lbEmpresa.Caption := frmNovoEnsaio.cbEmpresa.Text ;
		frmPerfPrint.stEmpresa.Caption := frmNovoEnsaio.cbEmpresa.Text ;
		frmPerfRes.lbModelo.Caption := frmNovoEnsaio.cbModeloCapacete.Text ;
		frmPerfPrint.stCapacete.Caption := frmNovoEnsaio.cbModeloCapacete.Text ;
		frmPerfRes.lbAmostra.Caption := frmNovoEnsaio.edNumeroAmostra.Text ;
		frmPerfPrint.stAmostra.Caption := frmNovoEnsaio.edNumeroAmostra.Text ;
		frmPerfRes.lbLote.Caption := frmNovoEnsaio.edNumeroLote.Text ;
        frmPerfPrint.stLote.Caption := frmNovoEnsaio.edNumeroLote.Text ;
		frmPerfRes.lbEnsaio.Caption := frmNovoEnsaio.edPosicaoEnsaio.Text ;
		frmPerfRes.lbTamanho.Caption := frmNovoEnsaio.edTamanho.Text;
		frmPerfPrint.stTamanho.Caption := frmNovoEnsaio.edTamanho.Text;
		frmPerfRes.lbCondicionamento.Caption := frmNovoEnsaio.edCondicionamento.Text ;
        frmPerfPrint.stCondicionamento.Caption := frmNovoEnsaio.edCondicionamento.Text ;
		if (strtofloat(frmPerfRes.edElast.text) < strtofloat(sVDin)) then
		begin
				frmPerfRes.Label3.font.color := clRed ;
				frmPerfRes.Label3.caption := 'Resultado parcial do ensaio: N�O CONFORME' ;
		end
		else
		begin
			 frmPerfRes.Label3.font.color := clBlue ;
			 frmPerfRes.Label3.caption := 'Resultado parcial do ensaio: CONFORME' ;
		end;
		Dec(iVno) ;
		Inc(iPVezes) ;
		frmPerfRes.lbEnsUnit.Caption := 'Ensaio '+inttostr(iPVezes)+'/'+sVno ;
		frmPerfPrint.stREnsaios.Caption := 'Ensaio '+inttostr(iPVezes)+'/'+sVno ;
		if frmPerfRes.Label3.caption = 'Resultado parcial do ensaio: N�O CONFORME' then
        PCNC := false ;

// Se todas as vezes programadas acabaram,
		if iPVezes = strtoint(sVno) then
		begin
// Reseta contagem de vezes
			iPVezes := 0 ;
// Mostra resultado global na impress�o
			if PCNC = true then
			begin
				frmPerfRes.lbResGlobal.visible := true ;
				frmPerfRes.stResGlobal.Font.Color := RGB(0,0,255) ;
				frmPerfRes.stResGlobal.visible := true ;
				frmPerfRes.stResGlobal.Caption := 'CONFORME' ;
			end
			else
			begin
				frmPerfRes.lbResGlobal.visible := true ;
				frmPerfRes.stResGlobal.Font.Color := RGB(255,0,0) ;
				frmPerfRes.stResGlobal.visible := true ;
				frmPerfRes.stResGlobal.Caption := 'N�O CONFORME' ;
			end;

// Reseta CNC global
			PCNC := true ;
		end
		else
// Se n�o, n�o mostra resultados globais
		begin
				frmPerfRes.lbResGlobal.visible := false ;
				frmPerfRes.stResGlobal.visible := false ;
		end ;
		if iVno > 0 then
		begin
			nbPages.PageIndex := 6 ;
			frmPerfRes.Show ;
		end
		else
		begin
			ResetOD;
			nbPages.PageIndex := 0 ;
			frmNovoEnsaio.Close ;
			frmPerfRes.Show ;
		end;

	end
	else // Se for ensaio de PERFURA��O
	begin
		frmPerfRes.Caption := 'Resultados do Ensaio de Resist�ncia � Perfura��o';
		frmPerfPrint.qtitle.caption := 'Ensaio de Resist�ncia � Perfura��o';
        frmPerfRes.lbEmpresa.Caption := frmNovoEnsaio.cbEmpresa.text ;
		frmPerfPrint.stEmpresa.Caption := frmNovoEnsaio.cbEmpresa.Text ;
        frmPerfRes.lbModelo.Caption := frmNovoEnsaio.cbModeloCapacete.Text ;
		frmPerfPrint.stCapacete.Caption := frmNovoEnsaio.cbModeloCapacete.Text ;
        frmPerfRes.lbAmostra.Caption := frmNovoEnsaio.edNumeroAmostra.Text;
		frmPerfPrint.stAmostra.Caption := frmNovoEnsaio.edNumeroAmostra.Text ;
        frmPerfRes.lbLote.Caption := frmNovoEnsaio.edNumeroLote.Text;
		frmPerfPrint.stLote.Caption := frmNovoEnsaio.edNumeroLote.Text ;
		frmPerfRes.lbEnsaio.Caption := frmNovoEnsaio.edPosicaoEnsaio.Text ;
		frmPerfPrint.stTamanho.Caption := frmNovoEnsaio.edTamanho.Text;
		frmPerfRes.lbTamanho.Caption := frmNovoEnsaio.edTamanho.Text;
        frmPerfRes.lbCondicionamento.Caption := frmNovoEnsaio.edCondicionamento.Text;
		frmPerfPrint.stCondicionamento.Caption := frmNovoEnsaio.edCondicionamento.Text ;
		if (strtofloat(frmPerfRes.edElast.text) < strtofloat(sPDin)) then
		begin
			 frmPerfRes.Label3.font.color := clRed ;
			 frmPerfRes.Label3.caption := 'Resultado parcial do ensaio: N�O CONFORME' ;
		end
		else
		begin
			 frmPerfRes.Label3.font.color := clBlue ;
			 frmPerfRes.Label3.caption := 'Resultado parcial do ensaio: CONFORME' ;
		end;
		Dec(iPno) ;
		Inc(iPVezes) ;
		frmPerfRes.lbEnsUnit.Caption := 'Ensaio '+inttostr(iPVezes)+'/'+sPno ;
		frmPerfPrint.stREnsaios.Caption := 'Ensaio '+inttostr(iPVezes)+'/'+sPno ;
        if frmPerfRes.Label3.caption = 'Resultado parcial do ensaio: N�O CONFORME' then
        PCNC := false ;


// Se todas as vezes programadas acabaram,
		if iPVezes = strtoint(sPno) then
		begin
// Reseta contagem de vezes
			iPVezes := 0 ;
// Mostra resultado global na impress�o
			if PCNC = true then
			begin
				frmPerfRes.lbResGlobal.visible := true ;
				frmPerfRes.stResGlobal.Font.Color := RGB(0,0,255) ;
				frmPerfRes.stResGlobal.visible := true ;
				frmPerfRes.stResGlobal.Caption := 'CONFORME' ;
			end
			else
			begin
				frmPerfRes.lbResGlobal.visible := true ;
				frmPerfRes.stResGlobal.Font.Color := RGB(255,0,0) ;
				frmPerfRes.stResGlobal.visible := true ;
				frmPerfRes.stResGlobal.Caption := 'N�O CONFORME' ;
			end;

// Reseta CNC global
			PCNC := true ;
		end
		else
// Se n�o, n�o mostra resultados globais
		begin
				frmPerfRes.lbResGlobal.visible := false ;
				frmPerfRes.stResGlobal.visible := false ;
		end ;

		if iPno > 0 then
		begin
			nbPages.PageIndex := 6 ;
			frmPerfRes.Show ;
		end
		else
		begin
			ResetOD;
			nbPages.PageIndex := 0 ;
			frmNovoEnsaio.Close ;
			frmPerfRes.Show ;
		end;

	end;
end;

{===============================================================================
	INICIAR PERF  INICIAR PERF  INICIAR PERF  INICIAR PERF
===============================================================================}
procedure TfrmNovoEnsaio.Button7Click(Sender: TObject);
var tdw1 : byte;
	gtrX : longint;
begin
	ResetOD ;  // Reset Optical Device
    ResetOD ;
    ResetOD ;
	nbPages.PageIndex := 8 ;
	button6.enabled := false; // Desabilita bot�o finalizar perfura��o

    Application.ProcessMessages; // Mostra tela do finalizar ensaio

    tmpP:=0; // Reseta vari�vel que ret�m pico m�ximo.
    gtrX := GetTickCount; // L� tick atual

    repeat // Loop de leitura do pico m�ximo da r�gua �tica
    	repeat
			tdw1 := ReadAbsolute;
	    until tdw1<=50;
		if tdw1>tmpP then tmpP:=tdw1;
    until ((GetTickCount-gtrX) >= 4000);

    button6.enabled := true; // Habilita novamente o bot�o finalizar perfura��o
    //timerP.enabled := true;
end;

procedure TfrmNovoEnsaio.btnCalibracaoClick(Sender: TObject);
var iItem	:	integer;
begin
	sEnsaio := 'CALIBRACAO';
        cbStopBackground(0);
	tmrParar.enabled := true;
        bCNC := true;
	nbPages.PageIndex := 1;
	// Manda Porta abrir
        CbDBitOut(0, AUXPORT, 4, 1) ;    // 8221
end;

procedure TFrmNovoEnsaio.GetNCintaValues ;
begin
	sCDin := frmNormas.lvNormasCinta.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[0];
	sCEst := frmNormas.lvNormasCinta.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[1];
	frmCintaRes.lbDElast.Caption := sCDin ;
	frmCintaRes.lbDPlast.Caption := sCEst ;
	frmCintaPrint.stDPlast.Caption := sCEst ;
	frmCintaPrint.stDElast.Caption := sCDin ;
// Pega valores do form geral
	frmCintaRes.lbEmpresa.Caption := frmNovoEnsaio.cbEmpresa.Text ;
	frmCintaRes.lbModelo.Caption := frmNovoEnsaio.cbModeloCapacete.Text ;
	frmCintaRes.lbAmostra.Caption := frmNovoEnsaio.edNumeroAmostra.Text ;
	frmCintaRes.lbLote.Caption := frmNovoEnsaio.edNumeroLote.Text ;
	frmCintaRes.lbTam.Caption := frmNovoEnsaio.edTamanho.Text;
	frmCintaRes.lbCondicionamento.Caption := frmNovoEnsaio.edCondicionamento.Text ;
        frmCintaRes.lbCondicionamento.Caption := frmNovoEnsaio.edObs.Text ;

end;

procedure TFrmNovoEnsaio.GetNViseiraValues ;
begin
	sVDin := frmNormas.lvNormasViseira.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[0];
	sVno :=	frmNormas.lvNormasViseira.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[1];
	iVno := strtoint(sVno) ;
	frmPerfPrint.stDElast.Caption := sVDin ;
	frmPerfRes.lbDElast.Caption := sVDin ;
	frmPerfPrint.stEnsaios.Caption := sVno ;
	frmPerfRes.lbEnsaios.Caption := sVno ;
end;

procedure TFrmNovoEnsaio.GetNPerfValues ;
begin
	sPDin := frmNormas.lvNormasPerfuracao.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[0];
	sPno := frmNormas.lvNormasPerfuracao.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[1] ;
	iPno := strtoint(sPno) ;
	frmPerfPrint.stDElast.Caption := sPDin ;
	frmPerfRes.lbDElast.Caption := sPDin ;
	frmPerfPrint.stEnsaios.Caption := sPno ;
	frmPerfRes.lbEnsaios.Caption := sPno ;
end;

{===============================================================================
	INICIAR CINTA INICIAR CINTA INICIAR CINTA INICIAR CINTA INICIAR CINTA
 ===============================================================================}
procedure TfrmNovoEnsaio.Button8Click(Sender: TObject);
var Leitura : word;
begin
	if (strtoint(edRPos.Caption) < 1) then
    begin
    	ShowMessage('Valor inicial menor do que 1.');
        Exit;
    end
    Else
    begin
        CPZero := ReadAbsolute;
    end;
		tmrLeitura.enabled := false ;

        //ShowMessage('Pressione OK quando o equipamento estiver pronto.');

        nbPages.PageIndex := 10 ;
        MaxROCinta := 0;
        StopReadROCinta := False;
        repeat
                Leitura := ReadAbsolute;
                if Leitura > MaxROCinta then
                        MaxROCinta := Leitura;
                Application.ProcessMessages();
        until stopReadROCinta;

end;


procedure TfrmNovoEnsaio.Button9Click(Sender: TObject);
var t1 : longint ;
	_erc1 : longint;
begin

                stopReadROCinta := True;
		bCD := false;
		button9.enabled := false;
		btnCC.visible := true;

		//timerP.enabled := false;
        //StopTimerP := true;

        CPelast:=MaxROCinta;

   		t1 := GetTickCount;

		lbDin.Caption := 'Deslocamento din�mico: ' + inttostr(CPelast-CPzero) + ' mm.';
		repeat
			Application.ProcessMessages ;
			lbCount.Caption := 'Contando: '+FormatFloaT('###',((GetTickCount-t1)/1000))+' seg.';
			lbRes.Caption := 'Deslocamento residual: '+ inttostr(ReadAbsolute-CPzero)+' mm.';
			if bCD then break;
		until (( GetTickCount - t1) >= 240000 ); //120000 milissegundos = 2 minutos
                //Desliga Lampada Retencao
                //cbDBitOut(0, FIRSTPORTA, 20, 0);
                //CbDBitOut(1, FIRSTPORTA, 21, 0) ;      // 8221

        	lbCount.Caption := ' ';
		Button9.enabled := true;
		btnCC.visible := false;
		lbDin.Caption := '';
		lbRes.Caption := '';
		CPplast := ReadAbsolute ;
		if ((CPelast > 50)) then
    begin
    	ShowMessage('Erro durante aquisi��o da medida el�stica.');
    end;

    if (CPplast=50) then
		frmCintaRes.edPlast.text := inttostr(CPplast-CPzero)
		else
	frmCintaRes.edPlast.text := inttostr(CPplast-CPzero) ;

    if (CPelast=50) then
    frmCintaRes.edElast.text := inttostr(CPelast-CPzero)
    else
	frmCintaRes.edElast.text := inttostr(CPelast-CPzero) ;

	frmCintaPrint.eres.caption := frmCintaRes.edElast.text ;
	frmCintaPrint.pres.caption := frmCintaRes.edPlast.text ;

		begin
		if (strtofloat(frmCintaRes.edElast.text) > strtofloat(sCDin)) or
		(strtofloat(frmCintaRes.edPlast.text) > strtofloat(sCEst))
		 then
		begin
			 frmCintaRes.stRes.font.color := clRed ;
			 frmCintaRes.stRes.caption := 'N�O CONFORME' ;
             if (strtofloat(frmCintaRes.edElast.text) > strtofloat(sCDin)) then
             begin
             	frmCintaPrint.eres.Font.Color := clRed ;
                frmCintaRes.edElast.Font.Color := clRed ;
             end
             else
             begin
             	frmCintaPrint.eres.Font.Color := clBlue ;
                frmCintaRes.edElast.Font.Color := clBlue ;
             end;
             if (strtofloat(frmCintaRes.edPlast.text) > strtofloat(sCEst)) then
             begin
             	frmCintaPrint.pres.Font.Color := clRed ;
                frmCintaRes.edPlast.Font.Color := clRed ;
             end
             else
             begin
               	frmCintaPrint.pres.Font.Color := clBlue ;
                frmCintaRes.edPlast.Font.Color := clBlue ;
             end;
		end
		else
		begin
			 frmCintaRes.stRes.font.color := clBlue ;
			 frmCintaRes.stRes.caption := 'CONFORME' ;
             frmCintaRes.edPlast.Font.Color := clBlue ;
             frmCintaRes.edElast.Font.Color := clBlue ;
             frmCintaPrint.pres.Font.Color := clBlue ;
             frmCintaPrint.eres.Font.Color := clBlue ;
		end;
		end;
			ResetOD;
        frmNovoEnsaio.Close ;
        frmHelmet.SaveRetencao('UltimoEnsaio.hmr');
        //JOTA
        //frmSelEnsaio.btnCintaJugularClick(Sender);
        //FIMJOTA
        frmCintaRes.Show ;
end;


procedure TfrmNovoEnsaio.btnCancelClick(Sender: TObject);
begin
    nbPages.PageIndex := 0 ;
    MTimeout := 30;
    lbRest.Caption := '30';
    tmrDanger.Enabled := false ;
    tmrDesligaMotor.enabled := true;
    frmNovoEnsaio.Close ;
end;

procedure TfrmNovoEnsaio.Button10Click(Sender: TObject);
begin
        //Neto Cancelar
	frmNovoEnsaio.Close ;
end;


procedure TfrmNovoEnsaio.Button12Click(Sender: TObject);
begin
	espera := false ;
	frmNovoEnsaio.Close ;
end;

procedure TfrmNovoEnsaio.Button11Click(Sender: TObject);
begin
	frmNovoEnsaio.Close ;
end;


procedure TfrmNovoEnsaio.tmrDangerTimer(Sender: TObject);
begin
	Dec( MTimeout ) ;
	if MTimeout > 10 then	lbRest.Font.Color := clBlue
	else
	lbRest.Font.Color := clRed ;

	lbRest.Caption := inttostr(MTimeout) ;
	if MTimeout = 0 then
	begin
		tmrDanger.enabled := false ;
		lbRest.Font.color := clBlue ;
		lbRest.Caption := '30' ;
		//frmMachineControl.ComandoMotor(#13'ST1'#13) ;
                //frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[1]+#13); // 1 - Shutdown MOTOR.RGJ
		//frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[2]+#13); // 2 - ShutdownT MOTOR.RGJ
                frmNovoEnsaio.nbPages.PageIndex := 1;
	end;

end;


procedure TfrmNovoEnsaio.btnFecharPorta2Click(Sender: TObject);
var temp : extended;
begin
        GetNormaRepetValues ;
        WriteMainPage ;

        sVeloc := sVelocAI2;
        // Calcula Altura + altura-atrito
        sAltura := sAlturaAI2;
	frmResultados.lbAltImp.caption := sAltura + ' m';//aqui
	if frmAtrito.edAtrito.Text <> '' then
	begin
		temp := (1 + (strtofloat(frmAtrito.edAtrito.Text) / 100)) * strtofloat(sAltura);
		sAltura := formatfloat('0.000',temp) ;
	end;

       	frmResultados.lbResReal.caption := sAltura + ' m';//aqui

	frmResultados.lbVelImp.caption := sVeloc + ' m/s';
	frmImpactoPrint.stVelocidadeImpactoNorma.Caption := sVeloc + ' m/s' ;

	btnFecharPortaClick(Sender);
end;

procedure TfrmNovoEnsaio.btnFecharPorta3Click(Sender: TObject);
var temp : extended;
begin


		sVeloc := sVeloc3 ;
		if frmAtrito.edAtrito.Text <> '' then
		begin
			temp := (1 + (strtofloat(frmAtrito.edAtrito.Text) / 100)) * strtofloat(sAltura3);
			sAltura := formatfloat('0.00',temp) ;
		end
		else
		sAltura := sAltura3;
		frmResultados.lbResReal.caption := sAltura + ' m';//aqui
		frmResultados.lbVelImp.caption := sVeloc + ' m/s';
		frmImpactoPrint.stVelocidadeImpactoNorma.Caption := sVeloc + ' m/s' ;
		frmResultados.lbAltImp.caption := sAltura + ' m';//aqui

		btnFecharPortaClick(Sender);
end;

procedure TfrmNovoEnsaio.btnFecharPorta1Click(Sender: TObject);
var temp : extended;
begin
        GetNormaValues ;
        WriteMainPage ;

        // Velocidade permitida pela norma atual se�ao 1
	//sVeloc := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].SubItems.Strings[3];
        sVeloc := sVelocAI1;
        // Calcula Altura + altura-atrito
	//sAltura := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[4];
        sAltura := sAlturaAI1;
	frmResultados.lbAltImp.caption := sAltura + ' m';//aqui
	if frmAtrito.edAtrito.Text <> '' then
	begin
		temp := (1 + (strtofloat(frmAtrito.edAtrito.Text) / 100)) * strtofloat(sAltura);
		sAltura := formatfloat('0.000',temp) ;
	end;

       	frmResultados.lbResReal.caption := sAltura + ' m';//aqui

	frmResultados.lbVelImp.caption := sVeloc + ' m/s';
	frmImpactoPrint.stVelocidadeImpactoNorma.Caption := sVeloc + ' m/s' ;

	btnFecharPortaClick(Sender);
end;

function TfrmNovoEnsaio.ReadForward : byte;
var Dt : byte ;
begin
			//Porta_1.OutB(LPTControl, $00); // Zero
				//Delay(500);
			//Porta_1.OutB(LPTControl, $09); // Avan�o
			//	Delay(500);
			//	Dt  := Porta_1.InpB(LPTAddress) and 63;
            //Porta_1.OutB(LPTControl, $00); // Zero
		//ReadForward := Dt ;
end;

function TfrmNovoEnsaio.ReadAbsolute : Word ;
var Dt : Word ;
begin
     	//Porta_1.OutB(LPTControl, $00); // Zero
        //Delay(500);
     	//Porta_1.OutB(LPTControl, $0A); // Absoluta
        //DelayRegua(500);
        //Dt  := Porta_1.InpB(LPTAddress) and 63;
	//	ReadAbsolute := Dt ;
        //cbDIn(0, FirstPortA, Dt);
        //ReadAbsolute := Dt;
        //ReadAbsolute := frmMachineControl.readRO;         // 8221
end;

function TFrmNovoEnsaio.CheckOD : boolean ;
begin
		if (ReadAbsolute > 50) then CheckOD := false else CheckOD := true ;
end;

procedure TfrmNovoEnsaio.ResetOD;
begin
	  //Porta_1.OutB(LPTControl, $04); // Reset
	  //Delay(500);
      //Porta_1.OutB(LPTControl, $00); // Zero
    //Porta_1.OutB(LPTAddress, $FF); // Ler
end;


procedure TfrmNovoEnsaio.Button16Click(Sender: TObject);
begin
    bCD := true;
		frmNovoEnsaio.Close ;
end;

procedure TfrmNovoEnsaio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	tmrLeitura.enabled := false ;
        frmHelmet.tmrStatus.Enabled := true;
end;

procedure TfrmNovoEnsaio.tmrLeituraTimer(Sender: TObject);
begin
	tmrLeitura.enabled := false;
	frmNovoEnsaio.edRPos.caption := inttostr(ReadAbsolute);
	tmrLeitura.enabled := true ;
end;

procedure TfrmNovoEnsaio.tmrPararTimer(Sender: TObject);
var DataValue: word;
        bitValue: integer;
begin
        //Neto Timer Fim de Curso
        if (cbAIn(0, 4, BIP5VOLTS, DataValue) <> 0) then
        begin
                tmrParar.enabled := false;
                bParar := true;
                ShowMessage('Erro Lendo FCB!');
        end
        else
        begin
                if (DataValue) < 49152 then   // equiv. � 2,5V
                begin
                        tmrParar.enabled := false;
                        bParar := true;
                        if bParar then
                        begin
        	                tmrParar.enabled := false;
                                frmMachineControl.ComandoMotor('ST'+#13);
                                frmMachineControl.ComandoMotor('MD'+#13);
                                nbPages.PageIndex := 5;
                        end;

                        ShowMessage('Fim de Curso Baixo Atingido!');
                end
        end;

        if (cbAIn(0, 5, BIP5VOLTS, DataValue) <> 0) then
        begin
                tmrParar.enabled := false;
                bParar := true;
                ShowMessage('Erro Lendo FCA!');
        end
        else
        begin
                if (DataValue) < 49152 then   // equiv. � 2,5V
                begin
                        tmrParar.enabled := false;
                        bParar := true;
                        if bParar then
                        begin
        	                tmrParar.enabled := false;
                                frmMachineControl.ComandoMotor('ST'+#13);
                                frmMachineControl.ComandoMotor('MD'+#13);
                                nbPages.PageIndex := 5;
                        end;

                        ShowMessage('Fim de Curso Alto Atingido!');
                end
        end;

        cbDBitIn(0, AUXPORT, 0, bitValue);          // 8221
        if (bitValue) = 1 then
        begin
                tmrParar.enabled := false;
                bParar := true;
                if bParar then
                begin
        	        tmrParar.enabled := false;
                        frmMachineControl.ComandoMotor('ST'+#13);
                        frmMachineControl.ComandoMotor('MD'+#13);
                        nbPages.PageIndex := 5;
               end;

                ShowMessage('Chave de Emerg�ncia Acionada!');
        end;

end;

procedure TfrmNovoEnsaio.SetStatus(str:string);
begin
        if (sEnsaio = 'TRANSMISSAO') then
                StatusTrans.SimpleText := str
        else if (sEnsaio = 'PENETRACAO') then
                StatusPenet.SimpleText := str
        else if (sEnsaio = 'CALIBRACAO') then
                StatusCal.SimpleText := str
        else
        	Status.SimpleText := str;
end;

procedure TfrmNovoEnsaio.GetCombos;
begin
	cbEmpresa.Items         := frmEmpresas.lbEmpresas.Items;
	cbModeloCapacete.Items  := frmCapacetes.lbCapacetes.Items;
	edPosicaoEnsaio.Items   := frmPos.lbPosicoes.Items;
	edCondicionamento.Items := frmCondicionamento.lbCondicionamentos.Items;
end;

procedure TfrmNovoEnsaio.timerPTimer(Sender: TObject);
var t : byte;
begin
	timerP.enabled := false;
    repeat
		t := ReadForward;
    until t<=50;
	if t>tmpP then	tmpP:=t;
    if StopTimerP = false then
		timerP.enabled := true else
        StopTimerP := false;
	Application.ProcessMessages;
end;

procedure TfrmNovoEnsaio.btnCCClick(Sender: TObject);
begin
	bCD := true;
end;

procedure TfrmNovoEnsaio.tmrPerfTimer(Sender: TObject);
begin
	tmrPerf.enabled := false;
	lbIni.Caption := inttostr(ReadAbsolute);
	Application.ProcessMessages;
	tmrPerf.enabled := true;
end;



procedure TfrmNovoEnsaio.btnSobeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL450000'+#13);
end;

procedure TfrmNovoEnsaio.btnSobeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        frmMachineControl.ComandoMotor('ST'+#13);
end;

procedure TfrmNovoEnsaio.btnDesceMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL-450000'+#13);
end;

procedure TfrmNovoEnsaio.btnDesceMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
        frmMachineControl.ComandoMotor('ST'+#13);
end;


procedure TfrmNovoEnsaio.tmrImpTimeoutTimer(Sender: TObject);
begin
     ImpTimeout := True;
     nbPages.PageIndex := 4;
end;

procedure TfrmNovoEnsaio.Button17Click(Sender: TObject);
begin
        stopReadROCinta := True;
end;


procedure TfrmNovoEnsaio.SpeedButton1Click(Sender: TObject);
begin
        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL1514'+#13);
end;

procedure TfrmNovoEnsaio.SpeedButton2Click(Sender: TObject);
begin
        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL-1514'+#13);
end;

procedure TfrmNovoEnsaio.tmrDesligaMotorTimer(Sender: TObject);
begin
        frmMachineControl.ComandoMotor('ME'+#13); // 2 - ShutdownT MOTOR.RGJ
        // frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[2]+#13); // 2 - ShutdownT MOTOR.RGJ
        tmrDesligaMotor.Enabled := false;
end;

procedure TfrmNovoEnsaio.btnIniciarTransmissao1Click(Sender: TObject);
var temp : extended;
begin
        sVeloc := sVelocTR;
        // Calcula Altura + altura-atrito
        sAltura := sAlturaTR;
	frmResultadosTrans.lbAltImp.caption := sAltura + ' m';//aqui
	if frmAtrito.edAtrito.Text <> '' then
	begin
		temp := (1 + (strtofloat(frmAtrito.edAtrito.Text) / 100)) * strtofloat(sAltura);
		sAltura := formatfloat('0.000',temp) ;
	end;

       	frmResultadosTrans.lbResReal.caption := sAltura + ' m';//aqui

	frmResultadosTrans.lbVelImp.caption := sVeloc + ' m/s';
	frmTransmissaoPrint.stVelocidadeImpactoNorma.Caption := sVeloc + ' m/s' ;

	fcnIniciarEnsaioTransmissao(Sender);
end;



procedure TfrmNovoEnsaio.btnFinalizarTransmissaoClick(Sender: TObject);
	 var dTLim1, dTLim2 : double ;
			 sdMax : string ;
             ss100:string;
             straux, straux2: string;
             AppPath: string;
             laltura: longint;
             sMotor: string;
             iStepsM: longint;
             iFMO: integer;
begin
	// Desce o motor novamente
        iStepsM := 151359;
        laltura := Trunc(iStepsM * StrToFloat(sAltura));
        // laltura := Trunc(iStepsM * StrToFloat('1,543'));
        sMotor := inttostr(laltura);

        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL-'+inttostr(laltura)+#13);
//        frmMachineControl.ComandoMotor('DC-'+inttostr(laltura-1000)+#13);
//        frmMachineControl.ComandoMotor('FO1L'+#13);

	SetStatus('Motor command ('+sMotor+') - Estimated Time:' + floattostr(Trunc((StrToFloat(sAltura) * iStepsM)))); //MOTOR.RGJ

	// Incrementa quantidade de ensaios efetuados
	Inc(iImpactos) ;

	// Quantidade de ensaios
	frmResultadosTrans.lbEnsaios.Caption := 'Ensaio '+inttostr(iImpactos)+'.';

	// For�a m�xima
	if (dMax >= strtoint(sForcaMax)) then
	begin
		bCNCmax := false ;
		frmResultadosTrans.lbMaximo.Font.Color := RGB(255,0,0) ;
		frmTransmissaoPrint.stAceleracaoMaxima.Font.Color := RGB(255,0,0) ;
	end
	else
	begin
		bCNCmax := true ;
		frmResultadosTrans.lbMaximo.Font.Color := RGB(0,255,0) ;
		frmTransmissaoPrint.stAceleracaoMaxima.Font.Color := RGB(0,0,255) ;
	end;
        sdMax := formatfloat('####0.00', dMax) ;
	frmResultadosTrans.lbMaximo.caption :=  sdMax + ' N' ;
	frmTransmissaoPrint.stAceleracaoMaxima.caption := sdMax + ' N' ;

	// Ensaio Atual
	EnsaioAtual := eaTransmissao;

	// Atualiza resultados individuais
	begin
                if (Tinv = true) then
                begin
                        frmResultadosTrans.lbSituacao.Font.Color := RGB(255,0,0) ;
                        frmResultadosTrans.lbSituacao.caption := 'TESTE INV�LIDO';
                        bCNCGlobal := false ;
                end
                else
                begin
        		if ((bCNC and bCNCmax) = true) then
	        	begin
		                // Se tudo estiver conforme, Global = conforme
                                frmResultadosTrans.lbSituacao.Font.Color := RGB(0,255,0) ;
		        	frmResultadosTrans.lbSituacao.caption := 'CONFORME' ;
			        bCNCGlobal := true ;
        		end
	        	else
		        begin
        		        // Se n�o estiver conforme, Global = n�o conforme
                                frmResultadosTrans.lbSituacao.Font.Color := RGB(255,0,0) ;
				frmResultadosTrans.lbSituacao.caption := 'N�O CONFORME' ;
                                bCNCGlobal := false ;
			end;
		end ;
	end ;

	// Adiciona resultado na tabela global
        table1.tablename := extractfilepath(application.exename)+'HELMET.DB';
	table1.Active := true;
	table1.append;
	tbNum.Text := frmResultadosTrans.lbAmostra.Caption;
        tbModel.Text := 'TF/' + frmResultadosTrans.lbModelo.Caption;
	tbTam.Text := edTamanho.Text;
	tbCon.Text := frmResultadosTrans.lbCondicionamento.Caption;
	tbPos.Text := frmResultadosTrans.lbEnsaio.Caption;
	tbVel.Text := frmResultadosTrans.lbTemp.Caption;
	//tbMax.Text := frmResultadosTrans.lbMaximo.Caption;
        tb1Lm.Text := frmResultadosTrans.lbMaximo.Caption;
        tb2Lm.Text := frmResultadosTrans.lbSituacao.Caption;
//        ss100 := frmResultadosTrans.lbTempo1.Caption;
//        tb1Lm.Text := Copy( frmresultadosTrans.lbTempo1.Caption, 0, Length(ss100)-2);
	//tb1Lm.Text := frmResultados.lbTempo1.Caption; //edTempoPrimLimite.Text;
	//if frmNormaImpacto.use2nd.checked then
        //	tb2Lm.Text := frmResultados.edTempoSegLimite.Text
        //else
	//        tb2Lm.Text := 'N/A';
	table1.post;
	table1.Active := false;

	//Atualiza valores na tela geral
	frmGeral.mmObs.Lines.Clear;
	frmGeral.mmObs.Lines.Add(valObs);
	frmGeral.lbEmpresa.caption := frmResultadosTrans.lbEmpresa.Caption;
	frmGeral.lbModelo.caption := frmresultadosTrans.lbModelo.caption;
	frmGeral.lbNorma.caption := frmResultadosTrans.lbNorma.caption;

	// Volta para tela inicial
	nbPages.ActivePage := 'Tipo';
	//frmNovoEnsaio.Close ;
	parcial := true ;

        AppPath := extractfilepath(application.exename);
        //Salva ensaio
        straux := FormatDateTime('yymmdd', Now);
        {$I-}
            mkdir(AppPath+'Ensaios');
        {$I+}

        {$I-}
            mkdir(AppPath+'Ensaios\'+straux);
        {$I+}
        straux2 := FormatDateTime('hhmmss', now);

        //Neto Salvar Transmiss�o
        //frmGraficoTrans.tcGrafico.SaveToMetafile(AppPath+'Ensaios\'+straux+'\'+straux2+'.WMF') ;
        frmHelmet.SaveTransmissao(AppPath+'UltimoEnsaio.hmt');
	frmHelmet.SaveTransmissao(AppPath+'Ensaios\'+straux+'\'+straux2+'.hmt');

        frmMachineControl.Delay(500);    // 200
        //frmSelEnsaio.btnImpactoClick(Sender);

        frmResultadosTrans.Show ;

        //Aguarda Descida do Motor
{
        cbDBitIn(0, AUXPORT, 2, iFMO);
        while ((iFMO = 1) and (bParar = false)) do
	begin
                cbDBitIn(0, AUXPORT, 2, iFMO);
                Application.ProcessMessages;
        end;
}

        CbDBitOut(0, AUXPORT, 4, 1) ;  // 8221  sobe porta

        //frmNovoEnsaio.Delay (12000) ; //MOTOR.RGJ
        frmNovoEnsaio.Delay (StrToInt(sTmrMotorTR)) ;
        CbDBitOut(0, AUXPORT, 5, 1) ;  // 8221  abre trava
        frmNovoEnsaio.Delay (500) ; //MOTOR.RGJ
        frmMachineControl.ComandoMotor('MD'+#13); // 4 - Move Up MOTOR.RGJ
        tmrParar.enabled := false;

        Close();
end;

procedure TfrmNovoEnsaio.btnIniciarPenetracao1Click(Sender: TObject);
var temp : extended;
begin
        GetNormaPenetracaoTopoValues ;
	WriteMainPagePenet ;

        // Calcula Altura + altura-atrito
	frmResultadosTrans.lbAltImp.caption := sAltura + ' m';//aqui
	if frmAtrito.edAtrito.Text <> '' then
	begin
		temp := (1 + (strtofloat(frmAtrito.edAtrito.Text) / 100)) * strtofloat(sAltura);
		sAltura := formatfloat('0.000',temp) ;
	end;

       	frmResultadosPenet.lbResReal.caption := sAltura + ' m';//aqui

	frmResultadosPenet.lbVelImp.caption := sVeloc + ' m/s';
	frmPenetracaoPrint.stVelocidadePenetracaoNorma.Caption := sVeloc + ' m/s' ;

	fcnIniciarEnsaioPenetracao(Sender);
end;

procedure TfrmNovoEnsaio.btnIniciarPenetracao2Click(Sender: TObject);
var temp : extended;
begin
        GetNormaPenetracaoExcValues ;
	WriteMainPagePenet ;

        // Calcula Altura + altura-atrito
	frmResultadosTrans.lbAltImp.caption := sAltura + ' m';//aqui
	if frmAtrito.edAtrito.Text <> '' then
	begin
		temp := (1 + (strtofloat(frmAtrito.edAtrito.Text) / 100)) * strtofloat(sAltura);
		sAltura := formatfloat('0.000',temp) ;
	end;

       	frmResultadosPenet.lbResReal.caption := sAltura + ' m';//aqui

	frmResultadosPenet.lbVelImp.caption := sVeloc + ' m/s';
	frmPenetracaoPrint.stVelocidadePenetracaoNorma.Caption := sVeloc + ' m/s' ;

	fcnIniciarEnsaioPenetracao(Sender);
end;

procedure TfrmNovoEnsaio.btnFinalizarPenetracaoClick(Sender: TObject);
var dTLim1, dTim2 : double ;
         sdMax : string ;
         ss100:string;
         straux, straux2: string;
         AppPath: string;
         laltura: longint;
         sMotor: string;
         iStepsM: longint;
         iFMO: integer;
begin
	// Desce o motor novamente
        iStepsM := 151359;
        laltura := Trunc(iStepsM * StrToFloat(sAltura));
        sMotor := inttostr(laltura);

        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL-'+inttostr(laltura)+#13);
//        frmMachineControl.ComandoMotor('DC-'+inttostr(laltura-1000)+#13);
//        frmMachineControl.ComandoMotor('FO1L'+#13);
	SetStatus('Motor command ('+sMotor+') - Estimated Time:' + floattostr(Trunc((StrToFloat(sAltura) * iStepsM)))); //MOTOR.RGJ

	// Incrementa quantidade de ensaios efetuados
	Inc(iImpactos) ;

	// Quantidade de ensaios
	frmResultadosPenet.lbEnsaios.Caption := 'Ensaio '+inttostr(iImpactos)+'.';

	// Penetra��o
	//if dMax > 49152 then   // equiv. � 2,5V
        if dMin < 49152 then   // equiv. � 2,5V
	begin
		bCNCmax := false ;
		frmResultadosPenet.lbPenet.Font.Color := RGB(255,0,0) ;
		frmPenetracaoPrint.stPenet.Font.Color := RGB(255,0,0) ;
                frmResultadosPenet.lbPenet.caption :=  'OCORREU' ;
                frmPenetracaoPrint.stPenet.caption :=  'OCORREU' ;
	end
	else
	begin
		bCNCmax := true ;
		frmResultadosPenet.lbPenet.Font.Color := RGB(0,255,0) ;
		frmPenetracaoPrint.stPenet.Font.Color := RGB(0,0,255) ;
                frmResultadosPenet.lbPenet.caption :=  'N�O OCORREU' ;
                frmPenetracaoPrint.stPenet.caption :=  'N�O OCORREU' ;
	end;
	sdMax := (floattostr(dMax)) ;
	Delete(sdMax, 6, 100) ;


	// Ensaio Atual
	EnsaioAtual := eaPenetracao;

	// Atualiza resultados individuais
	begin
                if (Tinv = true) then
                begin
                        frmResultadosPenet.lbSituacao.Font.Color := RGB(255,0,0) ;
                        frmResultadosPenet.lbSituacao.caption := 'TESTE INV�LIDO';
                        bCNCGlobal := false ;
                end
                else
                begin
        		if ((bCNC and bCNCmax) = true) then
	        	begin
		                // Se tudo estiver conforme, Global = conforme
                                frmResultadosPenet.lbSituacao.Font.Color := RGB(0,255,0) ;
		        	frmResultadosPenet.lbSituacao.caption := 'CONFORME' ;
			        bCNCGlobal := true ;
        		end
	        	else
		        begin
        		        // Se n�o estiver conforme, Global = n�o conforme
                                frmResultadosPenet.lbSituacao.Font.Color := RGB(255,0,0) ;
				frmResultadosPenet.lbSituacao.caption := 'N�O CONFORME' ;
                                bCNCGlobal := false ;
			end;
		end ;
	end ;

	// Adiciona resultado na tabela global
        table1.tablename := extractfilepath(application.exename)+'HELMET.DB';
	table1.Active := true;
	table1.append;
	tbNum.Text := frmResultadosPenet.lbAmostra.Caption;
        tbModel.Text := 'Pen/'+frmResultadosPenet.lbModelo.Caption;
	tbTam.Text := edTamanho.Text;
	tbCon.Text := frmResultadosPenet.lbCondicionamento.Caption;
	tbPos.Text := frmResultadosPenet.lbEnsaio.Caption;
	tbVel.Text := frmResultadosPenet.lbTemp.Caption;
	tbMax.Text := frmResultadosPenet.lbPenet.Caption;
        tb2Lm.Text := frmResultadosPenet.lbSituacao.Caption;
//
//        ss100 := frmResultadosTrans.lbTempo1.Caption;
//        tb1Lm.Text := Copy( frmresultadosTrans.lbTempo1.Caption, 0, Length(ss100)-2);
	//tb1Lm.Text := frmResultados.lbTempo1.Caption; //edTempoPrimLimite.Text;
	//if frmNormaImpacto.use2nd.checked then
        //	tb2Lm.Text := frmResultados.edTempoSegLimite.Text
        //else
	//        tb2Lm.Text := 'N/A';
	table1.post;
	table1.Active := false;

	//Atualiza valores na tela geral
	frmGeral.mmObs.Lines.Clear;
	frmGeral.mmObs.Lines.Add(valObs);
	frmGeral.lbEmpresa.caption := frmResultadosPenet.lbEmpresa.Caption;
	frmGeral.lbModelo.caption := frmresultadosPenet.lbModelo.caption;
	frmGeral.lbNorma.caption := frmResultadosPenet.lbNorma.caption;

	// Volta para tela inicial
	nbPages.ActivePage := 'Tipo';
	//frmNovoEnsaio.Close ;
	parcial := true ;

        AppPath := extractfilepath(application.exename);
        //Salva ensaio
        straux := FormatDateTime('yymmdd', Now);
        {$I-}
            mkdir(AppPath+'Ensaios');
        {$I+}

        {$I-}
            mkdir(AppPath+'Ensaios\'+straux);
        {$I+}
        straux2 := FormatDateTime('hhmmss', now);

        //frmGrafico.tcGrafico.SaveToMetafile(AppPath+'Ensaios\'+straux+'\'+straux2+'.WMF') ;
        frmHelmet.SavePenetracao(AppPath+'UltimoEnsaio.hmp');
	frmHelmet.SavePenetracao(AppPath+'Ensaios\'+straux+'\'+straux2+'.hmp');

        frmMachineControl.Delay(200);
        //frmSelEnsaio.btnImpactoClick(Sender);

        frmResultadosPenet.Show ;

        //Aguarda Descida do Motor
{
        cbDBitIn(0, AUXPORT, 2, iFMO);
        while ((iFMO = 1) and (bParar = false)) do
	begin
                cbDBitIn(0, AUXPORT, 2, iFMO);
                Application.ProcessMessages;
        end;
}

        CbDBitOut(0, AUXPORT, 4, 1) ;  // 8221  sobe porta

        if sAlturap = '2,5' then
                //frmMachineControl.Delay(19000)         // MUDAR e acrescentar al�m do tempo certo o FCA
                frmMachineControl.Delay(StrToInt(sTmrMotorPE1))
        else
                //frmMachineControl.Delay(10000);         // MUDAR e acrescentar al�m do tempo certo o FCA
                frmMachineControl.Delay(StrToInt(sTmrMotorPE2));
        CbDBitOut(0, AUXPORT, 5, 1) ;  // 8221  abre trava
        frmNovoEnsaio.Delay (500) ; //MOTOR.RGJ
        frmMachineControl.ComandoMotor('MD'+#13); // 4 - Move Up MOTOR.RGJ
        tmrParar.enabled := false;

        Close();
end;

procedure TfrmNovoEnsaio.btnIniciarCalibracao1Click(Sender: TObject);
var temp : extended;
begin
        GetNormaCalibracao1Values ;
        WriteMainPageCal ;


        sVeloc := sVelocCA1;
        // Calcula Altura + altura-atrito
        sAltura := sAlturaCA1;
        frmCalibracaoPrint.stAlturaNorma.caption := sAltura + ' m';//aqui
	frmResultadosCal.lbAltImp.caption := sAltura + ' m';//aqui
	if frmAtrito.edAtrito.Text <> '' then
	begin
		temp := (1 + (strtofloat(frmAtrito.edAtrito.Text) / 100)) * strtofloat(sAltura);
		sAltura := formatfloat('0.000',temp) ;
	end;

       	frmResultadosCal.lbResReal.caption := sAltura + ' m';//aqui

	frmResultadosCal.lbVelImp.caption := sVeloc + ' m/s';
	//frmCalibracaoPrint.stVelocidadeImpactoNorma.Caption := sVeloc + ' m/s' ;

	fcnIniciarCalibracao(Sender);
end;

procedure TfrmNovoEnsaio.btnIniciarCalibracao2Click(Sender: TObject);
var temp : extended;
begin
        GetNormaCalibracao2Values ;
        WriteMainPageCal ;

        sVeloc := sVelocCA2;
        // Calcula Altura + altura-atrito
        sAltura := sAlturaCA2;
	frmResultadosCal.lbAltImp.caption := sAltura + ' m';//aqui
	if frmAtrito.edAtrito.Text <> '' then
	begin
		temp := (1 + (strtofloat(frmAtrito.edAtrito.Text) / 100)) * strtofloat(sAltura);
		sAltura := formatfloat('0.000',temp) ;
	end;

       	frmResultadosCal.lbResReal.caption := sAltura + ' m';//aqui

	frmResultadosCal.lbVelImp.caption := sVeloc + ' m/s';
	//frmCalibracaoPrint.stVelocidadeImpactoNorma.Caption := sVeloc + ' m/s' ;

	fcnIniciarCalibracao(Sender);
end;

procedure TfrmNovoEnsaio.btnFinalizarCalibracaoClick(Sender: TObject);
	 var dTLim1, dTLim2, dPercDiff : double ;
			 sdMax : string ;
             ss100:string;
             straux, straux2: string;
             AppPath: string;
             laltura: longint;
             sMotor: string;
             iStepsM: longint;
             iFMO: integer;
begin
	// Desce o motor novamente
        iStepsM := 151359;
        laltura := Trunc(iStepsM * StrToFloat(sAltura));
        sMotor := inttostr(laltura);

        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL-'+inttostr(laltura)+#13);
//        frmMachineControl.ComandoMotor('DC-'+inttostr(laltura-10)+#13);
//        frmMachineControl.ComandoMotor('FO1L'+#13);
//        frmMachineControl.Delay(8000);         // MUDAR e acrescentar al�m do tempo certo o FCA

	SetStatus('Motor command ('+sMotor+') - Estimated Time:' + floattostr(Trunc((StrToFloat(sAltura) * iStepsM)))); //MOTOR.RGJ

	// Incrementa quantidade de ensaios efetuados
	Inc(iImpactos) ;

	// Quantidade de ensaios
	frmResultadosCal.lbEnsaios.Caption := 'Ensaio '+inttostr(iImpactos)+'.';

	// For�a m�xima
        dPercDiff := 0.0;
        dPercDiff := (100*(dMax-dMaxN))/dMax;
        if  (dPercDiff >= 2.5) or (dPercDiff <= 2.5) then
	begin
		bCNCmax := false ;
	end
	else
	begin
	 	bCNCmax := true ;
	end;

        frmCalibracaoPrint.stNorma.caption := 'NBR 8221' ;
        frmCalibracaoPrint.stDifNorma.caption := '2.5 %' ;

        sdMax := formatfloat('####0.00', (dMax/9.8/3.6)) ;
	frmResultadosCal.lbMaxZg.caption :=  sdMax + ' g' ;
        frmCalibracaoPrint.stMaxZg.caption := sdMax + ' g' ;

	//sdMax := (floattostr(dMax)) ;
	//Delete(sdMax, 6, 100) ;
        sdMax := formatfloat('####0.00', dMax) ;
	frmResultadosCal.lbMaxZ.caption :=  sdMax + ' N' ;
	frmCalibracaoPrint.stMaxZ.caption := sdMax + ' N' ;


	//sdMax := (floattostr(dMaxN)) ;
	//Delete(sdMax, 6, 100) ;
        sdMax := formatfloat('####0.00', dMaxN) ;
	frmResultadosCal.lbMaxN.caption :=  sdMax + ' N' ;
	frmCalibracaoPrint.stMaxN.caption := sdMax + ' N' ;

        sdMax := (floattostr(dMaxN-dMax)) ;
	Delete(sdMax, 6, 100) ;
	frmResultadosCal.lbDifZN.caption :=  sdMax + ' N' ;
	frmCalibracaoPrint.stDif.caption := sdMax + ' N' ;


	// Ensaio Atual
	EnsaioAtual := eaCalibracao;

	// Atualiza resultados individuais
	begin
                if (Tinv = true) then
                begin
                        frmResultadosCal.lbSituacao.Font.Color := RGB(255,0,0) ;
                        frmResultadosCal.lbSituacao.caption := 'TESTE INV�LIDO';
                        frmCalibracaoPrint.stSituacao.caption := 'TESTE INV�LIDO' ;
                        bCNCGlobal := false ;
                end
                else
                begin
        		if (bCNCmax = true) then
	        	begin
		                // Se tudo estiver conforme, Global = conforme
                                frmResultadosCal.lbSituacao.Font.Color := RGB(0,255,0) ;
		        	frmResultadosCal.lbSituacao.caption := 'CONFORME' ;
                                frmCalibracaoPrint.stSituacao.caption := 'CONFORME' ;
			        bCNCGlobal := true ;
        		end
	        	else
		        begin
        		        // Se n�o estiver conforme, Global = n�o conforme
                                frmResultadosCal.lbSituacao.Font.Color := RGB(255,0,0) ;
				frmResultadosCal.lbSituacao.caption := 'N�O CONFORME' ;
                                frmCalibracaoPrint.stSituacao.caption := 'N�O CONFORME' ;
                                bCNCGlobal := false ;
			end;
		end ;
	end ;

	// Adiciona resultado na tabela global
        table1.tablename := extractfilepath(application.exename)+'HELMET.DB';
	table1.Active := true;
	table1.append;
	tbNum.Text := frmResultadosCal.lbAmostra.Caption;
        tbModel.Text := 'Cal/'+frmResultadosCal.lbModelo.Caption;
	tbTam.Text := edTamanho.Text;
	tbCon.Text := frmResultadosCal.lbCondicionamento.Caption;
	tbPos.Text := frmResultadosCal.lbEnsaio.Caption;
	tbVel.Text := frmResultadosCal.lbTemp.Caption;
	tbMax.Text := frmResultadosCal.lbMaxZg.Caption;
        tb1Lm.Text := frmResultadosCal.lbMaxN.Caption;
        tb2Lm.Text := frmResultadosCal.lbSituacao.Caption;
//        ss100 := frmResultadosTrans.lbTempo1.Caption;
//        tb1Lm.Text := Copy( frmresultadosTrans.lbTempo1.Caption, 0, Length(ss100)-2);
	//tb1Lm.Text := frmResultados.lbTempo1.Caption; //edTempoPrimLimite.Text;
	//if frmNormaImpacto.use2nd.checked then
        //	tb2Lm.Text := frmResultados.edTempoSegLimite.Text
        //else
	//        tb2Lm.Text := 'N/A';
	table1.post;
	table1.Active := false;

	//Atualiza valores na tela geral
	frmGeral.mmObs.Lines.Clear;
	frmGeral.mmObs.Lines.Add(valObs);
	frmGeral.lbEmpresa.caption := frmResultadosCal.lbEmpresa.Caption;
	frmGeral.lbModelo.caption := frmresultadosCal.lbModelo.caption;
	frmGeral.lbNorma.caption := frmResultadosCal.lbNorma.caption;

	// Volta para tela inicial
	nbPages.ActivePage := 'Tipo';
	//frmNovoEnsaio.Close ;
	parcial := true ;

        AppPath := extractfilepath(application.exename);
        //Salva ensaio
        straux := FormatDateTime('yymmdd', Now);
        {$I-}
            mkdir(AppPath+'Ensaios');
        {$I+}

        {$I-}
            mkdir(AppPath+'Ensaios\'+straux);
        {$I+}
        straux2 := FormatDateTime('hhmmss', now);

        //frmGrafico.tcGrafico.SaveToMetafile(AppPath+'Ensaios\'+straux+'\'+straux2+'.WMF') ;
        frmHelmet.SaveCalibracao(AppPath+'UltimoEnsaio.hmc');
	frmHelmet.SaveCalibracao(AppPath+'Ensaios\'+straux+'\'+straux2+'.hmc');

        frmMachineControl.Delay(200);
        //frmSelEnsaio.btnImpactoClick(Sender);

        frmResultadosCal.Show ;

        //Aguarda Descida do Motor
{        cbDBitIn(0, AUXPORT, 2, iFMO);
        while ((iFMO = 1) and (bParar = false)) do
	begin
                cbDBitIn(0, AUXPORT, 2, iFMO);
                Application.ProcessMessages;
        end;
}
        CbDBitOut(0, AUXPORT, 4, 1) ;  // 8221  sobe porta

        if sAlturap = '1,0' then
                //frmMachineControl.Delay(8000)         // MUDAR e acrescentar al�m do tempo certo o FCA
                frmMachineControl.Delay(StrToInt(sTmrMotorCA1))
        else
                //frmMachineControl.Delay(5000);         // MUDAR e acrescentar al�m do tempo certo o FCA
                frmMachineControl.Delay(StrToInt(sTmrMotorCA2));

        CbDBitOut(0, AUXPORT, 5, 1) ;  // 8221  abre trava
        frmNovoEnsaio.Delay (500) ; //MOTOR.RGJ
        frmMachineControl.ComandoMotor('MD'+#13); // 4 - Move Up MOTOR.RGJ
        tmrParar.enabled := false;

        Close();
end;

procedure TfrmNovoEnsaio.Button18Click(Sender: TObject);
begin
        // neto 2
        CbDBitOut(0, AUXPORT, 5, 0) ;  // 8221

end;

procedure TfrmNovoEnsaio.Button20Click(Sender: TObject);
begin
        // neto 2
        CbDBitOut(0, AUXPORT, 5, 1) ;  // 8221

end;

procedure TfrmNovoEnsaio.LoadNorma8221Values(FileName: TFileName);
var
	fNorma	        :	TextFile;
        sBuff           :       String;
begin
	AssignFile(fNorma, FileName);
        {$I-}
	        Reset(fNorma);
        {$I+}
        if IOResult <> 0 then
        begin
                ShowMessage('Erro abrindo arquivo ' + FileName);
                Exit;
        end;

      	ReadLn(fNorma, sBuff); //Atenua��o 1
        ReadLn(fNorma, sVelocAI1); //Atenua��o 1 - Velocidade
        ReadLn(fNorma, sAlturaAI1); //Atenua��o 1 - Altura
        ReadLn(fNorma, sTmrMotorAI1); //Atenua��o 1 - Timer Espera Motor
        ReadLn(fNorma, sMultiplicadorAI1); //Atenua��o 1 - Multiplicador

      	ReadLn(fNorma, sBuff); //Atenua��o 2
        ReadLn(fNorma, sVelocAI2); //Atenua��o 2 - Velocidade
        ReadLn(fNorma, sAlturaAI2); //Atenua��o 2 - Altura
        ReadLn(fNorma, sTmrMotorAI2); //Atenua��o 2 - Timer Espera Motor
        ReadLn(fNorma, sMultiplicadorAI2); //Atenua��o 2 - Multiplicador

        ReadLn(fNorma, sBuff); //Ttransmiss�o
        ReadLn(fNorma, sVelocTR); //Ttransmiss�o - Velocidade
        ReadLn(fNorma, sAlturaTR); //Ttransmiss�o - Altura
        ReadLn(fNorma, sTmrMotorTR); //Ttransmiss�o - Timer Espera Motor
        ReadLn(fNorma, sMultiplicadorTR); //Ttransmiss�o - Multiplicador

      	ReadLn(fNorma, sBuff); //Penetra��o 1
        ReadLn(fNorma, sVelocPE1); //Penetra��o 1 - Velocidade
        ReadLn(fNorma, sAlturaPE1); //Penetra��o 1 - Altura
        ReadLn(fNorma, sTmrMotorPE1); //Penetra��o 1 - Timer Espera Motor
        ReadLn(fNorma, sMultiplicadorPE1); //Penetra��o 1 - Multiplicador

      	ReadLn(fNorma, sBuff); //Penetra��o 2
        ReadLn(fNorma, sVelocPE2); //Penetra��o 2 - Velocidade
        ReadLn(fNorma, sAlturaPE2); //Penetra��o 2 - Altura
        ReadLn(fNorma, sTmrMotorPE2); //Penetra��o 2 - Timer Espera Motor
        ReadLn(fNorma, sMultiplicadorPE2); //Penetra��o 2 - Multiplicador

        ReadLn(fNorma, sBuff); //Calibra��o 1
        ReadLn(fNorma, sVelocCA1); //Calibra��o 1 - Velocidade
        ReadLn(fNorma, sAlturaCA1); //Calibra��o 1 - Altura
        ReadLn(fNorma, sTmrMotorCA1); //Calibra��o 1 - Timer Espera Motor
        ReadLn(fNorma, sMultiplicadorCA1); //Calibra��o 1 - Multiplicador

        ReadLn(fNorma, sBuff); //Calibra��o 2
        ReadLn(fNorma, sVelocCA2); //Calibra��o 2 - Velocidade
        ReadLn(fNorma, sAlturaCA2); //Calibra��o 2 - Altura
        ReadLn(fNorma, sTmrMotorCA2); //Calibra��o 2 - Timer Espera Motor
        ReadLn(fNorma, sMultiplicadorCA2); //Calibra��o 2 - Multiplicador

        ReadLn(fNorma, sBuff); //Sensibilidade CC
        ReadLn(fNorma, sSensCC); //Sensibilidade CC - Valor

        CloseFile(fNorma);

end;

end.
