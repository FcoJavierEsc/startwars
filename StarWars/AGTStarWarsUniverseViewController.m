//
//  AGTStarWarsUniverseViewController.m
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 07/02/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTStarWarsUniverseViewController.h"
#import "AGTCharacterViewController.h"

@interface AGTStarWarsUniverseViewController ()
@property (nonatomic, strong) AGTStarWarsUniverse *model;
@end

@implementation AGTStarWarsUniverseViewController

-(id) initWithModel:(AGTStarWarsUniverse*) model
              style:(UITableViewStyle) style{
    
    if (self = [super initWithStyle:style]) {
        
        _model = model;
        self.title = @"StarWars Universe";
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return NUM_SECTION;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    switch (section) {
        case IMPERIAL_SECTION:
            return [self.model imperialCount];
            
        case REBEL_SECTION:
            return [self.model rebelCount];
            
        case MIXTA_SECTION:
            return [self.model mixtaCount];
           
        default:
            return 0;
          
    }

}

-(AGTStarWarsCharacter *) sicCharacter:(NSIndexPath *) indexPath{
    // Averiguar de qué personaje me habla
    AGTStarWarsCharacter *character = nil;
    
    switch (indexPath.section) {
        case IMPERIAL_SECTION:
            character = [self.model imperialAtIndex:indexPath.row];
            break;
        case REBEL_SECTION:
            character = [self.model rebelAtIndex:indexPath.row];
            break;
        case MIXTA_SECTION:
            character = [self.model mixtaAtIndex:indexPath.row];
            break;
    }
    return character;
}


-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    // Averiguar de qué personaje me habla
    AGTStarWarsCharacter *character = [self sicCharacter:indexPath];
 
#warning prueba aqui
    // Crear la celda
    static NSString *celld = @"StarWarsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:celld];
    if (cell == nil) {
        // la creo desde cero
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:celld];
    }
    
    // Configurarla: sincronizar modelo (personaje) -> Vista (celda)
    cell.imageView.image = character.photo;
    cell.textLabel.text = character.alias;
    cell.detailTextLabel.text = character.name;
    
    // Devolvemos la celda
    return cell;
    
}


-(NSString*) tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case IMPERIAL_SECTION:
            return @"Galactic Empire";
            break;
        case REBEL_SECTION:
            return @"Rebel Alliance";
            break;
        case MIXTA_SECTION:
            return @"Chancy Alliance";
            break;
        default:
            return @"TURURU";
            break;
    }
  
}

#pragma mark - TableView Delegate
-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    // Averiguar de qué personaje me habla
    AGTStarWarsCharacter *character = [self sicCharacter:indexPath];
  
    // Avisamos al delegado
    if ([self.delegate respondsToSelector:@selector(starWarsUniverseViewController:didSelectCharacter:)]) {
        
        [self.delegate starWarsUniverseViewController:self
                                   didSelectCharacter:character];
    }
    
    
    // Enviamos la notificación
    NSDictionary *dict = @{CHARACTER_KEY : character};
    NSNotification *n = [NSNotification notificationWithName:CHARACTER_DID_CHANGE_NOTIFICATION object:self userInfo:dict];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc postNotification:n];
    
    
}


#pragma mark - AGTStarWarsUniverseViewControllerDelegate
-(void) starWarsUniverseViewController:(AGTStarWarsUniverseViewController *)vc
                    didSelectCharacter:(AGTStarWarsCharacter *)character{
    
    // Creo un characterVC
    AGTCharacterViewController *charVC = [[AGTCharacterViewController alloc] initWithModel:character];
    
    // Me hago un push
    [self.navigationController pushViewController:charVC
                                         animated:YES];
    
}










@end
