//
//  Deck.m
//  Matchismo
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (nonatomic, strong) NSMutableArray *cards;

@end


@implementation Deck

- (NSMutableArray *)cards {
	if (!_cards) {
		_cards = [[NSMutableArray alloc] init];
	}
	return _cards;
}


- (void)addCard:(Card *)card {
	[self addCard:card atTop:NO];
}


- (void)addCard:(Card *)card atTop:(BOOL)atTop {
	if (atTop) {
		[self.cards insertObject:card atIndex:0];
	} else {
		[self.cards addObject:card];
	}
}

- (Card *)drawRandomCard {
    //Checking for empty card deck
    if (![self.cards count]){
        //Log when card deck is empty
        NSLog(@"Deck is Empty");
        return nil;
    }
	NSInteger randomCard = arc4random() % [self.cards count];
    Card * card = self.cards[randomCard];
    //Log what card are drawed 
    NSLog(@"Drawed playing card %@", card.contents);
    // Remove from deck
    [self.cards removeObject:card];
    return card;
    
}

@end
