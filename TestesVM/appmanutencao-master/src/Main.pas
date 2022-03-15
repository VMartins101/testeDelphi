unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.AppEvnts;

type
  TfMain = class(TForm)
    btDatasetLoop: TButton;
    btThreads: TButton;
    btStreams: TButton;
    ApplicationEvents1: TApplicationEvents;
    Button1: TButton;
    procedure btDatasetLoopClick(Sender: TObject);
    procedure btStreamsClick(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure Button1Click(Sender: TObject);
    procedure btThreadsClick(Sender: TObject);
  private
  public
  end;

var
  fMain: TfMain;

implementation

uses
  DatasetLoop, ClienteServidor, Threads;

{$R *.dfm}

procedure TfMain.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  // implementar gerar arquivo txt
  showmessage('Teste');
  //end

  showmessage(E.Message);
end;

procedure TfMain.btDatasetLoopClick(Sender: TObject);
begin
  fDatasetLoop.Show;
end;

procedure TfMain.btStreamsClick(Sender: TObject);
begin
  fClienteServidor.Show;
end;

procedure TfMain.btThreadsClick(Sender: TObject);
begin
  fThreads.Show;
end;

procedure TfMain.Button1Click(Sender: TObject);
var
  sData: TDate;
begin
  sData := StrToDate('0');
end;

end.
