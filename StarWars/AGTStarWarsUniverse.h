//
//  AGTStarWarsUniverse.h
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 07/02/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

@import Foundation;
#import "AGTStarWarsCharacter.h"

@interface AGTStarWarsUniverse : NSObject

@property (nonatomic, readonly) NSUInteger rebelCount;
@property (nonatomic, readonly) NSUInteger imperialCount;
@property (nonatomic, readonly) NSUInteger mixtaCount;

-(AGTStarWarsCharacter *) rebelAtIndex:(NSUInteger) index;
-(AGTStarWarsCharacter *) imperialAtIndex:(NSUInteger) index;
-(AGTStarWarsCharacter *) mixtaAtIndex:(NSUInteger) index;

@end
