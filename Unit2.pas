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
    ListBox1: TListBox;
    DBRadioGroup1: TDBRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    FileOpenDialog2: TFileOpenDialog;
    Memo1: TMemo;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Edit2: TEdit;
    Label1: TLabel;
    Memo2: TMemo;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    procedure example(Path: String; num,reg: Integer );
    procedure GetAllFiles( Path: string; Lb: TListBox );
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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
 SelectedFolder,buf: string;
 num,reg:Integer;
 i: Integer;
 begin
 /////Очистка списка файлов в очереди на анализ и обнуление числа найденных записей///
 listbox1.Clear;
 numM:=0;
 ////Множественное сканироование//////////////////////////////////////////////////////
 if(RadioButton1.Checked=true) then
  begin
    ///Выбираем папку////////////////////////////////////////////////////////////////
  FileOpenDialog1.Options := FileOpenDialog1.Options + [fdoPickFolders];
  if not FileOpenDialog1.Execute then
  Abort;
  SelectedFolder := FileOpenDialog1.FileName;
    /////Вызываем подфункцию получения списка файлов/////////////////////////////////
  GetAllFiles(SelectedFolder, listbox1 );
    //////Получаем количество файлов////////////////////
  num:=listbox1.Items.Count;
    //////Настраеваем прогресс бар для отображения процесса анализа списка файлов////
  ProgressBar2.position:= 0;
  ProgressBar2.max:=num;
    /////Очищаем буфер///////////////////////////////////////////////////////////////
  Memo1.Lines.Clear;
  for i := 0 to (num-1) do
    begin
    //////Инкрементирование прогресс барра списка файлов/////////////////////////////
      ProgressBar2.position:= i+1;
    //////Цикл чтения файлов/////////////////////////////////////////////////////////
      if(i=(num-1)) then reg:=0 else reg:=1;
    /////Вызов подфункция анализа одного файла///////////////////////////////////////
      example(listbox1.Items[i],numM,reg);
    ///////////Настройка вывода отладочной инфы//////////////////////////////////////
     if(reg=1) then
      begin
        Memo2.Lines.Add('File '+listbox1.Items[i]+' parsed');
        Memo2.Lines.Add(IntToStr(i+1)+'/'+ IntToStr(num)+'  analyzed');
      end;
    end;
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
  /////Вызов подфункция анализа одного файла////////////////////////////////////////
    example(buf,0,0);
  end;
////////////////////////////////////////////////////////////////////////////////////
end;
////////////////////////////////////////////////////////////////////////////////////
//////////Подфункция включающая поле ввода для фильтра анализируемых файлов/////////
//////////(РЕЖИМ С РЕГУЛЯРНЫМИ ВЫРАЖЕНИЯМИ//////////////////////////////////////////
procedure TForm2.CheckBox1Click(Sender: TObject);
begin
 If(Checkbox1.Checked=true) then
     begin
     Edit2.Show;
     end;
 If(Checkbox1.Checked=false) then
     begin
     Edit2.Hide;
     end;
end;
////////////////////////////////////////////////////////////////////////////////////
///////////Подфункция анализа одного файла//////////////////////////////////////////
procedure TForm2.example(Path: String; num,reg: Integer);
var f,f_save: TextFile ;
    rec,Path_Save:string;
    i,i_max,j: integer;
    List: TStringList;
begin
//////Получаем количиество строк в файле(нужно для ProgressBar)////////////////////
  List:= TStringList.Create;
  List.LoadFromFile(Path);
  i_max:=List.Count;
   // ;X
///////////////////////////////////////////////////////////////////////////////////
///Открываем файлы с переданнымх путем/////////////////////////////////////////////
  ////AssignFile(f, Path); X
  ////Reset(f); X
  //Настройка строки состояния/////////////////////////////////////////////////////
  Form2.ProgressBar1.position:= 0;
  Form2.ProgressBar1.max:= i_max;
  ////////Задаем путь с которым будут сохраняться файлы////////////////////////////
  Path_Save:=Path;
  Path_Save:= StringReplace(Path,'.log','_find.log',[rfReplaceAll, rfIgnoreCase]);
  ////////Непосредственно чтение файла/////////////////////////////////////////////
   i:=1;
   for j := 0 to i_max-2 do            //(i_max-1)
    begin
      rec:=List[i];
      //readln(f, rec);//////////Читаем строку//////////////////////////////////////
      //Memo2.Lines.Add(rec);//////вывод в консоль//////////////////////////////////
      Form2.ProgressBar1.position:= i;/////Индикация в прогресс баре//////////////
      i:=i+1;////Инкремент строки/////////////////////////////////////////////////
    //  Memo2.Lines.Add(rec);//////вывод в консоль//////////////////////////////////
      ///Поиск нужной фразы в строке(с исползование регулярных выражений//////////
      if RegEx.IsMatch(rec,Edit1.Text)then
        begin
          Memo2.Lines.Add(rec);//////вывод в консоль//////////////////////////////////
          Memo1.Lines.Add(rec);//Вывод в буфер////////////////////////////////////
          num:=num+1;//Инкремент счетчика найденных записей///////////////////////
        end;
    end;
    Memo1.Lines.SaveToFile(Path_Save);//Запись в файл данных из буфера//////////
    if(reg=0) then
    begin
      //Memo1.Lines.SaveToFile(Path_Save);//Запись в файл данных из буфера//////////
      ///////Сообщение об окончаний процедуры поиска//////////////////////////////
      Memo2.Lines.Add('File '+Path+' parsed');
      Memo2.Lines.Add('Parsing Completed');
      Memo2.Lines.Add('Found  '+IntToStr(num)+ ' records');
      ////////////////////////////////////////////////////////////////////////////
    end;
    Memo1.Lines.Clear;
    numM:=num;///Увеличение счетчика найденных записей(для множественного анализа/
    List.Free;
end;
//////////////////////////////////////////////////////////////////////////////////
//////Функция вызываемая при запуске программы////////////////////////////////////
procedure TForm2.FormCreate(Sender: TObject);
  begin
  //////Предварительная очистка и предустановка полей ввода///////////////////////
   Memo1.Lines.Clear;
   Memo2.Lines.Clear;
   Edit2.Clear;
   Edit2.Hide;
   Edit1.Clear;
   Edit1.Text:='Error';
  ////////////////////////////////////////////////////////////////////////////////
  end;
//////////////////////////////////////////////////////////////////////////////////
//////Подфункция получающя список файлов в папке//////////////////////////////////
procedure TForm2.GetAllFiles( Path: string; Lb: TListBox );
var
sRec: TSearchRec;
isFound: boolean;
begin
  isFound := FindFirst( Path + '\*.*', faAnyFile, sRec ) = 0;
  while isFound do
    begin
      if ( sRec.Name <> '.' ) and ( sRec.Name <> '..' ) then
      begin
        if ( sRec.Attr and faDirectory ) = faDirectory then
        GetAllFiles( Path + '\' + sRec.Name, Lb );
        if pos('.log',copy(sRec.Name, length(sRec.Name)-3,4))=1 then
          begin
 /////Настройка вкл/выкл фильтра файлов регулярными выражениями//////////////////
         ////////////////////////ВЫКЛ////////////////////////////////////////////
           if((CheckBox1.Checked=false))then
           Lb.Items.Add( Path + '\' + sRec.Name )
         ////////////////////////ВКЛ/////////////////////////////////////////////
           else if((CheckBox1.Checked=true) and (RegEx.IsMatch(Path + '\' + sRec.Name,Edit2.Text)))  then
           Lb.Items.Add( Path + '\' + sRec.Name )
 ////////////////////////////////////////////////////////////////////////////////
          end;
      end;
      Application.ProcessMessages;
      isFound := FindNext( sRec ) = 0;
  end;
  FindClose( sRec );
end;
/////////////////////////////////////////////////////////////////////////////////
end.
