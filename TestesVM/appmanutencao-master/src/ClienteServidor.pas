unit ClienteServidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Datasnap.DBClient, Data.DB,
  System.Threading;

type
  TServidor = class
  private
    FPath: AnsiString;
  public
    constructor Create;
    //Tipo do par?metro n?o pode ser alterado
    function SalvarArquivos(AData: OleVariant): Boolean; overload;
    function SalvarArquivos(AData: OleVariant; ALoteAtual: Integer): Boolean; overload;
  end;

  TfClienteServidor = class(TForm)
    ProgressBar: TProgressBar;
    btEnviarSemErros: TButton;
    btEnviarComErros: TButton;
    btEnviarParalelo: TButton;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Arq: TBlobField;
    procedure FormCreate(Sender: TObject);
    procedure btEnviarSemErrosClick(Sender: TObject);
    procedure btEnviarComErrosClick(Sender: TObject);
    procedure btEnviarParaleloClick(Sender: TObject);
  private
    FPath: AnsiString;
    FServidor: TServidor;

    function InitDataset: TClientDataset;
  public
  end;

var
  fClienteServidor: TfClienteServidor;

const
  QTD_ARQUIVOS_ENVIAR = 100;
  QTD_LOTES = 5;

implementation

uses
  IOUtils;

{$R *.dfm}

procedure TfClienteServidor.btEnviarComErrosClick(Sender: TObject);
var
  cds: TClientDataset;
  i: Integer;
begin
  cds := InitDataset;
  for i := 0 to QTD_ARQUIVOS_ENVIAR do
  begin
    cds.Append;
    TBlobField(cds.FieldByName('Arquivo')).LoadFromFile(FPath);
    cds.Post;

    {$REGION Simula??o de erro, n?o alterar}
    if i = (QTD_ARQUIVOS_ENVIAR/2) then
      FServidor.SalvarArquivos(NULL);
    {$ENDREGION}
  end;

  FServidor.SalvarArquivos(cds.Data);
end;

procedure TfClienteServidor.btEnviarParaleloClick(Sender: TObject);
var
  cds: TClientDataset;
begin
  cds := InitDataset;
  TParallel.&For(0,QTD_ARQUIVOS_ENVIAR,
    procedure (Index: Integer)
    begin
      cds.Append;
      TBlobField(cds.FieldByName('Arquivo')).LoadFromFile(FPath);
      cds.Post;
    end);
  FServidor.SalvarArquivos(cds.Data);
end;

procedure TfClienteServidor.btEnviarSemErrosClick(Sender: TObject);
var
  cds: TClientDataset;
  i, nLoteAtual, nControleLote: Integer;
begin
  ProgressBar.Min := 0;
  ProgressBar.Max := QTD_ARQUIVOS_ENVIAR;
  ProgressBar.Position := 0;
  nLoteAtual := 0;
  nControleLote := 1;


    cds := InitDataset;
    for i := 0 to QTD_ARQUIVOS_ENVIAR do
    begin
      cds.Append;
      TBlobField(cds.FieldByName('Arquivo')).LoadFromFile(FPath);
      cds.Post;

      if nControleLote = QTD_LOTES then begin
        FServidor.SalvarArquivos(cds.Data, nLoteAtual);
        cds.First;
        while not cds.Eof do begin
          //if cds.State = dsBrowse then
          //  cds.Edit;
          //(cds.FieldByName('Arquivo') as TBlobField).Clear;
          cds.Delete;
          //cds.Next;
        end;
        cds.EmptyDataSet;
        nLoteAtual := nLoteAtual + 1;
        nControleLote := 1;
      end else
        nControleLote := nControleLote + 1;

      ProgressBar.Position := ProgressBar.Position+1;
      Application.ProcessMessages;
    end;

    FServidor.SalvarArquivos(cds.Data, nLoteAtual);

end;

procedure TfClienteServidor.FormCreate(Sender: TObject);
begin
  inherited;
  FPath := IncludeTrailingBackslash(ExtractFilePath(ParamStr(0))) + 'pdf.pdf';
  FServidor := TServidor.Create;
end;

function TfClienteServidor.InitDataset: TClientDataset;
begin
  Result := TClientDataset.Create(nil);
  Result.FieldDefs.Add('Arquivo', ftBlob);
  Result.CreateDataSet;
end;

{ TServidor }

constructor TServidor.Create;
begin
  FPath := ExtractFilePath(ParamStr(0)) + 'Servidor\';
end;

function TServidor.SalvarArquivos(AData: OleVariant): Boolean;
var
  cds: TClientDataSet;
  FileName: string;
begin
  try
    cds := TClientDataset.Create(nil);
    cds.Data := AData;

    {$REGION Simula??o de erro, n?o alterar}
    if cds.RecordCount = 0 then
      Exit;
    {$ENDREGION}

    cds.First;

    while not cds.Eof do
    begin
      FileName := FPath + cds.RecNo.ToString + '.pdf';
      if TFile.Exists(FileName) then
        TFile.Delete(FileName);

      TBlobField(cds.FieldByName('Arquivo')).SaveToFile(FileName);
      cds.Next;
    end;

    Result := True;
  except
    Result := False;
    raise;
  end;
end;

function TServidor.SalvarArquivos(AData: OleVariant;
  ALoteAtual: Integer): Boolean;
var
  cds: TClientDataSet;
  FileName: string;
begin
  try
    cds := TClientDataset.Create(nil);
    cds.Data := AData;

    {$REGION Simula??o de erro, n?o alterar}
    if cds.RecordCount = 0 then
      Exit;
    {$ENDREGION}

    cds.First;

    while not cds.Eof do
    begin
      FileName := FPath +  IntToStr( cds.RecNo + (ALoteAtual * QTD_LOTES) ) + '.pdf';
      if TFile.Exists(FileName) then
        TFile.Delete(FileName);

      TBlobField(cds.FieldByName('Arquivo')).SaveToFile(FileName);
      cds.Next;
    end;

    Result := True;
  except
    Result := False;
    raise;
  end;
end;

end.
