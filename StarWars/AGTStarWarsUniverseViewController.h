//
//  AGTStarWarsUniverseViewController.h
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 07/02/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#define IMPERIAL_SECTION 4
#define REBEL_SECTION 1
#define MIXTA_SECTION 0

#define NUM_SECTION 5

#define CHARACTER_DID_CHANGE_NOTIFICATION @"characterDidChange"
#define CHARACTER_KEY @"character"


@import UIKit;
#import "AGTStarWarsUniverse.h"

@class AGTStarWarsUniverseViewController;


@protocol AGTStarWarsUniverseViewControllerDelegate <NSObject>

@optional
-(void)starWarsUniverseViewController: (AGTStarWarsUniverseViewController*)vc
                   didSelectCharacter:(AGTStarWarsCharacter *) character;

@end




@interface AGTStarWarsUniverseViewController : UITableViewController<AGTStarWarsUniverseViewControllerDelegate>

@property (weak, nonatomic) id<AGTStarWarsUniverseViewControllerDelegate> delegate;

-(id) initWithModel:(AGTStarWarsUniverse*) model
              style:(UITableViewStyle) style;

-(AGTStarWarsCharacter *) sicCharacter:(NSIndexPath *) indexPath;

@end



