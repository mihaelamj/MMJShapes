//
//  MMJShapeData.h
//  MMJShapes
//
//  Created by Mihaela Mihaljević Jakić on 6/13/13.
//  Copyright (c) 2013 Token d.o.o. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMJShapeTypes.h"

@interface MMJShapeData : NSObject

+ (CGFloat)maxStringWidth:(NSString *)string;

+ (NSArray *)shapeNames;
+ (NSUInteger)shapesCount;
+ (NSString *)shapeNameAtIndex:(NSUInteger)index;
+ (ShapeType)shapeTypeAtIndex:(NSUInteger)index;
+ (CGFloat)maxShapeNameWidth;

+ (NSArray *)shapeFillNames;
+ (NSUInteger)fillsCount;
+ (NSString *)shapeFillNameAtIndex:(NSUInteger)index;
+ (ShapeFill)shapeFillTypeAtIndex:(NSUInteger)index;
+ (CGFloat)maxFillNameWidth;


@end
