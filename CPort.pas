// TComPort component ver. 2.00 for Delphi 2, 3, 4, 5
// written by Dejan Crnila, 1998 - 1999
// email: dejancrn@yahoo.com

unit CPort;

interface

uses
  Windows, Messages, Classes, SysUtils;

type
  TPortType = (COM1, COM2, COM3, COM4, COM5, COM6, COM7, COM8);
  TBaudRate = (br110, br300, br600, br1200, br2400, br4800, br9600,
               br14400, br19200, br38400, br56000, br57600, br115200);
  TStopBits = (sbOneStopBit, sbOne5StopBits, sbTwoStopBits);
  TDataBits = (dbFive, dbSix, dbSeven, dbEight);
  TParityBits = (prNone, prOdd, prEven, prMark, prSpace);
  TDTRFlowControl = (dtrDisable, dtrEnable, dtrHandshake);
  TRTSFlowControl = (rtsDisable, rtsEnable, rtsHandshake, rtsToggle);
  TEvent = (evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS,
            evDSR, evError, evRLSD, evRx80Full);
  TEvents = set of TEvent;
  TModemSignal = (msCTS, msDSR, msRing, msRLSD);
  TModemSignals = set of TModemSignal;
  TComError = (ceFrame, ceRxParity, ceOverrun, ceBreak, ceIO, ceMode,
               ceRxOver, ceTxFull);
  TComErrors = set of TComError;
  TSyncMethod = (smThreadSync, smWindowSync, smNone);
  TRxCharEvent = procedure(Sender: TObject; Count: Integer) of object;
  TErrorEvent = procedure(Sender: TObject; Errors: TComErrors) of object;
  TSignalEvent = procedure(Sender: TObject; OnOff: Boolean) of object;

  TOperationKind = (okWrite, okRead);
  TAsync = record
    Overlapped: TOverlapped;
    Kind: TOperationKind;
  end;
  PAsync = ^TAsync;

  TComPort = class;

  TComThread = class(TThread)
  private
    FComPort: TComPort;
    FMask: DWORD;
    FStopEvent: THandle;
  protected
    procedure Execute; override;
    procedure DoEvents;
    procedure SendEvents;
    procedure DispatchComMsg;
    procedure Stop;
  public
    constructor Create(AComPort: TComPort);
    destructor Destroy; override;
  end;

  TComTimeouts = class(TPersistent)
  private
    FComPort: TComPort;
    FReadInterval: Integer;
    FReadTotalM: Integer;
    FReadTotalC: Integer;
    FWriteTotalM: Integer;
    FWriteTotalC: Integer;
    procedure SetReadInterval(Value: Integer);
    procedure SetReadTotalM(Value: Integer);
    procedure SetReadTotalC(Value: Integer);
    procedure SetWriteTotalM(Value: Integer);
    procedure SetWriteTotalC(Value: Integer);
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;
  published
    property ReadInterval: Integer read FReadInterval write SetReadInterval;
    property ReadTotalMultiplier: Integer read FReadTotalM write SetReadTotalM;
    property ReadTotalConstant: Integer read FReadTotalC write SetReadTotalC;
    property WriteTotalMultiplier: Integer read FWriteTotalM write SetWriteTotalM;
    property WriteTotalConstant: Integer read FWriteTotalC write SetWriteTotalC;
  end;

  TComFlowControl = class(TPersistent)
  private
    FComPort: TComPort;
    FOutCTSFlow: Boolean;
    FOutDSRFlow: Boolean;
    FControlDTR: TDTRFlowControl;
    FControlRTS: TRTSFlowControl;
    FXonXoffOut: Boolean;
    FXonXoffIn:  Boolean;
    FDSRSensitivity: Boolean;
    FTxContinueOnXoff: Boolean;
    FXonChar: Byte;
    FXoffChar: Byte;
    procedure SetOutCTSFlow(Value: Boolean);
    procedure SetOutDSRFlow(Value: Boolean);
    procedure SetControlDTR(Value: TDTRFlowControl);
    procedure SetControlRTS(Value: TRTSFlowControl);
    procedure SetXonXoffOut(Value: Boolean);
    procedure SetXonXoffIn(Value: Boolean);
    procedure SetDSRSensitivity(Value: Boolean);
    procedure SetTxContinueOnXoff(Value: Boolean);
    procedure SetXonChar(Value: Byte);
    procedure SetXoffChar(Value: Byte);
  protected                        
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;
  published
    property OutCTSFlow: Boolean read FOutCTSFlow write SetOutCTSFlow;
    property OutDSRFlow: Boolean read FOutDSRFlow write SetOutDSRFlow;
    property ControlDTR: TDTRFlowControl read FControlDTR write SetControlDTR;
    property ControlRTS: TRTSFlowControl read FControlRTS write SetControlRTS;
    property XonXoffOut: Boolean read FXonXoffOut write SetXonXoffOut;
    property XonXoffIn:  Boolean read FXonXoffIn write SetXonXoffIn;
    property DSRSensitivity: Boolean
      read FDSRSensitivity write SetDSRSensitivity;
    property TxContinueOnXoff: Boolean
      read FTxContinueOnXoff write SetTxContinueOnXoff;
    property XonChar: Byte read FXonChar write SetXonChar;
    property XoffChar: Byte read FXoffChar write SetXoffChar;
  end;

  TComParity = class(TPersistent)
  private
    FComPort: TComPort;
    FBits: TParityBits;
    FCheck: Boolean;
    FReplace: Boolean;
    FReplaceChar: Byte;
    procedure SetBits(Value: TParityBits);
    procedure SetCheck(Value: Boolean);
    procedure SetReplace(Value: Boolean);
    procedure SetReplaceChar(Value: Byte);
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;
  published
    property Bits: TParityBits read FBits write SetBits;
    property Check: Boolean read FCheck write SetCheck;
    property Replace: Boolean read FReplace write SetReplace;
    property ReplaceChar: Byte read FReplaceChar write SetReplaceChar;
  end;

  TComBuffer = class(TPersistent)
  private
    FComPort: TComPort;
    FInputSize: DWORD;
    FOutputSize: DWORD;
    procedure SetInputSize(Value: DWORD);
    procedure SetOutputSize(Value: DWORD);
  protected
    procedure AssignTo(Dest: TPersistent); override;
  public
    constructor Create;
  published
    property InputSize: DWORD read FInputSize write SetInputSize;
    property OutputSize: DWORD read FOutputSize write SetOutputSize;
  end;

  TComPort = class(TComponent)
  private
    FEventThread: TComThread;
    FThreadCreated: Boolean;
    FHandle: THandle;
    FWindow: THandle;
    FConnected: Boolean;
    FBaudRate: TBaudRate;
    FPort: TPortType;
    FStopBits: TStopBits;
    FDataBits: TDataBits;
    FDiscardNull: Boolean;
    FEventChar: Byte;
    FEvents: TEvents;
    FBuffer: TComBuffer;
    FParity: TComParity;
    FTimeouts: TComTimeouts;
    FFlowControl: TComFlowControl;
    FSyncMethod: TSyncMethod;
    FOnRxChar: TRxCharEvent;
    FOnTxEmpty: TNotifyEvent;
    FOnBreak: TNotifyEvent;
    FOnRing: TNotifyEvent;
    FOnCTSChange: TSignalEvent;
    FOnDSRChange: TSignalEvent;
    FOnRLSDChange: TSignalEvent;
    FOnError: TErrorEvent;
    FOnRxFlag: TNotifyEvent;
    FOnOpen: TNotifyEvent;
    FOnClose: TNotifyEvent;
    FOnRx80Full: TNotifyEvent;
    procedure SetConnected(Value: Boolean);
    procedure SetBaudRate(Value: TBaudRate);
    procedure SetPort(Value: TPortType);
    procedure SetStopBits(Value: TStopBits);
    procedure SetDataBits(Value: TDataBits);
    procedure SetDiscardNull(Value: Boolean);
    procedure SetEventChar(Value: Byte);
    procedure SetSyncMethod(Value: TSyncMethod);
    procedure SetParity(Value: TComParity);
    procedure SetTimeouts(Value: TComTimeouts);
    procedure SetBuffer(Value: TComBuffer);
    procedure SetFlowControl(Value: TComFlowControl);
    procedure DoOnRxChar;
    procedure DoOnTxEmpty;
    procedure DoOnBreak;
    procedure DoOnRingChange;
    procedure DoOnRxFlag;
    procedure DoOnCTSChange;
    procedure DoOnDSRChange;
    procedure DoOnError;
    procedure DoOnRLSDChange;
    procedure DoOnRx80Full;
    function ErrorCode(AsyncPtr: PAsync): Integer;
    function ComString: String;
    procedure WindowMethod(var Message: TMessage);
  protected
    procedure CreateHandle; virtual;
    procedure DestroyHandle; virtual;
    procedure ApplyDCB;
    procedure ApplyTimeouts;
    procedure ApplyBuffer;
    procedure SetupComPort; virtual;
  public
    property Connected: Boolean read FConnected write SetConnected;
    property Handle: THandle read FHandle;

    procedure Open;
    procedure Close;
    procedure ShowSetupDialog;

    function InputCount: DWORD;
    function OutputCount: DWORD;
    function ModemSignals: TModemSignals;
    function StateFlags: TComStateFlags;
    procedure SetDTR(OnOff: Boolean);
    procedure SetRTS(OnOff: Boolean);
    procedure SetXonXoff(OnOff: Boolean);
    procedure SetBreak(OnOff: Boolean);
    procedure ClearBuffer(Input, Output: Boolean);
    function LastErrors: TComErrors;

    function Write(const Buffer; Count: DWORD): DWORD;
    function WriteStr(Str: String): DWORD;
    function Read(var Buffer; Count: DWORD): DWORD;
    function ReadStr(var Str: String; Count: DWORD): DWORD;
    function WriteAsync(const Buffer; Count: DWORD; var AsyncPtr: PAsync): DWORD;
    function WriteStrAsync(Str: String; var AsyncPtr: PAsync): DWORD;
    function ReadAsync(var Buffer; Count: DWORD; var AsyncPtr: PAsync): DWORD;
    function ReadStrAsync(var Str: String; Count: DWORD; var AsyncPtr: PAsync): DWORD;
    function WaitForAsync(var AsyncPtr: PAsync): DWORD;
    function IsAsyncCompleted(AsyncPtr: PAsync): Boolean;
    procedure AbortAllAsync;
    procedure TransmitChar(Ch: Char);

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property BaudRate: TBaudRate read FBaudRate write SetBaudRate;
    property Port: TPortType read FPort write SetPort;
    property Parity: TComParity read FParity write SetParity;
    property StopBits: TStopBits read FStopBits write SetStopBits;
    property DataBits: TDataBits read FDataBits write SetDataBits;
    property DiscardNull: Boolean read FDiscardNull write SetDiscardNull;
    property EventChar: Byte read FEventChar write SetEventChar;
    property Events: TEvents read FEvents write FEvents;
    property Buffer: TComBuffer read FBuffer write SetBuffer;
    property FlowControl: TComFlowControl read FFlowControl write SetFlowControl;
    property Timeouts: TComTimeouts read FTimeouts write SetTimeouts;
    property SyncMethod: TSyncMethod read FSyncMethod write SetSyncMethod;
    property OnRxChar: TRxCharEvent read FOnRxChar write FOnRxChar;
    property OnTxEmpty: TNotifyEvent read FOnTxEmpty write FOnTxEmpty;
    property OnBreak: TNotifyEvent read FOnBreak write FOnBreak;
    property OnRing: TNotifyEvent read FOnRing write FOnRing;
    property OnCTSChange: TSignalEvent read FOnCTSChange write FOnCTSChange;
    property OnDSRChange: TSignalEvent read FOnDSRChange write FOnDSRChange;
    property OnRLSDChange: TSignalEvent read FOnRLSDChange write FOnRLSDChange;
    property OnRxFlag: TNotifyEvent read FOnRxFlag write FOnRxFlag;
    property OnError: TErrorEvent read FOnError write FOnError;
    property OnOpen: TNotifyEvent read FOnOpen write FOnOpen;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnRx80Full: TNotifyEvent read FOnRx80Full
                                      write FOnRx80Full;
  end;

  EComPort = class(Exception)
  private
    FWinCode: Integer;
    FCode: Integer;
  public
    property WinCode: Integer read FWinCode write FWinCode;
    property Code: Integer read FCode write FCode;

    constructor Create(ACode: Integer; AWinCode: Integer);
    constructor CreateNoWinCode(ACode: Integer);
  end;

procedure InitAsync(var AsyncPtr: PAsync);
procedure DoneAsync(var AsyncPtr: PAsync);

const
  dcb_Binary           = $00000001;
  dcb_Parity           = $00000002;
  dcb_OutxCTSFlow      = $00000004;
  dcb_OutxDSRFlow      = $00000008;
  dcb_DTRControl       = $00000030;
  dcb_DSRSensivity     = $00000040;
  dcb_TxContinueOnXoff = $00000080;
  dcb_OutX             = $00000100;
  dcb_InX              = $00000200;
  dcb_ErrorChar        = $00000400;
  dcb_Null             = $00000800;
  dcb_RTSControl       = $00003000;
  dcb_AbortOnError     = $00004000;

  CM_COMPORT           = WM_USER + 1;

// error codes
  CError_OpenFailed      = 1;
  CError_WriteFailed     = 2;
  CError_ReadFailed      = 3;
  CError_InvalidAsync    = 4;
  CError_PurgeFailed     = 5;
  CError_AsyncCheck      = 6;
  CError_SetStateFailed  = 7;
  CError_TimeoutsFailed  = 8;
  CError_SetupComFailed  = 9;
  CError_ClearComFailed  = 10;
  CError_ModemStatFailed = 11;
  CError_EscapeComFailed = 12;
  CError_TransmitFailed  = 13;
  CError_SyncMeth        = 14;

// error messages
  ComErrorMessages: array[1..14] of String =
    ('Unable to open com port',
     'WriteFile function failed',
     'ReadFile function failed',
     'Invalid Async parameter',
     'PurgeComm function failed',
     'Unable to get async status',
     'SetCommState function failed',
     'SetCommTimeouts failed',
     'SetupComm function failed',
     'ClearCommError function failed',
     'GetCommModemStatus function failed',
     'EscapeCommFunction function failed',
     'TransmitCommChar function failed',
     'Cannot set SyncMethod while connected');

procedure Register;

implementation

{$R- CPortImg.res}

uses
  DsgnIntf, CPortFrm, Controls, Forms;

type
  TComPortEditor = class(TComponentEditor)
  public
    procedure ExecuteVerb(Index: Integer); override;
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: Integer; override;
  end;

function GetTOValue(Value: Integer): DWORD;
begin
  if Value = -1 then
    Result := MAXDWORD
  else
    Result := Value;
end;

procedure InitAsync(var AsyncPtr: PAsync);
begin
  New(AsyncPtr);
  with AsyncPtr^ do begin
    FillChar(Overlapped, SizeOf(TOverlapped), 0);
    Overlapped.hEvent := CreateEvent(nil, True, True, nil);
  end;
end;

procedure DoneAsync(var AsyncPtr: PAsync);
begin
  with AsyncPtr^ do
    CloseHandle(Overlapped.hEvent);
  Dispose(AsyncPtr);
  AsyncPtr := nil;
end;

// TComThread

constructor TComThread.Create(AComPort: TComPort);
var
  AMask: DWORD;
begin
  inherited Create(True);
  FStopEvent := CreateEvent(nil, True, False, nil);
  FComPort := AComPort;
  AMask := 0;
  if evRxChar in FComPort.FEvents then AMask := AMask or EV_RXCHAR;
  if evRxFlag in FComPort.FEvents then AMask := AMask or EV_RXFLAG;
  if evTxEmpty in FComPort.FEvents then AMask := AMask or EV_TXEMPTY;
  if evRing in FComPort.FEvents then AMask := AMask or EV_RING;
  if evCTS in FComPort.FEvents then AMask := AMask or EV_CTS;
  if evDSR in FComPort.FEvents then AMask := AMask or EV_DSR;
  if evRLSD in FComPort.FEvents then AMask := AMask or EV_RLSD;
  if evError in FComPort.FEvents then AMask := AMask or EV_ERR;
  if evBreak in FComPort.FEvents then AMask := AMask or EV_BREAK;
  if evRx80Full in FComPort.FEvents then AMask := AMask or EV_RX80FULL;
  SetCommMask(FComPort.Handle, AMask);
  Resume;
end;

procedure TComThread.Execute;
var
  EventHandles: Array[0..1] of THandle;
  Overlapped: TOverlapped;
  Signaled, BytesTrans: DWORD;
begin
  FillChar(Overlapped, SizeOf(Overlapped), 0);
  Overlapped.hEvent := CreateEvent(nil, True, True, nil);
  EventHandles[0] := FStopEvent;
  EventHandles[1] := Overlapped.hEvent;
  repeat
    WaitCommEvent(FComPort.Handle, FMask, @Overlapped);
    Signaled := WaitForMultipleObjects(2, @EventHandles, False, INFINITE);
    case Signaled of
      WAIT_OBJECT_0: Break;
      WAIT_OBJECT_0 + 1:
        if GetOverlappedResult(FComPort.Handle, Overlapped, BytesTrans, False)
          then DispatchComMsg;
      else Break;
    end;
  until False;
  PurgeComm(FComPort.Handle, PURGE_TXABORT or PURGE_RXABORT or
     PURGE_TXCLEAR or PURGE_RXCLEAR);
  CloseHandle(Overlapped.hEvent);
  CloseHandle(FStopEvent);
end;

procedure TComThread.Stop;
begin
  SetEvent(FStopEvent);
end;

destructor TComThread.Destroy;
begin
  Stop;
  inherited Destroy;
end;

procedure TComThread.DispatchComMsg;
begin
  case FComPort.SyncMethod of
    smThreadSync: Synchronize(DoEvents);
    smWindowSync: SendEvents;
    smNone:       DoEvents;
  end;
end;

procedure TComThread.SendEvents;
begin
  if (EV_RXCHAR and FMask) <> 0 then
    SendMessage(FComPort.FWindow, CM_COMPORT, EV_RXCHAR, 0);
  if (EV_TXEMPTY and FMask) <> 0 then
    SendMessage(FComPort.FWindow, CM_COMPORT, EV_TXEMPTY, 0);
  if (EV_BREAK and FMask) <> 0 then
    SendMessage(FComPort.FWindow, CM_COMPORT, EV_BREAK, 0);
  if (EV_RING and FMask) <> 0 then
    SendMessage(FComPort.FWindow, CM_COMPORT, EV_RING, 0);
  if (EV_CTS and FMask) <> 0 then
    SendMessage(FComPort.FWindow, CM_COMPORT, EV_CTS, 0);
  if (EV_DSR and FMask) <> 0 then
    SendMessage(FComPort.FWindow, CM_COMPORT, EV_DSR, 0);
  if (EV_RXFLAG and FMask) <> 0 then
    SendMessage(FComPort.FWindow, CM_COMPORT, EV_RXFLAG, 0);
  if (EV_RLSD and FMask) <> 0 then
    SendMessage(FComPort.FWindow, CM_COMPORT, EV_RLSD, 0);
  if (EV_ERR and FMask) <> 0 then
    SendMessage(FComPort.FWindow, CM_COMPORT, EV_ERR, 0);
  if (EV_RX80FULL and FMask) <> 0 then
    SendMessage(FComPort.FWindow, CM_COMPORT, EV_RX80FULL, 0);
end;

procedure TComThread.DoEvents;
begin
  if (EV_RXCHAR and FMask) > 0 then FComPort.DoOnRxChar;
  if (EV_TXEMPTY and FMask) > 0 then FComPort.DoOnTxEmpty;
  if (EV_BREAK and FMask) > 0 then FComPort.DoOnBreak;
  if (EV_RING and FMask) > 0 then FComPort.DoOnRingChange;
  if (EV_CTS and FMask) > 0 then FComPort.DoOnCTSChange;
  if (EV_DSR and FMask) > 0 then FComPort.DoOnDSRChange;
  if (EV_RXFLAG and FMask) > 0 then FComPort.DoOnRxFlag;
  if (EV_RLSD and FMask) > 0 then FComPort.DoOnRLSDChange;
  if (EV_ERR and FMask) > 0 then FComPort.DoOnError;
  if (EV_RX80FULL and FMask) > 0 then FComPort.DoOnRx80Full;
end;

// TComTimeouts

constructor TComTimeouts.Create;
begin
  inherited Create;
  FReadInterval := -1;
  FWriteTotalM := 100;
  FWriteTotalC := 1000;
end;

procedure TComTimeouts.AssignTo(Dest: TPersistent);
begin
  if Dest is TComTimeouts then begin
    with TComTimeouts(Dest) do begin
      FReadInterval := Self.FReadInterval;
      FReadTotalM   := Self.FReadTotalM;
      FReadTotalC   := Self.FReadTotalC;
      FWriteTotalM  := Self.FWriteTotalM;
      FWriteTotalC  := Self.FWriteTotalC;
    end
  end
  else
    inherited AssignTo(Dest);
end;

procedure TComTimeouts.SetReadInterval(Value: Integer);
begin
  if Value <> FReadInterval then begin
    FReadInterval := Value;
    if FComPort <> nil then
      FComPort.ApplyTimeouts;
  end;
end;

procedure TComTimeouts.SetReadTotalC(Value: Integer);
begin
  if Value <> FReadTotalC then begin
    FReadTotalC := Value;
    if FComPort <> nil then
      FComPort.ApplyTimeouts;
  end;
end;

procedure TComTimeouts.SetReadTotalM(Value: Integer);
begin
  if Value <> FReadTotalM then begin
    FReadTotalM := Value;
    if FComPort <> nil then
      FComPort.ApplyTimeouts;
  end;
end;

procedure TComTimeouts.SetWriteTotalC(Value: Integer);
begin
  if Value <> FWriteTotalC then begin
    FWriteTotalC := Value;
    if FComPort <> nil then
      FComPort.ApplyTimeouts;
  end;
end;

procedure TComTimeouts.SetWriteTotalM(Value: Integer);
begin
  if Value <> FWriteTotalM then begin
    FWriteTotalM := Value;
    if FComPort <> nil then
      FComPort.ApplyTimeouts;
  end;
end;

// TComFlowControl

constructor TComFlowControl.Create;
begin
  inherited Create;
  FXonChar := 17;
  FXoffChar := 19;
end;

procedure TComFlowControl.AssignTo(Dest: TPersistent);
begin
  if Dest is TComFlowControl then begin
    with TComFlowControl(Dest) do begin
      FOutCTSFlow       := Self.FOutCTSFlow;
      FOutDSRFlow       := Self.FOutDSRFlow;
      FControlDTR       := Self.FControlDTR;
      FControlRTS       := Self.FControlRTS;
      FXonXoffOut       := Self.FXonXoffOut;
      FXonXoffIn        := Self.FXonXoffIn;
      FTxContinueOnXoff := Self.FTxContinueOnXoff;
      FDSRSensitivity   := Self.FDSRSensitivity;
      FXonChar          := Self.FXonChar;
      FXoffChar         := Self.FXoffChar;
    end
  end
  else
    inherited AssignTo(Dest);
end;

procedure TComFlowControl.SetControlDTR(Value: TDTRFlowControl);
begin
  if Value <> FControlDTR then begin
    FControlDTR := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

procedure TComFlowControl.SetControlRTS(Value: TRTSFlowControl);
begin
  if Value <> FControlRTS then begin
    FControlRTS := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

procedure TComFlowControl.SetOutCTSFlow(Value: Boolean);
begin
  if Value <> FOutCTSFlow then begin
    FOutCTSFlow := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

procedure TComFlowControl.SetOutDSRFlow(Value: Boolean);
begin
  if Value <> FOutDSRFlow then begin
    FOutDSRFlow := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

procedure TComFlowControl.SetXonXoffIn(Value: Boolean);
begin
  if Value <> FXonXoffIn then begin
    FXonXoffIn := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

procedure TComFlowControl.SetXonXoffOut(Value: Boolean);
begin
  if Value <> FXonXoffOut then begin
    FXonXoffOut := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

procedure TComFlowControl.SetDSRSensitivity(Value: Boolean);
begin
  if Value <> FDSRSensitivity then begin
    FDSRSensitivity := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

procedure TComFlowControl.SetTxContinueOnXoff(Value: Boolean);
begin
  if Value <> FTxContinueOnXoff then begin
    FTxContinueOnXoff := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

procedure TComFlowControl.SetXonChar(Value: Byte);
begin
  if Value <> FXonChar then begin
    FXonChar := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

procedure TComFlowControl.SetXoffChar(Value: Byte);
begin
  if Value <> FXoffChar then begin
    FXoffChar := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

// TComParity

constructor TComParity.Create;
begin
  inherited Create;
end;

procedure TComParity.AssignTo(Dest: TPersistent);
begin
  if Dest is TComParity then begin
    with TComParity(Dest) do begin
      FBits        := Self.FBits;
      FCheck       := Self.FCheck;
      FReplace     := Self.FReplace;
      FReplaceChar := Self.FReplaceChar;
    end
  end
  else
    inherited AssignTo(Dest);
end;

procedure TComParity.SetBits(Value: TParityBits);
begin
  if Value <> FBits then begin
    FBits := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

procedure TComParity.SetCheck(Value: Boolean);
begin
  if Value <> FCheck then begin
    FCheck := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

procedure TComParity.SetReplace(Value: Boolean);
begin
  if Value <> FReplace then begin
    FReplace := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

procedure TComParity.SetReplaceChar(Value: Byte);
begin
  if Value <> FReplaceChar then begin
    FReplaceChar := Value;
    if FComPort <> nil then
      FComPort.ApplyDCB;
  end;
end;

// TComBuffer

constructor TComBuffer.Create;
begin
  inherited Create;
  FInputSize := 1024;
  FOutputSize := 1024;
end;

procedure TComBuffer.AssignTo(Dest: TPersistent);
begin
  if Dest is TComBuffer then begin
    with TComBuffer(Dest) do begin
      FOutputSize  := Self.FOutputSize;
      FInputSize   := Self.FInputSize;
    end
  end
  else
    inherited AssignTo(Dest);
end;

procedure TComBuffer.SetInputSize(Value: DWORD);
begin
  if Value <> FInputSize then begin
    FInputSize := Value;
    if FComPort <> nil then
      FComPort.ApplyBuffer;
  end;
end;

procedure TComBuffer.SetOutputSize(Value: DWORD);
begin
  if Value <> FOutputSize then begin
    FOutputSize := Value;
    if FComPort <> nil then
      FComPort.ApplyBuffer;
  end;
end;

// TComPort

constructor TComPort.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FConnected := False;
  FBaudRate := br9600;
  FPort := COM1;
  FStopBits := sbOneStopBit;
  FDataBits := dbEight;
  FEvents := [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak,
             evCTS, evDSR, evError, evRLSD, evRx80Full];
  FHandle := INVALID_HANDLE_VALUE;

  FParity := TComParity.Create;
  FParity.FComPort := Self;
  FFlowControl := TComFlowControl.Create;
  FFlowControl.FComPort := Self;
  FTimeouts := TComTimeouts.Create;
  FTimeouts.FComPort := Self;
  FBuffer := TComBuffer.Create;
  FBuffer.FComPort := Self;
end;

destructor TComPort.Destroy;
begin
  Close;
  FBuffer.Free;
  FFlowControl.Free;
  FTimeouts.Free;
  FParity.Free;
  inherited Destroy;
end;

procedure TComPort.CreateHandle;
begin
  FHandle := CreateFile(
    PChar(ComString),
    GENERIC_READ or GENERIC_WRITE,
    0,
    nil,
    OPEN_EXISTING,
    FILE_FLAG_OVERLAPPED,
    0);

  if FHandle = INVALID_HANDLE_VALUE then
    raise EComPort.Create(CError_OpenFailed, GetLastError);
end;

procedure TComPort.DestroyHandle;
begin
  if FHandle <> INVALID_HANDLE_VALUE then
    CloseHandle(FHandle);
end;

procedure TComPort.WindowMethod(var Message: TMessage);
begin
  with Message do
    if Msg = CM_COMPORT then begin
      case wParam of
        EV_RXCHAR:   DoOnRxChar;
        EV_TXEMPTY:  DoOnTxEmpty;
        EV_BREAK:    DoOnBreak;
        EV_RING:     DoOnRingChange;
        EV_CTS:      DoOnCTSChange;
        EV_DSR:      DoOnDSRChange;
        EV_RXFLAG:   DoOnRxFlag;
        EV_RLSD:     DoOnRLSDChange;
        EV_ERR:      DoOnError;
        EV_RX80FULL: DoOnRx80Full;
      end
    end else
      Result := DefWindowProc(FWindow, Msg, wParam, lParam);
end;

procedure TComPort.Open;
begin
  if not FConnected then begin
    CreateHandle;
    FConnected := True;
    try
      SetupComPort;
    except
      DestroyHandle;
      FConnected := False;
      raise;
    end;
    if (FEvents = []) then
      FThreadCreated := False
    else begin
      if (FSyncMethod = smWindowSync) then
        FWindow := AllocateHWnd(WindowMethod);
      FEventThread := TComThread.Create(Self);
      FThreadCreated := True;
    end;
    if Assigned(FOnOpen) then
      FOnOpen(Self);
  end;
end;

procedure TComPort.Close;
begin
  if FConnected then begin
    AbortAllAsync;
    if FThreadCreated then begin
      FEventThread.Free;
      if FSyncMethod = smWindowSync then
        DeallocateHWnd(FWindow);
    end;
    DestroyHandle;
    FConnected := False;
    if Assigned(FOnClose) then
      FOnClose(Self);
  end;
end;

procedure TComPort.ApplyDCB;
const
  CParityBits: array[TParityBits] of DWORD =
    (NOPARITY, ODDPARITY, EVENPARITY, MARKPARITY, SPACEPARITY);
  CStopBits: array[TStopBits] of DWORD =
    (ONESTOPBIT, ONE5STOPBITS, TWOSTOPBITS);
  CBaudRate: array[TBaudRate] of DWORD =
    (CBR_110, CBR_300, CBR_600, CBR_1200, CBR_2400, CBR_4800, CBR_9600,
     CBR_14400, CBR_19200, CBR_38400, CBR_56000, CBR_57600, CBR_115200);
  CDataBits: array[TDataBits] of DWORD = (5, 6, 7, 8);
  CControlRTS: array[TRTSFlowControl] of Integer =
    (RTS_CONTROL_DISABLE shl 12,
     RTS_CONTROL_ENABLE shl 12,
     RTS_CONTROL_HANDSHAKE shl 12,
     RTS_CONTROL_TOGGLE shl 12);
  CControlDTR: array[TDTRFlowControl] of Integer =
    (DTR_CONTROL_DISABLE shl 4,
     DTR_CONTROL_ENABLE shl 4,
     DTR_CONTROL_HANDSHAKE shl 4);

var
  DCB: TDCB;

begin
  if FConnected then begin
    DCB.XonLim := FBuffer.InputSize div 4;
    DCB.XoffLim := DCB.XonLim;
    DCB.EvtChar := Char(FEventChar);

    DCB.Flags := dcb_Binary;
    if FDiscardNull then
      DCB.Flags := DCB.Flags or dcb_Null;

    with FFlowControl do begin
      DCB.XonChar := Chr(XonChar);
      DCB.XoffChar := Chr(XoffChar);
      if OutCTSFlow then
        DCB.Flags := DCB.Flags or dcb_OutxCTSFlow;
      if OutDSRFlow then
        DCB.Flags := DCB.Flags or dcb_OutxDSRFlow;
      DCB.Flags := DCB.Flags or CControlDTR[ControlDTR]
        or CControlRTS[ControlRTS];
      if XonXoffOut then
        DCB.Flags := DCB.Flags or dcb_OutX;
      if XonXoffIn then
        DCB.Flags := DCB.Flags or dcb_InX;
      if DSRSensitivity then
        DCB.Flags := DCB.Flags or dcb_DSRSensivity;
      if TxContinueOnXoff then
        DCB.Flags := DCB.Flags or dcb_TxContinueOnXoff;
    end;

    DCB.Parity := CParityBits[FParity.Bits];
    DCB.StopBits := CStopBits[FStopBits];
    DCB.BaudRate := CBaudRate[FBaudRate];
    DCB.ByteSize := CDataBits[FDataBits];

    if FParity.Check then begin
      DCB.Flags := DCB.Flags or dcb_Parity;
      if FParity.Replace then begin
        DCB.Flags := DCB.Flags or dcb_ErrorChar;
        DCB.ErrorChar := Char(FParity.ReplaceChar);
      end;
    end;

    if not SetCommState(FHandle, DCB) then
      raise EComPort.Create(CError_SetStateFailed, GetLastError);
  end;
end;

procedure TComPort.ApplyTimeouts;
var
  Timeouts: TCommTimeouts;
begin
  if FConnected then begin
    Timeouts.ReadIntervalTimeout := GetTOValue(FTimeouts.ReadInterval);
    Timeouts.ReadTotalTimeoutMultiplier := GetTOValue(FTimeouts.ReadTotalMultiplier);
    Timeouts.ReadTotalTimeoutConstant := GetTOValue(FTimeouts.ReadTotalConstant);
    Timeouts.WriteTotalTimeoutMultiplier := GetTOValue(FTimeouts.WriteTotalMultiplier);
    Timeouts.WriteTotalTimeoutConstant := GetTOValue(FTimeouts.WriteTotalConstant);

    if not SetCommTimeouts(FHandle, Timeouts) then
      raise EComPort.Create(CError_TimeoutsFailed, GetLastError);
  end;
end;

procedure TComPort.ApplyBuffer;
begin
  if FConnected then
    if not SetupComm(FHandle, FBuffer.InputSize, FBuffer.OutputSize) then
      raise EComPort.Create(CError_SetupComFailed, GetLastError);
end;

procedure TComPort.SetupComPort;
begin
  ApplyDCB;
  ApplyTimeouts;
  ApplyBuffer;
end;

function TComPort.InputCount: DWORD;
var
  Errors: DWORD;
  ComStat: TComStat;
begin
  if not ClearCommError(FHandle, Errors, @ComStat) then
    raise EComPort.Create(CError_ClearComFailed, GetLastError);
  Result := ComStat.cbInQue;
end;

function TComPort.OutputCount: DWORD;
var
  Errors: DWORD;
  ComStat: TComStat;
begin
  if not ClearCommError(FHandle, Errors, @ComStat) then
    raise EComPort.Create(CError_ClearComFailed, GetLastError);
  Result := ComStat.cbOutQue;
end;

function TComPort.ModemSignals: TModemSignals;
var
  Status: DWORD;
begin
  if not GetCommModemStatus(FHandle, Status) then
    raise EComPort.Create(CError_ModemStatFailed, GetLastError);
  Result := [];

  if (MS_CTS_ON and Status) <> 0 then
    Result := Result + [msCTS];
  if (MS_DSR_ON and Status) <> 0 then
    Result := Result + [msDSR];
  if (MS_RING_ON and Status) <> 0 then
    Result := Result + [msRing];
  if (MS_RLSD_ON and Status) <> 0 then
    Result := Result + [msRLSD];
end;

function TComPort.StateFlags: TComStateFlags;
var
  Errors: DWORD;
  ComStat: TComStat;
begin
  if not ClearCommError(FHandle, Errors, @ComStat) then
    raise EComPort.Create(CError_ClearComFailed, GetLastError);
  Result := ComStat.Flags;
end;

procedure TComPort.SetBreak(OnOff: Boolean);
var
  Act: DWORD;
begin
  if OnOff then
    Act := Windows.SETBREAK
  else
    Act := Windows.CLRBREAK;

  if not EscapeCommFunction(FHandle, Act) then
    raise EComPort.Create(CError_EscapeComFailed, GetLastError);
end;

procedure TComPort.SetDTR(OnOff: Boolean);
var
  Act: DWORD;
begin
  if OnOff then
    Act := Windows.SETDTR
  else
    Act := Windows.CLRDTR;

  if not EscapeCommFunction(FHandle, Act) then
    raise EComPort.Create(CError_EscapeComFailed, GetLastError);
end;

procedure TComPort.SetRTS(OnOff: Boolean);
var
  Act: DWORD;
begin
  if OnOff then
    Act := Windows.SETRTS
  else
    Act := Windows.CLRRTS;

  if not EscapeCommFunction(FHandle, Act) then
    raise EComPort.Create(CError_EscapeComFailed, GetLastError);
end;

procedure TComPort.SetXonXoff(OnOff: Boolean);
var
  Act: DWORD;
begin
  if OnOff then
    Act := Windows.SETXON
  else
    Act := Windows.SETXOFF;

  if not EscapeCommFunction(FHandle, Act) then
    raise EComPort.Create(CError_EscapeComFailed, GetLastError);
end;

procedure TComPort.ClearBuffer(Input, Output: Boolean);
var
  Flag: DWORD;
begin
  Flag := 0;
  if Input then
    Flag := PURGE_RXCLEAR;
  if Output then
    Flag := Flag or PURGE_TXCLEAR;

  if not PurgeComm(FHandle, Flag) then
    raise EComPort.Create(CError_PurgeFailed, GetLastError);
end;

function TComPort.LastErrors: TComErrors;
var
  Errors: DWORD;
  ComStat: TComStat;
begin
  if not ClearCommError(FHandle, Errors, @ComStat) then
    raise EComPort.Create(CError_ClearComFailed, GetLastError);
  Result := [];

  if (CE_FRAME and Errors) <> 0 then
    Result := Result + [ceFrame];
  if ((CE_RXPARITY and Errors) <> 0) and FParity.Check then // get around a bug
    Result := Result + [ceRxParity];
  if (CE_OVERRUN and Errors) <> 0 then
    Result := Result + [ceOverrun];
  if (CE_RXOVER and Errors) <> 0 then
    Result := Result + [ceRxOver];
  if (CE_TXFULL and Errors) <> 0 then
    Result := Result + [ceTxFull];
  if (CE_BREAK and Errors) <> 0 then
    Result := Result + [ceBreak];
  if (CE_IOE and Errors) <> 0 then
    Result := Result + [ceIO];
  if (CE_MODE and Errors) <> 0 then
    Result := Result + [ceMode];
end;

function TComPort.WriteAsync(const Buffer; Count: DWORD; var AsyncPtr: PAsync): DWORD;
var
  Success: Boolean;
  BytesTrans: DWORD;
begin
  AsyncPtr^.Kind := okWrite;

  Success := WriteFile(FHandle, Buffer, Count, BytesTrans, @AsyncPtr^.Overlapped)
    or (GetLastError = ERROR_IO_PENDING);

  if not Success then
    raise EComPort.Create(CError_WriteFailed, GetLastError);

  Result := BytesTrans;
end;

function TComPort.Write(const Buffer; Count: DWORD): DWORD;
var
  AsyncPtr: PAsync;
begin
  InitAsync(AsyncPtr);
  try
    WriteAsync(Buffer, Count, AsyncPtr);
    Result := WaitForAsync(AsyncPtr);
  finally
    DoneAsync(AsyncPtr);
  end;
end;

function TComPort.WriteStrAsync(Str: String; var AsyncPtr: PAsync): DWORD;
var
  Success: Boolean;
  BytesTrans: DWORD;
begin
  AsyncPtr^.Kind := okWrite;

  Success := WriteFile(FHandle, Str[1], Length(Str), BytesTrans, @AsyncPtr^.Overlapped)
    or (GetLastError = ERROR_IO_PENDING);

  if not Success then
    raise EComPort.Create(CError_WriteFailed, GetLastError);

  Result := BytesTrans;
end;

function TComPort.WriteStr(Str: String): DWORD;
var
  AsyncPtr: PAsync;
begin
  InitAsync(AsyncPtr);
  try
    WriteStrAsync(Str, AsyncPtr);
    Result := WaitForAsync(AsyncPtr);
  finally
    DoneAsync(AsyncPtr);
  end;
end;

function TComPort.ReadAsync(var Buffer; Count: DWORD; var AsyncPtr: PAsync): DWORD;
var
  Success: Boolean;
  BytesTrans: DWORD;
begin
  AsyncPtr^.Kind := okRead;

  Success := ReadFile(FHandle, Buffer, Count, BytesTrans, @AsyncPtr^.Overlapped)
    or (GetLastError = ERROR_IO_PENDING);

  if not Success then
    raise EComPort.Create(CError_ReadFailed, GetLastError);

  Result := BytesTrans;
end;

function TComPort.Read(var Buffer; Count: DWORD): DWORD;
var
  AsyncPtr: PAsync;
begin
  InitAsync(AsyncPtr);
  try
    ReadAsync(Buffer, Count, AsyncPtr);
    Result := WaitForAsync(AsyncPtr);
  finally
    DoneAsync(AsyncPtr);
  end;
end;

function TComPort.ReadStrAsync(var Str: String; Count: DWORD; var AsyncPtr: PAsync): DWORD;
var
  Success: Boolean;
  BytesTrans: DWORD;
begin
  AsyncPtr^.Kind := okRead;
  SetLength(Str, Count);

  Success := ReadFile(FHandle, Str[1], Count, BytesTrans, @AsyncPtr^.Overlapped)
    or (GetLastError = ERROR_IO_PENDING);

  if not Success then
    raise EComPort.Create(CError_ReadFailed, GetLastError);

  Result := BytesTrans;
end;

function TComPort.ReadStr(var Str: String; Count: DWORD): DWORD;
var
  AsyncPtr: PAsync;
begin
  InitAsync(AsyncPtr);
  try
    ReadStrAsync(Str, Count, AsyncPtr);
    Result := WaitForAsync(AsyncPtr);
    SetLength(Str, Result);
  finally
    DoneAsync(AsyncPtr);
  end;
end;

function TComPort.WaitForAsync(var AsyncPtr: PAsync): DWORD;
var
  BytesTrans, Signaled: DWORD;
  Success: Boolean;
begin
  if AsyncPtr = nil then
    raise EComPort.CreateNoWinCode(CError_InvalidAsync);

  with AsyncPtr^ do begin
    Signaled := WaitForSingleObject(Overlapped.hEvent, INFINITE);
    Success := (Signaled = WAIT_OBJECT_0) and
      (GetOverlappedResult(FHandle, Overlapped, BytesTrans, False));
  end;

  if not Success then
    raise EComPort.Create(ErrorCode(AsyncPtr), GetLastError);

  Result := BytesTrans;
end;

function TComPort.ErrorCode(AsyncPtr: PAsync): Integer;
begin
  Result := 0;
  case AsyncPtr^.Kind of
    okWrite: Result := CError_WriteFailed;
    okRead:  Result := CError_ReadFailed;
  end;
end;

procedure TComPort.AbortAllAsync;
begin
  if not PurgeComm(FHandle, PURGE_TXABORT or PURGE_RXABORT) then
    raise EComPort.Create(CError_PurgeFailed, GetLastError);
end;

function TComPort.IsAsyncCompleted(AsyncPtr: PAsync): Boolean;
var
  BytesTrans: DWORD;
begin
  if AsyncPtr = nil then
    raise EComPort.CreateNoWinCode(CError_InvalidAsync);

  Result := GetOverlappedResult(FHandle, AsyncPtr^.Overlapped, BytesTrans, False);
  if not Result then
    if GetLastError <> ERROR_IO_INCOMPLETE then
      raise EComPort.Create(CError_AsyncCheck, GetLastError);
end;

procedure TComPort.TransmitChar(Ch: Char);
begin
  if not TransmitCommChar(FHandle, Ch) then
    raise EComPort.Create(CError_TransmitFailed, GetLastError);
end;

procedure TComPort.ShowSetupDialog;
var
  Temp: TComFlowControl;
begin
  with TSerialFrm.Create(nil) do begin
    Temp := TComFlowControl.Create;
    Temp.Assign(FFlowControl);
    ComboBox1.ItemIndex := Integer(Port);
    ComboBox2.ItemIndex := Integer(BaudRate);
    ComboBox3.ItemIndex := Integer(StopBits);
    ComboBox4.ItemIndex := Integer(DataBits);
    ComboBox5.ItemIndex := Integer(Parity.Bits);
    CheckBox1.Checked := Temp.OutCTSFlow;
    CheckBox2.Checked := Temp.OutDSRFlow;
    CheckBox3.Checked := Temp.XonXoffOut;
    CheckBox4.Checked := Temp.XonXoffIn;
    RadioGroup1.ItemIndex := Integer(Temp.ControlRTS);
    RadioGroup2.ItemIndex := Integer(Temp.ControlDTR);
    if ShowModal = mrOK then begin
      Port := TPortType(ComboBox1.ItemIndex);
      BaudRate := TBaudRate(ComboBox2.ItemIndex);
      StopBits := TStopBits(ComboBox3.ItemIndex);
      DataBits := TDataBits(ComboBox4.ItemIndex);
      Parity.FBits := TParityBits(ComboBox5.ItemIndex);
      Temp.OutCTSFlow := CheckBox1.Checked;
      Temp.OutDSRFlow := CheckBox2.Checked;
      Temp.XonXoffOut := CheckBox3.Checked;
      Temp.XonXoffIn := CheckBox4.Checked;
      Temp.ControlRTS := TRTSFlowControl(RadioGroup1.ItemIndex);
      Temp.ControlDTR := TDTRFlowControl(RadioGroup2.ItemIndex);
      FlowControl := Temp;
    end;
    Temp.Free;
    Free;
  end;
end;

procedure TComPort.SetConnected(Value: Boolean);
begin
  if Value then
    Open
  else
    Close;
end;

procedure TComPort.SetBaudRate(Value: TBaudRate);
begin
  if Value <> FBaudRate then begin
    FBaudRate := Value;
    ApplyDCB;
  end;
end;

procedure TComPort.SetDataBits(Value: TDataBits);
begin
  if Value <> FDataBits then begin
    FDataBits := Value;
    ApplyDCB;
  end;
end;

procedure TComPort.SetDiscardNull(Value: Boolean);
begin
  if Value <> FDiscardNull then begin
    FDiscardNull := Value;
    ApplyDCB;
  end;
end;

procedure TComPort.SetEventChar(Value: Byte);
begin
  if Value <> FEventChar then begin
    FEventChar := Value;
    ApplyDCB;
  end;
end;

procedure TComPort.SetPort(Value: TPortType);
begin
  if Value <> FPort then begin
    FPort := Value;
    if FConnected then begin
      Close;
      Open;
    end;
  end;
end;

procedure TComPort.SetStopBits(Value: TStopBits);
begin
  if Value <> FStopBits then begin
    FStopBits := Value;
    ApplyDCB;
  end;
end;

procedure TComPort.SetSyncMethod(Value: TSyncMethod);
begin
  if Value <> FSyncMethod then begin
    if FConnected then
      raise EComPort.CreateNoWinCode(CError_SyncMeth)
    else
      FSyncMethod := Value;
  end;
end;

procedure TComPort.SetFlowControl(Value: TComFlowControl);
begin
  FFlowControl.Assign(Value);
  ApplyDCB;
end;

procedure TComPort.SetParity(Value: TComParity);
begin
  FParity.Assign(Value);
  ApplyDCB;
end;

procedure TComPort.SetTimeouts(Value: TComTimeouts);
begin
  FTimeouts.Assign(Value);
  ApplyTimeouts;
end;

procedure TComPort.SetBuffer(Value: TComBuffer);
begin
  FBuffer.AssignTo(Value);
  ApplyBuffer;
end;

procedure TComPort.DoOnRxChar;
begin
  if Assigned(FOnRxChar) then
    FOnRxChar(Self, Integer(InputCount));
end;

procedure TComPort.DoOnBreak;
begin
  if Assigned(FOnBreak) then
    FOnBreak(Self);
end;

procedure TComPort.DoOnTxEmpty;
begin
  if Assigned(FOnTxEmpty)
    then FOnTxEmpty(Self);
end;

procedure TComPort.DoOnRingChange;
begin
  if Assigned(FOnRing) then
    FOnRing(Self);
end;

procedure TComPort.DoOnCTSChange;
begin
  if Assigned(FOnCTSChange) then
    FOnCTSChange(Self, msCTS in ModemSignals);
end;

procedure TComPort.DoOnDSRChange;
begin
  if Assigned(FOnDSRChange) then
    FOnDSRChange(Self, msDSR in ModemSignals);
end;

procedure TComPort.DoOnRLSDChange;
begin
  if Assigned(FOnRLSDChange) then
    FOnRLSDChange(Self, msRLSD in ModemSignals);
end;

procedure TComPort.DoOnError;
begin
  if Assigned(FOnError) then
    FOnError(Self, LastErrors);
end;

procedure TComPort.DoOnRxFlag;
begin
  if Assigned(FOnRxFlag) then
    FOnRxFlag(Self);
end;

procedure TComPort.DoOnRx80Full;
begin
  if Assigned(FOnRx80Full) then
    FOnRx80Full(Self);
end;

function TComPort.ComString: String;
begin
  case FPort of
    COM1: Result := 'COM1';
    COM2: Result := 'COM2';
    COM3: Result := 'COM3';
    COM4: Result := 'COM4';
    COM5: Result := 'COM5';
    COM6: Result := 'COM6';
    COM7: Result := 'COM7';
    COM8: Result := 'COM8';
  end;
end;

// EComPort

constructor EComPort.Create(ACode: Integer; AWinCode: Integer);
begin
  FWinCode := AWinCode;
  FCode := ACode;
  inherited CreateFmt(ComErrorMessages[ACode] + ' (win error code: %d)', [AWinCode]);
end;

constructor EComPort.CreateNoWinCode(ACode: Integer);
begin
  FWinCode := -1;
  FCode := ACode;
  inherited Create(ComErrorMessages[ACode]);
end;

// TComPortEditor

procedure TComPortEditor.ExecuteVerb(Index: Integer);
begin
  if Index = 0 then begin
    (Component as TComPort).ShowSetupDialog;
    Designer.Modified;
  end;
end;

function TComPortEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Edit Properties';
  end;
end;

function TComPortEditor.GetVerbCount: Integer;
begin
  Result := 1;
end;

procedure Register;
begin
  RegisterComponents('e-comp', [TComPort]);
  RegisterComponentEditor(TComPort, TComPortEditor);
end;

end.
