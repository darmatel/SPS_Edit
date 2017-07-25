procedure TFormaMain.Edit1Change(Sender: TObject);
var linia, stacja :string;
    ktory_raz     :char;
begin
  if Pos('/', Edit1.text) <> 0 then
  begin
    Split_na_lin_stat(Edit1.text, linia, stacja, ktory_raz);
    with TabelaS do
    begin
       SetKey;
       FieldByName('Line').AsFloat := StrToFloat('1258');
       FieldByName('Station').AsFloat := StrToFloat('132.5');
       GotoNearest;
    end;
  end;
end;

procedure TFormaMain.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked = false then
  begin
    Edit1.Text := '';
    Edit1.Enabled := false;
    Button1.Enabled := false;
  end
  else
  begin
    Edit1.Enabled := true;
    Button1.Enabled := true;
  end;
end;

procedure TFormaMain.Button1Click(Sender: TObject);
begin
  if CheckBox1.Enabled then
  begin
    if not (EdytorSPS.ActivePage = RTabsheet) then
       begin
       try
         TabelaS.Filtered := true;
         TabelaS.Filter := Edit1.Text;
        except
          CheckBox1.Checked := false;
          ShowMessage('Nieprawid³owo zdefiniowany filtr');
        end;
    end else
    begin
      try
         TabelaR.Filtered := true;
         TabelaR.Filter := Edit1.Text;
      except
          CheckBox1.Checked := false;
          ShowMessage('Nieprawid³owo zdefiniowany filtr');
      end;
    end;
  end;
end;

procedure TFormaMain.Button2Click(Sender: TObject);
var pomoc :TFormaPomocy;
begin
  pomoc := TFormaPomocy.Create(Self);
  pomoc.ShowModal;
  pomoc.Free;
end;
