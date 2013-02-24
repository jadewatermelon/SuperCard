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

- (void)drawShapes
{
    // make rect to draw shape in
    
    if (self.number != 2) {
        //draw middle one  (i.e. number == 1,3)
        [self drawShape];
        if (self.number == 3) {
            // offset left and draw left
            [self drawShape];
            // offset right and draw right
            [self drawShape];
        }
    } else if (self.number == 2) {
        // offset a bit from corner and draw left
        [self drawShape];
        // scoot and draw right
        [self drawShape];
    }
}

- (void)drawShape
{
    switch(self.symbol) {
        case 1:
            [self drawDiamond];
            break;
        case 2:
            [self drawOval];
            break;
        case 3:
            [self drawSquiggle];
            break;
        default:
            [self drawDiamond];
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

- (void)drawDiamond
{
    
}

- (void)drawOval
{
    
}

- (void)drawSquiggle
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
