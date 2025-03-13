program ProjSerial01;

uses
  Forms,
  Serial01 in 'Serial01.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
