//
//  SetCardView.h
//  SuperCard
//
//  Created by Tom Billings on 17/2/2013.
//  Copyright (c) 2013 Tom Billings. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
typedef NS_ENUM(NSUInteger, SetSymbol) {
    SetSymbolOval, SetSymbolDiamond, SetSymbolSquiggle
};

typedef NS_ENUM(NSUInteger, SetShade) {
    SetShadeSolid, SetShadeStriped, SetShadeOpen
};

typedef NS_ENUM(NSUInteger, SetColor) {
    SetColorRed, SetColorGreen, SetColorPurple
};

@interface SetCardView : UIView

@property (nonatomic) NSUInteger number;
@property (nonatomic) SetSymbol symbol;
@property (nonatomic) SetShade shading;
@property (nonatomic) SetColor color;

@end
*/

@interface SetCardView : UIView

@property (nonatomic) NSUInteger number, symbol, shading, color;
@property (nonatomic) BOOL faceUp;

@end