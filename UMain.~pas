unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UBoard, ExtCtrls, StdCtrls, Tilebmp, jpeg;

type
  TFormMain = class(TForm)
    Memo1: TMemo;
    Image: TImage;
    ShapeMain: TShape;
    Tiles: TTileBmp;
    ShapeFade: TShape;
    MainImage: TImage;
    OptionsImage: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
  protected

    { Private declarations }
  public
    Board:TBoard;
    ThemeIndex:Integer;
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
var
 R:TRect;
begin
 DoubleBuffered:=True;

 Board:=  TBoard.Create(self);
 Board.Parent:= Self;

 Width:= Screen.Width;
 Height:= Screen.Height;

 BorderStyle:= bsNone;

 WindowState:= wsMaximized;

 Board.Left:= (Screen.Width div 2) - (Board.Width div 2);
 Board.Top:=  (Screen.Height div 2) - (Board.Height div 2) + (Board.Height div 16) ;

 ShapeMain.Width:= Board.Width  + ShapeMain.Pen.Width*2;
 ShapeMain.Height:=Board.Height + ShapeMain.Pen.Width*2;
 ShapeMain.Top:=   Board.Top    - ShapeMain.Pen.Width;
 ShapeMain.Left:=   Board.Left  - ShapeMain.Pen.Width;

 Tiles.Width:= Screen.Width;
 Tiles.Height:= Screen.Height;
 Tiles.Left:=0;
 Tiles.Top:= 0;

 ShapeFade.Left:= ShapeMain.Left+5;
 ShapeFade.Top:=  ShapeMain.Top+5;
 ShapeFade.Width:= ShapeMain.Width;
 ShapeFade.Height:= ShapeMain.Height;

 MainImage.Top:= 0;
 MainImage.Left:= (Screen.Width div 2) - (MainImage.Width div 2);

 ThemeIndex:= 0;
end;

procedure TFormMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
    49:ThemeIndex:=0;
    50:ThemeIndex:=1;
    51:ThemeIndex:=2;
  end;

 Board.MyKeyDown(Sender,Key,Shift);


end;


procedure TFormMain.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 OnKeyDown(Sender,Key,Shift);
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
 Board.StartGame;
end;

end.
