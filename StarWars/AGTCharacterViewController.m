//
//  AGTCharacterViewController.m
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 06/02/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTCharacterViewController.h"
#import "CafPlayer.h"
#import "AGTWikiViewController.h"

@implementation AGTCharacterViewController


-(id) initWithModel:(AGTStarWarsCharacter *) model{
    
    if (self = [super initWithNibName:nil bundle:nil]) {
        
        _model = model;
        _player = [CafPlayer cafPlayer];
        self.title = model.alias;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // DisplayMode preferido para el SplitVC
#warning Arregla esto!
    
    // Eliminamos comportamiento por defcto de iOS 7
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    // Sincronizar modelo -> vista
    [self syncViewWithModel];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
-(IBAction)playSound:(id)sender{
    
    [self.player playSoundData:self.model.soundData];
}

- (IBAction)displayWikipedia:(id)sender {
    
    
    // Creamos el WikiVC
    AGTWikiViewController *wiki = [[AGTWikiViewController alloc]initWithModel:self.model];
    
    
    // Pusheamos
    [self.navigationController pushViewController:wiki
                                         animated:YES];
}


#pragma mark - UISplitViewControllerDelegate
-(void) splitViewController:(UISplitViewController *)svc
    willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    if (displayMode != UISplitViewControllerDisplayModeAllVisible) {
        // Tenemos que poner un botón en mi barra
        // de navegación que permita mostrar el controlador
        // primario (el de la izquierda)
        self.navigationItem.rightBarButtonItem = svc.displayModeButtonItem;
    }
    
}

#pragma mark - AGTStarWarsUniverseViewControllerDelegate
-(void) starWarsUniverseViewController:(AGTStarWarsUniverseViewController *)vc
                    didSelectCharacter:(AGTStarWarsCharacter *)character{
    
    // ¡Tu modelo ha cambiao, pringao!
    self.model = character;
    
    // sincronizamos modelo nuevo con vistas
    [self syncViewWithModel];
    

    
}

#pragma mark - Utils
-(void) syncViewWithModel{
    
    // sincronizamos modelo -> Vista
    self.photoView.image = self.model.photo;
    self.title = self.model.alias;
}













@end
