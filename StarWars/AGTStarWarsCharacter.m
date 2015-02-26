//
//  AGTStarWarsCharacter.m
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 06/02/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTStarWarsCharacter.h"

@implementation AGTStarWarsCharacter

#pragma mark - Class Methods
+(instancetype) starWarsCharacterWithName:(NSString*) name
                                    alias:(NSString*) alias
                                      url:(NSURL *) url
                                    sound:(NSData *) soundData
                                    image:(UIImage*) photo{
    
    return [[self alloc] initWithName:name
                                alias:alias
                                  url:url
                                sound:soundData
                                image:photo];
    
}


+(instancetype) starWarsCharacterWithAlias:(NSString*) alias
                                       url:(NSURL *) url
                                     sound:(NSData *) soundData
                                     image:(UIImage*) photo{
    
    return [[self alloc] initWithAlias:alias
                                   url:url
                                 sound:soundData
                                 image:photo];
}

#pragma mark - Init
-(id) initWithName:(NSString*) name
             alias:(NSString*) alias
               url:(NSURL *) url
             sound:(NSData *) soundData
             image:(UIImage*) photo{
    
    
    if (self = [super init]) {
        
        _alias = alias;
        _name = name;
        _wikiPage = url;
        _soundData = soundData;
        _photo = photo;
    }
    return self;
}

-(id)initWithAlias:(NSString*) alias
               url:(NSURL *) url
             sound:(NSData *) soundData
             image:(UIImage*) photo{
    
    return [self initWithName:nil
                        alias:alias
                          url:url
                        sound:soundData
                        image:photo];
    
}

@end







