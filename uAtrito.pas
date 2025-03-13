unit uAtrito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls;

type
  TfrmAtrito = class(TForm)
    Atrito: TLabel;
    edAtrito: TEdit;
    Label15: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SaveAtritoIni();
    procedure LoadAtritoIni();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAtrito: TfrmAtrito;

implementation

{$R *.DFM}

procedure TfrmAtrito.SaveAtritoIni();
var
	fAtr	:	TextFile;
begin
	AssignFile(fAtr, ExtractFilePath(Application.ExeName) + '\Atrito.ini');
        {$I-}
	        ReWrite(fAtr);
        {$I+}
        if IOResult <> 0 then
                ShowMessage('Erro abrindo arquivo Atrito.ini')
        else
        begin
        	WriteLn(fAtr, frmAtrito.edAtrito.Text);
	        CloseFile(fAtr);
        end;
end;

procedure TfrmAtrito.LoadAtritoIni();
var
	fAtr	:	TextFile;
        sTemp   :       String;
begin
	AssignFile(fAtr, ExtractFilePath(Application.ExeName) + '\Atrito.ini');
        {$I-}
	        Reset(fAtr);
        {$I+}
        if IOResult <> 0 then
                ShowMessage('Erro abrindo arquivo Atrito.ini')
        else
        begin
        	ReadLn(fAtr, sTemp);
                frmAtrito.edAtrito.Text := sTemp;
	        CloseFile(fAtr);
        end;
end;

procedure TfrmAtrito.SpeedButton1Click(Sender: TObject);
 var texto : string ;
begin
        SaveAtritoIni();
        Close();
end;

procedure TfrmAtrito.SpeedButton2Click(Sender: TObject);
begin
	frmAtrito.Close ;
end;

procedure TfrmAtrito.FormCreate(Sender: TObject);
begin
        LoadAtritoIni();
end;

procedure TfrmAtrito.Button2Click(Sender: TObject);
begin
        SaveAtritoIni();
        Close();
end;

procedure TfrmAtrito.Button1Click(Sender: TObject);
begin
        Close();
end;

end.
