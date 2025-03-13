program ProjSerial02;

uses
  Forms,
  Serial02 in 'Serial02.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
