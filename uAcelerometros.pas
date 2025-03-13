unit uAcelerometros;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TfrmAcelerometros = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edAcelX: TEdit;
    edAcelY: TEdit;
    edAcelZ: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    procedure edAcelXClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edAcelYClick(Sender: TObject);
    procedure edAcelZClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure LoadAcelerometrosIni();
    procedure SaveAcelerometrosIni();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAcelerometros: TfrmAcelerometros;

implementation

{$R *.DFM}

 uses uNovoEnsaio ;

procedure TfrmAcelerometros.SpeedButton2Click(Sender: TObject);
begin
	Close();
end;

procedure TfrmAcelerometros.edAcelXClick(Sender: TObject);
begin
	edAcelX.Text := InputBox('Eixo X', 'Entre com o novo valor para o Eixo X:',
	edAcelX.Text);
	if edAcelX.Text = '' then edAcelX.Text := '10';
	frmNovoEnsaio.AcelX := strtofloat(edAcelX.Text);
end;

procedure TfrmAcelerometros.edAcelYClick(Sender: TObject);
begin
	edAcelY.Text := InputBox('Eixo Y', 'Entre com o novo valor para o Eixo Y:',
	edAcelY.Text);
	if edAcelY.Text = '' then edAcelY.Text := '10';
	frmNovoEnsaio.AcelY := strtofloat(edAcelY.Text);
end;

procedure TfrmAcelerometros.edAcelZClick(Sender: TObject);
begin
	edAcelZ.Text := InputBox('Eixo Z', 'Entre com o novo valor para o Eixo Z:',
	edAcelZ.Text);
	if edAcelZ.Text = '' then edAcelZ.Text := '10';
	frmNovoEnsaio.AcelZ := strtofloat(edAcelZ.Text);
end;

procedure TfrmAcelerometros.FormCreate(Sender: TObject);
begin
        LoadAcelerometrosIni();
end;

procedure TfrmAcelerometros.SaveAcelerometrosIni();
var
	fAcel	:	TextFile;
begin
	AssignFile(fAcel, ExtractFilePath(Application.ExeName) + '\Acelerometros.ini');
        {$I-}
	        ReWrite(fAcel);
        {$I+}
        if IOResult <> 0 then
                ShowMessage('Erro abrindo arquivo Acelerometros.ini')
        else
        begin
        	WriteLn(fAcel, frmAcelerometros.edAcelX.Text);
                WriteLn(fAcel, frmAcelerometros.edAcelY.Text);
                WriteLn(fAcel, frmAcelerometros.edAcelZ.Text);
	        CloseFile(fAcel);
        end;
end;

procedure TfrmAcelerometros.LoadAcelerometrosIni();
var
	fAcel	:	TextFile;
        sTemp   :       String;
begin
	AssignFile(fAcel, ExtractFilePath(Application.ExeName) + '\Acelerometros.ini');
        {$I-}
	        Reset(fAcel);
        {$I+}
        if IOResult <> 0 then
                ShowMessage('Erro abrindo arquivo Acelerometros.ini')
        else
        begin
        	ReadLn(fAcel, sTemp);
                frmAcelerometros.edAcelX.Text := sTemp;
                frmNovoEnsaio.AcelX := StrToFloat(sTemp);
        	ReadLn(fAcel, sTemp);
                frmAcelerometros.edAcelY.Text := sTemp;
                frmNovoEnsaio.AcelY := StrToFloat(sTemp);
        	ReadLn(fAcel, sTemp);
                frmAcelerometros.edAcelZ.Text := sTemp;
                frmNovoEnsaio.AcelZ := StrToFloat(sTemp);
	        CloseFile(fAcel);
        end;
end;

procedure TfrmAcelerometros.SpeedButton1Click(Sender: TObject);
begin
        SaveAcelerometrosIni();
        Close();
end;

end.
