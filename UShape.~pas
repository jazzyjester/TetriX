unit UShape;

interface

uses
 Classes,Windows,Graphics,TetrixConst,ContNrs,UBrick;

type
 TFindType = (ftXMin,ftYMin,ftMaxAll,ftXMax,ftYMax);
 TShapeStatus = (ssMoving,ssStanding);

type
 TBaseShape = class
  private
   BrickList:TObjectList;
    FBoardPoint: TPoint;
    FShapeStatus: TShapeStatus;
    FBoardPointInEnd: TPoint;
    function GetBricks(index: Integer): TBrick;
    procedure SetBricks(index: Integer; const Value: TBrick);
    function GetBrickCount: Integer;
    procedure SetBoardPoint(const Value: TPoint);
    procedure SetShapeStatus(const Value: TShapeStatus);
    procedure SetBoardPointInEnd(const Value: TPoint);
  public
   constructor Create;virtual;abstract;
   procedure Rotate(Dir:Byte); virtual;

   procedure IncreaseBoardX(IncBy:Integer);
   procedure IncreaseBoardY(IncBy:Integer);

   destructor Destroy; override;

  property Bricks[index:Integer]:TBrick read GetBricks write SetBricks;
  property BoardPoint:TPoint read FBoardPoint write SetBoardPoint;
  property BoardPointInEnd:TPoint read FBoardPointInEnd write SetBoardPointInEnd;
  property BricksCount:Integer read GetBrickCount;
  published


 end;

type
 TShape = class(TBaseShape)
  private
    function GetBrick(ind:Byte):TBrick;
  public
    ShapeType:TShapeType;
    procedure Rotate(Dir: Byte); override;

    function GetShapeName:string;
    function  FindBricksMax(FindType:TFindType):Byte;

    constructor Create(st:TShapeType);
    destructor Destroy; override;

  published

 end;


implementation

uses Math;

{ TBaseShape }

destructor TBaseShape.Destroy;
begin

  inherited;
end;


function TBaseShape.GetBrickCount: Integer;
begin
 Result:= BrickList.Count; 
end;

function TBaseShape.GetBricks(index: Integer): TBrick;
begin
 Result:= TBrick( BrickList.Items[index] );
end;



procedure TBaseShape.IncreaseBoardX(IncBy: Integer);
begin
 BoarDPoint:= Point(BoardPoint.X + IncBy,BoardPoint.Y);
end;

procedure TBaseShape.IncreaseBoardY(IncBy: Integer);
begin
 BoarDPoint:= Point(BoardPoint.X,BoardPoint.Y + IncBy);
end;

procedure TBaseShape.Rotate(Dir: Byte);
begin

end;

procedure TBaseShape.SetBoardPoint(const Value: TPoint);
begin
  FBoardPoint := Value;
end;

procedure TBaseShape.SetBoardPointInEnd(const Value: TPoint);
begin
  FBoardPointInEnd := Value;
end;

procedure TBaseShape.SetBricks(index: Integer; const Value: TBrick);
begin
 BrickList.Items[index]:= Value;
end;

procedure TBaseShape.SetShapeStatus(const Value: TShapeStatus);
begin
  FShapeStatus := Value;
end;

{ TShape }

constructor TShape.Create(st: TShapeType);
var
 i:Byte;
begin
  ShapeType:= ST;
  BrickList:= TObjectList.Create;

  for i:= 0 to BrickMaxCount - 1 do
   begin
    if (ShapesStruct[Ord(st),i].X <> 0) and
       (ShapesStruct[Ord(st),i].Y <> 0)  then
        BrickList.Add( TBrick.Create(Self,ShapesStruct[Ord(st),i],Ord(st) ) );
    end;

   BoardPoint:= Point( (BoardXLines div 2) - (FindBricksMax(ftMaxAll) div 2),0);

end;

destructor TShape.Destroy;
begin
  inherited;

  while BrickList.Count > 0 do
   BrickList.Remove(BrickList.Items[0]);

  BrickList.Free; 

end;

function TShape.GetBrick(ind: Byte): TBrick;
begin
 Result:= TBrick(BrickList.Items[ind]);
end;


function TShape.GetShapeName: string;
begin
 //Result:= ShapeNames[Ord( ShapeType )];
end;

function TShape.FindBricksMax(FindType:TFindType):Byte;
  var
   i:Byte;
  begin
    Result:=0;
    if FindType in [ftXMin,ftYMin] then
     Result:= FindBricksMax(ftMaxAll);

    for i:= 0 to BrickList.Count-1 do
     case FindType of
      ftMaxAll:if (Bricks[i].BrickPoint.X > Result) or
                  (Bricks[i].BrickPoint.Y > Result)  then
                   Result:= Max(Bricks[i].BrickPoint.X,Bricks[i].BrickPoint.Y);
      ftXMin:  if (Bricks[i].BrickPoint.X < Result) then
                   Result:= Bricks[i].BrickPoint.X;
      ftYMin:  if (Bricks[i].BrickPoint.Y < Result) then
                   Result:= Bricks[i].BrickPoint.Y;
      ftXMax:  if (Bricks[i].BrickPoint.X > Result) then
                   Result:= Bricks[i].BrickPoint.X;
      ftYMax:  if (Bricks[i].BrickPoint.Y > Result) then
                   Result:= Bricks[i].BrickPoint.Y;
     end;
  end;
procedure TShape.Rotate(Dir: Byte);
 procedure UpdateBricksPosition;
  var
   i:Byte;
   begin
    if FindBricksMax(ftXMin) > 1 then
     begin
      for i:=0 to BrickList.Count -1 do
       Bricks[i].BrickPoint:= Point(Bricks[i].BrickPoint.X -1,Bricks[i].BrickPoint.Y);
      UpdateBricksPosition;
     end;
    if FindBricksMax(ftYMin) > 1 then
     begin
      for i:=0 to BrickList.Count -1 do
       Bricks[i].BrickPoint:= Point(Bricks[i].BrickPoint.X ,Bricks[i].BrickPoint.Y-1);
      UpdateBricksPosition;
     end;

   end;
var
 i,Max:Byte;
begin
  inherited;
  Max:= FindBricksMax(ftMaxAll);
  for i:= 0 to BrickList.Count -1 do
   begin
     Bricks[i].BrickPoint:= Point(
            Max+1 - Bricks[i].BrickPoint.Y,
                    Bricks[i].BrickPoint.X);
   end;

   UpdateBricksPosition;

end;



end.
