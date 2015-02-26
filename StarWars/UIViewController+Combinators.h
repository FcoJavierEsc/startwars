//
//  UIViewController+Combinators.h
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 14/02/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Combinators)

-(UINavigationController*)wrappedInNavigation;

@end
