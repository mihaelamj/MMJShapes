//
//  MMJShapeData.m
//  MMJShapes
//
//  Created by Mihaela Mihaljević Jakić on 6/13/13.
//  Copyright (c) 2013 Token d.o.o. All rights reserved.
//

#import "MMJShapeData.h"
#import "MMJShapeTypes.h"

@implementation MMJShapeData

+ (CGFloat)maxStringWidth:(NSString *)string
{        
    CGSize stringSize = [string sizeWithFont:[UIFont systemFontOfSize:[UIFont systemFontSize] + 15]];
    return stringSize.width;
}

#pragma mark - Shapes

+ (CGFloat)maxShapeNameWidth
{
    return [MMJShapeData maxStringWidth:@"Squiggle"];
}

+ (NSArray *)shapeNames
{
    return @[@"Square",@"Diamond",@"Polygon",@"Triangle",@"Heart",@"Clover",@"Spades",@"Oval",@"Squiggle",@"Star"];
}

+ (NSUInteger)shapesCount
{
    return [[MMJShapeData shapeNames] count];
}

+ (NSString *)shapeNameAtIndex:(NSUInteger)index
{
    return (NSString *)[[MMJShapeData shapeNames] objectAtIndex:index];
}

+ (ShapeType)shapeTypeAtIndex:(NSUInteger)index
{
    return (ShapeType)index;
}

#pragma mark - Fills

+ (CGFloat)maxFillNameWidth
{
    return [MMJShapeData maxStringWidth:@"Striped"];
}

+ (NSArray *)shapeFillNames
{
    return @[@"Full",@"Open",@"Striped"];
}

+ (NSUInteger)fillsCount
{
    NSLog(@"fillsCount=%d", [[MMJShapeData shapeFillNames] count]);
    return [[MMJShapeData shapeFillNames] count];
}

+ (NSString *)shapeFillNameAtIndex:(NSUInteger)index
{
    NSLog(@"shapeFillNameAtIndex[%d]=%@", index, (NSString *)[[MMJShapeData shapeFillNames] objectAtIndex:index]);
    return (NSString *)[[MMJShapeData shapeFillNames] objectAtIndex:index];
}

+ (ShapeFill)shapeFillTypeAtIndex:(NSUInteger)index
{
    NSLog(@"shapeFillTypeAtIndex(%d)=%d", index, (ShapeFill)index);
    return (ShapeFill)index;
}


@end
