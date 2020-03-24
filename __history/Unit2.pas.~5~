unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, System.RegularExpressions,
  Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    FileOpenDialog1: TFileOpenDialog;
    DBRadioGroup1: TDBRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    FileOpenDialog2: TFileOpenDialog;
    Memo1: TMemo;
    Edit1: TEdit;
    Label1: TLabel;
    Memo2: TMemo;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    procedure example(Path: String; num,reg: Integer );
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  numM:Integer;
  RegEx:TRegEx;

implementation

{$R *.dfm}

////////////ЗАПУСК АНАЛИЗА////////////////////////////////////////////////////////////
 procedure TForm2.Button1Click(Sender: TObject);
 var
 buf: string;
 num,reg:Integer;
 i: Integer;
 begin
 ////Множественное сканироование//////////////////////////////////////////////////////
 if(RadioButton1.Checked=true) then
  begin

  end;
/////////////////////////////////////////////////////////////////////////////////////
///Одиночное сканирование////////////////////////////////////////////////////////////
 if(RadioButton2.Checked=true) then
  begin
  ////Указание пути к файлу//////////////////////////////////////////////////////////
   if not FileOpenDialog2.Execute then
    Abort;
    buf := FileOpenDialog2.FileName;
  ///Очистка буфера/////////////////////////////////////////////////////////////////
    Memo1.Lines.Clear;
  /////Вызов подфункции анализа одного файла////////////////////////////////////////
    example(buf,0,0);
  end;
////////////////////////////////////////////////////////////////////////////////////
end;
////////////////////////////////////////////////////////////////////////////////////
///////////Подфункция анализа одного файла//////////////////////////////////////////
procedure TForm2.example(Path: String; num,reg: Integer);
var f,f_save: TextFile ;
    rec,Path_Save:string;
    i,i_max: integer;
    List: TStringList;
begin
//////Получаем количиество строк в файле(нужно для ProgressBar)////////////////////
  List:= TStringList.Create;
  List.LoadFromFile(Path);
  i_max:=List.Count;
  List.Free;
///////////////////////////////////////////////////////////////////////////////////
///Открываем файлы с переданнымх путем/////////////////////////////////////////////
  AssignFile(f, Path);
  Reset(f);
  //Настройка строки состояния/////////////////////////////////////////////////////
  Form2.ProgressBar1.position:= 0;
  Form2.ProgressBar1.max:= i_max;
  ////////Задаем путь с которым будут сохраняться файлы////////////////////////////
  Path_Save:=Path;
  Path_Save:= StringReplace(Path,'.log','_find.log',[rfReplaceAll, rfIgnoreCase]);
  ////////Непосредственно чтение файла/////////////////////////////////////////////
  if IOResult <> 0 then
    begin
      ShowMessage('Ошибка открытия файла log.');
      Exit;
    end;
  i:=1;
  while not EOF(f) do
    begin
      readln(f, rec);//////////Читаем строку//////////////////////////////////////
      Form2.ProgressBar1.position:= i;/////Индикация в прогресс баре//////////////
      i:=i+1;////Инкремент строки/////////////////////////////////////////////////
      Memo2.Lines.Add(rec);//////вывод в консоль//////////////////////////////////
      ///Поиск нужной фразы в строке(с исползование регулярных выражений//////////
      if RegEx.IsMatch(rec,Edit1.Text)then
        begin
          Memo1.Lines.Add(rec);//Вывод в буфер////////////////////////////////////
          num:=num+1;//Инкремент счетчика найденных записей///////////////////////
        end;
    end;
  if(reg=0) then
    begin
      Memo1.Lines.SaveToFile(Path_Save);//Запись в файл данных из буфера//////////
      ///////Сообщение об окончаний процедуры поиска//////////////////////////////
      Memo2.Lines.Add('File '+Path+' parsed');
      Memo2.Lines.Add('Parsing Completed');
      Memo2.Lines.Add('Found  '+IntToStr(num)+ ' records');
      ////////////////////////////////////////////////////////////////////////////
    end;
    CloseFile(f);////Закрытие файла///////////////////////////////////////////////
end;
//////////////////////////////////////////////////////////////////////////////////
//////Функция вызываемая при запуске программы////////////////////////////////////
procedure TForm2.FormCreate(Sender: TObject);
  begin
  //////Предварительная очистка и предустановка полей ввода///////////////////////
   Memo1.Lines.Clear;
   Memo2.Lines.Clear;
   Edit1.Clear;
   Edit1.Text:='Error';
  ////////////////////////////////////////////////////////////////////////////////
  end;
//////////////////////////////////////////////////////////////////////////////////

end.
