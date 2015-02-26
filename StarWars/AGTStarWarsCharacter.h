//
//  AGTStarWarsCharacter.h
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 06/02/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

@import Foundation;
@import UIKit;


@interface AGTStarWarsCharacter : NSObject


@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, strong) NSURL *wikiPage;
@property (nonatomic, strong) NSData *soundData;
@property (nonatomic, strong) UIImage *photo;


+(instancetype) starWarsCharacterWithName:(NSString*) name
                                    alias:(NSString*) alias
                                      url:(NSURL *) url
                                    sound:(NSData *) soundData
                                    image:(UIImage*) photo;


+(instancetype) starWarsCharacterWithAlias:(NSString*) alias
                                       url:(NSURL *) url
                                     sound:(NSData *) soundData
                                     image:(UIImage*) photo;


// Designated
-(id) initWithName:(NSString*) name
             alias:(NSString*) alias
               url:(NSURL *) url
             sound:(NSData *) soundData
             image:(UIImage*) photo;

-(id)initWithAlias:(NSString*) alias
               url:(NSURL *) url
             sound:(NSData *) soundData
             image:(UIImage*) photo;

@end
