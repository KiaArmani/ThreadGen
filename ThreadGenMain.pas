unit ThreadGenMain;

// =============================================================================
// 	
// =============================================================================

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, IniFiles, ShellApi;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Memo2: TMemo;
    Label4: TLabel;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    Memo3: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    Memo4: TMemo;
    Button2: TButton;
    Button3: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    ListBox1: TListBox;
    Button4: TButton;
    Button5: TButton;
    Memo5: TMemo;
    Label10: TLabel;
    Edit3: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    Button6: TButton;

    procedure ThreadGenButton_Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OnPluginNameChange(Sender: TObject);
    procedure OnVersionChange(Sender: TObject);
    procedure OnDescChange(Sender: TObject);
    procedure OnSaveClick(Sender: TObject);
    procedure OnLoadClick(Sender: TObject);
    procedure OnHomepageLabelClick(Sender: TObject);
    procedure OnChangelogAddClick(Sender: TObject);
    procedure OnRemoveChangelogClick(Sender: TObject);
    procedure OnModifyChangelogClick(Sender: TObject);
    procedure OnChangelogVersionChange(Sender: TObject);
    procedure OnChangelogTextChange(Sender: TObject);
    procedure OnListBoxClick(Sender: TObject);
  private
    GlobalFileName : String;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

// =============================================================================
// 	
// =============================================================================

procedure TForm1.ThreadGenButton_Click(Sender: TObject);
var
  PluginName : String;
  PluginVersion : String;
  PluginDesc : String;

  SelectedVersion : String;

  ProjFile : TIniFile;
  iL : Integer;
  i : Integer;
  y : Integer;

  wYear, wMonth, wDay: Word;
begin
  PluginName := Edit1.Text;
  if PluginName = '' then
  begin
        MessageDlg('Plugin Name must not be empty!', mtError, [mbOK], 1);
        Edit1.Color := clRed;
        Exit;
  end;

  PluginVersion := Edit2.Text;
  if PluginVersion = '' then
  begin
        MessageDlg('Plugin Version must not be empty!', mtError, [mbOK], 1);
        Edit2.Color := clRed;
        Exit;
  end;

  PluginDesc := Memo1.Text;
  if PluginDesc = '' then
  begin
        MessageDlg('Plugin Description must not be empty!', mtError, [mbOK], 1);
        Memo1.Color := clRed;
        Exit;
  end;

  DecodeDate(Date, wYear, wMonth, wDay);

  Memo2.Text :=
  '[INDENT][FONT="Trebuchet MS"][SIZE="6"][color="#b5762d"]' + PluginName + '[/color][/SIZE][/FONT]'
  + ^M + ^J
  +'[SIZE="1"][color=#4C4C4C]v'
  + PluginVersion
  + ', last updated : '
  + IntToStr(wDay)
  + '.'
  + IntToStr(wMonth)
  + '.'
  + IntToStr(wYear)
  + '[/color][/SIZE]'
  + ^M + ^J
  + ^M + ^J
  + '[FONT="Trebuchet MS"][color=#4C4C4C]'
  + PluginDesc
  + '[/color][/font]';

  if Memo3.Text <> '' then
  begin
    Memo2.Text := Memo2.Text
    + ^M + ^J
    + ^M + ^J
    + '[B][color=#006699][SIZE="4"]Requirements[/SIZE][/color][/B]'
    + ^M + ^J
    + '[LIST]'
    + ^M + ^J;

    for i := 0 to Memo3.Lines.Count - 1 do
      Memo2.Text := Memo2.Text
      + '[*]'
      + Memo3.Lines.Strings[i]
      + ^M + ^J;

    Memo2.Text := Memo2.Text
    + '[/LIST]';
  end;

  if Memo4.Text <> '' then
  begin
    Memo2.Text := Memo2.Text
    + ^M + ^J
    + ^M + ^J
    + '[B][color=#006699][SIZE="4"]Credits[/SIZE][/color][/B]'
    + ^M + ^J
    + '[LIST]'
    + ^M + ^J;

    for i := 0 to Memo3.Lines.Count - 1 do
      Memo2.Text := Memo2.Text
      + '[*]'
      + Memo4.Lines.Strings[i]
      + ^M + ^J;

    Memo2.Text := Memo2.Text
    + '[/LIST]';
  end;

  if ListBox1.Items.Count > 0 then
  begin
    Memo2.Text := Memo2.Text
    + ^M + ^J
    + ^M + ^J
    + '[B][color=#006699][SIZE="4"]Changelogs[/SIZE][/color][/B]'
    + ^M + ^J;
    for i := 0 to ListBox1.Items.Count - 1 do
    begin
      Memo2.Text := Memo2.Text
      + '[QUOTE='
      + ListBox1.Items.Strings[i]
      + ']'
      + ^M + ^J
      + '[LIST]'
      + ^M + ^J;

      if GlobalFileName = '' then
        OnSaveClick(self)
      else
        begin
          ProjFile := TIniFile.Create(GlobalFileName);
          iL := ProjFile.ReadInteger('Changelogs', ListBox1.Items.Strings[i], 0);

          for y := 0 to iL - 1 do
            Memo2.Text := Memo2.Text
            + '[*]'
            + ProjFile.ReadString(ListBox1.Items.Strings[i], 'ChangeLine' + IntToStr(y), '')
            + ^M + ^J;
        end;

       Memo2.Text := Memo2.Text + '[/LIST]' + ^M + ^J + '[/QUOTE]' + ^M + ^J;
    end;
  end;

  Memo2.Text := Memo2.Text + '[/INDENT]';
end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.FormCreate(Sender: TObject);
begin

   GlobalFileName := '';

   Edit1.Text := 'Your Plugin Name';
   Edit2.Text := '1.0.0';
   Edit3.Text := '';

   Memo1.Text := '';
   Memo2.Text := '';
   Memo3.Text := '';
   Memo4.Text := '';
   Memo5.Text := '';
end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.OnPluginNameChange(Sender: TObject);
begin
  if Edit1.Color = clRed
  then
    Edit1.Color := clWindow;
end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.OnVersionChange(Sender: TObject);
begin
   if Edit2.Color = clRed
   then
     Edit2.Color := clWindow;
end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.OnDescChange(Sender: TObject);
begin
   if Memo1.Color = clRed
   then
     Memo1.Color := clWindow;
end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.OnSaveClick(Sender: TObject);
var
  FileDialog : TSaveDialog;
  ProjFile : TIniFile;
  i : Integer;
  iL : Integer;
  TempString : String;
begin
  FileDialog := TSaveDialog.Create(self);
  FileDialog.Title := 'Save your Project';
  FileDialog.InitialDir := GetCurrentDir;
  FileDialog.Filter := 'ThreadGen Project Files|*.tgen';
  FileDialog.FilterIndex := 1;

  if FileDialog.Execute then
  begin
    ProjFile := TIniFile.Create(FileDialog.FileName);
    try
      if Edit1.Text <> '' then ProjFile.WriteString('ThreadGen', 'PluginName', Edit1.Text);
      if Edit2.Text <> '' then ProjFile.WriteString('ThreadGen', 'PluginVersion', Edit2.Text);

      if Memo1.Text <> '' then
      begin
        iL := Memo1.Lines.Count;
        ProjFile.WriteInteger('ReadInfo', 'PluginDesc', iL);
        for i := 0 to iL - 1 do
          ProjFile.WriteString('ThreadGen', 'PluginDesc' + IntToStr(i), Memo1.Lines[i]);
      end;
      
      if Memo3.Text <> '' then
      begin
        iL := Memo1.Lines.Count;
        ProjFile.WriteInteger('ReadInfo', 'PluginReq', iL);
        for i := 0 to iL - 1 do
          ProjFile.WriteString('ThreadGen', 'PluginReq' + IntToStr(i), Memo3.Lines[i]);
      end;

      if Memo4.Text <> '' then
      begin
        iL := Memo4.Lines.Count;
        ProjFile.WriteInteger('ReadInfo', 'PluginCred', iL);
        for i := 0 to iL - 1 do
          ProjFile.WriteString('ThreadGen', 'PluginCred' + IntToStr(i), Memo4.Lines[i]);
      end;
    finally
      ProjFile.Free;
    end;
    GlobalFileName := FileDialog.FileName;
  end
  else
    MessageDlg('You need to select a valid file!', mtError, [mbOK], 1);

end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.OnLoadClick(Sender: TObject);
var
  FileDialog : TOpenDialog;
  ProjFile : TIniFile;

  i : Integer;
  iL : Integer;

  ChangelogList : TStringList;
begin
  FileDialog := TOpenDialog.Create(self);
  FileDialog.InitialDir := GetCurrentDir;
  FileDialog.Filter := 'ThreadGen Project Files|*.tgen';
  FileDialog.FilterIndex := 1;

  if FileDialog.Execute then
  begin

    Edit1.Text := 'Your Plugin Name';
    Edit2.Text := '1.0.0';
    Edit3.Text := '';

    Memo1.Text := '';
    Memo2.Text := '';
    Memo3.Text := '';
    Memo4.Text := '';
    Memo5.Text := '';

    ProjFile := TIniFile.Create(FileDialog.FileName);
    try
       Edit1.Text := ProjFile.ReadString('ThreadGen', 'PluginName', Edit1.Text);
       Edit2.Text := ProjFile.ReadString('ThreadGen', 'PluginVersion', Edit2.Text);

       iL := ProjFile.ReadInteger('ReadInfo', 'PluginDesc', 0);
       if iL <> 0 then
       begin
         for i := 0 to iL - 1 do
           Memo1.Lines.Insert(i, ProjFile.ReadString('ThreadGen', 'PluginDesc' + IntToStr(i), ''));
       end;

       iL := ProjFile.ReadInteger('ReadInfo', 'PluginReq', 0);
       if iL <> 0 then
       begin
         for i := 0 to iL - 1 do
           Memo3.Lines.Insert(i, ProjFile.ReadString('ThreadGen', 'PluginReq' + IntToStr(i), ''));
       end;

       iL := ProjFile.ReadInteger('ReadInfo', 'PluginCred', 0);
       if iL <> 0 then
       begin
         for i := 0 to iL - 1 do
           Memo4.Lines.Insert(i, ProjFile.ReadString('ThreadGen', 'PluginCred' + IntToStr(i), ''));
       end;

       ChangelogList := TStringList.Create;
       ProjFile.ReadSection('Changelogs', ListBox1.Items);

       GlobalFileName := FileDialog.FileName;

    finally
     ProjFile.Free;
    end;
  end
  else
    MessageDlg('You need to select a valid file!', mtError, [mbOK], 1);
end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.OnHomepageLabelClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.xkia.de', nil, nil, SW_SHOW);
end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.OnChangelogAddClick(Sender: TObject);
var
  ChangeVersion : String;
  ChangeText : String;

  ProjFile : TIniFile;
  iL : Integer;
  i : Integer;
begin
  ChangeVersion := Edit3.Text;
  ChangeText := Memo5.Text;

  if ChangeVersion = '' then
  begin
    MessageDlg('Changelog Version must not be empty!', mtError, [mbOK], 1);
    Edit3.Color := clRed;
    Exit;
  end;

  if ChangeText = '' then
  begin
    MessageDlg('Changelog Text must not be empty!', mtError, [mbOK], 1);
    Memo5.Color := clRed;
    Exit;
  end;

  if GlobalFileName = '' then
    OnSaveClick(self)
  else begin
    ProjFile := TIniFile.Create(GlobalFileName);

    iL := Memo5.Lines.Count;
    ProjFile.WriteInteger('Changelogs', ChangeVersion, iL);

    for i := 0 to iL - 1 do
      ProjFile.WriteString(ChangeVersion, 'ChangeLine' + IntToStr(i), Memo5.Lines[i]);
    ListBox1.Items.Add(ChangeVersion);
  end;
end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.OnRemoveChangelogClick(Sender: TObject);
begin
//
end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.OnModifyChangelogClick(Sender: TObject);
begin
//
end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.OnChangelogVersionChange(Sender: TObject);
begin
  if Edit3.Color = clRed then
    Edit3.Color := clWindow;
end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.OnChangelogTextChange(Sender: TObject);
begin
  if Memo5.Color = clRed then
    Memo5.Color := clWindow;
end;

// =============================================================================
// 	
// =============================================================================

procedure TForm1.OnListBoxClick(Sender: TObject);
var
  SelectedVersion : String;

  ProjFile : TIniFile;
  iL : Integer;
  i : Integer;
begin
  SelectedVersion := ListBox1.Items.Strings[ListBox1.ItemIndex];

  if GlobalFileName = '' then
    OnSaveClick(self)
  else begin
    ProjFile := TIniFile.Create(GlobalFileName);
    iL := ProjFile.ReadInteger('Changelogs', SelectedVersion, 0);

    Memo5.Text := '';

    for i := 0 to iL - 1 do
      Memo5.Lines.Insert(i, ProjFile.ReadString(SelectedVersion, 'ChangeLine' + IntToStr(i), ''));
  end;
end;

end.
