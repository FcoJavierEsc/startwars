//
//  AGTCharacterViewController.h
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 06/02/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

@import UIKit;

#import "AGTStarWarsCharacter.h"
#import "CafPlayer.h"
#import "AGTStarWarsUniverseViewController.h"

@interface AGTCharacterViewController : UIViewController <UISplitViewControllerDelegate, AGTStarWarsUniverseViewControllerDelegate>

@property (nonatomic, strong) AGTStarWarsCharacter *model;
@property (nonatomic, weak) IBOutlet UIImageView *photoView;
@property (nonatomic, strong) CafPlayer *player;



-(id) initWithModel:(AGTStarWarsCharacter *) model;


-(IBAction)playSound:(id)sender;

- (IBAction)displayWikipedia:(id)sender;

@end
