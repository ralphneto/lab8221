unit uAutoTeste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, ExtCtrls, CbW32;

type
  TfrmAutoTeste = class(TForm)
    GroupBox3: TGroupBox;
    ledPortaOff: TImage;
    ledGarraOff: TImage;
    ledCordaOff: TImage;
    ledVelocidadeOff: TImage;
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
    GroupBox5: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    MaskEdit1: TMaskEdit;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Button1: TButton;
    Button2: TButton;
    Timer1: TTimer;
    Label2: TLabel;
    ledFMOff: TImage;
    ledFMOn: TImage;
    Label44: TLabel;
    Label45: TLabel;
    Edit11: TEdit;
    Edit10: TEdit;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAutoTeste: TfrmAutoTeste;

implementation

uses uNovoEnsaio, uMachineControl;

{$R *.DFM}

procedure TfrmAutoTeste.Button1Click(Sender: TObject);
begin
        Timer1.Enabled := False;
        Close();
end;

procedure TfrmAutoTeste.Button2Click(Sender: TObject);
begin
        frmNovoEnsaio.Close();
        Close();
end;

procedure TfrmAutoTeste.Timer1Timer(Sender: TObject);
var bitValue : integer;
var dataValue : word;                               // 8221
begin
        // Reseta operações de background
        cbStopBackground(0) ;

        cbDBitIn(0, AUXPORT, 1, bitValue);          // 8221
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

        if (cbAIn(0, 2, BIP5VOLTS, DataValue) <> 0) then
        begin
                ShowMessage('Erro Lendo Sensor da Trava!');
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

        if (cbAIn(0, 4, BIP5VOLTS, DataValue) <> 0) then
        begin
                ShowMessage('Erro Lendo FCB!');
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

        if (cbAIn(0, 3, BIP5VOLTS, DataValue) <> 0) then
        begin
                ShowMessage('Erro Lendo FCA!');
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

        if (cbAIn(0, 1, BIP5VOLTS, DataValue) <> 0) then
        begin
                ShowMessage('Erro Lendo Contato Punção!');
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

        cbStopBackground(0) ;

        //Acelerometros e trnsdutor de força    8221
        if (cbAIn(0, 5, BIP5VOLTS, DataValue) <> 0) then
                ShowMessage('Erro Lendo Acelerômetro X!')
        else
        Begin
                Edit3.Text := FormatFloat('0.0', (((DataValue * 10)/65535)-5)*1000);
                Edit6.Text := FormatFloat('0.00', StrToFloat(Edit3.Text) / StrToInt(MaskEdit1.Text));
        End;


        if (cbAIn(0, 6, BIP5VOLTS, DataValue) <> 0) Then
                ShowMessage('Erro Lendo Acelerômetro Y!')
        else
        Begin
                Edit4.Text := FormatFloat('0.0', (((DataValue * 10)/65535)-5)*1000);
                Edit7.Text := FormatFloat('0.00', StrToFloat(Edit4.Text) / StrToInt(MaskEdit1.Text));
        End;

        if (cbAIn(0, 7, BIP5VOLTS, DataValue) <> 0) then
                ShowMessage('Erro Lendo Acelerômetro Z!')
        else
        Begin
                Edit5.Text := FormatFloat('0.0', (((DataValue * 10)/65535)-5)*1000);
                Edit8.Text := FormatFloat('0.00', StrToFloat(Edit5.Text) / StrToInt(MaskEdit1.Text) );
        End;

        if (cbAIn(0, 0, BIP5VOLTS, DataValue) <> 0) then
                ShowMessage('Erro Lendo Trandutor de Força!')
        else
        Begin
                Edit10.Text := FormatFloat('0.0', (((DataValue * 10)/65535)-5)*1000);
                Edit11.Text := FormatFloat('0.00', StrToFloat(Edit10.Text) / StrToInt(MaskEdit1.Text));
        End;

end;

procedure TfrmAutoTeste.FormShow(Sender: TObject);
begin
        //CbDBitOut(0, FIRSTPORTA, 23, 1) ;  // Liga Fonte +24V
        frmMachineControl.Delay(1000);


        Timer1.Enabled := true;
end;

end.
