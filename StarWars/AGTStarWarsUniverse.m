//
//  AGTStarWarsUniverse.m
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 07/02/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTStarWarsUniverse.h"

@interface AGTStarWarsUniverse ()

@property (nonatomic, strong) NSArray *imperials;
@property (nonatomic, strong) NSArray *rebels;
@property (nonatomic, strong) NSArray *mixta;

@end
@implementation AGTStarWarsUniverse


#pragma mark - Properties
-(NSUInteger) rebelCount{
    return [self.rebels count];
}

-(NSUInteger) imperialCount{
    return [self.imperials count];
}

-(NSUInteger) mixtaCount{
    return [self.mixta count];
}


#pragma mark -  init
-(id) init{
    if (self = [super init]) {
        
        
        NSURL *vaderURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Darth_Vader"];
        NSBundle *b = [NSBundle mainBundle];
        NSData *vaderSound = [NSData dataWithContentsOfURL:[b URLForResource:@"vader" withExtension:@"caf"]];
        UIImage *vaderImage = [UIImage imageNamed:@"darthVader.jpg"];
        AGTStarWarsCharacter *vader = [AGTStarWarsCharacter
                                       starWarsCharacterWithName:@"Anakin Skywalker"
                                       alias:@"Darth Vader"
                                       url:vaderURL
                                       sound:vaderSound
                                       image:vaderImage];
        
        
        NSURL *chewieURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Chewbacca"];
        NSData *chewieSound = [NSData dataWithContentsOfURL:[b URLForResource:@"chewbacca" withExtension:@"caf"]];
        UIImage *chewieImage = [UIImage imageNamed:@"chewbacca.jpg"];
        AGTStarWarsCharacter *chewie = [AGTStarWarsCharacter starWarsCharacterWithAlias:@"Chewbacca"
                                                                                    url:chewieURL
                                                                                  sound:chewieSound
                                                                                  image:chewieImage];
        
        NSURL *c3poURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/C-3PO"];
        NSData *c3poSound = [NSData dataWithContentsOfURL:[b URLForResource:@"c3po" withExtension:@"caf"]];
        UIImage *c3poImage = [UIImage imageNamed:@"c3po.jpg"];
        AGTStarWarsCharacter *c3po = [AGTStarWarsCharacter starWarsCharacterWithAlias:@"C-3PO"
                                                                                  url:c3poURL
                                                                                sound:c3poSound
                                                                                image:c3poImage];
        
        
        NSURL *r2d2URL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/R2-D2"];
        NSData *r2d2Sound = [NSData dataWithContentsOfURL:[b URLForResource:@"r2-d2" withExtension:@"caf"]];
        UIImage *r2d2Image = [UIImage imageNamed:@"R2-D2.jpg"];
        AGTStarWarsCharacter *r2d2 = [AGTStarWarsCharacter starWarsCharacterWithAlias:@"R2-D2"
                                                                                  url:r2d2URL
                                                                                sound:r2d2Sound
                                                                                image:r2d2Image];
        
        NSURL *yodaURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Yoda"];
        NSData *yodaSound = [NSData dataWithContentsOfURL:[b URLForResource:@"yoda" withExtension:@"caf"]];
        UIImage *yodaImage = [UIImage imageNamed:@"yoda.jpg"];
        AGTStarWarsCharacter *yoda = [AGTStarWarsCharacter starWarsCharacterWithName:@"Minch Yoda"
                                                                               alias:@"Master Yoda"
                                                                                 url:yodaURL
                                                                               sound:yodaSound
                                                                               image:yodaImage];
        
        
        NSURL *tarkinURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Tarkin"];
        NSData *tarkinSound = [NSData dataWithContentsOfURL:[b URLForResource:@"tarkin" withExtension:@"caf"]];
        UIImage *tarkinImage = [UIImage imageNamed:@"tarkin.jpg"];
        AGTStarWarsCharacter *tarkin = [AGTStarWarsCharacter starWarsCharacterWithName:@"Wilhuf Tarkin"
                                                                                 alias:@"Grand Moff Tarkin"
                                                                                   url:tarkinURL
                                                                                 sound:tarkinSound
                                                                                 image:tarkinImage];
        
        
        NSURL *palpatineURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Palpatine"];
        NSData *palpatineSound = [NSData dataWithContentsOfURL:[b URLForResource:@"palpatine" withExtension:@"caf"]];
        UIImage *palpatineImage = [UIImage imageNamed:@"palpatine.jpg"];
        AGTStarWarsCharacter *palpatine = [AGTStarWarsCharacter starWarsCharacterWithName:@"Palpatine"
                                                                                    alias:@"Darth Sidious"
                                                                                      url:palpatineURL
                                                                                    sound:palpatineSound
                                                                                    image:palpatineImage];
        

        
        _rebels = @[chewie, yoda, c3po, r2d2];
        _imperials = @[vader, tarkin, palpatine];
        _mixta = @[vader, yoda, tarkin];
        
    }
    return self;
}


#pragma mark - Accessors
-(AGTStarWarsCharacter *) rebelAtIndex:(NSUInteger) index{
    
    return [self.rebels objectAtIndex:index];
}

-(AGTStarWarsCharacter *) imperialAtIndex:(NSUInteger) index{
    
    return [self.imperials objectAtIndex:index];
}

-(AGTStarWarsCharacter *) mixtaAtIndex:(NSUInteger) index{
    
    return [self.mixta objectAtIndex:index];
}



























@end
