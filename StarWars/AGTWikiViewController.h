//
//  AGTWikiViewController.h
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 07/02/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

@import UIKit;
#import "AGTStarWarsCharacter.h"

@interface AGTWikiViewController : UIViewController<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;


@property (nonatomic, strong) AGTStarWarsCharacter *model;
@property (nonatomic, weak) IBOutlet UIWebView *browser;

-(id) initWithModel:(AGTStarWarsCharacter*) model;

@end
