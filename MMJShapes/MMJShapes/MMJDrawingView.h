//
//  MMJDrawingView.h
//  MMJShapes
//
//  Created by Mihaela Mihaljević Jakić on 6/11/13.
//  Copyright (c) 2013 Token d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMJShapeTypes.h"


@interface MMJDrawingView : UIView

@property (nonatomic) ShapeType shapeType;
@property (nonatomic) ShapeFill shapeFill;
@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) UIColor *frameColor;
@property (nonatomic) CGFloat frameSize;
@property (nonatomic) NSUInteger sizeStep;

@end
