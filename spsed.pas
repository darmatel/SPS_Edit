unit spsed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Buttons, Db, DBTables, Grids, DBGrids,
  Menus,Pomoc, ToolWin, DBCtrls;

type

  TFormaMain = class(TForm)
    Panel1: TPanel;
    TabControl1: TTabControl;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    OpenDialog1: TOpenDialog;
    Panel2: TPanel;
    Baza: TDatabase;
    XPopupMenu: TPopupMenu;
    UsunRec: TMenuItem;
    SortujQuery: TQuery;
    MainMenu1: TMainMenu;
    PlikMenu: TMenuItem;
    OtworzSPSMenu: TMenuItem;
    ZapiszSPSMenu: TMenuItem;
    DolaczSPSMenu: TMenuItem;
    N1: TMenuItem;
    ZakonczMenu: TMenuItem;
    Edycja1: TMenuItem;
    SzukajMenu: TMenuItem;
    ZamienMenu: TMenuItem;
    UsunMenu: TMenuItem;
    EdytujJakoTekst: TMenuItem;
    Narzdzia1: TMenuItem;
    OpcjeProgramu: TMenuItem;
    EdytorSPS: TPageControl;
    SSPS: TTabSheet;
    DBGrid1: TDBGrid;
    XSPS: TTabSheet;
    DBGrid2: TDBGrid;
    TabelaS: TTable;
    TabelaX: TTable;
    EksportSPSMenu: TMenuItem;
    ZamienIndeksyMenu: TMenuItem;
    TestujSPSMenu: TMenuItem;
    PrzyjmijSPSMenu: TMenuItem;
    N2: TMenuItem;
    WyczyscBazeMenu: TMenuItem;
    N3: TMenuItem;
    EdytorTabSheet: TTabSheet;
    WstawKolumneMenu: TMenuItem;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    WstawGeodezjeMenu: TMenuItem;
    TabelaSIND: TFloatField;
    TabelaSILE_SZT: TFloatField;
    TabelaSIDENT_S: TStringField;
    TabelaSLINE: TFloatField;
    TabelaSSTATION: TFloatField;
    TabelaSKTORY_RAZ: TStringField;
    TabelaSKOD_ZRODLA: TStringField;
    TabelaSDEPH: TFloatField;
    TabelaSUPHOLE: TFloatField;
    TabelaSDATUM: TSmallintField;
    TabelaSSTATYKA: TSmallintField;
    TabelaSWATER: TFloatField;
    TabelaSEASTING: TFloatField;
    TabelaSNORTHING: TFloatField;
    TabelaSELEW: TFloatField;
    TabelaSDAY: TSmallintField;
    TabelaSTIME: TFloatField;
    TabelaSREZERWA: TFloatField;
    TabelaXIND: TFloatField;
    TabelaXILE_SZT: TFloatField;
    TabelaXX: TStringField;
    TabelaXTASMA: TSmallintField;
    TabelaXREKORD: TFloatField;
    TabelaXLINE: TFloatField;
    TabelaXSTATION: TFloatField;
    TabelaXOD: TFloatField;
    TabelaXDO: TFloatField;
    TabelaXLINIA: TFloatField;
    TabelaXSKAD: TFloatField;
    TabelaXDOKAD: TFloatField;
    TabelaXNUMERACJA: TSmallintField;
    TabelaXAPARATURA: TStringField;
    TabelaXKTORY_RAZ: TStringField;
    TabelaXINDEKS_ODB: TStringField;
    TabelaXKROK_KAN: TSmallintField;
    SPopupMenu: TPopupMenu;
    Edytor: TRichEdit;
    UsunS: TMenuItem;
    WstawKolumneS: TMenuItem;
    EksportS: TMenuItem;
    EksportX: TMenuItem;
    ToolBar1: TToolBar;
    ToolButtonOtworz: TToolButton;
    ToolButtonSave: TToolButton;
    ImageList1: TImageList;
    RTabsheet: TTabSheet;
    TabelaR: TTable;
    DataSource3: TDataSource;
    DBGrid3: TDBGrid;
    ToolButtonErase: TToolButton;
    TabelaRILE_SZT: TFloatField;
    TabelaRIDENT_S: TStringField;
    TabelaRLINE: TFloatField;
    TabelaRSTATION: TFloatField;
    TabelaRKTORY_RAZ: TStringField;
    TabelaRKOD_ODB: TStringField;
    TabelaRDEPH: TFloatField;
    TabelaRUPHOLE: TFloatField;
    TabelaRDATUM: TFloatField;
    TabelaRSTATYKA: TFloatField;
    TabelaRWATER: TFloatField;
    TabelaREASTING: TFloatField;
    TabelaRNORTHING: TFloatField;
    TabelaRELEW: TFloatField;
    TabelaRDAY: TFloatField;
    TabelaRTIME: TFloatField;
    WczytajMenu: TMenuItem;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure OtworzSPSMenuClick(Sender: TObject);
    procedure EksportSPSMenuClick(Sender: TObject);
    procedure ZakonczMenuClick(Sender: TObject);
    procedure SzukajMenuClick(Sender: TObject);
    procedure WyczyscBazeMenuClick(Sender: TObject);
    procedure WstawKolumneMenuClick(Sender: TObject);
    procedure UsunMenuClick(Sender: TObject);
    procedure ZamienIndeksyMenuClick(Sender: TObject);
    procedure WstawGeodezjeMenuClick(Sender: TObject);
    procedure ZamienMenuClick(Sender: TObject);
    procedure UsunSClick(Sender: TObject);
    procedure UsunRecClick(Sender: TObject);
    procedure EdytorExit(Sender: TObject);
    procedure EksportSClick(Sender: TObject);
    procedure ToolButtonOtworzClick(Sender: TObject);
    procedure WstawKolumneSClick(Sender: TObject);
    procedure EksportXClick(Sender: TObject);
    procedure DolaczSPSMenuClick(Sender: TObject);
    procedure ToolButtonSaveClick(Sender: TObject);
    procedure ToolButtonEraseClick(Sender: TObject);
    procedure TabelaSAfterScroll(DataSet: TDataSet);
    procedure TabelaSAfterDelete(DataSet: TDataSet);
    procedure TabelaSAfterInsert(DataSet: TDataSet);
    procedure ZapiszSPSMenuClick(Sender: TObject);
    procedure WczytajMenuClick(Sender: TObject);


  private
    { Private declarations }
  public

  function TEST_INTEGRALNOSCI_SPS(nazwa_S, nazwa_X, nazwa_R :string) :boolean;

//  procedure ZaladujSPS;  {komplet *.S *.X}

  procedure LadujSSPS(nazwa_pliku :string);
  procedure LadujXSPS(nazwa_pliku :string);
  procedure LadujRSPS(nazwa_pliku :string);

  procedure ExportXSPS(nazwa_pliku :string);
  procedure ExportSPSS(nazwa_pliku :string);
  procedure ExportRSPS(nazwa_pliku :string);
  Function UstawNaPierwszyWierszRekordu(const Rekord_szukany :real) :boolean;

  function ZnajdzWgPS(linia, stacja :real; ktory_razik:char) :boolean; //przesuwa kursor
  function ZnajdzILE_SZT_WgRec(szukaj_rec :real):boolean; //przesuwa kursor
  function ZnajdzILE_SZT_WgNumeru(const linia, stacja :real; ktory_raz :char):boolean; //przesuwa kursor
  function ZnajdzSWgIndeksu(indeks :real):boolean; //przesuwa kursor maj¹c indeks
  function ZnajdzXWgIndeksu(indeks :real):boolean;
  procedure SzukWgPS(wiersz :string); //Ustawia na szukany rekord+usawia zm. globaln¹ INDEKS_ILE_SZT
  procedure SzukWgRec(wiersz :string);//Ustawia na szukany rekord+usawia zm. globaln¹ INDEKS_ILE_SZT

  procedure UpdateNumeruPS; //G³ówna procedura
  procedure ZmienNrAktywnego_S(linia, stacja :real; raz :char); //Ju¿ znalezione. Teraz zamiana!!!
  procedure ZmienNrAktywnego_X(linia, stacja :real; raz :char); //Ju¿ znalezione. Teraz zamiana!!!
  procedure UstawNumerRekordowi(nr_rekordu, linia, stacja :real; raz :char);

  function UsunWgPSS(const linia, stacja :real; const indeks :char ) :boolean;
  function UsunWgPSX(const linia, stacja :real; const indeks :char ) :boolean;
  function UsunWgRecX(const Rekord_real :real) :boolean;
  procedure Usun;
  Procedure UsunZnalezionyNrRec(numer :real);

  procedure WstawGeodezje;
  procedure PodstwGeodezje(const MnoznikL, MnoznikS :real);



  function TestPoprawnosciNumeru(wiersz :string) :boolean;
//  procedure UstawSWgRec(szukaj_rec :real);
//usun¹³em, jako zbêdn¹
  function Justuj(linia:string; ile_wszystkiego :byte; wyrownaj:strony;
           wypelnienie: char):string;
  function FormujUlamek(wiersz :string; po_punkcie :byte):string;
  function Pomnoz_znaki(ile :byte; jaki :char):string;

  procedure KasujTabele;
  procedure RozlaczTabele;
  procedure PolaczTabele;
  function  UstalParamEksportu :boolean;
  procedure WeryfikujParametryEksportu;
  procedure TranslateSurvLine(const linia :string; var in_fly  :format_geodezji);
  procedure TranslateSurvToFile(nazwa :TFileName);
  procedure KopiujBazeDanych;
  procedure OdzyskajBazeDanych;
  function ExtractFileNameOnly(nazwa_pliku :string) :string;
  procedure BiezacyRecNaPanel;
  procedure IloscRecNaPanel;
  procedure UstawAliasBazyDanych;

  end;

var
  FormaMain: TFormaMain;
  NazwaPlikuEksportowanegoS :TFileName;
  NazwaPlikuEksportowanegoX :TFileName;
  NazwaPlikuEksportowanegoR :TFileName;

  NazwaPlikuOtwartegoS :TFileName;
  NazwaPlikuOtwartegoX :TFileName;
  NazwaPlikuOtwartegoR :TFileName;

  LastS_Ext                 :String;
  LastS_Dir                 :String;
  LastS_Name                :String;

  ApplicationPath,
  LastOpendS,
  LastOpendX,
  LastOpendR,
  LastExportedS,
  LastExportedX,
  LastExportedR             :string;

implementation

uses Dialogi, Szukaj, ParamEksp, Indeksy,Registry,
     ComboOrazOKCancel, Otworz ;
type dane_eksportowe = record
                         wypelnienie_tape,
                         wypelnienie_record :char;
                         precyzja_line,
                         precyzja_station,
                         precyzja_kanal,
                         precyzja_LO        :byte;
                         datum,
                         woda,
                         czas_pionowy,
                         statyka,
                         glebokosc_strzelania :boolean
                       end;

var
     INDEKS_ILE_SZT    :real;
     t                 :string;

     parametry_eksportu :dane_eksportowe;
     Wyprowadz :TParametryEksportu;

const PLIK_SURV_TMP =  'CelSurv.tmp';
      Nazwa_STmp    =  'c:\S1299.tmp';
      Nazwa_XTmp    =  'c:\X1299.tmp';


{$R *.DFM}

procedure TFormaMain.KasujTabele;
begin
 if TabelaS.CanModify and TabelaX.CanModify and
    (Application.MessageBox('Wszystkie dane znajduj¹ce siê w bazie zostan¹ utracone!',
   'Kasowanie bazy danych',  mb_ICONHAND or MB_OKCANCEL) = IDOK)
 then
 begin
   RozlaczTabele;
   try
     if TabelaX.Active = false then TabelaX.Active := true;
     if TabelaS.Active =false then TabelaS.Active := true;

     if TabelaS.RecordCount <> 0 then
     begin
       TabelaS.Active := false;
       tabelaS.EmptyTable;
       tabelaS.Open;
     end;

     if TabelaX.RecordCount <> 0 then
     begin
       TabelaX.Active := false;
       tabelaX.EmptyTable;
       tabelaX.Open;
     end;

   PolaczTabele;
   except
     if TabelaX.Active = false then tabelaX.Open;
     if TabelaS.Active = false then tabelaS.Open;
     PolaczTabele;
     Application.MessageBox('Czyszczenie bazy nie powiod³o siê', 'B³¹d czyszczenia', mb_ICONHAND or mb_OK);
   end; {traja}
 end;

end;


procedure TFormaMain.LadujSSPS(nazwa_pliku :string);
var f: TextFile;
    s:     String;
    i: Longint;
    linia_sps :ssps_line;

procedure PominHeader;
begin
  while (s[1] = 'H') do   Readln(f,s);
end;


begin
  DecimalSeparator:='.';
  TabelaS.DisableControls;
  t := nazwa_pliku;

  AssignFile(f,nazwa_pliku);
  Reset(f);
  TabelaS.Open;
  if TabelaS.RecordCount <> 0 then
  begin
    TabelaS.Last;
    i := TabelaS['ile_szt'] + 1;
  end else i:=1;

  while not EOF(f) do
      begin
       Readln(f,s);
       LastOpendS := nazwa_pliku; {do rejestru}
       PominHeader;
       translate_sline(s, linia_sps);
       TabelaS.Insert;
       TabelaS['ind']:=i;
       TabelaS['ile_szt']:=i;
       TabelaS['ident_s']:= linia_sps.identyfikator;
       TabelaS['line']:= linia_sps.linia;
       TabelaS['station']:=linia_sps.punkt;
       TabelaS['ktory_raz']:=linia_sps.indeks;
       TabelaS['kod_zrodla']:=linia_sps.kod_pkt;
       TabelaS['deph']:=linia_sps.deph;
       TabelaS['uphole']:=linia_sps.uphole;     {Tu}
       TabelaS['datum']:=linia_sps.datum;
       TabelaS['statyka']:=linia_sps.statyka;
       TabelaS['water'] := linia_sps.water;
       TabelaS['easting']:=linia_sps.x;
       TabelaS['northing']:=linia_sps.y;
       TabelaS['elew']:=linia_sps.elewacja;
       TabelaS['day']:=linia_sps.dzien;
       TabelaS['time']:=linia_sps.czas;
       TabelaS.Post;  {wpisuje rzeczywiscie, zatwierdza}
       i:=i+1;
      end;
CloseFile(f);
TabelaS.EnableControls;
end; {S SPS}



procedure TFormaMain.LadujRSPS;
var f: TextFile;
    s:     String;
    i: Longint;
    linia_sps :ssps_line;

procedure PominHeader;
begin
  while (s[1] = 'H') do   Readln(f,s);
end;

begin
  DecimalSeparator:='.';
  OpenDialog1.Title := 'Otwórz SPS-R';
  if OpenDialog1.Execute then
  begin
    TabelaR.DisableControls;
    t := OpenDialog1.FileName;

    AssignFile(f,OpenDialog1.FileName);
    Reset(f);
    TabelaR.Open;
    i:=1;
    while not EOF(f) do
      begin
       Readln(f,s);
       PominHeader;
       LastOpendR := nazwa_pliku;
       translate_sline(s, linia_sps);
       TabelaR.Insert;
       TabelaR['ile_szt']:=i;
       TabelaR['ident_s']:= linia_sps.identyfikator;
       TabelaR['line']:= linia_sps.linia;
       TabelaR['station']:=linia_sps.punkt;
       TabelaR['ktory_raz']:=linia_sps.indeks;
       TabelaR['kod_odb']:=linia_sps.kod_pkt;
       TabelaR['deph']:=linia_sps.deph;
       TabelaR['uphole']:=linia_sps.uphole;     {Tu}
       TabelaR['datum']:=linia_sps.datum;
       TabelaR['statyka']:=linia_sps.statyka;
       TabelaR['water'] := linia_sps.water;
       TabelaR['easting']:=linia_sps.x;
       TabelaR['northing']:=linia_sps.y;
       TabelaR['elew']:=linia_sps.elewacja;
       TabelaR['day']:=linia_sps.dzien;
       TabelaR['time']:=linia_sps.czas;
       TabelaR.Post;  {wpisuje rzeczywiscie, zatwierdza}
       i:=i+1;
      end;
      CloseFile(f);
  end;
TabelaR.EnableControls;

end; {S SPS}


procedure TFormaMain.LadujXSPS(nazwa_pliku :string);
var f: TextFile;
    s: String;
    i: Longint;
    temp_xsps :xsps_line;
    last_rec  :longint;
    new_rec   :longint;
    licznikRec:longint;

procedure PominHeader;
begin
  while s[1] = 'H' do   Readln(f,s);
end;


begin
  DecimalSeparator:='.';

  TabelaX.DisableControls;

  AssignFile(f,nazwa_pliku);
  Reset(f);

  TabelaX.Open;
  if TabelaX.RecordCount <> 0 then
  begin
    TabelaX.Last;
    Last_rec := TabelaX['rekord'];
    LicznikRec := TabelaX['ile_szt'];
    i := TabelaX['ind'];
  end else
  begin
    last_rec := 0;
    licznikRec := 0;
    i:=1;
  end;

  while not EOF(f) do
      begin
        Readln(f,s);
        PominHeader;
        TabelaX.Insert;
        LastOpendX := nazwa_pliku;
        translate_xline(s, temp_xsps);
        new_rec := temp_xsps.rekord;
        if last_rec <> new_rec then inc(licznikRec)
           else licznikRec := licznikRec;
        last_rec := new_rec;
        TabelaX['ile_szt'] := licznikRec;
        TabelaX['ind']:=i;
        TabelaX['X'] := temp_xsps.identyfikator;
        TabelaX['tasma']:= temp_xsps.tasma;
        TabelaX['rekord']:= temp_xsps.rekord;
        TabelaX['numeracja']:= temp_xsps.numeracja;
        TabelaX['aparatura']:= temp_xsps.aparatura;
        TabelaX['line']:= temp_xsps.linia;
        TabelaX['station']:= temp_xsps.punkt;
        TabelaX['ktory_raz'] := temp_xsps.indeks;
        TabelaX['od']:= temp_xsps.od_kanalu;
        TabelaX['do']:= temp_xsps.do_kanalu;
        TabelaX['Krok_kan']:= temp_xsps.step_chan;
        TabelaX['Linia'] := temp_xsps.linia_odb;
        TabelaX['skad']:= temp_xsps.od_odbior;
        TabelaX['dokad']:= temp_xsps.do_odbior;
        TabelaX['indeks_odb']:= temp_xsps.indeks_odb;
        TabelaX.Post;
        i:=i+1;
      end;
  CloseFile(f);
  TabelaX.EnableControls;
end; {£adowanie sps-ów}



procedure TFormaMain.FormClose(Sender: TObject; var Action: TCloseAction);
procedure ZapodajDoRejestru;
var Reg               :TRegistry;
    WynikOtwarcia     :boolean;

begin
  Reg := TRegistry.Create;
  try
    WynikOtwarcia := Reg.OpenKey('Software\Soft_Era\SPS_Edit',False);
    if WynikOtwarcia
    then
    begin
      Reg.WriteInteger('FormaTop', FormaMain.Top) ;
      Reg.WriteInteger('FormaLeft',FormaMain.Left) ;
      Reg.WriteInteger('FormaWidth',FormaMain.Width);
      Reg.WriteInteger('FormaHigh',FormaMain.Height) ;
      Reg.WriteString('LastSName',LastOpendS);
      Reg.WriteString('LastXName',LastOpendX) ;
      Reg.WriteString('LastRName',LastOpendR) ;
      Reg.WriteString('LastExportedS',LastExportedS) ;
      Reg.WriteString('LastExportedX',LastExportedX)  ;
      Reg.WriteString('LastExportedR',LastExportedR)  ;
    end;
  finally
    Reg.Free;
  end;
end;  {Zapodaj}


begin
  if TabelaS.Modified or TabelaX.Modified then
  begin
    if MessageDlg('W bazie zasz³y zmiany. Czy zachowac je?',
                  mtConfirmation, mbYesNoCancel, 0) = mrYes
    then
    begin
      if TabelaS.Active = true then TabelaS.close;
      if TabelaX.Active = true then TabelaX.close;
    end;
  end;
  ZapodajDoRejestru;
end;



procedure TFormaMain.FormCreate(Sender: TObject);
procedure ZapodajZRejestru;
var Reg               :TRegistry;
    WynikOtwarcia     :boolean;
begin
  Reg := TRegistry.Create;
  try
    WynikOtwarcia := Reg.OpenKey('Software\Soft_Era\SPS_Edit',False);
    if WynikOtwarcia
    then
    begin
      if Reg.ReadInteger('FormaTop') <> 0 then FormaMain.Top := Reg.ReadInteger('FormaTop');
      if Reg.ReadInteger('FormaLeft') <> 0 then FormaMain.Left := Reg.ReadInteger('FormaLeft');
      if Reg.ReadInteger('FormaWidth') <> 0 then FormaMain.Width := Reg.ReadInteger('FormaWidth');
      if Reg.ReadInteger('FormaHigh') <> 0 then FormaMain.Height := Reg.ReadInteger('FormaHigh');
      if Reg.ReadString('ApplicationPath') = '' then
      begin
        GetDir(0, ApplicationPath);
        Reg.WriteString('ApplicationPath', ApplicationPath);
      end else ApplicationPath := Reg.ReadString('ApplicationPath');

      LastOpendS       := Reg.ReadString('LastSName');
      LastOpendX       := Reg.ReadString('LastXName');
      LastOpendR       := Reg.ReadString('LastRName');
      LastExportedS    := Reg.ReadString('LastExportedS');
      LastExportedX    := Reg.ReadString('LastExportedX');
      LastExportedR    := Reg.ReadString('LastExportedR');
    end;
  finally
    Reg.Free;
  end;
end;  {Zapodaj}


begin
  ZapodajZRejestru;
  UstawAliasBazyDanych;
  KopiujBazeDanych;
  DecimalSeparator := '.';
  TabelaX.MasterSource := DataSource1;
  TabelaX.IndexName := 'ILE_SZT';
  TabelaX.MasterFields := 'ILE_SZT';

  if TabelaS.Active = false then TabelaS.Open;
  if TabelaX.Active = false then TabelaX.Open;
  if TabelaR.Active = false then TabelaR.Open;

  if DataSource1.Enabled = false then DataSource1.Enabled := true;
  if DataSource2.Enabled = false then  DataSource2.Enabled := true;

  BiezacyRecNaPanel;
  IloscRecNaPanel;

  EdytorSPS.ActivePage := SSPS;
end;

procedure TFormaMain.UstawAliasBazyDanych;
begin
//  Session.AddStandardAlias('baza', ApplicationPath, 'DBASE');
//  Session.SaveConfigFile;
end;

procedure TFormaMain.BiezacyRecNaPanel;
begin
  try
  if TabelaX.RecordCount <> 0 then
     StatusBar1.Panels[1].text := 'Bie¿¹cy numer rekordu: ' + FloatToStr(TabelaX['Rekord'])
  else StatusBar1.Panels[1].text := 'Bie¿¹cy numer rekordu: ' ;
  except
     StatusBar1.Panels[1].text := 'Bie¿¹cy numer rekordu: ' ;
  end;
end;


procedure TFormaMain.IloscRecNaPanel;
begin
  try
  if TabelaS.RecordCount <> 0 then
     StatusBar1.Panels[2].text := 'Iloœæ rekordów w bazie: ' +
                            FloatToStr(TabelaS.RecordCount)
  else StatusBar1.Panels[2].text := 'Iloœæ rekordów w bazie: ';
  except
     StatusBar1.Panels[2].text := 'Iloœæ rekordów w bazie: ';
  end;
end;


procedure TFormaMain.KopiujBazeDanych;
var skad, dokad                      :string;
begin
  skad := ApplicationPath + '\spss.dbf';
  dokad := ApplicationPath + '\spss.bak';
  KopiujPlik(skad,dokad);

  skad := ApplicationPath + '\spsx.dbf';
  dokad := ApplicationPath + '\spsx.bak';
  KopiujPlik(skad,dokad);

  KopiujPlik(ApplicationPath +'\spsr.dbf', ApplicationPath +'\spsr.bak');
  KopiujPlik(ApplicationPath +'\spss.mdx', ApplicationPath +'\spss_md.bak');
  KopiujPlik(ApplicationPath +'\spsx.mdx', ApplicationPath +'\spsx_md.bak');
end;

procedure TFormaMain.OdzyskajBazeDanych;
begin
  KopiujPlik('spss.bak', 'spss.dbf');
  KopiujPlik('spsx.bak', 'spsx.dbf');
  KopiujPlik('spsr.bak', 'spsr.dbf');
  KopiujPlik('spss_md.bak', 'spss.mdx');
  KopiujPlik('spsx_md.bak', 'spsx.mdx');
end;


procedure TFormaMain.SzukWgPS(wiersz :string);
var linia, stacja :string;
    ktory_raz     :char;
    lina, stacyjka :real;
begin
  if TestPoprawnosciNumeru(wiersz) = true then
  begin
    Split_na_lin_stat(wiersz,linia, stacja, ktory_raz);
    lina  := StrToFloat(Trim(linia));
    stacyjka := StrToFloat(Trim(stacja));
    if not ZnajdzWgPS(lina, stacyjka, ktory_raz) then
    Application.MessageBox('Nie znaleziono takiego numeru PS', 'Wyszukiwanie',mb_ICONHAND or mb_OK)
    else    INDEKS_ILE_SZT := TabelaS['ILE_SZT'];
  end;
end;

procedure TFormaMain.SzukWgRec(wiersz :string);
var rekord        :real;

begin
  try
    rekord := StrToFloat(Trim(Wiersz));
    if (ZnajdzILE_SZT_WgRec(rekord) = false) then
       begin
        INDEKS_ILE_SZT := 0;
        Application.MessageBox('Nie znaleziono takiego numeru PS', 'Wyszukiwanie',mb_ICONHAND or mb_OK);
       end
  except
    Application.MessageBox('B³¹d podczas szukania', 'Wyszukiwanie',mb_ICONHAND or mb_OK)
  end
end;

function TFormaMain.ZnajdzWgPS(linia, stacja :real; ktory_razik:char) :boolean;
var macierz   :array[1..3] of variant;
begin
  macierz[1] := linia;
  macierz[2] := stacja;
  macierz[3] := ktory_razik;
  if not TabelaS.Locate('Line;Station;Ktory_raz',VarArrayOf(Macierz),
                        [loCaseInsensitive])
                        then ZnajdzWgPS := false
  else ZnajdzWgPS := true;
end;



procedure TFormaMain.DBGrid2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = Chr(VK_PRIOR)) then TabelaS.Prior;
  if (Key = Chr(VK_NEXT)) then TabelaS.Next;
end;



procedure TFormaMain.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key = VK_PRIOR) then TabelaS.Prior;
    if (Key = VK_NEXT) then TabelaS.Next;
end;

procedure TFormaMain.Button4Click(Sender: TObject);
begin
   DataSource1.DataSet := SortujQuery;
   SortujQuery.Close;
   SortujQuery.SQL.Clear;
   SortujQuery.SQL.Add('SELECT * FROM spss.dbf ORDER BY line');
   SortujQuery.Open;
   SortujQuery.Close;
//   SortujQuery.ExecSQL;
end;

procedure TFormaMain.Button5Click(Sender: TObject);
begin
   DataSource1.DataSet := TabelaS;
end;



function TFormaMain.FormujUlamek(wiersz :string; po_punkcie :byte):string;
var tmp :string;
begin
  if (StrToFloat(wiersz) > 90) and (StrToFloat(wiersz) < 101) then
  begin
    wiersz := wiersz;
  end;


  if Pos('.', wiersz) = 0 then
  begin
    if po_punkcie > 0 then tmp := wiersz + '.' + pomnoz_znaki(po_punkcie,'0')
       else tmp := wiersz;
  end else
  if Length(wiersz) - Pos('.',wiersz) < po_punkcie then //Je¿eli
  begin
    tmp := wiersz +
           pomnoz_znaki(po_punkcie - Length(wiersz) - Pos('.',wiersz),'0');
  end else
  if Length(wiersz) - Pos('.',wiersz) = po_punkcie then
  begin
    tmp := wiersz;
  end else
  if Length(wiersz) - Pos('.',wiersz) > po_punkcie then
  begin //obcina resztê na chama
      tmp := Copy(wiersz,1, Pos('.',wiersz) + po_punkcie);
  end;
  FormujUlamek := tmp;
end;


function TFormaMain.pomnoz_znaki(ile :byte; jaki :char):string;
var tpm :string;
    c   :byte;
begin
  tpm := '';
  for c:= 1 to ile do
      tpm := tpm + jaki;
  pomnoz_znaki := tpm;
end;   {************************************************************}


function TFormaMain.justuj(linia:string; ile_wszystkiego :byte; wyrownaj :strony;
                                     wypelnienie: char):string;

var dlugosc :byte;
    temp    :string;



begin
  if linia <> '' then
  begin
    dlugosc := Length(linia);
    if ile_wszystkiego > dlugosc then
    begin  // g³owny fragment funkcji
      case wyrownaj of
        sLewo:   begin
                    temp := linia;
                    temp := temp + pomnoz_znaki(ile_wszystkiego - dlugosc,
                         wypelnienie);
                 end;

        sSrodek: begin

                 end;
        sPrawo:  begin
                    temp := linia;
                    temp := pomnoz_znaki(ile_wszystkiego  - dlugosc,
                        wypelnienie) + temp ;
                 end;
      end

    end else {gdy nie ma co justowaæ}
    begin
      if dlugosc = ile_wszystkiego then
      begin
        justuj := linia;
        exit; //z procedury
      end else
      if dlugosc > ile_wszystkiego then
      begin
        ShowMessage('Zbyt wiele cyfr znacz¹cych - skontaktuj siê z Autorem');
        Close;
      end;
    end;

  end else justuj := '';

  justuj := temp;
end;   {*****************************JUSTUJ*************}



procedure TFormaMain.ExportSPSS(nazwa_pliku :string);

var
    i         :integer;
    temp_str  :string;
    wynik_str :string;
    f         :TextFile;

begin
  TabelaS.DisableControls;

  TabelaS.First;
  wynik_str := '';

  AssignFile(f,nazwa_pliku);
  Rewrite(f);
  for i := 0 to TabelaS.RecordCount - 1 do
  begin
    LastExportedS := nazwa_pliku;

    wynik_str := TabelaS['Ident_S'];

    temp_str := FormujUlamek(FloatToStr(TabelaS['Line']),parametry_eksportu.precyzja_line );
    wynik_str  := wynik_str + justuj(temp_str,SLINE_NUM_MANY, sLewo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaS['STATION']), parametry_eksportu.precyzja_station);
    wynik_str := wynik_str + justuj(temp_str, SSHOT_NUM_MANY, sPrawo, ' ');

    temp_str := TabelaS['KTORY_RAZ'];   //TU JEST cHAR!!!
    wynik_str := wynik_str + temp_str ;

    temp_str := TabelaS['KOD_ZRODLA'];
    wynik_str := wynik_str + temp_str ;

    if parametry_eksportu.statyka then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaS['STATYKA']), 0);
      wynik_str := wynik_str + justuj(temp_str, SSTATIC_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SSTATIC_MANY, ' ');


    if parametry_eksportu.glebokosc_strzelania then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaS['DEPH']), 1);
      wynik_str := wynik_str + justuj(temp_str, SDEPH_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SDEPH_MANY, ' ');

    if parametry_eksportu.datum then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaS['DATUM']), 1);
      wynik_str := wynik_str + justuj(temp_str, SDATUM_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SDATUM_MANY, ' ');

    if parametry_eksportu.czas_pionowy then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaS['UPHOLE']), 0);
      wynik_str := wynik_str + justuj(temp_str, SUPHOLE_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SUPHOLE_MANY, ' ');


    if parametry_eksportu.woda then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaS['WATER']), 1);
      wynik_str := wynik_str + justuj(temp_str, SWATER_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SWATER_MANY, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaS['EASTING']), 1);
    wynik_str := wynik_str + justuj(temp_str, S_X_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaS['NORTHING']), 1);
    wynik_str := wynik_str + justuj(temp_str, S_Y_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaS['ELEW']), 1);
    wynik_str := wynik_str + justuj(temp_str, S_ELEV_MANY, sPrawo, ' ');

    temp_str := FloatToStr(TabelaS['DAY']);
    wynik_str := wynik_str + justuj(temp_str, S_DAY_MANY, sPrawo, '0');

    temp_str := FloatToStr(TabelaS['TIME']);
    wynik_str := wynik_str + justuj(temp_str, S_TIME_MANY, sPrawo, ' ');

    writeln(f, wynik_str);

    TabelaS.Next;
    temp_str := '';
    wynik_str := '';


  end;{for}
  TabelaS.First;
  TabelaS.EnableControls;
//  PageControl1.Enabled := true;
  CloseFile(f);
end;          {************* EXPORT S **************}



procedure TFormaMain.ExportXSPS(nazwa_pliku :string);
var
    i         :integer;
    temp_str  :string;
    wynik_str :string;
    f         :TextFile;

begin
  TabelaX.DisableControls;


  TabelaX.MasterSource := nil;
  TabelaX.IndexName := '';
  TabelaX.MasterFields := '';


  TabelaX.First;
  wynik_str := '';

  AssignFile(f,nazwa_pliku);
  Rewrite(f);
  for i := 0 to TabelaX.RecordCount - 1 do
  begin
    LastExportedX := nazwa_pliku;
    wynik_str := TabelaX['X'];

    temp_str := FormujUlamek(FloatToStr(TabelaX['Tasma']), 0);
    wynik_str  := wynik_str + justuj(temp_str,X_TAPE_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Rekord']), 0);
    wynik_str  := wynik_str + justuj(temp_str,X_RECORD_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Numeracja']), 0);
    wynik_str  := wynik_str + justuj(temp_str, X_REC_STEP_MANY, sPrawo, ' ');

    wynik_str  := wynik_str + TabelaX['Aparatura'];

    temp_str := FormujUlamek(FloatToStr(TabelaX['Line']),parametry_eksportu.precyzja_line );
    wynik_str  := wynik_str + justuj(temp_str, X_SLINE_MANY, sLewo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Station']), parametry_eksportu.precyzja_station);
    wynik_str  := wynik_str + justuj(temp_str, X_SSTATION_MANY, sPrawo, ' ');

    wynik_str  := wynik_str + TabelaX['Ktory_raz']; {który raz strzelono}

    temp_str := FormujUlamek(FloatToStr(TabelaX['Od']), 0);
    wynik_str  := wynik_str + justuj(temp_str, X_FROM_CHANEL_MANY, sPrawo, ' ');


    temp_str := FormujUlamek(FloatToStr(TabelaX['Do']), 0);
    wynik_str  := wynik_str + justuj(temp_str, X_TO_CHANEL_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Krok_kan']), 0);
    wynik_str  := wynik_str + justuj(temp_str, X_STEP_CHANEL_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Linia']), parametry_eksportu.precyzja_LO);
    wynik_str  := wynik_str + justuj(temp_str, X_RLINE_MANY , sLewo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Skad']), parametry_eksportu.precyzja_kanal);
    wynik_str  := wynik_str + justuj(temp_str, X_FROM_STAT_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaX['Dokad']), parametry_eksportu.precyzja_kanal);
    wynik_str  := wynik_str + justuj(temp_str, X_TO_STAT_MANY, sPrawo, ' ');

    wynik_str  := wynik_str +  TabelaX['Indeks_odb'];

    TabelaX.Next;

    Writeln(f, wynik_str);
  end;  {end for}

  TabelaX.MasterSource := DataSource1;
  TabelaX.IndexName := 'ILE_SZT';
  TabelaX.MasterFields := 'ILE_SZT';

  TabelaX.EnableControls;
//  PageControl1.Enabled := true;
  CloseFile(f);

end;          {************* EXPORT X **************}





procedure TFormaMain.OtworzSPSMenuClick(Sender: TObject);
var ForemkaOtwarcia :TFormaOtwarcia;
begin
  if ((TabelaX.RecordCount <> 0) or (TabelaS.RecordCount <> 0)) and
     (Sender <> DolaczSPSMenu) then
     Application.MessageBox('Dane nie mog¹ byæ wczytane. Baza nie jest pusta. PrzejdŸ do menu "Edycja" i wyczyœæ bazê.',
                                  'Otwieranie SPS', mb_OK)

  else
  begin
    try
    ForemkaOtwarcia := TFormaOtwarcia.Create(Self);
    ForemkaOtwarcia.ShowModal;
    if ForemkaOtwarcia.ModalResult = mrOK then
    begin
      if FileExists(ForemkaOtwarcia.Edit1.Text) and //istniej¹ S i X lub podano R, ale niekoniecznie
         FileExists(ForemkaOtwarcia.Edit2.Text) and
        (FileExists(ForemkaOtwarcia.Edit3.Text) or
         (ForemkaOtwarcia.Edit3.Text = ''))
      then
      begin
        // za³aduj niezbêdne pliki
        if TEST_INTEGRALNOSCI_SPS(ForemkaOtwarcia.Edit1.Text,
                                  ForemkaOtwarcia.Edit2.Text,
                                  ForemkaOtwarcia.Edit3.Text) then
        begin
          RozlaczTabele;
          NazwaPlikuOtwartegoS := ForemkaOtwarcia.Edit1.Text;
          LadujSSPS(NazwaPlikuOtwartegoS);
          NazwaPlikuOtwartegoX := ForemkaOtwarcia.Edit2.Text;
          LadujXSPS(NazwaPlikuOtwartegoX);
          NazwaPlikuOtwartegoR := ForemkaOtwarcia.Edit3.Text;
          if (NazwaPlikuOtwartegoR <> '') then
             LadujRSPS(NazwaPlikuOtwartegoR);
          FormaMain.Caption := 'Edycja SPS (' +
                            ExtractFileName(ForemkaOtwarcia.Edit1.Text) + ')';
          PolaczTabele;
        end;
      end;
    end;
    finally
    PolaczTabele;
    ForemkaOtwarcia.Free;
    end;
  end;
end;


procedure TFormaMain.EksportSPSMenuClick(Sender: TObject);
begin
  if UstalParamEksportu then

  begin

  try
  SaveDialog1.Title := 'Zachowaj SPS-S';
  if NazwaPlikuOtwartegoS <> '' then
  begin
    SaveDialog1.FileName := ExtractFileName(NazwaPlikuOtwartegoS);
    SaveDialog1.InitialDir := ExtractFileDir(NazwaPlikuOtwartegoS);
  end;
  if SaveDialog1.Execute then
  begin
    if SaveDialog1.FileName <> '' then
    begin
      NazwaPlikuEksportowanegoS := SaveDialog1.FileName;

      LastS_Ext := ExtractFileExt(NazwaPlikuEksportowanegoS);
      LastS_Dir := ExtractFileDir(NazwaPlikuEksportowanegoS);
      LastS_Name:= ExtractFileName(NazwaPlikuEksportowanegoS);

      SaveDialog2.Title := 'Zachowaj SPS-X';
      SaveDialog2.InitialDir := LastS_Dir;
      SaveDialog2.FileName := LastS_Name   ;
      if SaveDialog2.Execute then
      begin
      if SaveDialog2.FileName <> '' then
      begin
        NazwaPlikuEksportowanegoX := SaveDialog2.FileName;

        SaveDialog2.Title := 'Zachowaj SPS-R';
        SaveDialog2.InitialDir := LastS_Dir;
        SaveDialog2.FileName := LastS_Name ;
        If TabelaR.RecordCount <> 0 then
        begin
          SaveDialog2.InitialDir := LastS_Dir;
          if SaveDialog2.Execute then  NazwaPlikuEksportowanegoR := SaveDialog2.FileName
             else NazwaPlikuEksportowanegoR := '';
        end;

        ExportSPSS(NazwaPlikuEksportowanegoS);
        ExportXSPS(NazwaPlikuEksportowanegoX);
        if NazwaPlikuEksportowanegoR <> ''
           then ExportRSPS(NazwaPlikuEksportowanegoR);


      end;{Dialog 2}
    end;  {Dialog 1}

    end;

  end;

  except
   Application.MessageBox('Wyst¹pi³ b³¹d podczas zapisywania SPS-R',
                                  'Eksport do tekstu', mb_OK);
   Exit;
  end;
  Application.MessageBox('Eksport do plików tekstowych zakoñczony pomyœlnie',
                                  'Eksport do tekstu', mb_OK);
  end;

end;

procedure TFormaMain.ZakonczMenuClick(Sender: TObject);
begin
  If TabelaS.Modified or TabelaX.Modified then
  
  if TabelaS.Active = true then TabelaS.close;
  if TabelaX.Active = true then TabelaX.close;
  close; {powoduje stack overflow}
end;


procedure TFormaMain.SzukajMenuClick(Sender: TObject);
var SzukBox :TFormaSzukaj;
    Numer, rekord :string;

begin
  SzukBox := TFormaSzukaj.Create(self);
  SzukBox.ShowModal;
  if SzukBox.ModalResult = mrOK then
  begin
    Numer := SzukBox.EditPS.Text;
    Rekord := SzukBox.EditRec.Text   ;
    if Numer <> '' then  SzukWgPS(Numer)
    else if Rekord <> '' Then
         begin
           RozlaczTabele;
           SzukWgRec(rekord);
           if ZnajdzSWgIndeksu(INDEKS_ILE_SZT) = NULL then
              Application.MessageBox('Nie znaleziono rekordu',
                                  'Szukaj', mb_ICONHAND or mb_OK);
           PolaczTabele;
         end
    else Application.MessageBox('Nie ma nic do szukania ',
                                  'Szukaj', mb_ICONHAND or mb_OK);
  end;
end;

{
procedure TFormaMain.ZaladujSPS;
var boks :TOKBottomDlg;
begin
  if (TabelaS.RecordCount <> 0) or (TabelaX.RecordCount <> 0)
  then
  begin
    boks := TOKBottomDlg.Create(Self);
    try
      boks.ShowModal;
      if boks.ModalResult = mrOK then
      begin
        KasujTabele;
        LadujSSPS;
        LadujXSPS;
      end;
    finally
      boks.free;
    end;

  end else
  begin
    LadujSSPS;
    LadujXSPS;
  end;
end;
}

procedure TFormaMain.PolaczTabele;
begin
  TabelaX.MasterSource := DataSource1;
  TabelaX.IndexName := 'ILE_SZT';
  TabelaX.MasterFields := 'ILE_SZT';
end;

procedure TFormaMain.RozlaczTabele;
begin
  TabelaX.MasterSource := nil;
  TabelaX.IndexName := '';
  TabelaX.MasterFields := '';
end;

procedure TFormaMain.WyczyscBazeMenuClick(Sender: TObject);
begin
  KopiujBazeDanych;
  KasujTabele;
  BiezacyRecNaPanel;
  IloscRecNaPanel;

  FormaMain.Caption := 'Edycja SPS';
end;


procedure TFormaMain.WstawKolumneMenuClick(Sender: TObject);
type dane_real = record
                   x,y,z :real;
                 end;

var Foremka     :TFormaZCombo;

procedure TranslateToXYZ(jaki, na_jaki, kolumne :string);
//procedura zamienia plik tekstowy
var f_str        :TextFile;
    f            :file of dane_real;
    temp_real    :dane_real;
    str          :string;

begin
  KopiujBazeDanych;
  try
    AssignFile(f_str, jaki);
    Reset(f_str);
    AssignFile(f, na_jaki);
    Rewrite(f);

    while not eof(f_str) do
    begin
     readln(f_str, str);
     temp_real.x := StrToFloat(Trim(kolumna(str,1)));
     temp_real.y := StrToFloat(Trim(kolumna(str,2)));
     temp_real.z := StrToFloat(Trim(kolumna(str, StrToInt(kolumne))));
     write(f, temp_real);
    end;
  finally
   CloseFile(f_str);
   CloseFile(f);
  end;
end;

procedure WstawKolumne(nazwa_plikuXYZ :string; kolumna, kolumna_zrodla :string);
var
    PlikTempXYZ       :file of Dane_Real;
    wstawiana_liczba  :real;


function WyszukajWartoscXYZ(szukane_X, szukane_Y :real; var wynik :real) :boolean;
var odczytaneXYZ        :Dane_Real;
begin
   Seek(PlikTempXYZ,0);
   while not eof(PlikTempXYZ) do
   begin
     read(PlikTempXYZ, odczytaneXYZ);
     if (szukane_X = odczytaneXYZ.x) and (szukane_Y = odczytaneXYZ.y)
     then
     begin
       wynik := odczytaneXYZ.z;
       WyszukajWartoscXYZ := true;
       Exit;
     end;
   end;
WyszukajWartoscXYZ := false;
end;

var    i           :longint;
begin

  if kolumna = 'kod_zrodla' then // znakowe pole
  begin

  end else // rzeczywiste
  begin
    TabelaS.DisableControls;
    TranslateToXYZ(nazwa_plikuXYZ, 'tempXYZ.tmp', kolumna_zrodla);
    // Pocz¹tek wpisywania do tabeli S
    RozlaczTabele;
    AssignFile(PlikTempXYZ,'tempXYZ.tmp');
    Reset(PlikTempXYZ);

    TabelaS.First;
    for i := 0 to TabelaS.RecordCount - 1 do
    begin
    if WyszukajWartoscXYZ(TabelaS['Line'], TabelaS['Station'],wstawiana_liczba)
    then begin
            TabelaS.Edit;
            TabelaS.FieldByName(kolumna).AsFloat := wstawiana_liczba;
            TabelaS.POst;
            TabelaS.Next;
         end
    else begin
            TabelaS.Edit;
            TabelaS.FieldByName(kolumna).AsFloat := -99;
            TabelaS.POst;
            TabelaS.Next;
         end;
    end; {Pêtli for}
  end;

  CloseFile(PlikTempXYZ);
  Erase(PlikTempXYZ);
  TabelaS.EnableControls;
  PolaczTabele;
end;


begin
  Foremka := TFormaZCombo.Create(Self);
  Foremka.ShowModal;
  if Foremka.ModalResult = mrOK then
  begin
    try
      if (Foremka.ComboBox1.Text <> '') and (Foremka.Edit1.text <> '') then
      WstawKolumne(Trim(Foremka.Edit1.text),Trim(Foremka.ComboBox1.Text),Foremka.Edit2.text);
    finally
    Foremka.Free;
    end;
  end;
{Tu mamy do wyboru: wstaw wg kolumny do wyboru}
end;

procedure TFormaMain.UsunMenuClick(Sender: TObject);
begin
  KopiujBazeDanych;
  Usun;
end;


procedure TFormaMain.Usun;

var SzukBox :TFormaSzukaj;
    Numer, rekord,
    linia_str, stacja_str :string;
    linia, stacja         :real;
    indeks                :char;
    Rekord_real           :real;

begin
  SzukBox := TFormaSzukaj.Create(self);
  SzukBox.PSLabel.Caption := 'Podaj numer PS do usuniêcia';
  SzukBox.RekordLabel.Caption := 'Podaj numer rekordu do usuniêcia';
  RozlaczTabele;
  if EdytorSPS.ActivePage = SSPS then
  begin
    SzukBox.EditPS.Text := FloatToStr(TabelaS['Line'])+
      '/' + FloatToStr(TabelaS['Station']) + TabelaS['Ktory_raz'];
    SzukBox.EditPS.TabOrder := 0;
    SzukBox.EditRec.TabOrder := 1;
  end;

  if EdytorSPS.ActivePage = XSPS then
  begin
    SzukBox.EditRec.Text := FloatToStr(TabelaX['Rekord']);
    SzukBox.EditPS.TabOrder := 1;
    SzukBox.EditRec.TabOrder := 0;
  end;

  SzukBox.Caption := 'Usuñ';
  SzukBox.ShowModal;

  if SzukBox.ModalResult = mrOK then
  begin
    if TabelaS.Active = false then TabelaS.Open;
    if TabelaX.Active = false then TabelaX.Open;

    Numer := SzukBox.EditPS.Text;
    Rekord := SzukBox.EditRec.Text   ;
    if( Numer <> '') and TestPoprawnosciNumeru(numer) then
    begin
      // Szukaj i ustaw kursor
      Split_na_lin_stat(Numer,linia_str, stacja_str, indeks);
      linia := StrToFloat(Trim(linia_str));
      stacja := StrToFloat(Trim(stacja_str));
      if ZnajdzILE_SZT_WgNumeru(linia, stacja, indeks) then
      begin
        if ZnajdzXWgIndeksu(INDEKS_ILE_SZT) then
        begin
          TabelaS.Delete;
          UsunZnalezionyNrRec(TabelaX['Rekord']);
        end else
        Application.MessageBox('Nie znaleziono rekordu',
               'Kasowanie rekordu', mb_ICONHAND or mb_OK);
      end
      else  //operacja UsunWgPSS nie powiod³a siê
        Application.MessageBox('Nie znaleziono rekordu',
               'Kasowanie rekordu', mb_ICONHAND or mb_OK);
    end



    // Wybra³ kasowanie wg Rekordu
    else if Rekord <> ''  Then  //wybrano usuwanie wg rec.
    begin
      {Wed³ug numeru rec.}
      try
        Rekord_real := StrToFloat(Trim(Rekord));
        if ZnajdzILE_SZT_WgRec(Rekord_real) then
        begin
          if ZnajdzSWgIndeksu(INDEKS_ILE_SZT) then
          begin
            UsunZnalezionyNrRec(TabelaX['Rekord']);
            if (TabelaS['ile_szt'] = INDEKS_ILE_SZT) then TabelaS.Delete;
          end;
        end;
      except
        Application.MessageBox('Operacja usuwania wed³ug numeru rekordu nie powiod³a siê',
        'Usuwanie rekordu', mb_ICONHAND or mb_OK);
      end;
    end;
  end;
PolaczTabele;
end; {Procedury}




  function TFormaMain.UsunWgPSS(const linia, stacja :real; const indeks :char ) :boolean;
  var tmp  :variant;
  begin
    tmp := ZnajdzILE_SZT_WgNumeru(linia, stacja, indeks);
    if tmp  <> null
    then
    begin
      INDEKS_ILE_SZT := tmp;
      TabelaS.Delete;
      UsunWgPSS := true; //Poprawnie
    end else
        begin
          INDEKS_ILE_SZT := 0;
          UsunWgPSS := false;
        end;
  end;

  function TFormaMain.UsunWgPSX(const linia, stacja :real; const indeks :char ) :boolean;    
  var tmp  :variant;
  begin
    TMP := ZnajdzXWgIndeksu(INDEKS_ILE_SZT);
    if tmp <> null then
    begin
       while TabelaX['ile_szt'] = INDEKS_ILE_SZT do
       begin
         TabelaX.Delete;
       end;
      UsunWgPSX := true;
    end else
        begin
          INDEKS_ILE_SZT := 0;
          UsunWgPSX := false;
        end;
  end;

  {
  function TFormaMain.UsunWgRecS(const Rekord_real :real):boolean;
  begin
    UsunWgRecS := false;
  end;
  }

  function TFormaMain.UsunWgRecX(const Rekord_real :real):boolean;
  var tmp  :boolean;
  begin
    tmp := ZnajdzILE_SZT_WgRec(Rekord_real);
    if tmp  <> false then
    begin
      while TabelaX['Ile_szt'] = INDEKS_ILE_SZT do
      begin
        TabelaX.Delete;
      end;
      UsunWgRecX := true;
    end else
        begin
          INDEKS_ILE_SZT := 0;
          UsunWgRecX := false;
        end;
  end;

function TFormaMain.TestPoprawnosciNumeru(wiersz :string) :boolean;
var linia, stacja  :string;
    ktory_raz      :char;
    lina,
    stacyjka       :real;
    zawartosc      :string;
    poprawny       :boolean ;

begin
   poprawny := true ;
   zawartosc := Trim(wiersz);
   if zawartosc <> '' then
   begin
      if Pos('/', zawartosc) <> 0 then
      begin
        try
          Split_na_lin_stat(Zawartosc, linia, stacja, ktory_raz);
          lina      := StrToFloat(Trim(linia));
          stacyjka  := StrToFloat(Trim(stacja));
        except
          poprawny := false;
          Application.MessageBox('Nieprwid³owy format numeru', 'B³¹d konwersji',mb_ICONHAND or mb_OK);
        end; {Excepta}
      end else
      begin
        poprawny := false;
        Application.MessageBox('Brak znaku "/"', 'B³¹d konwersji', mb_ICONHAND or mb_OK);
      end;

   end;

 if (poprawny = true) then TestPoprawnosciNumeru := true
 else TestPoprawnosciNumeru := false;

end; {procedury}


Function TFormaMain.UstawNaPierwszyWierszRekordu(const Rekord_szukany :real) :boolean;
begin
  if TabelaX.CanModify then
  begin
    if TabelaX.Active = false then TabelaX.Open;
    TabelaX.First;
    if TabelaX.Locate('Rekord',Rekord_szukany,[loCaseInsensitive])
    then  UstawNaPierwszyWierszRekordu := true else
            UstawNaPierwszyWierszRekordu := false;

  end else UstawNaPierwszyWierszRekordu := false

end;



Procedure TFormaMain.UsunZnalezionyNrRec(numer :real);
begin
  try
  while TabelaX['Rekord'] = numer do
  begin
    TabelaX.Delete;
  end;
  except
    Application.MessageBox('Nie mo¿na usun¹æ rekordu','B³¹d podczas usuwania',mb_ICONHAND or mb_OK);
  end;
end;


function TFormaMain.ZnajdzILE_SZT_WgRec(szukaj_rec :real):boolean;
// Przesuwa kursor
var
  lokalny     :variant;
begin
  lokalny := szukaj_rec;
  if TabelaX.Active = false then TabelaX.Open;
  TabelaX.First;
  if TabelaX.Locate('REKORD',Lokalny , [loCaseInsensitive]) then
  begin
    indeks_ile_szt := TabelaX['ile_szt'];
    ZnajdzILE_SZT_WgRec := true;
  end else ZnajdzILE_SZT_WgRec := false;
end;


function TFormaMain.ZnajdzILE_SZT_WgNumeru(const linia, stacja :real;
                                           ktory_raz :char):boolean;
//przesuwa kursor i przekazuje jaki indeks ILE_SZT posiada rekord
// mamy numer PS, szukamy w S, uzyskujemy ILE_SZT
var
    macierz   :array[1..3] of variant;
begin
  macierz[1] := linia;
  macierz[2] := stacja;
  macierz[3] := ktory_raz;

  if TabelaS.Active = false then TabelaS.Open;
  TabelaS.First;
  if TabelaS.Locate('Line;Station;Ktory_raz',
                         VarArrayOf(Macierz),[loCaseInsensitive]) then
  begin
    INDEKS_ILE_SZT :=  TabelaS['ile_szt'];
    ZnajdzILE_SZT_WgNumeru := true;
  end else ZnajdzILE_SZT_WgNumeru := false;
end;


function TFormaMain.ZnajdzSWgIndeksu(indeks :real):boolean;
begin
  if TabelaS.Active = false then TabelaS.Open;
  TabelaS.First;
  if TabelaS.Locate('ile_szt', indeks, [loCaseInsensitive]) then
  ZnajdzSWgIndeksu := true else ZnajdzSWgIndeksu := false;
end;

function TFormaMain.ZnajdzXWgIndeksu(indeks :real):boolean;
begin
  if TabelaX.Active = false then TabelaX.Open;
  TabelaX.First;
  if TabelaX.Locate('ile_szt', indeks, [loCaseInsensitive]) then
  ZnajdzXWgIndeksu := true else ZnajdzXWgIndeksu := false;
end;




function TFormaMain.UstalParamEksportu :boolean;
begin
  Wyprowadz := TParametryEksportu.Create(Self);
  WeryfikujParametryEksportu;
  Wyprowadz.ShowModal;

  if Wyprowadz.ModalResult = mrOK then
  begin
    parametry_eksportu.precyzja_line := StrToInt(Wyprowadz.LineEdit.Text);
    parametry_eksportu.precyzja_station := StrToInt(Wyprowadz.StationEdit.Text);
    parametry_eksportu.precyzja_LO := StrToInt(Wyprowadz.LOEdit.Text);
    parametry_eksportu.precyzja_Kanal := StrToInt(Wyprowadz.KanalEdit.Text);

    parametry_eksportu.datum    := Wyprowadz.DatumCheckBox.Checked;
    parametry_eksportu.woda := Wyprowadz.WodaCheckBox.Checked;
    parametry_eksportu.czas_pionowy  := Wyprowadz.CzasPCheckBox.Checked;
    parametry_eksportu.statyka := Wyprowadz.StatykaCheckBox.Checked;
    parametry_eksportu.glebokosc_strzelania := Wyprowadz.GlebokoscCheckBox.Checked;
    UstalParamEksportu := true;
  end else UstalParamEksportu := false;
end;


procedure TFormaMain.WeryfikujParametryEksportu;
// procedura sprawdza, czy któraœ kolumna ma wartoœci niezerowe i proponuje stan
// pola "check box"
var licznik_s  :longint;

begin
  if not TabelaS.Active then TabelaS.Active := true;
  for licznik_s := 1 to TabelaS.RecordCount do
  begin

    if parametry_eksportu.datum = false then if TabelaS['datum'] <> 0
                                then parametry_eksportu.datum := true;
    if parametry_eksportu.statyka = false then if TabelaS['statyka'] <> 0
                                then parametry_eksportu.statyka := true;

    if parametry_eksportu.woda = false then if TabelaS['water'] <> 0
                                then parametry_eksportu.woda := true;

    if parametry_eksportu.czas_pionowy = false then if TabelaS['uphole'] <> 0
                                then parametry_eksportu.czas_pionowy := true;

    if parametry_eksportu.glebokosc_strzelania = false then if TabelaS['deph'] <> 0
                                then parametry_eksportu.glebokosc_strzelania := true;

  end;

  if parametry_eksportu.datum = true then Wyprowadz.DatumCheckBox.Checked := true
     else Wyprowadz.DatumCheckBox.Checked := false;

  if parametry_eksportu.statyka = true then Wyprowadz.StatykaCheckBox.Checked := true
     else Wyprowadz.StatykaCheckBox.Checked := false;

  if parametry_eksportu.woda = true then Wyprowadz.WodaCheckBox.Checked := true
     else Wyprowadz.WodaCheckBox.Checked := false;

  if parametry_eksportu.czas_pionowy = true then Wyprowadz.CzasPCheckBox.Checked := true
     else Wyprowadz.CzasPCheckBox.Checked := false;

  if parametry_eksportu.glebokosc_strzelania = true then Wyprowadz.GlebokoscCheckBox.Checked := true
   else Wyprowadz.GlebokoscCheckBox.Checked := false;

    Wyprowadz.LineUpDown.Position :=  parametry_eksportu.precyzja_line;
    Wyprowadz.StationUpDown.Position := parametry_eksportu.precyzja_station;
    Wyprowadz.LOUpDown.Position := parametry_eksportu.precyzja_LO;
    Wyprowadz.KanalUpDown.Position := parametry_eksportu.precyzja_Kanal;

end;




procedure TFormaMain.ZamienIndeksyMenuClick(Sender: TObject);
var  indeksiki :TZamianaIndeksow;
begin
  try
    indeksiki := TZamianaIndeksow.Create(Self);
    indeksiki.ShowModal;
  except
    Application.MessageBox('Operacja nie powiod³a siê','B³¹d podczas zamiany indeksow',mb_ICONHAND or mb_OK);
    indeksiki.Free;
  end;
end;

procedure TFormaMain.WstawGeodezje;
var dialog  :TFormaSzukaj;
    mnoznik_LINE,
    mnoznik_STATION   :real;
    plik_geodezyjny   :TFileName;

begin
  OpenDialog1.Title := 'Otwórz plik geodezyjny';
  If OpenDialog1.Execute then
  begin
    if FileExists(OpenDialog1.FileName) then
    begin
      plik_geodezyjny := OpenDialog1.FileName;

      RozlaczTabele;
      TabelaS.DisableControls;
      if TabelaS.Active = false then TabelaS.Active := true;
      TabelaS.First;

      dialog := TFormaSzukaj.Create(self);
      dialog.PSLabel.Caption       := 'Mno¿nik STATION dla geodezji';
      dialog.RekordLabel.Caption   := 'Mno¿nik LINE dla geodezji';
      dialog.EnableKasowanie := false;
      dialog.ShowModal;
      IF dialog.ModalResult = mrOK then
      begin
        mnoznik_STATION := StrToFloat(dialog.EditPS.text) ;
        mnoznik_LINE := StrToFloat(dialog.EditRec.text)   ;
        TranslateSurvToFile(plik_geodezyjny);
        PodstwGeodezje(mnoznik_LINE, mnoznik_STATION);
      end;

      TabelaS.EnableControls;
      PolaczTabele;
    end else Application.MessageBox('Plik nie istnieje','Otwieranie pliku',mb_ICONHAND or mb_OK);
  end;{Execute}
end;




procedure TFormaMain.PodstwGeodezje(const MnoznikL, MnoznikS :real);
var i     :longInt;
    skad  :file of format_geodezji;
    REKORD:format_geodezji;

function GetSurvRecord(var tmp:format_geodezji): boolean;
var tmp_tmp :format_geodezji;
    ext1, ext2, ext3, ext4    :extended;

begin
  while not eof(skad) do
  begin
//     Seek(skad,licznik);
     read(skad, tmp_tmp);
     ext1 := TabelaS['line'];
     ext2 := tmp_tmp.num_line_to * MnoznikL;
     ext3 := TabelaS['station'];
     ext4 := tmp_tmp.num_station_to * MnoznikS;
     if IsEqualNear(ext1, ext2) and IsEqualNear(ext3, ext4)
        then
        begin
          Seek(skad,1);
          tmp := tmp_tmp;
          GetSurvRecord := true;
          exit;
        end;
  //   inc(licznik);
  end;

 Seek(skad,1);
 GetSurvRecord := false;
end;

begin
  TabelaS.Open;
  AssignFile(skad, PLIK_SURV_TMP);
  Reset(skad);
  for i:= 0 to TabelaS.RecordCount - 1 do
  begin
    TabelaS.Edit;
    TabelaS['Northing'] := 0;
    TabelaS['Easting'] := 0;
    TabelaS['Elew'] := 0;  //Najpierw zerujemy
    if GetSurvRecord(REKORD) then
    begin
      if TabelaS.CanModify then
      begin
        TabelaS.Edit;
        TabelaS.FieldByName('Northing').AsFloat := Rekord.x;
        TabelaS.FieldByName('Easting').AsFloat := Rekord.y;
        TabelaS.FieldByName('Elew').AsFloat := Rekord.z;
        TabelaS.Post;
      end;
    end else
        begin
         TabelaS.Edit;
         TabelaS.FieldByName('Northing').AsFloat := 0;
         TabelaS.FieldByName('Easting').AsFloat := 0;
         TabelaS.FieldByName('Elew').AsFloat := 0;
         TabelaS.Post;
        end;
  TabelaS.Next;
  end;
  CloseFile(skad);
  Erase(skad);
end;


procedure TFormaMain.TranslateSurvToFile(nazwa :TFileName);
var f         :TextFile;
    cel       :file of format_geodezji;
    temp_geod :format_geodezji;
    temp_str  :string;

begin
  if FileExists(nazwa) then
  begin
    AssignFile(f, NAZWA);
    Reset(f);
    AssignFile(cel, PLIK_SURV_TMP);
    Rewrite(cel);

    while not eof(f) do
    begin
      Readln(f,temp_str);
      TranslateSurvLine(temp_str,temp_geod);
      Write(cel,temp_geod);
    end;
    CloseFile(f); CloseFile(cel);
  end;
end;



procedure TFormaMain.TranslateSurvLine(const linia :string; var in_fly  :format_geodezji);
var kopia, str   :string;
begin
  kopia := linia;
  str := Trim(Copy(kopia, FIRST_X_FROM_SURV, X_FROM_SURV_MANY));
  if str = '' then in_fly.num_line_from := 0 else in_fly.num_line_from  := StrToFloat(str);

  str := Trim(Copy(kopia, FIRST_Y_FROM_SURV, Y_FROM_SURV_MANY));
  if str = '' then in_fly.num_stat_from := 0 else in_fly.num_stat_from  := StrToFloat(str);

  in_fly.num_line_to    := StrToFloat(Trim(Copy(kopia, FIRST_X_SURV, X_SURV_MANY)));
  in_fly.num_station_to := StrToFloat(Trim(Copy(kopia, FIRST_Y_SURV, Y_SURV_MANY)));
  in_fly.x              := StrToFloat(Trim(Copy(kopia, FIRST_X_NUM_SURV, X_NUM_SURV_MANY)));
  in_fly.y              := StrToFloat(Trim(Copy(kopia, FIRST_Y_NUM_SURV, Y_NUM_SURV_MANY)));
  in_fly.z              := StrToFloat(Trim(Copy(kopia, FIRST_ELEV_SURV, MANY_ELEV_SURV)));
end;


procedure TFormaMain.WstawGeodezjeMenuClick(Sender: TObject);
begin
  KopiujBazeDanych;
  WstawGeodezje;
end;

procedure TFormaMain.ZamienMenuClick(Sender: TObject);
begin
{
  DBGrid2.Columns[3].ReadOnly := False;
  DBGrid2.Columns[4].ReadOnly := False;
  DBGrid2.Columns[5].ReadOnly := False;// X - odblokowujê dla klawiatury.
  DBGrid1.Columns[1].ReadOnly := False;
  DBGrid1.Columns[2].ReadOnly := False;
  DBGrid1.Columns[3].ReadOnly := False;
 }
  KopiujBazeDanych;
  UpdateNumeruPS;
 {
  DBGrid2.Columns[3].ReadOnly := True;
  DBGrid2.Columns[4].ReadOnly := True;
  DBGrid2.Columns[5].ReadOnly := True;// X - blokujê dla klawiatury.
  DBGrid1.Columns[1].ReadOnly := True;
  DBGrid1.Columns[2].ReadOnly := True;
  DBGrid1.Columns[3].ReadOnly := True;
}
end;



procedure TFormaMain.UpdateNumeruPS;
var SzukBox :TFormaSzukaj;
    Szukaj, ZamienNa   :string;

    linia_s, stacja_s  :string;
    linia_z, stacja_z  :string;
    Raz_S              :char;
    Raz_Z              :char;
    RealLinia_S, RealStacja_S,
    RealLinia_Z, RealStacja_Z :real;

begin
  SzukBox := TFormaSzukaj.Create(self);
  SzukBox.EnableKasowanie := false;
  SzukBox.RekordLabel.Caption := 'Szukaj numer PS';
  SzukBox.PSLabel.Caption := 'Zamieñ na';
  SzukBox.EditRec.Text := FloatToStr(TabelaS['line']) + '/'
                       + FloatToStr(TabelaS['station']) + TabelaS['ktory_raz'];
  SzukBox.ShowModal;
  if SzukBox.ModalResult = mrOK then
  begin
    Szukaj := SzukBox.EditRec.Text;
    ZamienNa :=  SzukBox.EditPS.Text   ;
    if (Szukaj <> '') and (ZamienNa <> '') then
    begin
       if TestPoprawnosciNumeru(Szukaj) and TestPoprawnosciNumeru(ZamienNa) then
       begin
         try
           Split_na_lin_stat(Szukaj,linia_s,stacja_s, Raz_S);
           RealLinia_S := StrToFloat(linia_s);
           RealStacja_S := StrToFloat(stacja_s);

           Split_na_lin_stat(ZamienNa,linia_z,stacja_z, Raz_z);
           RealLinia_z := StrToFloat(linia_z);
           RealStacja_z := StrToFloat(stacja_z);

           RozlaczTabele;
           if ZnajdzILE_SZT_WgNumeru(RealLinia_S, RealStacja_S, Raz_S) and
              ZnajdzXWgIndeksu(INDEKS_ILE_SZT)  then
           begin
             ZmienNrAktywnego_S(RealLinia_Z, RealStacja_Z, Raz_Z);
             ZmienNrAktywnego_X(RealLinia_Z, RealStacja_Z, Raz_Z);
             PolaczTabele;
           end else
           begin
             PolaczTabele;
             Application.MessageBox('Nie znaleziono wzorca szukania','Szukanie',mb_ICONHAND or mb_OK);
           end;
         except
           PolaczTabele;
         end {try}
       end
       else
       Application.MessageBox('Numer PS jest nieprawid³owy','B³¹d konwersji',mb_ICONHAND or mb_OK);
    end;
  end;
end;


procedure TFormaMain.ZmienNrAktywnego_S(linia, stacja :real; raz :char);
begin
  TabelaS.Edit;
  TabelaS['line'] := linia;
  TabelaS['station'] := stacja;
  TabelaS['ktory_raz'] := raz;
  TabelaS.Next;
end;

procedure TFormaMain.ZmienNrAktywnego_X(linia, stacja :real; raz :char);
var rekord    :real;
begin
  rekord := TabelaX['rekord'];
  while TabelaX['rekord'] = rekord do
  begin
    TabelaX.Edit;
    TabelaX['line'] := linia;
    TabelaX['station'] := stacja;
    TabelaX['ktory_raz'] := raz;
    TabelaX.Next;
  end;
end;

procedure TFormaMain.UstawNumerRekordowi(nr_rekordu, linia, stacja :real; raz :char);
begin

end;


procedure TFormaMain.UsunSClick(Sender: TObject);
begin
  Usun;
end;


procedure TFormaMain.UsunRecClick(Sender: TObject);
begin
  Usun;
end;

procedure TFormaMain.EdytorExit(Sender: TObject);
var klawisz :integer;
begin
  if Edytor.Modified or (Edytor.Lines.Count <> 0) then
  begin
    klawisz := Application.MessageBox('Czy zapisaæ zawartoœæ edytora?',
      'Kasowanie bazy danych',  mb_ICONHAND or MB_YESNOCANCEL);
    if klawisz = IDYES
    then
    begin
      SaveDialog1.Title := 'Zapisz plik';
      if SaveDialog1.Execute then
      begin
        Edytor.Lines.SaveToFile(SaveDialog1.FileName);
        Edytor.Clear;
      end
    end else //Anuluj
    begin
      if klawisz = IDNO   then Edytor.Clear;
      if klawisz = IDCANCEL   then EdytorSPS.ActivePage := EdytorTabSheet
    end;
  end
end;


procedure TFormaMain.EksportSClick(Sender: TObject);
begin
  EksportSPSMenuClick(Sender);
end;

procedure TFormaMain.ToolButtonOtworzClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Otwórz plik';
  If OpenDialog1.Execute then
  begin
    if FileExists(OpenDialog1.FileName) then
        Edytor.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;

procedure TFormaMain.WstawKolumneSClick(Sender: TObject);
begin
  WstawKolumneMenuClick(Sender);
end;

procedure TFormaMain.EksportXClick(Sender: TObject);
begin
  EksportSPSMenuClick(Sender);
end;

procedure TFormaMain.ExportRSPS(nazwa_pliku :string );
var
    i         :integer;
    temp_str  :string;
    wynik_str :string;
    f         :TextFile;
begin
  TabelaR.DisableControls;

  TabelaR.First;
  wynik_str := '';

  AssignFile(f,nazwa_pliku);
  Rewrite(f);
  for i := 0 to TabelaR.RecordCount - 1 do
  begin
    wynik_str := TabelaR['Ident_S'];

    temp_str := FormujUlamek(FloatToStr(TabelaR['Line']),parametry_eksportu.precyzja_line );
    wynik_str  := wynik_str + justuj(temp_str,SLINE_NUM_MANY, sLewo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaR['STATION']), parametry_eksportu.precyzja_station);
    wynik_str := wynik_str + justuj(temp_str, SSHOT_NUM_MANY, sPrawo, ' ');

    temp_str := TabelaR['KTORY_RAZ'];   //TU JEST cHAR!!!
    wynik_str := wynik_str + temp_str ;

    temp_str := TabelaR['KOD_ODB'];
    wynik_str := wynik_str + temp_str ;

    if parametry_eksportu.statyka then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaR['STATYKA']), 0);
      wynik_str := wynik_str + justuj(temp_str, SSTATIC_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SSTATIC_MANY, ' ');


    if parametry_eksportu.glebokosc_strzelania then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaR['DEPH']), 1);
      wynik_str := wynik_str + justuj(temp_str, SDEPH_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SDEPH_MANY, ' ');

    if parametry_eksportu.datum then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaR['DATUM']), 1);
      wynik_str := wynik_str + justuj(temp_str, SDATUM_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SDATUM_MANY, ' ');

    if parametry_eksportu.czas_pionowy then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaR['UPHOLE']), 0);
      wynik_str := wynik_str + justuj(temp_str, SUPHOLE_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SUPHOLE_MANY, ' ');


    if parametry_eksportu.woda then
    begin
      temp_str := FormujUlamek(FloatToStr(TabelaR['WATER']), 1);
      wynik_str := wynik_str + justuj(temp_str, SWATER_MANY, sPrawo, ' ');
    end else wynik_str := wynik_str + Pomnoz_znaki(SWATER_MANY, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaR['EASTING']), 1);
    wynik_str := wynik_str + justuj(temp_str, S_X_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaR['NORTHING']), 1);
    wynik_str := wynik_str + justuj(temp_str, S_Y_MANY, sPrawo, ' ');

    temp_str := FormujUlamek(FloatToStr(TabelaR['ELEW']), 1);
    wynik_str := wynik_str + justuj(temp_str, S_ELEV_MANY, sPrawo, ' ');

    temp_str := FloatToStr(TabelaR['DAY']);
    wynik_str := wynik_str + justuj(temp_str, S_DAY_MANY, sPrawo, '0');

    temp_str := FloatToStr(TabelaR['TIME']);
    wynik_str := wynik_str + justuj(temp_str, S_TIME_MANY, sPrawo, ' ');

    writeln(f, wynik_str);

    TabelaR.Next;
    temp_str := '';
    wynik_str := '';


  end;{for}
  TabelaR.First;
  TabelaR.EnableControls;
//  PageControl1.Enabled := true;
  CloseFile(f);
end;          {************* EXPORT R **************}




procedure TFormaMain.DolaczSPSMenuClick(Sender: TObject);
begin
  KopiujBazeDanych;
  OtworzSPSMenuClick(Sender);
end;

procedure TFormaMain.ToolButtonSaveClick(Sender: TObject);
begin
  if Edytor.Lines.Count <> 0 then
  begin
    if SaveDialog1.Execute then
    begin
      Edytor.Lines.SaveToFile(SaveDialog1.FileName);
    end;
  end;
end;

procedure TFormaMain.ToolButtonEraseClick(Sender: TObject);
begin
  if Application.MessageBox('Czy skasowaæ zawaroœæ edytora?',
      'Kasowanie',  mb_ICONHAND or MB_OKCANCEL) = IDOK
  then    Edytor.Lines.Clear;
end;


procedure TFormaMain.TabelaSAfterScroll(DataSet: TDataSet);
begin
{
 if tabelaX['Rekord'] <> null then
    StatusBar1.Panels[1].text := 'Bie¿¹cy rekord: ' +
                              FloatToStr(tabelaX['Rekord'])
 else StatusBar1.Panels[1].text := '';
}
   BiezacyRecNaPanel;
end;

procedure TFormaMain.TabelaSAfterDelete(DataSet: TDataSet);
begin
  StatusBar1.Panels[2].text := 'Iloœæ rekordów w bazie: ' +
                            FloatToStr(TabelaS.RecordCount);
end;

procedure TFormaMain.TabelaSAfterInsert(DataSet: TDataSet);
begin
  StatusBar1.Panels[2].text := 'Iloœæ rekordów w bazie: ' +
                            FloatToStr(TabelaS.RecordCount);

end;

function TFormaMain.TEST_INTEGRALNOSCI_SPS(nazwa_S, nazwa_X, nazwa_R :string) :boolean;
//Na pocz¹tek testuje wewnêtrzn¹ spójnoœæ SPS, bez uwzglêdniania parametrów konkretnego tematu;
// Przt³umaczone pliki binarne SPS powinny byæ wczytane do bazy.

var S,X,R              :TextFile;
    Tmp_S              :ssps_line;
    Tmp_X              :xsps_line;
    Tmp_R              :ssps_line;
    tmp_str            :string;
begin
 { If (FileExists(Nazwa_S) and FileExists(Nazwa_X)) or FileExists(Nazwa_R)
  then
  begin
    try
      AssignFile(S, Nazwa_S); AssignFile(X, Nazwa_X);
      Reset(S); Reset(X);
    if FileExists(Nazwa_R) then
    begin
      AssignFile(R, Nazwa_S);
      Reset(R);
    end;
    Except
      Application.MessageBox('B³¹d WE/WY', 'Wczytaj SPS',  mb_ICONHAND or MB_OKCANCEL) ;
      TEST_INTEGRALNOSCI_SPS := false;
      Exit;
    end;

    Read(s, tmp_str);
    translate_sline(tmp_str, Tmp_S);

    Read(x, tmp_str);
    translate_xline(tmp_str, Tmp_X);

  end;
  }
 {
  Testuj logicznie S: (na binarnych)
  Testuj logicznie X:
  Testuj S-X;
 }
 TEST_INTEGRALNOSCI_SPS := true;
end;                          {TFormaMain.TEST_INTEGRALNOSCI_SPS}


procedure TFormaMain.ZapiszSPSMenuClick(Sender: TObject);
begin
  TabelaS.Close; TabelaX.Close;TabelaR.Close;
  RozlaczTabele;
  KopiujBazeDanych;
  TabelaS.OPen; TabelaX.OPen;TabelaR.OPen;
  PolaczTabele;
end;

procedure TFormaMain.WczytajMenuClick(Sender: TObject);
begin
  TabelaS.Close; TabelaX.Close;TabelaR.Close;
  RozlaczTabele;
  OdzyskajBazeDanych;
  TabelaS.OPen; TabelaX.OPen;TabelaR.OPen;
  PolaczTabele;
end;

function TFormaMain.ExtractFileNameOnly(nazwa_pliku :string) :string;
var i    :byte;
    tmp  :string;

function pozycja(liczba :string) :byte;
begin
  if Pos('.', liczba) <> 0 then pozycja := Pos('.', liczba) - 1
  else pozycja := Length(liczba);
end;

begin
  tmp := '';
  i := pozycja(Nazwa_pliku);

  while (nazwa_pliku[i] <>'\') or (i =1) do
  begin
    tmp := tmp + nazwa_pliku[i];
    dec(i);
  end;

end;
//GetEnvironmentVariable, GetEnvironmentStrings
// To pobiera zmienne œrodowiskowe.
end.
