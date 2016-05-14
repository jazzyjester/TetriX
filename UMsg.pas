unit UMsg;

interface

uses
 Classes,Windows,Graphics,TetrixConst,Dialogs,SysUtils,Controls;

type

 TMsg = class
 private
  Msg:TBitmap;
  Text:String;
  function GetCanvas:TCanvas;
 protected
    procedure Paint;
 public
    constructor Create(AOwner: TComponent;Str:string);
    destructor Destroy; override;

    function GetWidth:Integer;
    function GetHeight:Integer;
    procedure Show(Str:String);

 property Canvas:TCanvas Read GetCanvas;
 end;

implementation

{ TMsg }

constructor TMsg.Create(AOwner: TComponent; Str: string);
begin
  Msg:= TBitmap.Create;
  Msg.Width:= 220;
  Msg.Height:=120;

end;

destructor TMsg.Destroy;
begin
  inherited;
  Msg.Free;
end;

function TMsg.GetCanvas: TCanvas;
begin
 Result:= Msg.Canvas;
end;

function TMsg.GetHeight: Integer;
begin
 Result:= Msg.Height;
end;

function TMsg.GetWidth: Integer;
begin
 Result:= Msg.Width;
end;

procedure TMsg.Paint;
var
 TW:Integer;
begin

  with Msg.Canvas do
   begin
    Brush.Color:= ClRed;
    Pen.Width:=3;
    Pen.Color:=ClBlack;
    Pen.Style:= psSolid;

    brush.Color:= RGB(80,80,80);
    Rectangle(0,0,Msg.Width,Msg.Height);

    Font.Name:= 'Tahoma';
    Font.Size:= 22;
    Font.Color:= clSilver;

    TW:= (Msg.Width div 2) - ((Length(Text) * (Font.Size div 2) + (Font.Size div 4)*8 + (Font.Size div 8)*8) div 2);
    TextOut(TW,5,Text);

    Font.Size:= 18;
    Font.Color:= clGray;

    Text:= 'Press Enter';
    TW:= (Msg.Width div 2) - ((Length(Text) * (Font.Size div 2) + (Font.Size div 4)*6 + (Font.Size div 8)*6) div 2);
    TextOut(TW,70,Text);


   end;

end;

procedure TMsg.Show(Str: String);
begin
  Text:= Str;
  Paint;
end;

end.
