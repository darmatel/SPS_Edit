unit Procedury;

interface

var CRITICAL_ERROR      :boolean; //kluczowa zmienna. WartoúÊ true uniemoøliwia
                                  //dalsze przetwaøanie

implementation
uses test,pomoc,forms,Windows, Messages, Geofizyk;

function is_non_visible_char(jakas_linia  :string):boolean;
{zwraca wartoòÜ 'true' jeæeli w danym wierszu istnieje znak 'biaày'
 w sensie SPS}
var znak :char;
    i    :byte;
    jest :boolean;
begin
  {w zasadzie plus jest mocno podejrzanym znakiem w SPS. Minus teoret.
   moæe wyst•piÜ w poz. odniesienia, poprawce statycznej}
  jest := false;
  for i := 1 to length(jakas_linia) do
  begin
    znak := UpCase(jakas_linia[i]);
    if not ((znak = '.') or
       (znak = '-') or
       (znak = ' ') or
       ((ord(znak) >= 48) and (ord(znak) <= 57) ) or
       ((ord(znak) >= 65) and (ord(znak) <= 90) ))then
       begin
        jest := true;
        CRITICAL_ERROR := true;
        break;
       end;
  end;

  if jest = true then is_non_visible_char := true else is_non_visible_char := false;
end;




procedure init_load_xsps(Nazwa_pliku, Nazwa_wyniku :string);
//konwertuje wiersz na binar i zapisuje go jako Nazwa_wyniku
var
    linia     :string[80];
    tempik    :string;
    record_x  :xsps_line;
    plik_x    :TextFile;
    aut_x     :file of xsps_line;

begin
  try
    AssignFile(plik_x, Nazwa_pliku);
    AssignFile(aut_x, Nazwa_wyniku);
    Rewrite(aut_x);
    Reset(plik_x);
  finally
    CloseFile(plik_x);
    Application.MessageBox('B≥πd WE/WY', 'Wczytaj SPS-X',  mb_ICONHAND or MB_OKCANCEL) ;
  end;

  while not eof(plik_x) do
  begin
    readln(plik_x, tempik);
    linia := tempik ;                      {OSTROΩNIE !!! DùUGOóè}
    if length(tempik) > 80 then
       begin
         dolacz_kom('checksps.err', 'B≥πd:Bù§D FORMATU SPS -> WIERSZ DùUΩSZY NIΩ 80 ZNAK‡W');
         exit;
       end;

    if length(tempik) < 80 then dolacz_kom('checksps.err',
                      'UWAGA: Wiersz XSPS zawiera mniej niæ 80 znak¢w');
    if (is_non_visible_char(tempik) = true) then
       begin
         dolacz_kom('checksps.err','Bù§D: Poniæszy wiersz w XSPS zawiera niedozwolone znaki... ');
         dolacz_kom('checksps.err','" ' + tempik + '"');
         exit;
       end;
    translate_xline(linia, record_x);
    write(aut_x, record_x);
  end;
  CloseFile(aut_x);
  CloseFile(plik_x);
end;




procedure init_load_ssps(Nazwa_pliku, Nazwa_wyniku :string);
//konwertuje wiersz na binar i zapisuje go jako Nazwa_wyniku
var linia     :string[80];
    tempik    :string;
    record_s  :ssps_line;
    plik_s    :TextFile;
    aut_s     :file of ssps_line;
begin
  AssignFile(plik_s, Nazwa_pliku);
  Reset(plik_s);
  AssignFile(aut_s, Nazwa_wyniku);
  Rewrite(aut_s);

  while not eof(plik_s) do
  begin
    readln(plik_s, tempik);                       {OSTROΩNIE !!! DùUGOóè}
    linia := tempik;
    if length(tempik) > 80 then
       begin
         dolacz_kom('checksps.err','Bù§D FORMATU SPS-S -> WIERSZ DùUΩSZY NIΩ 80 ZNAK‡W');
         dolacz_kom('checksps.err','" ' + tempik + '"');
       end;

    if length(tempik) < 80 then
         dolacz_kom('checksps.err',
         'UWAGA: wiersz SPS-X zawiera mniej niæ 80 znak¢w');

    if (is_non_visible_char(tempik) = true) then
       begin
         dolacz_kom('checksps.err','Bù§D: Poniæszy wiersz w SSPS zawiera niedozwolone znaki...');
         dolacz_kom('checksps.err','" ' + tempik + '"');
       end;

    translate_sline(linia, record_s);
    write(aut_s, record_s);
  end;
  CloseFile(plik_s);
  CloseFile(aut_s);
end;


function test_times(var tymczas :ssps_line):boolean;
{test dnia i czasu}
var  wynik :boolean;

begin
  wynik := true;
  if tymczas.dzien > 366 THEN wynik := false;
  if (tymczas.czas div 10000) > 24 then wynik := false;
  if ((tymczas.czas div 100) mod 100 > 60) then wynik := false;
  if (tymczas.czas mod 100 )> 60 then wynik := false;
  if wynik = false then test_times := false else test_times := true;
end;



function testuj_parami_s(var tymczas, drugi  :ssps_line):boolean;
var
    wynik                :boolean;
begin
    wynik := true;
    if (tymczas.dzien > drugi.dzien)   then wynik  := false;
    if (tymczas.dzien = drugi.dzien) and (tymczas.czas > drugi.czas)
       then wynik  := false;

    if wynik  = false then testuj_parami_s := false else testuj_parami_s := true;
end;




{***************   XXXXXXXXXXXXXXXXXXXXXX *****************}


function test_records(var first_rekord, next_rekord :xsps_line):boolean;
//UWAGA NA KOLEJNOå∆!!!
// Wynik zawsze true;
var
     temp_str,
     temp_str2        :string;

begin                 {********** test_records ******** }
  if ((next_rekord.rekord - first_rekord.rekord) <> 0) then
  begin
    if ((next_rekord.rekord - first_rekord.rekord) <> 1) then
       begin
         str(first_rekord.rekord:5, temp_str );
         str(next_rekord.rekord:5, temp_str2 );
         temp_str2 := 'UWAGA: skok numeracji rekordu: ' +
                       temp_str + ' -> ' + temp_str2;
         dolacz_kom('checksps.err', temp_str2   );
       end;
  end;
  test_records := true;
end;




function test_tapes(var first_rekord, next_rekord :xsps_line):boolean;
// zawsze zwraca true;
var
     temp_str,
     temp_str2        :string;
begin
  if ((next_rekord.tasma - first_rekord.tasma) <> 0) then
  begin
    if ((next_rekord.tasma - first_rekord.tasma) <> 1) then
    begin
      str(first_rekord.tasma:5, temp_str );
      str(next_rekord.tasma:5, temp_str2 );
      dolacz_kom('checksps.err', 'UWAGA: skok numeracji taòmy: ' +  temp_str +
                     ' -> ' + temp_str2);
    end;
  end;
  test_tapes := true;
end;




function testuj_kanaly_parami(var first_rekord, next_rekord :xsps_line):boolean;
var temp_str2                     :string;
begin
if (((next_rekord.od_kanalu - first_rekord.do_kanalu) <> 1) and
         ((next_rekord.rekord - first_rekord.rekord) = 0)) then
      begin
        str(next_rekord.rekord:5, temp_str2 );
        dolacz_kom('checksps.err', 'B≥πd: NiezgodnoúÊ kana≥Ûw ' + '(rec. ' + temp_str2 +')' );
        CRITICAL_ERROR := true;
        testuj_kanaly_parami := false;
      end else testuj_kanaly_parami := true;
end;



function dobre_sumy_kanalow(var first_rekord, next_rekord :xsps_line):boolean;
var
    suma_kanalow_z_kanalow_first,
    suma_kanalow_z_odbior_first               :real;
    temp_str2,temp_str                        :STRING;

begin
      {rozstaw}
      suma_kanalow_z_kanalow_first := first_rekord.do_kanalu -
                                     first_rekord.od_kanalu + 1;
      {ziemia}
      suma_kanalow_z_odbior_first  := first_rekord.do_odbior -
                                     first_rekord.od_odbior + 1;

     if (suma_kanalow_z_kanalow_first <> suma_kanalow_z_odbior_first)
     then
     begin
         str(next_rekord.rekord:5, temp_str2 );
         str(next_rekord.linia_odb:5:2, temp_str );
         temp_str2 := 'Bù§D: Nieprawidàowy rozstaw na linii odbioru ' +
                         temp_str + ' (rec. ' + temp_str2 +')' ;
         dolacz_kom('checksps.err', temp_str2);
         dobre_sumy_kanalow := false;
         CRITICAL_ERROR := true;
       end else  dobre_sumy_kanalow := true;
end;




end.

