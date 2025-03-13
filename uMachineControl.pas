unit uMachineControl;


interface


uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	OleCtrls, ExtCtrls, Cbw32, IniFiles, CPort;


type
	TfrmMachineControl = class(TForm)
    ComPort1: TComPort;
		procedure FormCreate(Sender: TObject);
		procedure FormDestroy(Sender: TObject);
	private
		{ Private declarations }
	public
		procedure AbrirPorta;
		procedure FecharPorta;
		procedure IncharAmortecedor;
		procedure AbrirGarra;
                procedure FecharGarra;
                function readRes() : integer;
                function readStatus: Integer;
		function	SensorSuperiorOK: boolean;
		function	SensorInferiorOK:	boolean;
                function readFCA: integer;
                function readFCB: integer;
                function readEmergencia: integer;
                function readPorta: integer;
                function readTravaGarra: integer;
                function readCorda: integer;
                function readSensVel: integer;
                function readRO: integer;
                function readROMax: integer;
		procedure ConfigurarMotor( iAceleracao, iVelocidade, iDistancia: longint );
		procedure ConfigurarAjusteFinoMotor( iAceleracao, iVelocidade,
																				 iDistancia: longint );
		procedure ComandoMotor(sComando: string) ;
		procedure Delay (iMSecs: integer);

		end;


const
	iBoardNum	:	integer	=	0;
        sLineBreak = AnsiChar(#10);


var
	frmMachineControl	: TfrmMachineControl;
	sAcFino,                	// Aceleracao do ajuste fino
	sDsFino,									// Distancia do ajuste fino
	sVlFino,									// Velocidade do ajuste fino
	sAcNormal,								// Aceleracao do ajuste fino
	sDsNormal,								// Distancia do ajuste fino
	sVlNormal			:	string;	  // Velocidade do ajuste fino


implementation


uses uMisc, uHelmet;


{$R *.DFM}


{===============================================================================

===============================================================================}
procedure TfrmMachineControl.Delay (iMSecs: integer);
var
	lFirstTickCount	: longint;
begin
	lFirstTickCount := GetTickCount;
	repeat
		Application.ProcessMessages ;
	until ((GetTickCount - lFirstTickCount) >= longint(iMSecs));
end;


{===============================================================================

===============================================================================}
procedure TfrmMachineControl.FormCreate(Sender: TObject);
var
	fsRevision	:	single;
	iErrReport	:	integer;
	iErrHandle	:	integer;
	ifMotor			:	TIniFile;
begin
        Delay(1000); //-delay
        ComPort1.Open;
        //Delay(500); //-delay
        frmHelmet.tmrStatus.Enabled := true;


	fsRevision := CURRENTREVNUM;
	cbDeclareRevision(fsRevision);
	iErrReport := PRINTALL;
	iErrHandle := STOPALL;
	cbErrHandling(iErrReport, iErrHandle);

	ifMotor := TIniFile.Create(sAppPath+'MOTOR.INI');
	//Comm.CommPort := TCommPort(strtoint(ifMotor.ReadString('Comm', 'Serial_Port', '0')));

	sAcFino := ifMotor.ReadString('Adjust_Settings', 'Aceleration', '30');
	sDsFino := ifMotor.ReadString('Adjust_Settings', 'Distance', '2083');
	sVlFino := ifMotor.ReadString('Adjust_Settings', 'Velocity', '50');

	sAcNormal := ifMotor.ReadString('Normal_Settings', 'Aceleration', '2.5');
	sDsNormal := ifMotor.ReadString('Normal_Settings', 'Distance', '2083333');
	sVlNormal := ifMotor.ReadString('Normal_Settings', 'Velocity', '12.5');

	ifMotor.Free;
end;


{===============================================================================

===============================================================================}
procedure TfrmMachineControl.FormDestroy(Sender: TObject);
var
	ifMotor		:	TIniFile;
begin
	ifMotor := TIniFile.Create(sAppPath+'MOTOR.INI');
	ifMotor.WriteString('Adjust_Settings', 'Acceleration', sAcFino);
	ifMotor.WriteString('Adjust_Settings', 'Distance', sDsFino);
	ifMotor.WriteString('Adjust_Settings', 'Velocity', sVlFino);
	ifMotor.WriteString('Normal_Settings', 'Acceleration', sAcNormal);
	ifMotor.WriteString('Normal_Settings', 'Distance', sDsNormal);
	ifMotor.WriteString('Normal_Settings', 'Velocity', sVlNormal);
	ifMotor.Free;
	ComPort1.Close;
end;


{===============================================================================

===============================================================================}
procedure TfrmMachineControl.AbrirPorta;
var
	iBit			:	WORD;
	iPortType	:	word;
	iBitSet		:	word;
begin
//RGN20211015	iPortType := AUXPORT;
        iPortType := AUXPORT;           // 8221
	iBit := 1; //Bit 4
	iBitSet := 0;
//RGN20211015	cbDBitOut (iBoardNum, iPortType, iBit, iBitSet);
        cbDBitOut (0, iPortType, iBit, iBitSet);
	{repeat                          // 8221
		cbDBitIn(iBoardNum, iPortType, iBit-16, iBitSet);
                //iBitSet := frmMachineControl.readPorta();
	until (iBitSet=0);   }
end;


{===============================================================================

===============================================================================}
procedure TfrmMachineControl.FecharPorta;
var
	iBit			:	word;
  iPortType	:	word;
  iBitSet		:	word;
begin
	iPortType := AUXPORT;           // 8221
	iBit := 4;
        iBitSet := 1;
	cbDBitOut (0, iPortType, iBit, iBitSet);
  {repeat                                // 8221
  	//cbDBitIn(iBoardNum, iPortType, iBit-16, iBitSet);
        iBitSet := frmMachineControl.readPorta();
  until (iBitSet=1);  }
end;


{===============================================================================

===============================================================================}
procedure TfrmMachineControl.IncharAmortecedor;
var
	iBit			:	word;
  iPortType	:	word;
  iBitSet		:	word;
begin                                        // 8221
{	iPortType := FIRSTPORTA;
        iBit := 18; //Bit 2 PortC
        iBitSet := 1;
	cbDBitOut (0, iPortType, iBit, iBitSet);
        iBitSet := 0;
        delay(1000);
        cbDBitOut (0, iPortType, iBit, iBitSet);  }
end;


{===============================================================================

===============================================================================}
procedure TfrmMachineControl.AbrirGarra;
var
	iBit			:	word;
  iPortType	:	word;
  iBitSet		:	word;
begin
	iPortType := AUXPORT;               // 8221
        iBit := 5; //Bit 5
        iBitSet := 1;
	cbDBitOut (0, iPortType, iBit, iBitSet);
end;

{===============================================================================

===============================================================================}
procedure TfrmMachineControl.FecharGarra;
var
	iBit			:	word;
  iPortType	:	word;
  iBitSet		:	word;
begin
	iPortType := AUXPORT;               // 8221
        iBit := 5; //Bit 5
        iBitSet := 0;
	cbDBitOut (0, iPortType, iBit, iBitSet);
end;

{===============================================================================

===============================================================================}
function TfrmMachineControl.SensorSuperiorOK: boolean;
var
	iBit			:	word;
  iPortType	:	word;
	iBitSet		:	word;
begin
	{iPortType := AUXPORT;             // 8221
        iBit := 2;
        iBitSet := 0;
	//cbDBitIn (iBoardNum, iPortType, iBit, iBitSet);
        iBitSet := frmMachineControl.readFCA();
        Result := iBitSet<>1;  }
end;


{===============================================================================

===============================================================================}
function TfrmMachineControl.SensorInferiorOK: boolean;
var
	iBit			:	word;
	iPortType	:	word;
	iBitSet		:	word;
begin
	{iPortType := AUXPORT;            // 8221
	iBit := 1;
	iBitSet := 0;
	//cbDBitIn (iBoardNum, iPortType, iBit, iBitSet);
        iBitSet := frmMachineControl.readFCB();
	Result := iBitSet<>1;  }
end;


{===============================================================================

==============================================================================}
procedure TfrmMachineControl.ConfigurarMotor( iAceleracao, iVelocidade,
	iDistancia: longint );
var
	sTemp		:	string;
begin
	sAcNormal := inttostr(iAceleracao);
	sVlNormal := inttostr(iVelocidade);
	sDsNormal := inttostr(iDistancia);
	sTemp := 'MN LD3 A' + IntToStr(iAceleracao) + ' V' + IntToStr(iVelocidade) +
	         ' D' + IntToStr(iDistancia) + #13;
	ComPort1.WriteStr(sTemp);
end;


{===============================================================================

==============================================================================}
procedure TfrmMachineControl.ConfigurarAjusteFinoMotor( iAceleracao,
	iVelocidade, iDistancia: longint );
var
	sTemp		:	string;
begin
	sAcFino := inttostr(iAceleracao);
	sVlFino := inttostr(iVelocidade);
	sDsFino := inttostr(iDistancia) ;
	sTemp := 'MN LD3 A' + IntToStr(iAceleracao) + ' V' + IntToStr(iVelocidade) +
					 ' D' + IntToStr(iDistancia) + #13;
	//ComPort1.WriteStr(sTemp);
end;


{===============================================================================

===============================================================================}
procedure TfrmMachineControl.ComandoMotor(sComando: string);
var
	sTemp	:	string;
begin
	sTemp := sComando;
	ComPort1.WriteStr(sTemp);
end;


{===============================================================================

===============================================================================}
function TFrmMachineControl.readRes() : integer;
var aux: word;
    count: Cardinal;
    value: integer;
    tempoIni, tempoFim: longint;
begin
        count := 0;
        aux := 0;
        Sleep(1);
        tempoIni := GetTickCount;
        while (count < 1) do
        begin
                tempoFim := GetTickCount;
                if ((tempoFim - tempoIni) > 1000) then
                        break;
                count := ComPort1.Read(aux, 1);
        end;
        value := aux;
        result := value;
end;

function TFrmMachineControl.readStatus: Integer;
var value: integer;
begin
        //ComPort1.WriteStr('I'+sLineBreak);
        //value := readRes();
        //cbDIn(0, AUXPORT, value);               // 8221
        //result := value;
end;

function TFrmMachineControl.readRO: Integer;
var value: word;
//strAux: string;
begin
        //ComPort1.WriteStr('R'+sLineBreak);   // 8221
        //value := readRes();
        //StrAux := AnsiChar(value);
        //result := StrToInt(strAux);
        //cbDIn(0, AUXPORT, value);
        //result := value;
end;

function TFrmMachineControl.readPorta: Integer;
var value: Integer;
begin
        cbDBitIn(0, AUXPORT, 1, value);          // 8221
        result := value;
end;

function TFrmMachineControl.readTravaGarra: Integer;
var DataValue: word;
begin
        {cbDIn(1, FIRSTPORTA, value);         // 8221
        result := value and 32;
        if result = 32  then
        begin
            result := 1;
        end
        else
        begin
            result := 0;
        end;  }
        if (cbAIn(0, 6, BIP5VOLTS, DataValue) <> 0) then
        begin
                result := -1;
        end
        else
        begin
                if (DataValue) > 49152 then   // equiv. à 2,5V
                        result := 1
                else
                        result := 0
        end;


end;


function TFrmMachineControl.readFCA: Integer;
var value: integer;
begin
        {cbDIn(1, FIRSTPORTA, value);         // 8221
        result := value and 64;
        if result = 64  then
        begin
            result := 1;
        end
        else
        begin
            result := 0;
        end; }
end;

function TFrmMachineControl.readFCB: Integer;
var value: integer;
begin
        {cbDIn(1, FIRSTPORTA, value);        // 8221
        result := value and 2;
        if result = 2  then
        begin
            result := 1;
        end
        else
        begin
            result := 0;
        end;  }
end;

function TFrmMachineControl.readEmergencia: Integer;
var value: integer;
begin
        cbDBitIn(0, AUXPORT, 0, value);         // 8221
        result := value;
end;

function TFrmMachineControl.readCorda: Integer;
var value: word;
begin
        {cbDIn(1, FIRSTPORTA, value);      // 8221
        result := value and 16;
        if result = 16  then
        begin
            result := 1;
        end
        else
        begin
            result := 0;
        end;  }
end;

function TFrmMachineControl.readSensVel: Integer;
var value: integer;
begin
        cbDBitIn(0, AUXPORT, 3, value);      // 8221
        result := value;
        if result = 1  then
        begin
            result := 1;
        end
        else
        begin
            result := 0;
        end;
end;

function TFrmMachineControl.readROMax: Integer;
var value: integer;
//strAux: string;
begin
        //ComPort1.WriteStr('M'+sLineBreak);
        //value := readRes();
        //StrAux := AnsiChar(value);
        //result := StrToInt(strAux);
        result := value;
end;

end.
