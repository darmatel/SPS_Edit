unit ComboOrazOKCancel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ComCtrls;

type
  TFormaZCombo = class(TForm)
    ComboBox1: TComboBox;
    OKButton: TButton;
    AnulujButton: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Label2: TLabel;
    Edit1: TEdit;
    RichEdit1: TRichEdit;
    Edit2: TEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    Label4: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormaZCombo: TFormaZCombo;

implementation

{$R *.DFM}

procedure TFormaZCombo.Edit1Change(Sender: TObject);
begin
  if FileExists(Edit1.Text) then
  begin
     RichEdit1.Lines.Clear;
     RichEdit1.Lines.LoadFromFile(Edit1.Text);
  end;
end;

procedure TFormaZCombo.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then OKButton.Click;
  if (Key = Chr(VK_ESCAPE)) then AnulujButton.Click;
end;

procedure TFormaZCombo.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_RETURN)) then OKButton.Click;
  if (Key = Chr(VK_ESCAPE)) then AnulujButton.Click;
end;

procedure TFormaZCombo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if not (FileExists(Trim(Edit1.Text)) or (ComboBox1.Text = '')) and (ModalResult = 1) then
   begin
     Application.MessageBox('B³¹d podczas otwierania pliku lub nie wybrano kolumny',  'Wstawianie wartoœci do kolumny',  mb_ICONHAND or MB_OKCANCEL);
     Abort;
   end;
end;

procedure TFormaZCombo.FormCreate(Sender: TObject);
begin
  ComboBox1.ItemIndex := 1;
end;

end.
