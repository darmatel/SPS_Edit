{plik z procedurami dla programu checksps.exe}
function jest_skip_OK(wiersz_1, wiersz_2 :xsps_line) :boolean;
begin
  {sytuacja, gdy w XSPS s• dwa wiersze o ident. numerze linii odb.}
  if (wiersz_1.linia_odb - wiersz_2.linia_odb) = 0
  then
  begin
  if (wiersz_1.do_odbior = (PIERWSZY_NIEMY_SKIP - 1)) and
     (wiersz_2.od_odbior = (DRUGI_NIEMY_SKIP + 1))
  then jest_skip_OK := true  else
    begin
      str(next_rekord.rekord:5, temp_str2 );
      dolacz_kom('checksps.err',
          'Bù§D: Zmiana definicji skipu lub nieprawidàowa kolejnoòÜ linii odb. '
      + temp_str);
      jest_skip_OK := false
    end
  end
end; {funkcji}

procedure jest_wiecej;
begin
if (temp_rekord.do_kanalu > MAX_CHANELS_IN_SPREAD) then
         begin
           str(temp_rekord.rekord:4, temp_str2 );
           dolacz_kom('checksps.err',
           'Bù§D: Zbyt duæa iloòÜ aktywnych kanaà¢w ' + '(rec. ' + temp_str2 +')' );
         end;
end;

function  jest_linia_skipem(wierszyk :xsps_line) :boolean;
begin
  if (wierszyk.linia_odb <> SKIP_NA_LINII) then
    jest_linia_skipem := false
  else jest_linia_skipem := true;
end;


procedure test_na_jedynke;
begin
if next_rekord.rekord <> temp_rekord.rekord then
    begin
    if (next_rekord.od_kanalu <> 1) then
       begin
         str(next_rekord.rekord:5, temp_str2 );
         dolacz_kom('checksps.err', 'Bù§D: Pierwszy kanaà rekordu <> 1 '
         + '(rec. ' + temp_str2 +')' );
       end;
    end;
end;

procedure oblicz_sumy_kanalow;
begin
     {rozstaw}
      suma_kanalow_z_kanalow_next := next_rekord.do_kanalu -
                                     next_rekord.od_kanalu + 1;
      {ziemia}
//      suma_kanalow_z_odbior_next  := next_rekord.do_odbior -
//                                     next_rekord.od_odbior + 1;
      {rozstaw}
      suma_kanalow_z_kanalow_temp := temp_rekord.do_kanalu -
                                     temp_rekord.od_kanalu + 1;
      {ziemia}
//      suma_kanalow_z_odbior_temp  := temp_rekord.do_odbior -
//                                     temp_rekord.od_odbior + 1;
end;

procedure dobre_sumy_kanalow;
begin
if (suma_kanalow_z_kanalow_temp <> suma_kanalow_z_odbior_temp)
         then
         begin
           str(next_rekord.rekord:5, temp_str2 );
           str(next_rekord.linia_odb:5:2, temp_str );
           temp_str2 := 'Bù§D: Nieprawidàowy rozstaw na linii odbioru ' +
                         temp_str + ' (rec. ' + temp_str2 +')' ;
           dolacz_kom('checksps.err', temp_str2);
         end;
end;


procedure testuj_kanaly_parami;
begin
if (((next_rekord.od_kanalu - temp_rekord.do_kanalu) <> 1) and
         ((next_rekord.rekord - temp_rekord.rekord) = 0)) then
      begin
        str(next_rekord.rekord:5, temp_str2 );
        dolacz_kom('checksps.err', 'Bù§D: NiezgodnoòÜ kanaà¢w ' + '(rec. ' + temp_str2 +')' );
      end;
end;

procedure testuj_odbiorniki_parami;
begin
  if (((next_rekord.do_odbior - temp_rekord.do_odbior) <> 0) and
         ((next_rekord.rekord - temp_rekord.rekord) = 0)) then
      begin
        if (SKIP_NA_LINII <> next_rekord.linia_odb) and
           (SKIP_NA_LINII <> temp_rekord.linia_odb) then
        begin
          str(next_rekord.rekord:5, temp_str2 );
          dolacz_kom('checksps.err', 'UWAGA! R¢æna dàugoòÜ LO ' + '(rec. ' + temp_str2 +')' );


          if (((next_rekord.od_odbior - temp_rekord.od_odbior) <> 0) and
             ((next_rekord.rekord - temp_rekord.rekord) = 0)) then
             begin
               str(next_rekord.rekord:5, temp_str2 );
               dolacz_kom('checksps.err', 'UWAGA: R¢æna dàugoòÜ LO ' + '(rec. ' + temp_str2 +')' );
             end
        end
      end
end;

procedure czy_rozne_sasiednie_linie;
begin
if ((next_rekord.linia_odb - temp_rekord.linia_odb) <> STEP_R_LINE)
      then
      begin
        if (PIERWSZY_NIEMY_SKIP = 0) and (DRUGI_NIEMY_SKIP = 0) and
           (SKIP_NA_LINII = 0) then
        begin
          str(temp_rekord.linia_odb:5:2, temp_str );
          str(next_rekord.linia_odb:5:2, temp_str2 );
          temp_str := 'Bù§D: KolejnoòÜ linii odbioru: ' + temp_str +
                  ' -> ' + temp_str2;
          str(next_rekord.rekord:5, temp_str2 );
          dolacz_kom('checksps.err', temp_str + '(rec. ' + temp_str2 +')' );
        end
        else if (jest_skip_OK(temp_rekord, next_rekord) = false)
        then begin end {maào eleganckie...............}
      end;
end;