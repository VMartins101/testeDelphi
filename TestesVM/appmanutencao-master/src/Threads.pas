unit Threads;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, System.Threading;

type
  TfThreads = class(TForm)
    edtQtdMaxThreads: TEdit;
    edtTempoMaximo: TEdit;
    Button1: TButton;
    ProgressBar: TProgressBar;
    Memo1: TMemo;
    procedure Iteracao;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fThreads: TfThreads;

implementation

{$R *.dfm}

{ TfThreads }

procedure TfThreads.Button1Click(Sender: TObject);
begin

  // verificar edits vazio

  Memo1.Clear;

  ProgressBar.Position := 0;
  ProgressBar.Min := 0;
  ProgressBar.Max := 500; // StrtoInt(edtQtdMaxThreads.Text) * 100;

  TTask.Run(
  procedure
  begin
    TParallel.&For(1,StrToInt(edtQtdMaxThreads.Text),
    procedure (Index: Integer)
    begin
      Iteracao;
    end)
  end
  );
end;

procedure TfThreads.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    TTask.WaitForAny(TTask.CurrentTask);

end;

procedure TfThreads.Iteracao;
var
  I: Integer;
begin
  Memo1.Lines.Add( IntToStr(GetCurrentThreadId)  +  ' - Iniciando Processamento');
  for I := 0 to 100 do begin
    sleep(random(StrToInt(edtTempoMaximo.Text)));
    ProgressBar.Position := ProgressBar.Position + 1;
  end;
  Memo1.Lines.Add( IntToStr(GetCurrentThreadId)  +  ' - Processamento Finalizado');
end;

end.
