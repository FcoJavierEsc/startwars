//
//  AGTWikiViewController.m
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 07/02/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTWikiViewController.h"
#import "AGTStarWarsUniverseViewController.h"

@interface AGTWikiViewController ()

@end

@implementation AGTWikiViewController

-(id) initWithModel:(AGTStarWarsCharacter*) model{
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        
        
        _model = model;
        self.title = @"Wikipedia";
    }
    
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Eliminamos comportamiento por defcto de iOS 7
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Sincronizar modelo -> Vista
    self.browser.delegate = self;
    [self syncViewWithModel];
    
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // Alta en notificaciones
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc addObserver:self
           selector:@selector(notifyThatCharacterDidChange:)
               name:CHARACTER_DID_CHANGE_NOTIFICATION
             object:nil];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    // Baja en notificaciones
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self];
    
}

// CHARACTER_DID_CHANGE_NOTIFICATION
-(void) notifyThatCharacterDidChange:(NSNotification *)n{
    
    // Tu modelo ha cambiao, espabilao!
    NSDictionary *userInfo = n.userInfo;
    
    self.model = [userInfo objectForKey:CHARACTER_KEY];
    
    // sincronizamos modelo -> Vista
    [self syncViewWithModel];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"Pues estamos jodidos...");
    
}

#pragma mark - UIWebViewDelegate
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    // Paramos y ocultamos el activity
    [self.activity stopAnimating];
    self.activity.hidden = YES;
    
}

-(BOOL) webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType{
    
    
    if ((navigationType == UIWebViewNavigationTypeLinkClicked) ||
        (navigationType == UIWebViewNavigationTypeFormSubmitted)){
        
        return NO;
    }else{
        return YES;
    }
    
}

#pragma mark - Utils
-(void) syncViewWithModel{
    
    // Sinc modelo -> vista
    self.activity.hidden = NO;
    [self.activity startAnimating];
    [self.browser loadRequest:[NSURLRequest requestWithURL:self.model.wikiPage]];
    
    
}





@end





