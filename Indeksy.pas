unit Indeksy;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, FileCtrl;

type
  TZamianaIndeksow = class(TForm)
    KlawiszOtworz: TButton;
    OpenDialog: TOpenDialog;
    Memo: TMemo;
    Button1: TButton;
    Label1: TLabel;
    MemoPlytkie: TMemo;
    Label2: TLabel;
    procedure KlawiszOtworzClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    Nazwa_Pliku_S :string;
    f             :file;
    { Public declarations }
  end;

var
  ZamianaIndeksow: TZamianaIndeksow;

implementation

{$R *.DFM}

procedure TZamianaIndeksow.KlawiszOtworzClick(Sender: TObject);

function znajdz(co:string):string ;
var i :integer;
begin
  znajdz := '';
  for i := 0 to Memo.Lines.Count -1 do
  begin
    if Copy(Memo.Lines[i],1,2) = co then znajdz := Copy(Memo.Lines[i],4,2);
  end;
end;

function znajdz_plytki(co:string):string ;
var i :integer;
begin
  znajdz_plytki := '';
  for i := 0 to MemoPlytkie.Lines.Count -1 do
  begin
    if Copy(MemoPlytkie.Lines[i],1,2) = co then
       znajdz_plytki := Copy(MemoPlytkie.Lines[i],4,2);
  end;
end;

var linia_sps :string[80];
    plik        :textfile;
    ind_oryg,
    ind_nowy    :string[2];
    plik_tmp    :textfile;

begin
  OpenDialog.Title := 'Otwórz SPS-S';
  if OpenDialog.Execute then
  begin
    if OpenDialog.FileName <> ''
    then
    begin
      Nazwa_Pliku_S := OpenDialog.FileName;
      AssignFile(plik, OpenDialog.FileName);
      Reset(plik);
      AssignFile(plik_tmp, 'sps001.tmp');
      Rewrite(plik_tmp);

      while not eof(plik) do
      begin
        readln(plik, linia_sps);
        if (Length(linia_sps) > 80) or (linia_sps[1] <> 'S') then
        begin
          ShowMessage('Nieprawid³owy format pliku SPS');
          CloseFile(plik);
          CloseFile(plik_tmp);
          DeleteFile('sps001.tmp');
          Halt;
        end;
        ind_oryg := copy(linia_sps,27, 2);
        ind_nowy := znajdz(ind_oryg);
        if ind_nowy <> '' then
        begin
          delete(linia_sps, 27, 2);
          insert(ind_nowy, linia_sps, 27);
          {A TERAZ KOREKTA P£YTKICH}
          if StrToFloat(Trim(Copy(linia_sps,33, 4))) <= 2 then
          begin
            ind_nowy := znajdz_plytki(ind_nowy);
            if ind_nowy <> '' then
            begin
              delete(linia_sps, 27, 2);
              insert(ind_nowy, linia_sps, 27);
            end else //NIE ZNALAZ£ DEFINICJI INDEKSU DLA P£YTKIEGO
            begin
              delete(linia_sps, 27, 2);
              insert('**', linia_sps, 27);
            end;
          end;

        end else    {NIE ZNALAZ£ INDEKSU}
        begin
          delete(linia_sps, 27, 2);
          insert('**', linia_sps, 27);
        end;
      Writeln(plik_tmp, linia_sps);
      end;{while}
      CloseFile(plik);
      CloseFile(plik_tmp);
      if FileExists(Nazwa_Pliku_S) then  DeleteFile(Nazwa_Pliku_S);
      RenameFile('sps001.tmp', Nazwa_Pliku_S) ;

      ShowMessage('Zrobione!');
    end;
  end

end;

procedure TZamianaIndeksow.FormCreate(Sender: TObject);
begin
   if FileExists('indeksy.dat') and FileExists('Plytkie.dat') then
   begin
     Memo.Lines.LoadFromFile('indeksy.dat');
     MemoPlytkie.Lines.LoadFromFile('Plytkie.dat');
   end;
end;

procedure TZamianaIndeksow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  If Memo.Modified then Memo.Lines.SaveToFile('indeksy.dat');
  If MemoPlytkie.Modified then MemoPlytkie.Lines.SaveToFile('plytkie.dat');
end;

procedure TZamianaIndeksow.Button1Click(Sender: TObject);
begin
 Close;
end;


end.
