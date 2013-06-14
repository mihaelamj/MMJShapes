MMJShapes - Playing with UIBezierPath
=============


## Shapes

Drag the included **UIBezierPath_MMJBezierPathShapes.h, UIBezierPath_MMJBezierPathShapes.m, MMJDrawingView.h, MMJDrawingView.m and MMJShapeTypes.h** files into your project.

**MMJDrawingView** is a custom UIView with properties:

* shapeType
* shapeFill
* color
* frameColor
* frameSize

### ShapeType

* SRect
* SRoundRect
* SDiamond
* SPolygon
* STriangle
* SHeart
* SClover
* SSpades
* SOval
* SStar

### ShapeFill

* FFull,
* FOpen,
* FStriped

## Using
* add UIView to your storyboard/xib, or create in code
* put MMJDrawingView as a (super)class. 

Code in your ViewController may look like this:

 ``òbjc    
   self.drawingView.shapeType = SStar;
   self.drawingView.frameSize = 5;
   self.drawingView.shapeFill = FStriped;
```



