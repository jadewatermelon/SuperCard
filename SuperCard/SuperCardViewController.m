//
//  SuperCardViewController.m
//  SuperCard
//
//  Created by Tom Billings on 17/2/2013.
//  Copyright (c) 2013 Tom Billings. All rights reserved.
//

#import "SuperCardViewController.h"

#import "PlayingCardView.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

#import "SetCardView.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SuperCardViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@property (weak, nonatomic) IBOutlet SetCardView *setCardView;
@property (strong, nonatomic) Deck *playingCardDeck;
@property (strong, nonatomic) Deck *setCardDeck;
@end

@implementation SuperCardViewController

- (Deck *)playingCardDeck
{
    if (!_playingCardDeck) _playingCardDeck = [[PlayingCardDeck alloc] init];
    return _playingCardDeck;
}

- (Deck *)setCardDeck
{
    if (!_setCardDeck) _setCardDeck = [[SetCardDeck alloc] init];
    return _setCardDeck;
}

- (void)setPlayingCardView:(PlayingCardView *)playingCardView
{
    _playingCardView = playingCardView;
    [self drawRandomPlayingCard];
    [playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:playingCardView action:@selector(pinch:)]];
}

- (void)setSetCardView:(SetCardView *)setCardView
{
    _setCardView = setCardView;
    [self drawRandomSetCard];
}

- (void)drawRandomPlayingCard
{
    Card *card = [self.playingCardDeck drawRandomCard];
    if ([card isKindOfClass:[PlayingCard class]]) {
        PlayingCard *playingCard = (PlayingCard *)card;
        self.playingCardView.rank = playingCard.rank;
        self.playingCardView.suit = playingCard.suit;
    }
}

- (void)drawRandomSetCard
{
    Card *card = [self.setCardDeck drawRandomCard];
    if ([card isKindOfClass:[SetCard class]]) {
        SetCard *setCard = (SetCard *)card;
        self.setCardView.number = setCard.number;
        self.setCardView.number = 1;
        self.setCardView.symbol = 1;//setCard.symbol;
        self.setCardView.shading = 1;//setCard.shading;
        self.setCardView.color = 1;//setCard.color;
    }
}

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender
{
    [UIView transitionWithView:self.playingCardView
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        if (!self.playingCardView.faceUp)
                            [self drawRandomPlayingCard];
                        self.playingCardView.faceUp = !self.playingCardView.faceUp;
                    }completion:NULL];
}

@end
