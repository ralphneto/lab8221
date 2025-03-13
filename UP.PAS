unit uP;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IniFiles;

type
  TfrmP = class(TForm)
    cbAlways: TCheckBox;
		Button1: TButton;
    //FormStorage1: TFormStorage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmP: TfrmP;

implementation

{$R *.DFM}
uses uNovoEnsaio;

procedure TfrmP.Button1Click(Sender: TObject);
begin
	if cbAlways.enabled = false then
	frmNovoEnsaio._1stPerf := true;
	Close;
end;

procedure TfrmP.FormCreate(Sender: TObject);
var ini : TIniFile;
begin
	ini := TIniFile.Create('P');
  cbAlways.enabled := ini.ReadBool('Geral', 'always', true);
end;

procedure TfrmP.FormDestroy(Sender: TObject);
var ini : TIniFile;
begin
	ini := TIniFile.Create('P');
  ini.WriteBool('Geral', 'always', cbAlways.enabled);
end;

end.

