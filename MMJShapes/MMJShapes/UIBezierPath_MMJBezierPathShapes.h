//
//  UIBezierPath_MMJBezierPathShapes.h
//  MMJShapes
//  Category for drawing different shapes
//
//  Created by Mihaela Mihaljević Jakić on 6/12/13.
//  Copyright (c) 2013 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMJShapeTypes.h"

@interface UIBezierPath (MMJShape)


+ (UIBezierPath *)mmjBezierPathRect:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill;

+ (UIBezierPath *)mmjBezierPathDiamond:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill;

+ (UIBezierPath *)mmjBezierPathPolygon:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill;

+ (UIBezierPath *)mmjBezierPathTriangle:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill;

+ (UIBezierPath *)mmjBezierPathHeart:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill;

+ (UIBezierPath *)mmjBezierPathClover:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill;

+ (UIBezierPath *)mmjBezierPathRoundRect:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill;

+ (UIBezierPath *)mmjBezierPathOval:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill;

+ (UIBezierPath *)mmjBezierPathStar:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill;

+ (UIBezierPath *)mmjBezierPathSpades:(CGRect)rect color:(UIColor *)color frameColor:(UIColor *)frameColor frameSize:(CGFloat)frameSize fill:(ShapeFill)fill;

+ (void)shadePath:(UIBezierPath *)path fill:(ShapeFill)fill color:(UIColor *)color;

@end
