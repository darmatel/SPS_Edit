unit check ;
{moduà zawiera funkcje dla programu checksps}

INTERFACE
uses pomoc ;



VAR
                ilosc_wierszy_x :longint;
                ilosc_wierszy_s :longint;
                ilosc_wierszy_r :longint;
                number_rec_in_x :word;
                number_rec_in_s :word;
                rozna_il_rec    :boolean; {w S i X}
                skok_nr_tasmy,
                line_not_in_swath,
                line_not_in_project,
                line_not_exists,
                malo_kanalow_w_rek,
                skip_is_changed,
                to_many_chanels,
                first_chanel_incorrect,
                bad_line_def             :boolean;{r¢æna iloòÜ z kanaàow i odbiornik¢w}
                {"testuj_linie_parami" i "dobre_kanaày" dubluj• si© }
                no_index_sp,
                too_deep_hole,
                too_shellow_hole,
                incorrect_time_format,
                inconsistent_x_s,
                inconsistent_x_r,
                inconsistent_s_r         :boolean;
                is_non_visible           :boolean;


                nazwa_xsps   :string;     {nazwa xsps - tekstowego}
                nazwa_ssps,
                nazwa_rsps   :string;
                nazwa_xout   :string;     {xsps w postaci binarnej}
                nazwa_sout   :string;     {ssps w postaci binarnej}
                nazwa_pliku_ini :string;
                plik_ini        :text;      {init param tematu}
                plik_s          :text;
                plik_x          :text;

                aut_s       :file of ssps_line;
                aut_x       :file of xsps_line;

                {aut_r       :file of rsps_line;}


procedure init;
procedure done;
procedure otwieram_pliki;
procedure naglowek_testu;
procedure test_xsps;
procedure test_ssps;
function is_non_visible_char(jakas_linia  :string):boolean;


IMPLEMENTATION
uses geofizyk, sysutils,Dialogs;

const       EPS =0.000001;

          {***** DEFINICJA SSPS *****}


const      POSSIBLE_NUM_LINES       = 100;
           {dopuszczalna iloòÜ linii odbior¢w na temacie}
           POSSIBLE_LINES_in_spread = 20;

var     FIRST_R_LINE,
        LAST_R_LINE,
        STEP_R_LINE             :real;
        ILOSC_LINII_ODBIORU     :byte;
        MAX_LINES_IN_SPREAD,
        MIN_LINES_IN_SPREAD     :byte;
        MAX_LINE_IN_SWATH       :byte;
        FIRST_LINE_IN_SWATH     :real;
        LAST_LINE_IN_SWATH      :real;
        MAX_CHANELS_IN_SPREAD   :word;
        MIN_CHANELS_IN_SPREAD   :word;
        LINIE_ODBIORU           :array[1..POSSIBLE_LINES_in_spread] of real;
        ALL_LINES               :array[1..POSSIBLE_NUM_LINES] of real;
        LEGAL_INDSS_ARR         :array[1..24] of string[2];
        SKIP_NA_LINII           :real;
        PIERWSZY_NIEMY_SKIP,
        DRUGI_NIEMY_SKIP        :word; {pierwszy i ostatni "niemy" kanaà w skipie}
        MAX_DEPH                :byte;
        MIN_DEPH                :byte;
        MIN_NORTH_COORD,
        MAX_NORTH_COORD,
        MIN_EAST_COORD ,
        MAX_EAST_COORD          :double;
        TEST_COORD              :boolean;




        SP_LINE_NUM_COEF,
        SP_SHOT_NUM_COEF,
        SP_LINE_NUM_PLUS,
        SP_SHOT_NUM_PLUS,
        RLINE_NUM_COEF  ,
        RLINE_NUM_PLUS  ,
        FROM_NUM_CHAN_COEF,
        FROM_NUM_CHAN_PLUS,
        TO_NUM_CHAN_COEF  ,
        TO_NUM_CHAN_PLUS       :REAL;



var  temp_str           :string;
     rok,miesiac,dzien,godzina,minuta,sekunda :word;
     atrapa                                   :word;
     temp_str2                                :string;

function is_non_visible_char(jakas_linia  :string):boolean;
{zwraca wartoòÜ 'true' jeæeli w danym wierszu istnieje znak 'biaày'
 w sensie SPS}
var znak :char;
    i    :byte;
    jest :boolean;
begin
  {w zasadzie plus jest mocno podejrzanym znakiem a SPS. Minus teoret.
   moæe wyst•piÜ w poz. odniesienia, poprawce statycznej}
  jest := false;
  for i := 1 to length(jakas_linia) do
  begin
    znak := UpCase(jakas_linia[i]);
    if (znak = '.') or
       (znak = '-') or
       (znak = ' ') or
       ((ord(znak) >= 48) and (ord(znak) <= 57) ) or
       ((ord(znak) >= 65) and (ord(znak) <= 90) )
  then is_non_visible_char := false
  else jest := true;
  end;

  if jest = true then is_non_visible_char := true;
end;


procedure init;

procedure init_parametry_tematu;
{wczytuje wszystkie staàe dotycz•ce badanego tematu}
var
          temp_str        :string;
          Temp_int        :integer;
          temp_real       :real;
          temp_byte       :byte;
          temp_word       :word;
          temp_long       :longint;
          temp_double     :double;
          temp_boolean    :boolean;
          kod             :integer;
          i               :byte;


procedure pobierz_sekcje(nazwa_sekcji :string);
var  sekcja_znaleziona :boolean;
begin
  sekcja_znaleziona := FALSE;
  while (not eof(plik_ini) and (not sekcja_znaleziona)) do
  begin
    readln(plik_ini,temp_str);
    if temp_str = nazwa_sekcji then  sekcja_znaleziona := true
    else sekcja_znaleziona := false
  end;
  if eof(plik_ini) or  sekcja_znaleziona = false
  then
  begin
    done;
    writeln('Nie znaleziono sekcji: ', nazwa_sekcji);
    halt;
  end;
end;

function pobierz_parametr(nazwa :string):string;
begin
  readln(plik_ini,temp_str);
  if Pos('<', temp_str) <> 0 then
  temp_str := copy(temp_str, 1, Pos('<', temp_str) - 1); {usuwam komentarz}

  if Pos(nazwa,temp_str)=1 then
  begin
    if (Pos(':', temp_str) <> 0) and  (Pos(';', temp_str) <> 0) and
       (Pos(';', temp_str) > Pos(':', temp_str))
    then
    temp_str := Copy(temp_str, Pos(':', temp_str)+ 1,
                Pos(';', temp_str) - Pos(':', temp_str) - 1 )
    else
    begin
      dolacz_kom('checksps.err', 'bà•d parametr¢w inicjuj•cych programu');
      done;
      halt;
    end;
  end;
  pobierz_parametr := temp_str;
end;

function pobierz_element(temp_str :string; numer :byte):string;
var pozycja      :byte;
    lokal_str    :string;
begin

      lokal_str := Copy(temp_str, Pos(':', temp_str)+ 1,
                Pos(';', temp_str) - Pos(':', temp_str) - 1);
      lokal_str := ',' + lokal_str ; {bardzo mi to uàatwi}



    if szukaj_char(lokal_str,',',numer + 1) = 0 then
    begin
      lokal_str := copy(lokal_str, szukaj_char(lokal_str,',',numer)+1,
                 length(lokal_str) - szukaj_char(lokal_str,',',numer) +1 +1);
    end    else
    begin
      pozycja := szukaj_char(lokal_str,',',numer ) + 1;
      lokal_str := copy(lokal_str,pozycja,
                  szukaj_char(lokal_str,',',numer+1)-1 - pozycja + 1);
    end;

  pobierz_element := lokal_str;
end;


begin

     pobierz_sekcje('[SEKCJA PARAMETROW TEMATU]');
     val(pobierz_parametr('FIRST_R_LINE'),temp_real, kod);
     if kod = 0 then  FIRST_R_LINE := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;
     val(pobierz_parametr('LAST_R_LINE'),temp_real, kod);
     if kod = 0 then  LAST_R_LINE := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('STEP_R_LINE'),temp_real, kod);
     if kod = 0 then  STEP_R_LINE := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;
     val(pobierz_parametr('ILOSC_LINII_ODBIORU'),temp_byte, kod);
     if kod = 0 then  ILOSC_LINII_ODBIORU := temp_byte else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('MAX_LINES_IN_SPREAD'),temp_byte, kod);
     if kod = 0 then  MAX_LINES_IN_SPREAD := temp_byte else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('MIN_LINES_IN_SPREAD'),temp_byte, kod);
     if kod = 0 then  MIN_LINES_IN_SPREAD := temp_byte else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('MAX_LINE_IN_SWATH'),temp_byte, kod);
     if kod = 0 then  MAX_LINE_IN_SWATH := temp_byte else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('FIRST_LINE_IN_SWATH'),temp_real, kod);
     if kod = 0 then  FIRST_LINE_IN_SWATH := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('LAST_LINE_IN_SWATH'),temp_real, kod);
     if kod = 0 then  LAST_LINE_IN_SWATH := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('MAX_CHANELS_IN_SPREAD'), temp_word, kod);
     if kod = 0 then  MAX_CHANELS_IN_SPREAD := temp_word else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('MIN_CHANELS_IN_SPREAD'), temp_word, kod);
     if kod = 0 then  MIN_CHANELS_IN_SPREAD := temp_word else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;


        {********  ùADUJ® MACIERZ *************}
     readln(plik_ini,temp_str);
     if Pos('<', temp_str) <> 0 then
        temp_str := copy(temp_str, 1, Pos('<', temp_str) - 1); {usuwam komentarz}
     if Pos('LINIE_ODBIORU',temp_str)=1 then
     begin
       if (Pos(':', temp_str) <> 0) and  (Pos(';', temp_str) <> 0) and
          (Pos(';', temp_str) > Pos(':', temp_str))
       then
       for i := 1 to ile_znakow(temp_str,',') + 1 do {BO W óRODKU DODAJ®  ','}
       begin
         val(pobierz_element(temp_str, i), temp_real, kod);
         LINIE_ODBIORU[i] := temp_real; {a teraz wczytujemy do macierzy}
       end
       else
       begin
         dolacz_kom('checksps.err', 'bà•d parametr¢w inicjuj•cych programu');
         done;
         halt;
       end;
     end;

        {********  ùADUJ® MACIERZ *************}
     readln(plik_ini, temp_str);
     if Pos('<', temp_str) <> 0 then
        temp_str := copy(temp_str, 1, Pos('<', temp_str) - 1); {usuwam komentarz}
     if Pos('ALL_LINES',temp_str) = 1 then
     begin
       if (Pos(':', temp_str) <> 0) and  (Pos(';', temp_str) <> 0) and
          (Pos(';', temp_str) > Pos(':', temp_str))
       then
       for i := 1 to ile_znakow(temp_str,',') + 1 do
       begin
         val(pobierz_element(temp_str, i), temp_real, kod);
         ALL_LINES[i] := temp_real; {a teraz wczytujemy do macierzy}
       end
       else
       begin
         dolacz_kom('checksps.err', 'bà•d parametr¢w inicjuj•cych programu');
         done;
         halt;
       end;
     end;

     {SKIPY WCZYTUJ®}
     readln(plik_ini,temp_str);

     if Pos('<', temp_str) <> 0 then
        temp_str := copy(temp_str, 1, Pos('<', temp_str) - 1); {usuwam komentarz}
     if Pos('SKIP',temp_str) = 1 then
     begin
       if (Pos(':', temp_str) <> 0) and  (Pos(';', temp_str) <> 0) and
          (Pos(';', temp_str) > Pos(':', temp_str))
       then

       if  ile_znakow(temp_str,',') = 2 then
       begin
         val(pobierz_element(temp_str, 1), temp_real, kod);
         if kod <>0 then
         begin
           dolacz_kom('checksps.err', 'bà•d parametr¢w inicjuj•cych skip');
           done;
           halt;
         end;
         SKIP_NA_LINII := temp_real;

         val(pobierz_element(temp_str, 2), temp_word, kod);
         if kod <>0 then
         begin
           dolacz_kom('checksps.err', 'bà•d parametr¢w inicjuj•cych skip');
           done;
           halt;
         end;
         PIERWSZY_NIEMY_SKIP := temp_word;

         val(pobierz_element(temp_str, 3), temp_word, kod);
         if kod <>0 then
         begin
           dolacz_kom('checksps.err', 'bà•d parametr¢w inicjuj•cych skip');
           done;
           halt;
         end;
         DRUGI_NIEMY_SKIP := temp_word;
       end
       else {brak przecink¢w = brak skipu}
       begin
         PIERWSZY_NIEMY_SKIP := 0;
         DRUGI_NIEMY_SKIP    := 0;
         SKIP_NA_LINII       := 0;
       end;
     end;

     pobierz_sekcje('[SEKCJA S_SPS]');
     {maksymalna gà©bokoòÜ}
     val(pobierz_parametr('MAX_DEPH'), temp_byte, kod);
     if kod = 0 then MAX_DEPH  := temp_byte else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;
     {minimalna gà©bokoòÜ}
     val(pobierz_parametr('MIN_DEPH'), temp_byte, kod);
     if kod = 0 then MIN_DEPH  := temp_byte else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

     {àaduj© dopuszczalne indeksy PS}
     readln(plik_ini, temp_str);
     if Pos('<', temp_str) <> 0 then
        temp_str := copy(temp_str, 1, Pos('<', temp_str) - 1); {usuwam komentarz}
     if Pos('LEGAL_INDSS',temp_str) = 1 then
     begin
       if (Pos(':', temp_str) <> 0) and  (Pos(';', temp_str) <> 0) and
          (Pos(';', temp_str) > Pos(':', temp_str))
       then
       for i := 1 to ile_znakow(temp_str,',') + 1 do
       begin
         LEGAL_INDSS_ARR[i] := pobierz_element(temp_str, i); {a teraz wczytujemy do macierzy}
       end
       else
       begin
         dolacz_kom('checksps.err', 'bà•d parametr¢w inicjuj•cych programu');
         done;
         halt;
       end;
     end;

     temp_str := pobierz_parametr('TEST_COORD');
     if temp_str = 'TAK' then TEST_COORD := true else
     if temp_str = 'NIE' then TEST_COORD := false else
        begin
          dolacz_kom('checksps.err',
                      'Bù§D: Niedopuszczalna opcja inicjalizuj•ca');
          done;
          halt;
        end;
     if  TEST_COORD = true then
     begin
       val(pobierz_parametr('MIN_NORTH_COORD'), temp_double, kod);
       if kod = 0 then MIN_NORTH_COORD  := temp_double else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

       val(pobierz_parametr('MAX_NORTH_COORD'), temp_double, kod);
       if kod = 0 then MAX_NORTH_COORD  := temp_double else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;
       val(pobierz_parametr('MIN_EAST_COORD'), temp_double, kod);
       if kod = 0 then MIN_EAST_COORD  := temp_double else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

       val(pobierz_parametr('MAX_EAST_COORD'), temp_double, kod);
       if kod = 0 then MAX_EAST_COORD  := temp_double else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;
     end else
     begin
       {
       readln(plik_ini, temp_str);
       readln(plik_ini, temp_str);
       readln(plik_ini, temp_str);
       readln(plik_ini, temp_str);
       }
     end;

     pobierz_sekcje('[SEKCJA WSPOLCZYNNIKOW]');
       val(pobierz_parametr('SP_LINE_NUM_COEF'), temp_reaL, kod);
       if kod = 0 then SP_LINE_NUM_COEF  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

       val(pobierz_parametr('SP_SHOT_NUM_COEF'), temp_reaL, kod);
       if kod = 0 then SP_SHOT_NUM_COEF  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

       val(pobierz_parametr('SP_LINE_NUM_PLUS'), temp_reaL, kod);
       if kod = 0 then SP_LINE_NUM_PLUS  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;
       val(pobierz_parametr('SP_SHOT_NUM_PLUS'), temp_reaL, kod);
       if kod = 0 then SP_SHOT_NUM_PLUS  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;
       Val(pobierz_parametr('RLINE_NUM_COEF'), temp_reaL, kod);
       if kod = 0 then RLINE_NUM_COEF  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;
       val(pobierz_parametr('RLINE_NUM_PLUS'), temp_reaL, kod);
       if kod = 0 then RLINE_NUM_PLUS  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;
     val(pobierz_parametr('FROM_NUM_CHAN_COEF'), temp_reaL, kod);
       if kod = 0 then FROM_NUM_CHAN_COEF  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('FROM_NUM_CHAN_PLUS'), temp_reaL, kod);
       if kod = 0 then FROM_NUM_CHAN_PLUS  := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

     val(pobierz_parametr('TO_NUM_CHAN_COEF'), temp_reaL, kod);
     if kod = 0 then TO_NUM_CHAN_COEF  := temp_real else
     begin
       dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
       done;
       halt;
     end;

     val(pobierz_parametr('TO_NUM_CHAN_PLUS'), temp_reaL, kod);
                       if kod = 0 then  TO_NUM_CHAN_PLUS := temp_real else
                       begin
                         dolacz_kom('checksps.err', 'bà•d parametr¢w programu');
                         done;
                         halt;
                       end;

end;      {********** KONIEC POBIERANIA PLIKU INI  ******************   }




procedure init_load_xsps;
var
    linia     :string[80];
    tempik    :string;
    record_x  :xsps_line;
begin
  ilosc_wierszy_x := 0;

  while not eof(plik_x) do
  begin
    inc(ilosc_wierszy_x);
    readln(plik_x, tempik);
    linia := tempik ;                      {OSTROΩNIE !!! DùUGOóè}
    if length(tempik) > 80 then
       begin
         writeln('Bù§D FORMATU SPS -> WIERSZ DùUΩSZY NIΩ 80 ZNAK‡W');
         writeln('Naciònij dowolny klawisz .... ');
         dolacz_kom('checksps.err', 'B≥πd:Bù§D FORMATU SPS -> WIERSZ DùUΩSZY NIΩ 80 ZNAK‡W');
         done;
         halt;
       end;

    if length(tempik) < 80 then dolacz_kom('checksps.err',
                      'UWAGA: Wiersz XSPS zawiera mniej niæ 80 znak¢w');
    if (is_non_visible_char(tempik) = true) then
       begin
         dolacz_kom('checksps.err','Bù§D: Poniæszy wiersz w XSPS zawiera niedozwolone znaki... ');
         dolacz_kom('checksps.err','" ' + tempik + '"');
         halt;
       end;
    translate_xline(linia, record_x);
    write(aut_x, record_x);
  end;
end;


procedure init_load_ssps;
var linia     :string[80];
    tempik    :string;
    record_s  :ssps_line;

begin
  ilosc_wierszy_s := 0;
  while not eof(plik_s) do
  begin
    inc(ilosc_wierszy_s);
    readln(plik_s, tempik);                       {OSTROΩNIE !!! DùUGOóè}
    linia := tempik;
    if length(tempik) > 80 then
       begin
         writeln('Bù§D FORMATU SSPS -> WIERSZ DùUΩSZY NIΩ 80 ZNAK‡W');
         writeln('Naciònij dowolny klawisz .... ');

         done;
         halt;
       end;
    if length(tempik) < 80 then
         dolacz_kom('checksps.err',
         'UWAGA: wiersz SSPS zawiera mniej niæ 80 znak¢w');

    if (is_non_visible_char(tempik) = true) then
       begin
         dolacz_kom('checksps.err','Bù§D: Poniæszy wiersz w SSPS zawiera niedozwolone znaki...');
         dolacz_kom('checksps.err','" ' + tempik + '"');
         done;
         halt;
       end;

    translate_sline(linia, record_s);
    write(aut_s, record_s);
  end;
  number_rec_in_s := ilosc_wierszy_s;
end;

procedure init_load_rsps;
begin
end;

begin                                           {init}
  init_parametry_tematu;
  init_load_xsps;
  init_load_ssps;
  init_load_rsps;
end;                                            {init}

procedure otwieram_pliki;
begin
  nazwa_pliku_ini := 'checksps.ini';

  if not FileExists(nazwa_pliku_ini) then
  begin
    writeln('Bà•d wejòcia - wyjòcia.');
    halt;
  end;
  assign(plik_ini, nazwa_pliku_ini);
  reset(plik_ini);

  assign(plik_s, nazwa_ssps);
  reset(plik_s);
  assign(aut_s, nazwa_sout); {wynik ssps w paostaci binarnej}
  rewrite(aut_s);

  assign(plik_x, nazwa_xsps);
  reset(plik_x);

  assign(aut_x, nazwa_xout);
  rewrite(aut_x);
{assign(aut_r, nazwa_rout);}
  reset(aut_x);
  reset(aut_s);
{  reset(aut_r);}
end;

procedure done;
begin
  close(plik_ini);
  close(aut_x);
  close(aut_s);
  assign(aut_x, nazwa_xout);
  assign(aut_s, nazwa_sout);
  erase(aut_x);
  erase(aut_s);
  { close(aut_r); }
end;

procedure test_xsps;                            {og¢lna procedura}
var temp_rekord,
    next_rekord  :xsps_line;
    licznik      :longint;

procedure test_tapes;
var  tasma_1, tasma_2 :word;
     temp_str,
     temp_str2        :string;
begin
  licznik := 0;
  seek(aut_x, licznik);
  while licznik <= ilosc_wierszy_x - 2  do {æeby na przedostatniej}
  begin
    read(aut_x, temp_rekord);
    seek(aut_x, licznik + 1);
    read(aut_x, next_rekord);
    if ((next_rekord.tasma - temp_rekord.tasma) <> 0) then
    if ((next_rekord.tasma - temp_rekord.tasma) <> 1) then
       begin
         str(temp_rekord.tasma:5, temp_str );
         str(next_rekord.tasma:5, temp_str2 );
         dolacz_kom('checksps.err', 'UWAGA: skok numeracji taòmy: ' +  temp_str +
                     ' -> ' + temp_str2);
         skok_nr_tasmy := true;
       end;
    inc(licznik);
    seek(aut_x, licznik);
  end;
end;

procedure test_records;
var  tasma_1, tasma_2 :word;
     temp_str,
     temp_str2        :string;
     sztuk            :longint;

begin                                           {********** test_records ******** }
  licznik := 0;   sztuk := 1;
  seek(aut_x, licznik);
  while licznik <= ilosc_wierszy_x - 2  do
  {æeby si© zatrzymaÜ na przedostatniej}
  begin
    read(aut_x, temp_rekord);
    seek(aut_x, licznik + 1);
    read(aut_x, next_rekord);
    if ((next_rekord.rekord - temp_rekord.rekord) <> 0) then
    begin
    inc(sztuk);
    if ((next_rekord.rekord - temp_rekord.rekord) <> 1) then
       begin
         str(temp_rekord.rekord:5, temp_str );
         str(next_rekord.rekord:5, temp_str2 );
         temp_str2 := 'UWAGA: skok numeracji rekordu: ' +
                       temp_str + ' -> ' + temp_str2;
         dolacz_kom('checksps.err', temp_str2   );
       end;
    end;
    inc(licznik);
    seek(aut_x, licznik);

  end;
  str(sztuk:4, temp_str2 );
  number_rec_in_x := sztuk;
  dolacz_kom('checksps.err', 'iloòÜ rekord¢w w XSPS------> ' + temp_str2 );
  str(ilosc_wierszy_s:4, temp_str);
  dolacz_kom('checksps.err', 'iloòÜ rekord¢w w SSPS ------>' + temp_str);
end;


procedure test_positions;
begin
end;


procedure test_lines;
var  tasma_1, tasma_2 :word;
     temp_str,
     temp_str2        :string;

procedure nalezy_do_swatha;
var       temp_str,
          temp_str2        :string;
          temp_byte        :byte;
          jest             :boolean;
begin
  if (temp_rekord.linia_odb < FIRST_LINE_IN_SWATH)
     or (temp_rekord.linia_odb > LAST_LINE_IN_SWATH )
  then
  begin
    str(temp_rekord.linia_odb:5:2, temp_str );
    str(temp_rekord.rekord:5, temp_str2);
    dolacz_kom('checksps.err','Bù§D: linia nie naleæy do swatha: ' +
    temp_str + ' (rekord: ' + temp_str2 + ')');
    line_not_in_swath := true;
  end
  else
  begin
  jest := false;   temp_byte := 1;
  while (temp_byte <= MAX_LINE_IN_SWATH) and (jest = false)  do
  begin
    if LINIE_ODBIORU[temp_byte] = temp_rekord.linia_odb then jest := true;
    inc(temp_byte);
  end;
  if jest = false
  then
  begin
    str(temp_rekord.linia_odb:5:2, temp_str );
    str(temp_rekord.rekord:5, temp_str2);
    dolacz_kom('checksps.err','Bù§D: linia nie naleæy do swatha: ' +
    temp_str + ' (rekord: ' + temp_str2 + ')');
    line_not_in_swath := true;
  end;
  end;
end;




procedure testuj_linie_parami;
{sprwadzam, czy linie s•siednie s• logicznie napisane}
var
     temp_str,
     temp_str2                   :string;
     licznik_rekord              :longint;
     suma_kanalow_z_kanalow_next :word;
     suma_kanalow_z_odbior_next  :word;
     suma_kanalow_z_kanalow_temp :word;
     suma_kanalow_z_odbior_temp  :word;

{$I c:\progs\sps_e\testy\check\parami.pas}



begin  {testuj_linie_parami;}

  licznik := 0;   suma_kanalow_z_kanalow_next := 0;   suma_kanalow_z_odbior_next  := 0;
  suma_kanalow_z_kanalow_temp:= 0;   suma_kanalow_z_odbior_temp  := 0;

  while licznik <= ilosc_wierszy_x - 2  do
  begin
    seek(aut_x, licznik);
    read(aut_x, temp_rekord);
    seek(aut_x, licznik + 1);
    read(aut_x, next_rekord);

    {wychwytuj© "styk" dw¢ch rekord¢w. To jest robione tylko jeæeli para
    linii odb. wypada na styku}

    test_na_jedynke; {cz©sty skutek niechlujnego kasowania}
    jest_wiecej; {..... kanaà¢w w rekordzie}

    if (temp_rekord.do_kanalu < MIN_CHANELS_IN_SPREAD) and {tylko ostatni wiersz}
       (temp_rekord.rekord <> next_rekord.rekord) then
    begin
      if not jest_linia_skipem(temp_rekord) then
      begin
        str(next_rekord.rekord:5, temp_str2 );
        malo_kanalow_w_rek := true;
        dolacz_kom('checksps.err', 'UWAGA!!!: Zbyt maàa iloòÜ aktywnych kanaà¢w w rekordzie '
                 + '(rec. ' + temp_str2 +')' );
      end;
    end;

    if ((next_rekord.rekord - temp_rekord.rekord) = 0) then
      {a tu juæ badamy we wn©tzru rekordu}
      begin
        {poniæsze procedury znajduj• si© w pliku}
        oblicz_sumy_kanalow; {w procedurze}

        dobre_sumy_kanalow;  {analizuje sumy kanalow}
        czy_rozne_sasiednie_linie; {testujemy s•siednie linie odb. w rekordzie}
        testuj_kanaly_parami; {jest to de facto procedura testuj_kanaày}
        testuj_odbiorniki_parami; {co innego kanaà, co innego odbiornik}
      end;

  inc(licznik);
  end; {p©tla iloòci rekord¢w  }

end;


begin                                          {procedury test_lines;}
  testuj_linie_parami; {tam od nowa ustawiam na pocz. pliku}
end;      {procedury test_lines;}


procedure test_indexes;
{indeksy s• chyba 3}
begin
end;

begin                          {****test_xsps}
  dolacz_kom('checksps.err', '                                           ');
  dolacz_kom('checksps.err', '                                           ');
  dolacz_kom('checksps.err', '       --------- TEST XSPS ---------       ');
  dolacz_kom('checksps.err', '                                           ');
  test_tapes;
  test_records;
  test_positions;
  test_lines;
  test_indexes;
end;                           {****   test_xsps *******}

procedure test_ssps;           {****   test_ssps *******}
var linia_ssps   :ssps_line;


procedure test_kodu;
{test ≥adunku oraz iloúci otworÛw - czemu nie ???}
var
         i   :longint;
    licznik  :byte;
    tymczas  :ssps_line;
    jest     :boolean;

begin
  licznik  := 1; jest := false;
  for i := 0 to ilosc_wierszy_s - 1 do
  begin
    seek(aut_s, i);
    read(aut_s, tymczas);
    while (LEGAL_INDSS_ARR[licznik] <> '') and (jest = false) and (licznik <= 24) do
    begin
      if tymczas.kod_pkt = LEGAL_INDSS_ARR[licznik]
      then
      begin
        jest := true;
        break;
      end
      else
      begin
        jest := false;
        inc(licznik);
      end;
    end;

    if (jest = false) then
    begin
      str((i+1):4, temp_str);
      dolacz_kom('checksps.err',
      'Bù§D: Brak takiego indeksu punktu strzaàowego (wiersz: '+temp_str+')');
      no_index_sp := true;
    end;

  licznik  := 1; jest := false;
  end; {for}

end;


procedure test_deph;
{max i min zdefiniowane}
var tymczas :ssps_line;
    i       :longint;
begin
 {moæna tak zrobiÜ, æe pewne przedziaày gà©bokoòci i
 indeksy pkt. si© wykluczaj• np E1 to przedziaà tylko >3m E4 tylko 2m}

  for i := 0 to ilosc_wierszy_s - 1 do
  begin
    seek(aut_s, i);
    read(aut_s, tymczas);
    str((i+1):4, temp_str);
    if tymczas.deph > MAX_DEPH THEN
       begin
         dolacz_kom('checksps.err',
         'Bù§D: Zbyt duæa gà©bokoòÜ otworu (wiersz:' + temp_str +')');
         too_deep_hole := true;
       end;
    if tymczas.deph < MIN_DEPH THEN
       begin
         dolacz_kom('checksps.err',
         'Bù§D: Zbyt maàa gà©bokoòÜ otworu (wiersz:' + temp_str +')');
         too_shellow_hole := true;
       end;
  end; {for}
  {    WYMYóL INNE TESTY Gù®BOKOóCI !!!!}
end;

procedure test_uphole;
begin
end;

procedure   test_xy;
begin
end;


procedure test_times;
{test dnia i czasu}
var   i        :longint;
      tymczas  :ssps_line;
      n        :byte;

begin
  incorrect_time_format := false;
  for i := 0 to ilosc_wierszy_s - 1 do
  begin
    seek(aut_s, i);
    read(aut_s, tymczas);

    if tymczas.dzien > 366 THEN
       begin
         str((i+1):4, temp_str);
         dolacz_kom('checksps.err',
         'Bù§D: Nieprawidàowy dzie‰ roku (wiersz:' + temp_str +')');
         incorrect_time_format := true;
       end;

    n := tymczas.czas mod 100;
    if (tymczas.czas div 10000) > 24 then
       begin
         str((i+1):4, temp_str);
         dolacz_kom('checksps.err','Bù§D: Nieprawidàowy czas (wiersz:' + temp_str +')');
         incorrect_time_format := true;
       end;

    if ((tymczas.czas div 100) mod 100 > 60) then
       begin
         str((i+1):4, temp_str);
         dolacz_kom('checksps.err','Bù§D: Nieprawidàowy czas (wiersz:' + temp_str +')');
         incorrect_time_format := true;
       end;

    if (tymczas.czas mod 100 )> 60 then
       begin
         str((i+1):4, temp_str);
         dolacz_kom('checksps.err','Bù§D: Nieprawidàowy czas (wiersz:' + temp_str +')');
         incorrect_time_format := true;
       end;

  end; {for}
end;

procedure testuj_parami_s;
var i                    :longint;
    tymczas,
    drugi                :ssps_line;
begin
  for i := 0 to ilosc_wierszy_s - 2 do
  begin
    seek(aut_s, i);
    read(aut_s, tymczas);
    read(aut_s, drugi);
    if (tymczas.dzien > drugi.dzien)
       then
       begin
         str((i+1):4, temp_str);
         dolacz_kom('checksps.err','Bù§D: Nieprawidàowy przyrost czasu (wiersz:' + temp_str +')');
       end;

    if (tymczas.dzien = drugi.dzien) and (tymczas.czas > drugi.czas)
       then
       begin
         str((i+1):4, temp_str);
         dolacz_kom('checksps.err','Bù§D: Nieprawidàowy przyrost czasu (wiersz:' + temp_str +')');
       end;
  end;
end;


procedure test_powtorek;
begin
{cholera trzeba sortowaÜ}
end; {procedury}

begin              {ciaào procedury test SSPS}
  dolacz_kom('checksps.err', '                                           ');
  dolacz_kom('checksps.err', '                                           ');
  dolacz_kom('checksps.err', '      ---------- TEST SSPS ---------       ');
  dolacz_kom('checksps.err', '                                           ');
  test_kodu;
  test_deph;
  test_uphole;
  test_xy;
  test_times;
//  testuj_parami;
  test_powtorek; {czy s• podw¢jne PS. Zwykle nie wyst©puje ale ....}
end;               {ciaào procedury test SSPS}


procedure naglowek_testu;
var tmp_byte :byte;
    Time: TDateTime;
begin
  dolacz_kom('checksps.err','   ' +  '                                 ');
  dolacz_kom('checksps.err','   ' +  '                                  ');
  dolacz_kom('checksps.err','   ' +  '******************************************');
//  getdate(rok,miesiac,dzien, atrapa);
//  gettime(godzina,minuta,sekunda,atrapa);
  ShowMessage('TÍ procedurÍ naleøy poprawiÊ!!!');
  temp_str := TimeToStr(Time);
  str(rok:4, temp_str);
  temp_str2 := temp_str + ':';
  str(miesiac:2, temp_str);
  if Pos(' ', temp_str) = 1 then
     begin
       delete(temp_str,1,1);
       temp_str := '0' + temp_str;
     end;
  temp_str2 := temp_str2 + temp_str + ':';
  str(dzien:2, temp_str);
  if Pos(' ', temp_str) = 1 then
     begin
       delete(temp_str,1,1);
       temp_str := '0' + temp_str;
     end;
  temp_str2 := '   ' + temp_str2 + temp_str + '          *';
  dolacz_kom('checksps.err', '   ' + '*' +'Test SPS (data): ' + temp_str2);


  str(godzina:2, temp_str);
  temp_str2 := '';
  if Pos(' ', temp_str) = 1 then
     begin
       delete(temp_str,1,1);
       temp_str := '0' + temp_str;
     end;
  temp_str2 := temp_str2 + temp_str + ':';

  str(minuta:2, temp_str);
  if Pos(' ', temp_str) = 1 then
     begin
       delete(temp_str,1,1);
       temp_str := '0' + temp_str;
     end;
  temp_str2 := temp_str2 + temp_str + ':';

  str(sekunda:2, temp_str);
  if Pos(' ', temp_str) = 1 then
     begin
       delete(temp_str,1,1);
       temp_str := '0' + temp_str;
     end;
  temp_str2 := '   ' + temp_str2 + temp_str + '            *';

  dolacz_kom('checksps.err', '   *      (godzina): ' + temp_str2);
  temp_str2 := '   *' + 'Test plik¢w    : ' + '   '+ParamStr(1) +
                   ' ' + ParamStr(2);
  temp_str := '*';
  tmp_byte := Length(temp_str2);
  dostaw_space(temp_str, 44 - tmp_byte );
  temp_str2 := temp_str2 + temp_str;
  dolacz_kom('checksps.err', temp_str2);
  dolacz_kom('checksps.err', '   *' +'                                        *');
  dolacz_kom('checksps.err', '   ******************************************');
end;



end.