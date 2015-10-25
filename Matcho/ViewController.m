//
//  ViewController.m
//  Matcho
//
//  Created by Anton Lookin on 10/19/15.
//  Copyright © 2015 geekub. All rights reserved.
//

#import "PlayingCardDeck.h"

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) PlayingCardDeck *deck;

@property (weak, nonatomic) IBOutlet UIButton *cardButton;

@end

@implementation ViewController

- (PlayingCardDeck *)deck {
	if (!_deck) {
		_deck = [[PlayingCardDeck alloc] init];
	}
    //Add new coinciding and unique Card
    Card * coincidingCard = [[Card alloc]init];
    coincidingCard.contents = @"K♥";
    Card * uniqeCard = [[Card alloc]init];
    uniqeCard.contents = @"someContent";
    [_deck addCard:coincidingCard];
    [_deck addCard:uniqeCard];
	return _deck;
}


- (IBAction)cardButtonTapped:(UIButton *)sender {
	if ([sender.currentTitle length]) {
		[sender setTitle:@""
				forState:UIControlStateNormal];
		[sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
						  forState:UIControlStateNormal];
	} else {
		Card *card = [self.deck drawRandomCard];
		[sender setTitle:card.contents
				forState:UIControlStateNormal];
		[sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
						  forState:UIControlStateNormal];
	}
}

@end
