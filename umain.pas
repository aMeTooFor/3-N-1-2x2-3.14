unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnRUN: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    TreeView1: TTreeView;
    procedure btnRUNClick(Sender: TObject);
  private

  public
    linelist: TStringList;
    // function GreenBeanGrain(aisGreen, xisBean, bisGrain: integer;
    //  const Green, Bean, Grain: integer): integer;
    function GreenBeanGrain(aisGreen, xisBean, bisGrain: longint;
      const Green, Bean, Grain: longint): integer;
    // function GreenBeanGrain(aisGreen, xisBean, bisGrain: int64;  const Green, Bean, Grain: int64): integer;

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

{ TfrmMain }

procedure TfrmMain.btnRUNClick(Sender: TObject);
var
  www: integer;
begin
  self.Memo1.Lines.Clear;
  self.linelist := TStringList.Create;
  www := GreenBeanGrain(2, 1, 1, 2, 1, 1);
  //if GreenBeanGrain(2, 1, 1, 2, 1, 1) = 1 then
  begin
    ShowMessage('ok=' + IntToStr(www));
    application.ProcessMessages;
    self.Memo1.Lines.Assign(self.linelist);
    ShowMessage('Memo=ok=' + IntToStr(linelist.Count));
    application.ProcessMessages; //290,980 // 1,652,927  //306  //256,244 //132,7070
    self.Memo1.Lines.SaveToFile('GreenBeanGrain.txt');
    ShowMessage('txt=ok');
  end;
  linelist.Free;
end;

//function TfrmMain.GreenBeanGrain(aisGreen, xisBean, bisGrain: int64; const Green, Bean, Grain: int64): integer;
function TfrmMain.GreenBeanGrain(aisGreen, xisBean, bisGrain: longint;
  const Green, Bean, Grain: longint): integer;
  //function TfrmMain.GreenBeanGrain(aisGreen, xisBean, bisGrain: integer;
  //  const Green, Bean, Grain: integer): integer;
var
  // a, b, x: int64;
  a, b, x: longint;
  //a, b, x: integer;
  gbg: integer;
  aa: integer;
  one: string;
begin
  gbg := 0;
  a := aisGreen;
  x := xisBean;
  b := bisGrain;

  //if a = 536870912 then  //536870912
  //  application.ProcessMessages;
  //if ((a = 256) and (b = 39)) then
  //  application.ProcessMessages;

  aa := 0;
  if gbg = 0 then
  begin
    while (((a mod 2) = 0) and ((b mod 2) = 0)) do
    begin

      if (((a mod 2) = 0) and ((b mod 2) = 0)) then
      begin
        if (((a mod 3) = 0) and ((b mod 3) = 1) and (a >= 3) and (b > 3)) then
        begin
          a := a div 3;
          b := (b - 1) div 3;
          aa := aa + 1;

        end;
        if a < Green then
          gbg := 1
        else if ((a = Green) and (b < Grain)) then
          gbg := 1;
      end;
      if (((a mod 2) = 0) and ((b mod 2) = 0)) then
      begin
        a := a div 2;
        b := b div 2;
      end;
    end;
    if a < Green then
      gbg := 1
    else if ((a = Green) and (b < Grain)) then
      gbg := 1;
  end;
  //////////////////////////////////////
 //if aa = 0  then
 // if gbg = 0 then
 // begin
 //   if (((a mod 2) = 0) and ((b mod 2) = 1)) then
 //   begin
 //     //while (((a mod 3) = 0) and ((b mod 3) = 1) and (a >= 3) and (b > 3)) do
 //     if (((a mod 3) = 0) and ((b mod 3) = 1) and (a >= 3) and (b > 3)) then
 //     begin     //a=18,b=13,     a=6k+4,multi 3 add 1 ,error???
 //       a := a div 3;
 //       b := (b - 1) div 3;
 //       aa := aa + 1;
 //       while (((a mod 2) = 0) and ((b mod 2) = 0)) do
 //       begin
 //         a := a div 2;
 //         b := b div 2;
 //       end;
 //     end;
 //
 //   end;
 //end;


  ////////////////////////////////////

  if aa = 0 then
    if gbg = 0 then
    begin
      while (((a mod 2) = 0) and ((b mod 2) = 1)) do
      begin
        a := a * 3;
        b := b * 3 + 1;

        while (((a mod 2) = 0) and ((b mod 2) = 0)) do
        begin
          a := a div 2;
          b := b div 2;
          if (((a mod 2) = 0) and ((b mod 2) = 0)) then
          begin
            if (((a mod 3) = 0) and ((b mod 3) = 1) and (a >= 3) and (b > 3)) then
            begin
              a := a div 3;
              b := (b - 1) div 3;
              aa := aa + 1;

            end;
            if a < Green then
              gbg := 1
            else if ((a = Green) and (b < Grain)) then
              gbg := 1;
          end;

        end;
        if aa>0 then break;
      end;
      //if a < 0 then
      //  application.ProcessMessages;
      if a < Green then
        gbg := 1
      else if ((a = Green) and (b < Grain)) then
        gbg := 1;
    end;




  //if 1=0 then
  if gbg = 1 then
  begin
    //if not ((a > 0) and (b>0) and  (Green > 0) and (Grain>0)) then
    //if  ((a > 0) and (b>0) and  (Green > 0) and (Grain>0)) then
    //if not ((a > 0) and (b > 0) and (Green > 0) and (Grain > 0)) then
    begin
      one := IntToStr(Green) + ' * N' + IntToStr(Bean) + ' + ' +
        IntToStr(Grain) + ' -->  ' + IntToStr(a) + ' * M' + IntToStr(x) +
        ' + ' + IntToStr(b) + ' ok ';
      linelist.add(one);
      //self.Memo1.Lines.add(one);
      //application.ProcessMessages;
      //  if linelist.Count>290980 then
      //     application.ProcessMessages;
    end;
  end;
  if gbg = 0 then
  begin
    //  gbg := GreenBeanGrain(aisGreen * 2, xisBean + 1, bisGrain, Green *
    //   2, Bean + 1, Grain);
    gbg := GreenBeanGrain(a * 2, x + 1, b, Green * 2, Bean + 1, Grain);
    //  if  (aisGreen * 2 mod 3)=0 then
    //     application.ProcessMessages;
    //  gbg := gbg * GreenBeanGrain(aisGreen * 2, xisBean + 1, aisGreen +
    //    bisGrain, Green * 2, Bean + 1, Green + Grain);
    gbg := gbg * GreenBeanGrain(a * 2, x + 1, a + b, Green * 2,
      Bean + 1, Green + Grain);
    //if gbg = 0 then
    //  ShowMessage('error');
    //if gbg = 0 then
    //  application.ProcessMessages;
  end;

  Result := gbg;
end;

end.
