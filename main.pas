unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.Grids, AdvObj, BaseGrid, AdvGrid, AdvEdit, AdvEdBtn, AdvFileNameEdit,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, Registry, Vcl.ExtDlgs,DateUtils, Vcl.Menus;

type
  TfMain = class(TForm)
    Label1: TLabel;
    cbChannelName: TComboBox;
    Label2: TLabel;
    sePartSize: TSpinEdit;
    fNameEdit: TAdvFileNameEdit;
    dataGrid: TAdvStringGrid;
    sePartIndex: TSpinEdit;
    Label3: TLabel;
    Chart1: TChart;
    lAllDiscreetCount: TLabel;
    bShowData: TButton;
    Series1: TLineSeries;
    bSaveToFile: TButton;
    saveFileDialog: TSaveTextFileDialog;
    MainMenu1: TMainMenu;
    Program1: TMenuItem;
    About1: TMenuItem;
    mExitProgram: TMenuItem;
    procedure fNameEditChange(Sender: TObject);
    procedure sePartSizeChange(Sender: TObject);
    procedure sePartIndexChange(Sender: TObject);
    procedure RecalcFrameIndexes();
    procedure ReadingBinaryFile();
    procedure FillDataGrid();
    procedure DrawChart();
    procedure LoadReestrData();
    procedure SaveReestrData();
    function CheckDemoPeriod(): boolean;
    procedure EnablingForm(makeEnable: boolean);
    procedure bShowDataClick(Sender: TObject);
    procedure cbChannelNameChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bSaveToFileClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mExitProgramClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    filePath: string;
    discreetCount: integer;
    leftLimit: integer;
    rightLimit: integer;
    component: string;
    signalData: array of integer;

    startAmount: integer;
    dtFirstStart: string;
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

uses activationForm, aboutForm;

procedure TfMain.ReadingBinaryFile();
var
  f: file;
  i: integer;
  startSeek, seekValue: integer;
begin
   if length(filePath)=0 then
      begin
         discreetCount:=0;
         setLength(signalData,0);
         exit();
      end;


   SetLength(signalData,rightLimit-leftLimit);
   assignFile(f, filePath);
   FileMode:=fmOpenRead;
   reset(f,1);

   startSeek:=336+12*leftLimit;
   if component='X' then
      startSeek:=startSeek+4;
   if component='Y' then
      startSeek:=startSeek+8;

   seekValue:=startSeek;
   for i := 0 to rightLimit-leftLimit-1 do
     begin
        seek(f, seekValue);
        blockRead(f, signalData[i], 4);
        seekValue:=seekValue+12;
     end;
   closefile(f);
end;

procedure TfMain.recalcFrameIndexes();
begin
    leftLimit:=sePartSize.Value*sePartIndex.Value;
    rightLimit:=sePartSize.Value*(sePartIndex.Value+1);
    if rightLimit>discreetCount-1 then
      rightLimit:=discreetCount-1;
end;

procedure TfMain.FillDataGrid();
var
    i: integer;
begin
    dataGrid.RowCount:=2;
    dataGrid.Cells[0,1]:='';
    dataGrid.Cells[1,1]:='';

    if length(signalData)=0 then
      exit();

    dataGrid.RowCount:=length(signalData)+1;
    for I := 1 to length(signalData) do
      begin
        dataGrid.Cells[0,i]:=inttostr(leftLimit+i);
        dataGrid.Cells[1,i]:=inttostr(signalData[i-1]);
      end;
end;

procedure TfMain.DrawChart();
var
    i: integer;
begin
  Chart1.Series[0].Clear;

    if length(signalData)=0 then
      exit();

  for I := 0 to length(signalData)-1 do
    begin
      Chart1.Series[0].AddXY(leftLimit+i, signalData[i]);
    end;

end;

procedure TfMain.bShowDataClick(Sender: TObject);
begin
    readingbinaryfile();
    fillDataGrid();
    drawChart();
end;

procedure TfMain.LoadReestrData();
var
  fReestr: TRegIniFile;
begin
   fReestr:=TRegIniFile.Create('Software');
   startAmount:=FReestr.ReadInteger('BinViewer','StartAmount',0);
   dtFirstStart:=FReestr.ReadString('BinViewer','DtFirstStart','NULL');
   FreeAndNil(FReestr);
end;

procedure TfMain.mExitProgramClick(Sender: TObject);
begin
  close();
end;

procedure TfMain.SaveReestrData();
var
  fReestr: TRegIniFile;
begin
   fReestr:=TRegIniFile.Create('software'); // Инициализируем
   fReestr.WriteInteger('BinViewer','StartAmount',startAmount);
   if dtFirstStart='NULL' then
      dtFirstStart:=datetimetostr(now());
   fReestr.WriteString('BinViewer','DtFirstStart', dtFirstStart);
   FreeAndNil(fReestr);
end;

function TfMain.CheckDemoPeriod(): boolean;
var
  dateTimeStartValue: TDateTime;
  currentDateValue: TDateTime;
  daysCount: integer;
begin
  if dtFirstStart='NULL' then
    result:=False
  else
     dateTimeStartValue:=strtodatetime(dtFirstStart);
  currentDateValue:=now();

  daysCount:=DaysBetween(currentDateValue,dateTimeStartValue);
  if (startAmount<50) and (daysCount<=30) then
    result:=True
  else
    result:=False;
end;

procedure TfMain.About1Click(Sender: TObject);
begin
  fAbout.Show();
end;

procedure TfMain.bSaveToFileClick(Sender: TObject);
var
   outputFileName: string;
   f: textFile;
   i: integer;
   line: string;
begin
   if length(signalData)=0 then
      begin
        showmessage('No data for saving');
        exit();
      end;

  if saveFileDialog.Execute then
  begin
     outputFileName:=saveFileDialog.FileName;
     assignfile(f,outputFileName);
     rewrite(f);
     line:='Id'+chr(9)+'Value';
     writeln(f,line);
     for I := 1 to length(signalData)+1 do
      begin
        line:=inttostr(i+leftLimit)+chr(9)+inttostr(signalData[i-1]);
        writeln(f,line);
      end;
     closefile(f);
  end;
end;

procedure TfMain.cbChannelNameChange(Sender: TObject);
begin
  component:=cbChannelName.Text;
end;

procedure TfMain.fNameEditChange(Sender: TObject);
var
  f: file of byte;
  fileSize: integer;
begin
  filePath:=fNameEdit.FileName;
  assignfile(f, filePath);
  reset(f);
  fileSize:=System.FileSize(f);
  CloseFile(f);
  discreetCount:=Trunc((fileSize-336)/12);
  lAllDiscreetCount.Caption:='All discreet count: '+inttostr(discreetCount);
  sePartSize.maxValue:=discreetCount;
end;


procedure TfMain.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  resize:=False;
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  component:='Z';
end;

procedure TfMain.EnablingForm(makeEnable: boolean);
begin
   fNameEdit.Enabled:=makeEnable;
   cbChannelName.Enabled:=makeEnable;
   sePartSize.Enabled:=makeEnable;
   sePartIndex.Enabled:=makeEnable;
   bShowData.Enabled:=makeEnable;
   bSaveToFile.Enabled:=makeEnable;
end;

procedure TfMain.FormShow(Sender: TObject);
var
  isCorrectDemo: boolean;
begin
  LoadReestrData();
  startAmount:=startAmount+1;
  isCorrectDemo:=CheckDemoPeriod();
  if isCorrectDemo then
    begin
       SaveReestrData();
       EnablingForm(true);
       exit();
    end;
    Application.CreateForm(TfLicKey, fLicKey);
    fLicKey.ShowModal();
    if fLicKey.isCorrectKey then
      begin
         dtFirstStart:='NULL';
         startAmount:=0;
         SaveReestrData();
         EnablingForm(true);
      end
    else
      EnablingForm(false);
end;

procedure TfMain.sePartIndexChange(Sender: TObject);
begin
   recalcFrameIndexes();
end;

procedure TfMain.sePartSizeChange(Sender: TObject);
var
  partCount: integer;
begin
  partCount:=Trunc(discreetCount/sePartSize.Value)+1;
  sePartIndex.MaxValue:=partCount-1;
  recalcFrameIndexes();
end;

end.
