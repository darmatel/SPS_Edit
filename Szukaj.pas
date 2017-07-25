unit Szukaj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TFormaSzukaj = class(TForm)
    EditPS: TEdit;
    EditRec: TEdit;
    PSLabel: TLabel;
    RekordLabel: TLabel;
    OKButton: TButton;
    AnulujButton: TButton;
    Bevel1: TBevel;
    procedure EditPSEnter(Sender: TObject);
    procedure EditRecEnter(Sender: TObject);
    procedure EditPSExit(Sender: TObject);
    procedure EditRecExit(Sender: TObject);
    procedure EditPSKeyPress(Sender: TObject; var Key: Char);
    procedure EditRecKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    EnableKasowanie :boolean; //przy przechodzeniu z okna edycyjnego do okna
    { Public declarations }
  end;

var
  FormaSzukaj: TFormaSzukaj;

implementation

{$R *.DFM}


procedure TFormaSzukaj.EditPSEnter(Sender: TObject);
begin
   if EnableKasowanie then EditRec.Text := '';
end;

procedure TFormaSzukaj.EditRecEnter(Sender: TObject);
begin
  if EnableKasowanie then EditPS.Text := '';
end;

procedure TFormaSzukaj.EditPSExit(Sender: TObject);
begin
   if EnableKasowanie then EditRec.Text := '';
end;

procedure TFormaSzukaj.EditRecExit(Sender: TObject);
begin
  if EnableKasowanie then EditPS.Text := '';
end;

procedure TFormaSzukaj.EditPSKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then OKButton.Click;
  if (Key = Chr(VK_ESCAPE)) then AnulujButton.Click;
end;

procedure TFormaSzukaj.EditRecKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then OKButton.Click;
  if (Key = Chr(VK_ESCAPE)) then AnulujButton.Click;
end;

procedure TFormaSzukaj.FormCreate(Sender: TObject);
begin
  EnableKasowanie := true; 
end;

end.
