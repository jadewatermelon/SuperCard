//
//  SetCardView.m
//  SuperCard
//
//  Created by Tom Billings on 17/2/2013.
//  Copyright (c) 2013 Tom Billings. All rights reserved.
//

#import "SetCardView.h"

@implementation SetCardView
#define CORNER_RADIUS 10

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CORNER_RADIUS];
    
    [roundedRect addClip];
    
    if (self.faceUp) {
        [[UIColor lightGrayColor] setFill];
        UIRectFill(self.bounds);
    } else {
        [[UIColor whiteColor] setFill];
        UIRectFill(self.bounds);
    }
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    [self drawShapes];
}

#pragma mark - Shape Logic -

#define SHAPE_HSCALE_FACTOR 0.20
#define SHAPE_VSCALE_FACTOR 0.80
#define SHAPE_BORDER_HOFFSET_PERCENTAGE 0.125
#define SHAPE_BORDER_VOFFSET_PERCENTAGE 0.100
#define SHAPE_INTERNAL_HOFFSET_PERCENTAGE 0.075

- (void)drawShapes
{
    // make rect for center rec (used as base for drawing other shapes)
    CGRect centerRect = CGRectInset(self.bounds,
                                    self.bounds.size.width * SHAPE_HSCALE_FACTOR,
                                    self.bounds.size.height * SHAPE_VSCALE_FACTOR);
    
    if (self.number != 2) {
        //draw middle one  (i.e. number == 1,3)
        [self drawShapeInRect:centerRect];
        if (self.number == 3) {
            // offset left and draw left
            CGRect leftRect = CGRectOffset(centerRect,
                                           -self.bounds.size.width * (SHAPE_HSCALE_FACTOR + SHAPE_INTERNAL_HOFFSET_PERCENTAGE),
                                           0);
            [self drawShapeInRect:leftRect];
            // offset right and draw right
            CGRect rightRect = CGRectOffset(centerRect,
                                           self.bounds.size.width * (SHAPE_HSCALE_FACTOR + SHAPE_INTERNAL_HOFFSET_PERCENTAGE),
                                           0);
            [self drawShapeInRect:rightRect];
        }
    } else if (self.number == 2) {
        // offset a bit from corner and draw left
        CGRect leftRect = CGRectOffset(centerRect,
                                       -self.bounds.size.width * (SHAPE_HSCALE_FACTOR + SHAPE_INTERNAL_HOFFSET_PERCENTAGE) / 2.0,
                                       0);
        [self drawShapeInRect:leftRect];
        // scoot and draw right
        CGRect rightRect = CGRectOffset(leftRect,
                                        self.bounds.size.width * (SHAPE_HSCALE_FACTOR + SHAPE_INTERNAL_HOFFSET_PERCENTAGE),
                                        0);
        [self drawShapeInRect:rightRect];
    }
}

- (void)drawShapeInRect:(CGRect)rect
{
    switch(self.symbol) {
        case 1:
            [self drawDiamond:rect];
            break;
        case 2:
            [self drawOval:rect];
            break;
        case 3:
            [self drawSquiggle:rect];
            break;
        default:
            [self drawDiamond:rect];
            break;
    }
}

- (UIColor *)renderColor
{
    switch(self.color) {
        case 1:
            return [UIColor redColor];
        case 2:
            return [UIColor greenColor];
        case 3:
            return [UIColor purpleColor];
        default:            // problem if we are ever here
            return [UIColor blackColor];
    }
}

#pragma mark - Shape Implementation -

- (void)drawDiamond:(CGRect)rect
{
    
}

- (void)drawOval:(CGRect)rect
{
    
}

- (void)drawSquiggle:(CGRect)rect
{
    
}

#pragma mark - Setters -

- (void)setNumber:(NSUInteger)number
{
    _number = number;
    [self setNeedsDisplay];
}

- (void)setSymbol:(NSUInteger)symbol
{
    _symbol = symbol;
    [self setNeedsDisplay];
}

- (void)setShading:(NSUInteger)shading
{
    _shading = shading;
    [self setNeedsDisplay];
}

- (void)setColor:(NSUInteger)color
{
    _color = color;
    [self setNeedsDisplay];
}

- (void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

#pragma mark - Initialization -

- (void)setup
{
    // do initialization here
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setup];
    return self;
}

@end
