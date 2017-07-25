unit Otworz;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFormaOtwarcia = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormaOtwarcia: TFormaOtwarcia;

implementation
uses test, Pomoc;

{$R *.DFM}

procedure TFormaOtwarcia.Button1Click(Sender: TObject);
begin
   OpenDialog1.Title := 'Otwórz SPS-S';
   OpenDialog1.InitialDir := ExtractFileDir(PobierzKluczRejestru('NazwaPlikuOtwartegoS'));
   if OpenDialog1.Execute then
   begin
     if OpenDialog1.FileName <> '' then
     if FileExists(OpenDialog1.FileName) then Edit1.Text := Trim(OpenDialog1.FileName) ;
     ZapiszKluczRejestru('NazwaPlikuOtwartegoS', Edit1.Text);
   end;               
end;

procedure TFormaOtwarcia.Button2Click(Sender: TObject);
begin
   OpenDialog1.Title := 'Otwórz SPS-X';
   OpenDialog1.InitialDir := ExtractFileDir(PobierzKluczRejestru('NazwaPlikuOtwartegoS'));
   if OpenDialog1.Execute then
   begin
     if OpenDialog1.FileName <> '' then
     if FileExists(OpenDialog1.FileName) then Edit2.Text := Trim(OpenDialog1.FileName) ;
     ZapiszKluczRejestru('NazwaPlikuOtwartegoX', Edit2.Text);
   end;
end;

procedure TFormaOtwarcia.Button3Click(Sender: TObject);
begin
   OpenDialog1.Title := 'Otwórz SPS-R';
   OpenDialog1.InitialDir := ExtractFileDir(PobierzKluczRejestru('NazwaPlikuOtwartegoR'));
   if OpenDialog1.Execute then
   begin
     if OpenDialog1.FileName <> '' then
     if FileExists(OpenDialog1.FileName) then Edit3.Text := OpenDialog1.FileName;
     ZapiszKluczRejestru(NazwaPlikuOtwartegoR,'NazwaPlikuOtwartegoR');
   end;
end;

end.
