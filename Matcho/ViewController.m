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
@property (weak, nonatomic) IBOutlet UILabel *cardLogButton;
@property (nonatomic) NSInteger flipCount;

@end

@implementation ViewController

- (void) setFlipCount:(NSInteger)flipCount {
    _flipCount = flipCount;
    self.cardLogButton.text = [NSString stringWithFormat:@"Flips: %ld", (long)self.flipCount];
}

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
        //Not flip if card deck is empty
        if (card != nil) {
            [sender setTitle:card.contents
                    forState:UIControlStateNormal];
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            //Change text of card
            if ([card.contents rangeOfString:@"♥"].location != NSNotFound || [card.contents rangeOfString:@"♦"].location != NSNotFound) {
                [sender setTitleColor: [UIColor redColor]
                             forState:UIControlStateNormal];
            }
            else if ([card.contents rangeOfString:@"♣"].location != NSNotFound || [card.contents rangeOfString:@"♠"].location != NSNotFound) {
                [sender setTitleColor: [UIColor blackColor]
                             forState:UIControlStateNormal];
            }
            else {
                [sender setTitleColor: [UIColor grayColor]
                             forState:UIControlStateNormal];
            }
        }
    }
    self.flipCount++;
}

- (IBAction)cardLogButtonTapped:(UIButton*)sender {
    if (![sender.currentTitle length]) {
        NSLog(@"Card was flipped");
    }
}

@end
