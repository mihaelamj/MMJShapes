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

 ```    
   self.drawingView.shapeType = SStar;
   self.drawingView.frameSize = 5;
   self.drawingView.shapeFill = FStriped;
```
![Clicky](<a title="Real Time Web Analytics" href="http://clicky.com/100629064"><img alt="Real Time Web Analytics" src="//static.getclicky.com/media/links/badge.gif" border="0" /></a>
<img alt="Clicky" width="1" height="1" src="//in.getclicky.com/100629064ns.gif" />)



