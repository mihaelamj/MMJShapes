//
//  UIBezierPath_MMJBezierPathShapes.m
//  MMJShapes
//
//  Created by Mihaela Mihaljević Jakić on 6/12/13.
//  Copyright (c) 2013 Token d.o.o. All rights reserved.
//

//star triangle ne rade

#import "UIBezierPath_MMJBezierPathShapes.h"

@implementation UIBezierPath(MMJShape)

#pragma mark - Helpers

#define STRIPE_LINE_WIDTH 0.02;
#define STRIPE_LINE_DISTANCE 2.95;

+ (void)shadePath:(UIBezierPath *)path fill:(ShapeFill)fill color:(UIColor *)color frame:(CGRect)frame
{
    switch(fill)
    {
        case FFull :
            [color setFill];
            [path fill];
            break;
        case FOpen :
            [[UIColor clearColor] setFill];
            [path fill];
            break;
        case FStriped : {
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSaveGState(context);
            [path addClip];
            [color setStroke];
            UIBezierPath *stripes = [[UIBezierPath alloc] init];
            
            CGPoint startPoint = frame.origin;
            CGPoint endPoint = startPoint;
            CGFloat lineThickness = frame.size.height / 2 * STRIPE_LINE_WIDTH;
            CGFloat lineDistance = lineThickness * STRIPE_LINE_DISTANCE;
            
            do {
                startPoint.y += lineDistance;
                endPoint.y += lineDistance;
                endPoint.x += CGRectGetMaxX(frame);
                [stripes moveToPoint:startPoint];
                [stripes addLineToPoint:endPoint];                
            } while (startPoint.y < CGRectGetMaxY(frame));
            
            stripes.lineWidth = lineThickness;
            [stripes stroke];
            CGContextRestoreGState(UIGraphicsGetCurrentContext());            
        }
    }
}

+ (void)finishShapePath:(UIBezierPath *)path color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill frame:(CGRect)frame
{    
    [path closePath];
    
    [self shadePath:path fill:fill color:color frame:frame];
    
    if (frameSize) {
        [frameColor setStroke];
        path.lineWidth = frameSize;
        [path stroke];
    }
}

+ (CGRect)fittingRect:(CGRect)rect frameSize:(CGFloat)frameSize
{    
    if (!frameSize) return rect;
    return CGRectMake(frameSize, frameSize, CGRectGetWidth(rect) - (frameSize * 2), CGRectGetHeight(rect) - (frameSize *2));
}

#pragma mark - Shape Drawing

+ (UIBezierPath *)mmjBezierPathRect:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill
{
    CGRect frame = [self fittingRect:rect frameSize:frameSize];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:frame];//can call with self
        
    [self finishShapePath:path color:color frameColor:frameColor frameSize:frameSize fill:fill frame:frame];
    return path;
}

#define RECT_RADIUS 15

+ (UIBezierPath *)mmjBezierPathRoundRect:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill
{
    CGRect frame = [self fittingRect:rect frameSize:frameSize];

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:frame cornerRadius:RECT_RADIUS];
    
    [self finishShapePath:path color:color frameColor:frameColor frameSize:frameSize fill:fill frame:frame];
    return path;
}

+ (UIBezierPath *)mmjBezierPathTriangle:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill
{
    CGRect frame = [self fittingRect:rect frameSize:frameSize];
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    
    [trianglePath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.00962 * CGRectGetHeight(frame))];
    [trianglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.02174 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.97115 * CGRectGetHeight(frame))];
    [trianglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.99275 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.97115 * CGRectGetHeight(frame))];
    [trianglePath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.00962 * CGRectGetHeight(frame))];

    [self finishShapePath:trianglePath color:color frameColor:frameColor frameSize:frameSize fill:fill frame:frame];    
    return trianglePath;
}

+ (UIBezierPath *)mmjBezierPathDiamond:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill
{
    UIBezierPath *diamondPath = [UIBezierPath bezierPath];
    [diamondPath addClip];
    
    [diamondPath moveToPoint:CGPointMake(CGRectGetMaxX(rect) / 2, frameSize)];
    [diamondPath addLineToPoint:CGPointMake(frameSize, CGRectGetHeight(rect) / 2)];
    [diamondPath addLineToPoint:CGPointMake(CGRectGetMaxX(rect) / 2, CGRectGetHeight(rect) - frameSize)];
    [diamondPath addLineToPoint:CGPointMake(CGRectGetMaxX(rect) - frameSize, CGRectGetHeight(rect) / 2) ];
    
    [self finishShapePath:diamondPath color:color frameColor:frameColor frameSize:frameSize fill:fill frame:rect];
    return diamondPath;
}


+ (UIBezierPath *)mmjBezierPathPolygon:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill
{
    CGRect frame = [self fittingRect:rect frameSize:frameSize];
    
    UIBezierPath *polygonPath = [UIBezierPath bezierPath];
    
    [polygonPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.03947 * CGRectGetHeight(frame))];
    [polygonPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.98634 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.39406 * CGRectGetHeight(frame))];
    [polygonPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.80057 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96779 * CGRectGetHeight(frame))];
    [polygonPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.19943 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96779 * CGRectGetHeight(frame))];
    [polygonPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.01366 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.39406 * CGRectGetHeight(frame))];
    
    [self finishShapePath:polygonPath color:color frameColor:frameColor frameSize:frameSize fill:fill frame:frame];    
    return polygonPath;
}


+ (UIBezierPath *)mmjBezierPathOval:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill
{
    CGRect frame = [self fittingRect:rect frameSize:frameSize];    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:frame];
    
    [self finishShapePath:path color:color frameColor:frameColor frameSize:frameSize fill:fill frame:frame];
    return path;
}


+ (UIBezierPath *)mmjBezierPathHeart:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill
{    
    CGRect frame = [self fittingRect:rect frameSize:frameSize];      
    UIBezierPath* heartPath = [UIBezierPath bezierPath];
    
    [heartPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.89597 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.11732 * CGRectGetHeight(frame))];
    [heartPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.89597 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.58320 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 1.00395 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24597 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 1.00395 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.45455 * CGRectGetHeight(frame))];
    [heartPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.51317 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.97917 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.87379 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.60963 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.53985 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96360 * CGRectGetHeight(frame))];
    [heartPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.51245 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.97917 * CGRectGetHeight(frame))];
    [heartPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50331 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.97917 * CGRectGetHeight(frame))];
    [heartPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10078 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.58320 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.47553 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96344 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.12377 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.61059 * CGRectGetHeight(frame))];
    [heartPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10078 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.11732 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + -0.00721 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.45455 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + -0.00721 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24597 * CGRectGetHeight(frame))];
    [heartPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.49183 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.11732 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.20876 * CGRectGetWidth(frame), CGRectGetMinY(frame) + -0.01133 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.38384 * CGRectGetWidth(frame), CGRectGetMinY(frame) + -0.01133 * CGRectGetHeight(frame))];
    [heartPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.49838 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.12538 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.49406 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.11997 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.49624 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.12266 * CGRectGetHeight(frame))];
    [heartPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50492 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.11732 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.50051 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.12266 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.50269 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.11997 * CGRectGetHeight(frame))];
    [heartPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.89597 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.11732 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.61290 * CGRectGetWidth(frame), CGRectGetMinY(frame) + -0.01133 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.78798 * CGRectGetWidth(frame), CGRectGetMinY(frame) + -0.01133 * CGRectGetHeight(frame))];

    [self finishShapePath:heartPath color:color frameColor:frameColor frameSize:frameSize fill:fill frame:frame];   
    return heartPath;
}

+ (UIBezierPath *)mmjBezierPathStar:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill
{
    CGRect frame = [self fittingRect:rect frameSize:frameSize];
    UIBezierPath * starPath = [UIBezierPath bezierPath];
    
    [starPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.04730 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.64908 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.33892 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.95968 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.39746 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.74122 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.63623 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.78410 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96403 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81997 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.21590 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96403 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.25878 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.63623 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.04032 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.39746 * CGRectGetHeight(frame))];
    [starPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.35092 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.33892 * CGRectGetHeight(frame))];
    
    [self finishShapePath:starPath color:color frameColor:frameColor frameSize:frameSize fill:fill frame:frame];    
    return starPath;
}


+ (UIBezierPath *)mmjBezierPathClover:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill
{
    CGRect frame = [self fittingRect:rect frameSize:frameSize];
    UIBezierPath *cloverPath = [UIBezierPath bezierPath];
    
    [cloverPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.68547 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09067 * CGRectGetHeight(frame))];
    [cloverPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.74659 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.33265 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.75984 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.15610 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.78022 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.25105 * CGRectGetHeight(frame))];
    [cloverPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.89859 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.39836 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.80217 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.33890 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.85590 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.36081 * CGRectGetHeight(frame))];
    [cloverPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.89859 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.72472 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 1.00102 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.48848 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 1.00102 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.63460 * CGRectGetHeight(frame))];
    [cloverPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.59836 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.76912 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.81737 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.79617 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.69615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81097 * CGRectGetHeight(frame))];
    [cloverPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.59836 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96154 * CGRectGetHeight(frame))];
    [cloverPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.40164 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96154 * CGRectGetHeight(frame))];
    [cloverPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.40164 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.76912 * CGRectGetHeight(frame))];
    [cloverPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10141 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.72472 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.30385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81097 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.18263 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.79617 * CGRectGetHeight(frame))];
    [cloverPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10141 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.39836 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + -0.00102 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.63460 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + -0.00102 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.48848 * CGRectGetHeight(frame))];
    [cloverPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.25341 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.33265 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.14410 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.36081 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.19783 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.33890 * CGRectGetHeight(frame))];
    [cloverPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.31453 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09067 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.21978 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.25105 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.24016 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.15610 * CGRectGetHeight(frame))];
    [cloverPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.68547 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09067 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.41696 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.00055 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.58304 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.00055 * CGRectGetHeight(frame))];

    
    [self finishShapePath:cloverPath color:color frameColor:frameColor frameSize:frameSize fill:fill frame:frame];    
    return cloverPath;
}

+ (UIBezierPath *)mmjBezierPathSpades:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill
{
    CGRect frame = [self fittingRect:rect frameSize:frameSize];
    UIBezierPath *pikPath = [UIBezierPath bezierPath];
    
    [pikPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.51954 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02673 * CGRectGetHeight(frame))];
    [pikPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.90595 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.34525 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.54617 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.03911 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.88354 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.32398 * CGRectGetHeight(frame))];
    [pikPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.90595 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.72019 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 1.01505 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.44879 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 1.01505 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.61665 * CGRectGetHeight(frame))];
    [pikPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.58719 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.77167 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.81973 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.80202 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.69117 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81918 * CGRectGetHeight(frame))];
    [pikPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.58719 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.98085 * CGRectGetHeight(frame))];
    [pikPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.42461 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.98085 * CGRectGetHeight(frame))];
    [pikPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.42461 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.77014 * CGRectGetHeight(frame))];
    [pikPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10257 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.72019 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.32007 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81953 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.18970 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.80288 * CGRectGetHeight(frame))];
    [pikPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10257 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.34525 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + -0.00653 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.61665 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + -0.00653 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.44879 * CGRectGetHeight(frame))];
    [pikPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50925 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02658 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.12580 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.32321 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.48118 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.03923 * CGRectGetHeight(frame))];
    [pikPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.51921 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02658 * CGRectGetHeight(frame))];
    [pikPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.51954 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02673 * CGRectGetHeight(frame))];

    [self finishShapePath:pikPath color:color frameColor:frameColor frameSize:frameSize fill:fill frame:frame];
    return pikPath;
}


@end