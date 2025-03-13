unit uDiagnostico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, CPort, StdCtrls, ComCtrls, Buttons, Mask, Cbw32, uMachineControl;

type
  TfrmDiagnostico = class(TForm)
    lbAjusteCapacete: TLabel;
    Label2: TLabel;
    btnSobe: TSpeedButton;
    btnDesce: TSpeedButton;
    Label4: TLabel;
    updown: TUpDown;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    btnGarraOff: TImage;
    btnCordaOff: TImage;
    btnVelocidadeOff: TImage;
    btnPortaOff: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
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
    Timer1: TTimer;
    MemoData: TMemo;
    Label17: TLabel;
    ledPortaOn: TImage;
    ledGarraOn: TImage;
    ledCordaOn: TImage;
    ledVelocidadeOn: TImage;
    ledFcbOn: TImage;
    ledFcaOn: TImage;
    ledEmergenciaOn: TImage;
    btnGarraOn: TImage;
    btnCordaOn: TImage;
    btnVelocidadeOn: TImage;
    btnPortaOn: TImage;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    MaskEdit1: TMaskEdit;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label24: TLabel;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox6: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image4: TImage;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Panel1: TPanel;
    Label29: TLabel;
    ledVelocidadeOff: TImage;
    Image10: TImage;
    SpeedButton3: TSpeedButton;
    GroupBox7: TGroupBox;
    Label30: TLabel;
    //lbReguaPos: TLabel;
    btnLampadaOff: TImage;
    btnLampadaOn: TImage;
    Label9: TLabel;
    ledFMOn: TImage;
    ledFMOff: TImage;
    Label27: TLabel;
    Label31: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    procedure updownClick(Sender: TObject; Button: TUDBtnType);
    procedure btnSobeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSobeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnDesceMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnDesceMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGarraOffClick(Sender: TObject);
    procedure btnGarraOnClick(Sender: TObject);
    procedure btnCordaOnClick(Sender: TObject);
    procedure btnVelocidadeOnClick(Sender: TObject);
    procedure btnPortaOnClick(Sender: TObject);
    procedure btnCordaOffClick(Sender: TObject);
    procedure btnVelocidadeOffClick(Sender: TObject);
    procedure btnPortaOffClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    //procedure ComandoMotor(sComando: string);
    procedure CheckBox1Click(Sender: TObject);
    procedure btnLampadaOnClick(Sender: TObject);
    procedure btnLampadaOffClick(Sender: TObject);
    procedure Delay(iMSecs: integer);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDiagnostico: TfrmDiagnostico;

implementation

uses uNormas, uHelmet, uNovoEnsaio;

{$R *.DFM}

{===============================================================================
  DELAY DELAY DELAY DELAY DELAY DELAY DELAY DELAY DELAY DELAY DELAY DELAY DELAY
===============================================================================}
procedure TfrmDiagnostico.Delay (iMSecs: integer);
var
	lFirstTickCount	: longint;
begin
	lFirstTickCount := GetTickCount;
	repeat
		Application.ProcessMessages ;
	until ((GetTickCount - lFirstTickCount) >= longint(iMSecs));

end;

procedure TfrmDiagnostico.updownClick(Sender: TObject; Button: TUDBtnType);     // 8221
begin
//        frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[6]+#13); // 6 - 1cm Move MOTOR.RGJ
	if button = btNext then
	begin
//                frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[4]+#13); // 4 - Move Up MOTOR.RGJ
                frmMachineControl.ComandoMotor('ME'+#13);
                frmMachineControl.ComandoMotor('FL1514'+#13);
	end
		else
	begin
		if button = btPrev then
			begin
//			 frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[5]+#13); // 5 - Move Down MOTOR.RGJ
                        frmMachineControl.ComandoMotor('ME'+#13);
                        frmMachineControl.ComandoMotor('FL-1514'+#13);
			end;
	end;
end;



procedure TfrmDiagnostico.btnSobeMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
begin
        frmMachineControl.ComandoMotor('ST'+#13);
end;



procedure TfrmDiagnostico.btnSobeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL450000'+#13);
end;


procedure TfrmDiagnostico.SpeedButton1Click(Sender: TObject);
var cmd: string;
    aux: longint;
    aux2: real;
    iStepsM: longint;
begin
     if CheckBox1.Checked Then
          aux := StrToInt(Edit2.Text)
     else
        begin
          iStepsM := 151359;  //strtoint(frmHelmet.lstMotor.Lines[11]); // 11- Steps/M: 1677812
          aux2 := StrToInt(Edit1.Text) /1000 * iStepsM; //MOTOR.RGJ
          aux := Trunc(aux2); //MOTOR.RGJ
        end;
     cmd := 'FL'+inttostr(aux)+#13;
     //#13+frmHelmet.lstMotor.Lines[9]+inttostr(aux)+frmHelmet.lstMotor.Lines[10]+#13; //MOTOR.RGJ
     // 9 - Specific Move / 10- Normal Cur ( ST0)
     frmMachineControl.ComandoMotor('ME'+#13);
     frmMachineControl.ComandoMotor(cmd); //MOTOR.RGJ
     //frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[4]+#13) ; // 4 - Move Up MOTOR.RGJ
end;

procedure TfrmDiagnostico.btnDesceMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
        frmMachineControl.ComandoMotor('ME'+#13);
        frmMachineControl.ComandoMotor('FL-450000'+#13);
end;

procedure TfrmDiagnostico.btnDesceMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
        frmMachineControl.ComandoMotor('ST'+#13);
end;

procedure TfrmDiagnostico.SpeedButton2Click(Sender: TObject);
var cmd: string;
    aux: longint;
    aux2: real;
    iStepsM: longint;
begin
     if CheckBox1.Checked Then
          aux := StrToInt(Edit2.Text)
     else
        begin
          iStepsM := 151359;  //strtoint(frmHelmet.lstMotor.Lines[11]); // 11- Steps/M: 1677812
          aux2 := StrToInt(Edit1.Text) /1000 * iStepsM; //MOTOR.RGJ
          aux := Trunc(aux2); //MOTOR.RGJ
        end;
     cmd := 'FL-'+inttostr(aux)+#13;
     // 9 - Specific Move / 10- Normal Cur ( ST0)
     frmMachineControl.ComandoMotor('ME'+#13);
     frmMachineControl.ComandoMotor(cmd); //MOTOR.RGJ
//     frmMachineControl.ComandoMotor(cmd); //MOTOR.RGJ
//     frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[5]+#13) ; // 5 - Move Down MOTOR.RGJ
end;

procedure TfrmDiagnostico.Timer1Timer(Sender: TObject);
var bitValue : integer;
var dataValue: Word;
begin
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
        //cbDBitIn(0, FIRSTPORTA, 12, bitValue);
        //bitValue := frmMachineControl.readEmergencia();
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

        //cbDBitIn(0, FIRSTPORTA, 11, bitValue);
        //bitValue := frmMachineControl.readCorda();
        {if (bitValue and 16) = 16 then
        begin
                ledCordaOff.Visible := true;
                ledCordaOn.Visible := false;
        end
        else
        begin
                ledCordaOff.Visible := false;
                ledCordaOn.Visible := true;
        end;  }

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

{        cbDBitIn(0, AUXPORT, 7, bitValue);     // 8221   teste do PA
        if (bitValue) = 1 then
        begin
                btnLampadaOff.Visible := true;
                btnLampadaOn.Visible := false;
        end
        else
        begin
                btnLampadaOff.Visible := false;
                btnLampadaOn.Visible := true;
        end;
}
        //lbReguaPos.caption := inttostr(frmNovoEnsaio.ReadAbsolute);

        // Reseta operações de background
	//cbStopBackground(1, AIFUNCTION) ;
        cbStopBackground(0) ;

        //Acelerometros e trnsdutor de força    8221
        if (cbAIn(0, 0, BIP5VOLTS, DataValue) <> 0) then
                MemoData.Lines.Add('Erro Lendo Acelerômetro X!')
        else
        Begin
                Edit3.Text := FormatFloat('0.0', (((DataValue * 10)/65535)-5)*1000);
                Edit6.Text := FormatFloat('0.0', StrToFloat(Edit3.Text) / StrToInt(MaskEdit1.Text));
        End;


        if (cbAIn(0, 1, BIP5VOLTS, DataValue) <> 0) Then
                MemoData.Lines.Add('Erro Lendo Acelerômetro Y!')
        else
        Begin
                Edit4.Text := FormatFloat('0.0', (((DataValue * 10)/65535)-5)*1000);
                Edit7.Text := FormatFloat('0.0', StrToFloat(Edit4.Text) / StrToInt(MaskEdit1.Text));
        End;

        if (cbAIn(0, 2, BIP5VOLTS, DataValue) <> 0) then
                MemoData.Lines.Add('Erro Lendo Acelerômetro Z!')
        else
        Begin
                Edit5.Text := FormatFloat('0.0', (((DataValue * 10)/65535)-5)*1000);
                Edit8.Text := FormatFloat('0.0', StrToFloat(Edit5.Text) / StrToInt(MaskEdit1.Text) );
        End;

        if (cbAIn(0, 3, BIP5VOLTS, DataValue) <> 0) then
                MemoData.Lines.Add('Erro Lendo Transdutor de Força!')
        else
        Begin
                Edit10.Text := FormatFloat('0.0', (((DataValue * 10)/65535)-5)*1000);
                Edit11.Text := FormatFloat('0.0', (4903/5000) * StrToFloat(Edit10.Text));
                // Edit11.Text := FormatFloat('0.0', (4903/5000) * StrToFloat(Edit10.Text));
        End;

end;

{procedure TfrmDiagnostico.ComandoMotor(sComando: string);
var
	sTemp	:	string;
begin
	sTemp := sComando;
	//Comm.WriteCommData(PChar(sTemp), Length(sTemp));
        frmMachineControl.ComPort1.WriteStr(sComando);
end;}

procedure TfrmDiagnostico.FormCreate(Sender: TObject);
var iErr: integer;
begin
        btnPortaOn.Visible := true;        //8221
        btnPortaOff.Visible := false;
	// Configura parâmetros do counter
        if frmHelmet.DesSensVel = false then
        begin
                //cbC8254Config(0, 4, RATEGENERATOR);
                //iErr := cbCLoad(0, LOADREG4, 10);
        	//if iErr <> 0 then ShowMessage('Erro ao carregar Counter.');

	        //cbC8254Config(0, 5, HIGHONLASTCOUNT ) ;
        end;

        //Configura Port 1 como entrada
        //cbDConfigPort(0, 0, DIGITALIN);

        //Configura Port 2 como entrada
        //cbDConfigPort(0, 1, DIGITALIN);

        //Configura Port 3 como saida
        {if cbDConfigPort(0, FIRSTPORTCL, DIGITALOUT) <> 0 then
                MemoData.Lines.Add('Erro configurando Porta 3 L como saída!')
        else
                MemoData.Lines.Add('SUCESSO configurando Porta 3 L como saída!');

        if cbDConfigPort(0, FIRSTPORTCH, DIGITALOUT) <> 0 then
                MemoData.Lines.Add('Erro configurando Porta 3 H como saída!')
        else
                MemoData.Lines.Add('SUCESSO configurando Porta 3 H como saída!');}

        //cbDBitOut(0, FIRSTPORTA, 23, 0);
        //CbDBitOut(1, AUXPORT, 7, 0) ;
        //cbDBitOut(0, FIRSTPORTA, 22, 0);
        //CbDBitOut(1, AUXPORT, 6, 0) ;
        //cbDBitOut(0, FIRSTPORTA, 21, 0);
        //CbDBitOut(1, AUXPORT, 5, 0) ;
        //cbDBitOut(0, FIRSTPORTA, 20, 0);
        //CbDBitOut(1, AUXPORT, 4, 0) ;
        //cbDBitOut(0, FIRSTPORTA, 19, 0);
        //CbDBitOut(1, AUXPORT, 3, 0) ;
        //cbDBitOut(0, FIRSTPORTA, 18, 0);
        //CbDBitOut(1, AUXPORT, 2, 0) ;
        //cbDBitOut(0, FIRSTPORTA, 17, 0);
        //CbDBitOut(1, AUXPORT, 1, 0) ;
        //cbDBitOut(0, FIRSTPORTA, 16, 0);
        //CbDBitOut(1, AUXPORT, 0, 0) ;

        // Configura parâmetros do counter
//	if (cbC8254Config(0, 1, HIGHONLASTCOUNT ) <> 0) then
//                showMessage('Erro - Configurando counter!') ;

     //frmMachineControl.ComPort1.Close;
     //ComPort1.Open;
     //frmMachineControl.Delay(2000);
     //ComandoMotor(#13'ST1'#13);
     //ComandoMotor(#13'LD3 MN MR25000 MPI'#13) ;
     //frmMachineControl.ComandoMotor(#13'LD3 A2.5 V2.5'#13);
//     frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[0]+#13) ; // 0 - Startup MOTOR.RGJ


end;

procedure TfrmDiagnostico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     timer1.enabled := false;
     //ComandoMotor(#13'ST1'#13);
     //frmMachineControl.ComandoMotor(#13'S ST1'#13);
//     frmMachineControl.ComandoMotor(#13+frmHelmet.lstMotor.Lines[1]+#13); // 1 - Shutdown MOTOR.RGJ
     //frmMachineControl.Delay(1000);
end;

procedure TfrmDiagnostico.btnGarraOffClick(Sender: TObject);
begin
        cbDBitOut(0, AUXPORT, 5, 1);         // 8221
        btnGarraOn.Visible := true;
        btnGarraOff.Visible := false;
end;

procedure TfrmDiagnostico.btnGarraOnClick(Sender: TObject);
begin
        cbDBitOut(0, AUXPORT, 5, 0);         // 8221
        btnGarraOn.Visible := false;
        btnGarraOff.Visible := true;
end;

procedure TfrmDiagnostico.btnCordaOnClick(Sender: TObject);
begin
        cbDBitOut(0, AUXPORT, 7, 0);        // 8221   Pulso de aferição
        btnCordaOn.Visible := false;
        btnCordaOff.Visible := true;
end;

procedure TfrmDiagnostico.btnVelocidadeOnClick(Sender: TObject);
begin
        cbDBitOut(0, AUXPORT, 6, 0);        // 8221
        btnVelocidadeOn.Visible := false;
        btnVelocidadeOff.Visible := true;

end;

procedure TfrmDiagnostico.btnPortaOnClick(Sender: TObject);
begin
        cbDBitOut(0, AUXPORT, 4, 0);       // 8221
        btnPortaOn.Visible := false;
        btnPortaOff.Visible := true;

end;

procedure TfrmDiagnostico.btnCordaOffClick(Sender: TObject);
begin
        cbDBitOut(0, AUXPORT, 7, 1);      // 8221   Pulso de aferição
        btnCordaOn.Visible := true;
        btnCordaOff.Visible := false;
end;

procedure TfrmDiagnostico.btnVelocidadeOffClick(Sender: TObject);
begin
        cbDBitOut(0, AUXPORT, 6, 1);      // 8221
        btnVelocidadeOn.Visible := true;
        btnVelocidadeOff.Visible := false;
end;



procedure TfrmDiagnostico.btnPortaOffClick(Sender: TObject);
begin
        cbDBitOut(0, AUXPORT, 4, 1);      // 8221
        btnPortaOn.Visible := true;
        btnPortaOff.Visible := false;
end;

procedure TfrmDiagnostico.Button1Click(Sender: TObject);
var 			laltura : longint   ;
			temp1 : integer ;
                        temp2 : word ;
			vezes,x	: integer   ;
			mili    : extended  ;
			iErr			: integer ;
			ways      : integer ;
                        CounterFlag: boolean;
                        bitValue: word;
                        vel: double;
                        sAltSens: string;
                        tempoini : longint;
                        iVelCtr: longint;

begin
        temp2:=0;                                            // 8221
        ways := 0;
        vezes := 0;
	iErr := cbCLoad(0, LOADREG, 0);
	if iErr <> 0 then ShowMessage('Erro ao carregar sensor de Velocidade.');
        CbDBitOut(0, AUXPORT, 7, 1) ; // permite contar

	// Entra no Loop de Velocidade
	MemoData.Lines.Add('Waiting for velocity changing');
                temp1 := 0;
                //Esperar pelo sinal do sensor de velocidade
                while (temp1 = 0) do
                begin
                      cbDBitIn(0, AUXPORT, 3, temp1);
                      //temp1 := frmMachineControl.readSensVel();
                end;

                //Esperar pelo término do sinal do sensor de velocidade
                while (temp1 = 1) do
                begin
                        cbDBitIn(0, AUXPORT, 3, temp1);
                        //temp1 := frmMachineControl.readSensVel();
                end;

	        // Le velocidade
        	MemoData.Lines.Add('Velocity measured');
                frmMachineControl.Delay(60);
                cbCin(0, LOADREG,temp2);

                //showmessage(inttostr(temp2));
	        sAltSens  := frmNormas.lvNormasImpacto.Items.Item[frmHelmet.NormaAtual].Subitems.Strings[13];
                iVelCtr := strtoint(frmHelmet.lstMotor.Lines[13]); // 13- Velocity Pulse Adjust
	        //mili   := (temp2 + iVelCtr) / 1000 ;
	        mili   := temp2 / 1000 ;
        	//vel := ((strtofloat(sAltSens)/1000)/(mili/1000)) ;
                vel := (strtofloat(sAltSens)) / mili;

        Edit9.Text := FormatFloat('###0.00',vel);
end;

procedure TfrmDiagnostico.FormShow(Sender: TObject);
var R: TRect;
begin
        R := Rect(0,0, Screen.Width, Screen.Height);
        frmDiagnostico.Left := (R.Right - R.Left - frmDiagnostico.Width) div 2;
        frmDiagnostico.Top := (R.Bottom - R.Top - frmDiagnostico.Height) div 2;
        timer1.enabled := true;

end;

procedure TfrmDiagnostico.CheckBox1Click(Sender: TObject);
begin
        if not CheckBox1.Checked then
        begin
                Edit2.Enabled := false;
                Edit1.Enabled := true;
        end
        else
        begin
                Edit1.Enabled := false;
                Edit2.Enabled := true;
        end;

end;

procedure TfrmDiagnostico.btnLampadaOnClick(Sender: TObject);
begin
        //cbDBitOut(0, FIRSTPORTA, 20, 0);
        {CbDBitOut(1, FIRSTPORTA, 21, 0) ;        // 8221
        btnLampadaOn.Visible := false;
        btnLampadaOff.Visible := true;  }
end;

procedure TfrmDiagnostico.btnLampadaOffClick(Sender: TObject);
begin
        //cbDBitOut(0, FIRSTPORTA, 20, 1);
        {CbDBitOut(1, FIRSTPORTA, 21, 1) ;         // 8221
        btnLampadaOn.Visible := true;
        btnLampadaOff.Visible := false;  }
end;

procedure TfrmDiagnostico.SpeedButton3Click(Sender: TObject);
begin
        frmMachineControl.ComandoMotor('MD'+#13);   //8221
        Close();
end;

end.
