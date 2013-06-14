//
//  MMJShapeTypes.h
//  MMJShapes
//
//  Created by Mihaela Mihaljević Jakić on 6/12/13.
//  Copyright (c) 2013 Token d.o.o. All rights reserved.
//

#ifndef MMJShapes_MMJShapeTypes_h
#define MMJShapes_MMJShapeTypes_h

typedef enum {
    SSquare = 0,
    SDiamond = 1,
    SPolygon = 2,
    STriangle = 3,
    SHeart = 4,
    SClover = 5,
    SSpades= 6,
    SOval = 7,
    SSquiggle = 8,
    SStar = 9
} ShapeType;

#define SHAPES_COUNT 10

typedef enum {
    FFull,
    FOpen,
    FStriped
} ShapeFill;

#define FILLS_COUNT 3


#endif
