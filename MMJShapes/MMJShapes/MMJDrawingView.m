//
//  MMJDrawingView.m
//  MMJShapes
//
//  Created by Mihaela Mihaljević Jakić on 6/11/13.
//  Copyright (c) 2013 Token d.o.o. All rights reserved.
//

#import "MMJDrawingView.h"
#import "MMJShapeTypes.h"
#import "UIBezierPath_MMJBezierPathShapes.h"

@interface MMJDrawingView()

@property (nonatomic) CGRect initRect;
@property (nonatomic) CGFloat initSizeFactor;

@end

@implementation MMJDrawingView

#pragma mark - Properties

@synthesize shapeType = _shapeType, color = _color, frameColor = _frameColor, frameSize = _frameSize, shapeFill = _shapeFill;

- (CGRect)initRect
{
    if (CGRectIsEmpty(_initRect)) _initRect = CGRectMake(self.bounds.origin.x, self.bounds.origin.y, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    return _initRect;
}

- (ShapeType)shapeType
{
    if (_shapeType < SSquare || _shapeType > SStar) _shapeType = SSquare;
    return _shapeType;
}

- (void)setShapeType:(ShapeType)shapeType
{
    _shapeType = shapeType;
    [self setNeedsDisplay];
}

- (ShapeFill)shapeFill
{
    if (_shapeFill < FFull || _shapeFill > FStriped) _shapeFill = FFull;
    return _shapeFill;
}

- (void)setShapeFill:(ShapeFill)shapeFill
{
    _shapeFill = shapeFill;
    [self setNeedsDisplay];
}

#define SCALE_FACTOR  0.3

-(void)setSizeStep:(NSUInteger)sizeStep
{
    _sizeStep = sizeStep;
    if (_sizeStep) {        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate: self];
        [UIView setAnimationDuration:2];
        [UIView setAnimationDelay:0];
        
        CGAffineTransform scaleTransform = CGAffineTransformScale(self.transform, (CGFloat)(_sizeStep * SCALE_FACTOR), (CGFloat)(_sizeStep * SCALE_FACTOR) );
        self.transform = scaleTransform;
        [UIView commitAnimations];
    } else {
        self.transform = CGAffineTransformIdentity;
    }
    [self setNeedsDisplay];
}

- (UIColor *)color
{
    return _color ? _color : [[UIColor alloc] initWithRed:1.0 green:0.0 blue:0.0 alpha:1];
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    [self setNeedsDisplay];
}

- (UIColor *)frameColor
{
    return _frameColor ? _frameColor : [UIColor blackColor];
}

- (void)setFrameColor:(UIColor *)frameColor
{
    _frameColor = frameColor;
    [self setNeedsDisplay];
}

- (CGFloat)frameSize
{
    return _frameSize;
}

- (void)setFrameSize:(CGFloat)frameSize
{
    _frameSize = frameSize;
    [self setNeedsDisplay];
}

#pragma mark - Drawing

- (void) drawRect:(CGRect)rect
{
    switch (self.shapeType)
    {
        case SSquare :
            [UIBezierPath mmjBezierPathSquare:rect color:self.color frameColor:self.frameColor frameSize:self.frameSize fill:self.shapeFill];
            break;
        case SDiamond :
            [UIBezierPath mmjBezierPathDiamond:rect color:self.color frameColor:self.frameColor frameSize:self.frameSize fill:self.shapeFill];
            break;
        case SPolygon:
            [UIBezierPath mmjBezierPathPolygon:rect color:self.color frameColor:self.frameColor frameSize:self.frameSize fill:self.shapeFill];
            break;
        case STriangle :
            [UIBezierPath mmjBezierPathTriangle:rect color:self.color frameColor:self.frameColor frameSize:self.frameSize fill:self.shapeFill];
            break;
        case SHeart :
            [UIBezierPath mmjBezierPathHeart:rect color:self.color frameColor:self.frameColor frameSize:self.frameSize fill:self.shapeFill];
            break;
        case SClover :
            [UIBezierPath mmjBezierPathClover:rect color:self.color frameColor:self.frameColor frameSize:self.frameSize fill:self.shapeFill];
            break;
        case SSpades :
            [UIBezierPath mmjBezierPathSpades:rect color:self.color frameColor:self.frameColor frameSize:self.frameSize fill:self.shapeFill];
            break;
        case SOval :
            [UIBezierPath mmjBezierPathOval:rect color:self.color frameColor:self.frameColor frameSize:self.frameSize fill:self.shapeFill];
            break;
        case SStar :
            [UIBezierPath mmjBezierPathStar:rect color:self.color frameColor:self.frameColor frameSize:self.frameSize fill:self.shapeFill];
            break;
        default:
            break;
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];//CGRectZero
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        [self setColor:[UIColor clearColor]];
        self.initSizeFactor = 1;
    }
    return self;
}

@end
