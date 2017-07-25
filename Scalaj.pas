unit Scalaj;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ComCtrls, Spin;

type
  TFormaScalaj = class(TForm)
    Button1: TButton;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    UpDown1: TUpDown;
    DirectoryListBox2: TDirectoryListBox;
    DriveComboBox2: TDriveComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Button7: TButton;
    FileListBox2: TFileListBox;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure DirectoryListBox2Change(Sender: TObject);
    procedure DriveComboBox2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FileListBox1DblClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);

  private
    procedure SumujNazwe;
    { Private declarations }
  public
    PlikWynikowy           :string;
    { Public declarations }
  end;

var
  FormaScalaj: TFormaScalaj;

implementation

{$R *.DFM}

procedure TFormaScalaj.Button3Click(Sender: TObject);
begin
 if (FileListBox1.SelCount <> 0)  and FileListBox1.Enabled then
 begin
   if FileListBox1.FileName <> '' then
   begin
     FileListBox2.Items.Add(ExtractFileName(FileListBox1.FileName));
     FileListBox1.ItemIndex := -1;
   end;
 end;

end;

procedure TFormaScalaj.Button4Click(Sender: TObject);
var i :integer;
begin
  if FileListBox1.Items.Count <> 0 then
  begin
    for i := 0 to FileListBox1.Items.Count - 1 do
    begin
      if FileListBox1.Selected[i] then
      begin
         FileListBox2.Items.Add(FileListBox1.Items.Strings[i]);
         FileListBox1.Selected[i] := false;
      end;
    end;
    FileListBox1.ItemIndex := -1;
  end;
end;

procedure TFormaScalaj.Button5Click(Sender: TObject);
begin
  FileListBox2.Items.Delete(FileListBox2.ItemIndex);
  FileListBox2.ItemIndex := -1;
end;

procedure TFormaScalaj.Button6Click(Sender: TObject);
begin
  FileListBox2.Items.Clear;
end;

procedure TFormaScalaj.UpDown1Click(Sender: TObject; Button: TUDBtnType);
var    indeks :integer;
begin
  if FileListBox2.ItemIndex = -1 then exit;

  if Button = btPrev then
  begin
    if  (FileListBox2.ItemIndex < FileListBox2.Items.Count - 1)
    then
    begin
      indeks := FileListBox2.ItemIndex;
      FileListBox2.Items.Move(FileListBox2.ItemIndex, indeks + 1);
      FileListBox2.ItemIndex := indeks + 1;
    end;
  end else
  begin
    if  (FileListBox2.ItemIndex > 0) then
    begin
      indeks := FileListBox2.ItemIndex;
      FileListBox2.Items.Move(FileListBox2.ItemIndex, FileListBox2.ItemIndex - 1);
      FileListBox2.ItemIndex := indeks - 1;
    end;
  end;

end;


procedure TFormaScalaj.DirectoryListBox2Change(Sender: TObject);
begin
  SumujNazwe;
end;

procedure TFormaScalaj.DriveComboBox2Change(Sender: TObject);
begin
  SumujNazwe;
end;

procedure TFormaScalaj.Edit1Change(Sender: TObject);
begin
  SumujNazwe;
end;

procedure TFormaScalaj.SumujNazwe;
begin
  PlikWynikowy := DirectoryListBox2.Directory + '\' + Trim(Edit1.Text);
end;

procedure TFormaScalaj.Button1Click(Sender: TObject);
var i             :integer;
    f,cel         :TextFile;
    tmp_str       :string;
begin
  if Edit1.Text <> '' then
  begin
    AssignFile(cel, PlikWynikowy);
    Rewrite(cel);
    for i := 0 to FileListBox2.Items.Count - 1 do
    begin
      AssignFile(f,  FileListBox2.Items.Strings[i]);
      Reset(f);
      while not eof(f) do
      begin
        readln(f, tmp_str);
        writeln(cel, tmp_str);
      end;
      CloseFile(f);
    end;
    CloseFile(cel);
  end;
  FileListBox2.Update;
  DirectoryListBox2.Update;
end;

procedure TFormaScalaj.FileListBox1DblClick(Sender: TObject);
begin
  Button3Click(Sender);
end;



procedure TFormaScalaj.Button7Click(Sender: TObject);
begin
  Close;
end;

end.
