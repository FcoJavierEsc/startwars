//
//  UIViewController+Combinators.m
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 14/02/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "UIViewController+Combinators.h"

@implementation UIViewController (Combinators)

-(UINavigationController*)wrappedInNavigation{
    
    UINavigationController *nav = [UINavigationController new];
    [nav pushViewController:self
                   animated:NO];
    return nav;
}


@end
