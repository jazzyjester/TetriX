unit UBrick;

interface

uses
 Classes,Windows,Graphics,TetrixConst,Dialogs,SysUtils;

 type
  TBrickType  = (btRegular);

 type
  TBaseBrick = class
  private
   iWidth:Integer;
   iHeight:Integer;
   iBorderWidth:Byte;
   sBrickType:TBrickType;
    FSenderObj: TObject;
   iBrickPoint:TPoint;
    FShapeOffset: Integer;
   procedure SetBrickPoint(const Value: TPoint);
   procedure SetSenderObj(const Value: TObject);
    procedure SetShapeOffset(const Value: Integer);
  public
   constructor Create(Sender:TObject;P:TPoint;Off:Integer; W: Integer = BrickSize; H: Integer = BrickSize); virtual;abstract;
   procedure DrawBrick(Canvas:TCanvas;T:TRect); virtual;abstract;
    procedure DrawBrickEx(Canvas: TCanvas;T:TRect;Val:Integer);virtual;abstract;
  published
   property BrickPoint:TPoint read iBrickPoint write SetBrickPoint;
   property BrickType:TBrickType read sBrickType write sBrickType;
   property SenderObj:TObject read FSenderObj write SetSenderObj;
   property ShapeOffset:Integer read FShapeOffset write SetShapeOffset;
  end;


 type
  TBrick = class(TBaseBrick)
  public
    constructor Create(Sender:TObject;P:TPoint;Off:Integer; W: Integer = BrickSize; H: Integer = BrickSize); override;
    procedure ShowBrickDesc;
    procedure DrawBrick(Canvas: TCanvas;T:TRect); override;
    procedure DrawBrickEx(Canvas: TCanvas;T:TRect;Val:Integer); override;


  published
   property BrickPoint;
  end;

implementation

{ TBrick }


{ TBrick }
uses UShape,UMain;

constructor TBrick.Create(Sender:TObject;P: TPoint;Off:Integer;W, H: Integer);
begin
 inherited;
 iWidth := W;
 iHeight := H;
 iBorderWidth := 1;
 BrickType:= btRegular;
 BrickPoint:= P;
 SenderObj:= Sender; // Shape Connector
 ShapeOffset:= Off;
end;

procedure TBrick.DrawBrick(Canvas: TCanvas;T:TRect);
var
 R:TRect;
 i:Integer;
begin
  inherited;
  R:= T;

  BitBlt(Canvas.Handle,R.Left,R.Top,BrickSize,BrickSize,FormMain.Image.Picture.Bitmap.Canvas.Handle,ShapeOffset*BrickSize, FormMain.ThemeIndex*BrickSize ,SRCCOPY);
  
end;

procedure TBrick.DrawBrickEx(Canvas: TCanvas; T: TRect;Val:Integer);
var
 R:TRect;
begin
  inherited;
  R:= T;
  with Canvas do
   begin
    brush.Color:= RGB(105 - Val*2,105 - Val*2,105 - Val*2);
    Rectangle(T.Left,T.Top,T.Right,T.Bottom);
   end;

end;

procedure TBrick.ShowBrickDesc;
var
 Str:String;
begin

 Str:=       Format('Point[X]=%d',[BrickPoint.X]) + #10#13;
 Str:= Str + Format('Point[Y]=%d',[BrickPoint.Y]) + #10#13;

// Str:= Str + Format('BoardPoint[Y]=%d',[BoardPoint.Y]) + #10#13;
// Str:= Str + Format('BoardPoint[Y]=%d',[BoardPoint.Y]) + #10#13;

 Str:= Str + Format('ShapeName=%s',[TShape(SenderObj).GetShapeName]) + #10#13;

 ShowMessage( Str );
end;

{ TBaseBrick }


procedure TBaseBrick.SetBrickPoint(const Value: TPoint);
begin
 iBrickPoint:= Value;
end;

procedure TBaseBrick.SetSenderObj(const Value: TObject);
begin
  FSenderObj := Value;
end;

procedure TBaseBrick.SetShapeOffset(const Value: Integer);
begin
  FShapeOffset := Value;
end;

end.
