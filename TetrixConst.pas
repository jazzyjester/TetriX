unit TetrixConst;

interface
uses
 Types,Graphics;

type
 TShapeType = (stDot,stFeat1,stFeat2,stBox,stLine,stZed1,stZed2,stShortLine,stTree);

const
 BrickSize    = 25;
 BrickMaxCount= 5; // Total number of bricks per shape.

 BoardXLines      = 10;
 BoardYLines      = 20;
 BoardShapeTipMax = 10;

 ShapesCount = 9;


 B_InitStart = 1000;
 B_ReStart   = 100;
 B_EndGame   = 0;

 VK_KeyP = 80;
 VK_KeyQ = 81;

 ShapesStruct : array[0..ShapesCount-1,0..BrickMaxCount-1] of TPoint = (

 ((X:1;Y:1), (X:0;Y:0),(X:0;Y:0),(X:0;Y:0),(X:0;Y:0)), //Dot
 ((X:1;Y:1), (X:2;Y:1),(X:3;Y:1),(X:3;Y:2),(X:0;Y:0)), //Feat1
 ((X:3;Y:1), (X:2;Y:1),(X:1;Y:1),(X:1;Y:2),(X:0;Y:0)), //Feat2
 ((X:1;Y:1), (X:1;Y:2),(X:2;Y:1),(X:2;Y:2),(X:0;Y:0)), //Box
 ((X:1;Y:1), (X:2;Y:1),(X:3;Y:1),(X:4;Y:1),(X:0;Y:0)), //Line
 ((X:1;Y:1), (X:2;Y:1),(X:2;Y:2),(X:3;Y:2),(X:0;Y:0)), //Zed 1
 ((X:3;Y:1), (X:2;Y:1),(X:2;Y:2),(X:1;Y:2),(X:0;Y:0)), //Zed 2
 ((X:1;Y:1), (X:2;Y:1),(X:0;Y:0),(X:0;Y:0),(X:0;Y:0)), //Short Line
 ((X:1;Y:1), (X:2;Y:1),(X:3;Y:1),(X:2;Y:2),(X:0;Y:0))  //Tree
 );


implementation

end.
