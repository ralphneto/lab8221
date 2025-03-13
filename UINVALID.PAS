unit uInvalid;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
	TfrmInvalid = class(TForm)
		Label1: TLabel;
		Label2: TLabel;
		Button1: TButton;
		procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
	end;

var
	frmInvalid: TfrmInvalid;

implementation

{$R *.DFM}


procedure TfrmInvalid.Button1Click(Sender: TObject);
begin
	frmInvalid.Close ;
end;

end.
