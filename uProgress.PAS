unit uProgress;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmProgress = class(TForm)
    Animate: TAnimate;
    pbOpen: TProgressBar;
    StatusBar1: TStatusBar;
  private
    { Private declarations }
	public
    { Public declarations }
	end;

var
  frmProgress: TfrmProgress;

implementation

{$R *.DFM}





end.
