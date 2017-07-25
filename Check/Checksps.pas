Program CheckSps;
uses crt, geofizyk, check, dos;
{$R- $Q-}


var
     kod                                      :integer;
     temp_str, temp_str2                      :string;

procedure test_consistency;
var licznik_x,
    licznik_s   :longint;
    wiersz_x    :xsps_line;{tymczasowe}
    wiersz_s    :ssps_line;
{zgodnoòÜ r i s}
{zgodnoòÜ x i r}
procedure test_consistency_x_s;
var   licznik_x,
      licznik_s   :longint;
      temp_1_x,
      temp_2_x    :xsps_line;
      temp_1_s    :ssps_line;
begin
  if  number_rec_in_x <> number_rec_in_s then
      begin
        dolacz_kom('checksps.err', 'Bù§D:  R¢æna iloòÜ rekord¢w w SSPS i XSPS');
        rozna_il_rec := true;
      end;
  if (rozna_il_rec = false) then
  begin
    licznik_x := 0; licznik_s := 0;
    for licznik_x := 0 to ilosc_wierszy_x - 2 do {przedostani wiersz}
    begin
      seek(aut_x, licznik_x);
      read(aut_x, temp_1_x);
      seek(aut_x, licznik_x + 1);
      read(aut_x, temp_2_x);
      if (temp_1_x.rekord <> temp_2_x.rekord) then
         begin
           seek(aut_s, licznik_s);
           read(aut_s, temp_1_s);
           if (temp_1_x.linia  = temp_1_s.linia) and
              (temp_1_x.punkt  = temp_1_s.punkt) and
              (temp_1_x.indeks = temp_1_s.indeks)then
              begin
                inc(licznik_s);
              end else {Nr PS z X <> Nr PS z S}
                  begin
                    str(temp_1_x.rekord :4, temp_str);
                    str((licznik_s + 1) :3, temp_str2);
                    temp_str := 'Bù§D: NiezgodnoòÜ numer¢w PS lub indeksu w SSPS i XSPS'
                                +'(rek. ' + temp_str + ')' +
                                ' (linia SSPS '+temp_str2 + ')';
                    dolacz_kom('checksps.err', temp_str);
                    inc(licznik_s);
                    inconsistent_x_s := true;
                  end;
         end;
    end;{p©tli for}
  end else dolacz_kom('checksps.err', 'UWAGA: Nie wykonano testu zgodnoòci XSPS i SSPS');
end;

procedure test_consistency_x_r;
begin

end;

procedure test_consistency_s_r;
begin

end;

begin
  dolacz_kom('checksps.err', '                                           ');
  dolacz_kom('checksps.err', '                                           ');
  dolacz_kom('checksps.err', '      ------- TESTY  ZGODNOóCI------       ');
  dolacz_kom('checksps.err', '                                           ');
  test_consistency_x_s;
  test_consistency_x_r;
  test_consistency_s_r;
end;

procedure compare_external;
{por¢wnanie z zewn©trznymi sps}
begin
end;

procedure sequre;
{procedura zabezpiecza przed niepowoàanym uæywaniem programu}

type rekordy  = record
                  x,
                  y,z        :char;
                  doubl      :double;  {ile razy uruchomiono}
                  byla_proba :boolean; {czy byàa pr¢ba zàamania}
                  loneg      :longint;
                  zawartosc  :string[8];{ci•g znak¢w}
                end;

function odczytaj_pozycje_rekordu_specjalnego :longint;
begin
end;

function generuj_pozycje_rekordu_specjalnego :longint;
begin
end;

function czy_dyskietka_wlozona :boolean;
begin

end;

function czy_nazwa_OK :boolean; {dyskietki}
begin
end;

function czy_serial_OK :boolean;
begin
end;

function czy_pliki_ident :boolean;
begin
end;

procedure zapisz_pliki_zaszyfrowane;
{jedna kopia na dyskietk©, druga na dysk
 musimy uwzgl©dniÜ dysk awaryjny}
begin
end;

procedure analizuj_pliki_zaszyfrowane;
begin
end;

begin
end;


procedure test_parametrow_i_copyright;
begin
  if (ParamCount <> 2) or (ParamStr(1) = '/?') or (paramStr(1) = '?') then
  begin
    clrscr;
    writeln('Checksps ver. 1.0');
    writeln('Zàa iloòÜ parametr¢w.');
    writeln('Wywoàanie: checksps.exe <plik_XSPS> <plik_SSPS>');
    writeln;    writeln;    writeln;    writeln;    writeln;
    writeln('Program testuje poprawnoòÜ plik¢w SPS');
    writeln;
    writeln('Autor programu: Dariusz Matelowski, 1999 (darmatel@kr.onet.pl');
    writeln('Program moæe byÜ uæywany bezpàatnie WYù§CZNIE w jednostkach podlegàych');
    writeln('Zakàadu Geofizyka Krak¢w sp. z o.o.');
    writeln('Kopiowanie i rozpowszechninie tego programu jest zabronione bez zgody autora.');
    writeln('Autor nie ponosi odpowiedzialnoòci za skutki uæywania programu.');
    halt;
  end;
end;



begin
  clrscr;
{  sequre;}

  test_parametrow_i_copyright;
  nazwa_xsps := ParamStr(1);
  nazwa_ssps := ParamStr(2);
  nazwa_rsps := 'r.out';
  nazwa_xout := 'x.out';
  nazwa_sout := 's.out';
  temp_str := '';

  naglowek_testu;
  otwieram_pliki;
  init;
  test_xsps;
  test_ssps;
  test_consistency;
  compare_external;
  done;  {zamykam otwarte pliki i inne porz•dki}
end.