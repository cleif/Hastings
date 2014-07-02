//
//  MenuViewController.m
//  RevealControllerStoryboardExample
//
//  Created by Nick Hodapp on 1/9/13.
//  Copyright (c) 2013 CoDeveloper. All rights reserved.
//

#import "MenuViewController.h"
#import "IIViewDeckController.h"


@implementation MenuViewController

@synthesize homeViewController = _homeViewController;
@synthesize aboutViewController = _aboutViewController;
@synthesize athleticsViewController = _athleticsViewController;
@synthesize mapViewController = _mapViewController;
@synthesize broncoBoardViewController = _broncoBoardViewController;
@synthesize contactsTableViewController = _contactsTableViewController;




- (void) initViewControllers{
    
    self.homeViewController         = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    self.aboutViewController        = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
    self.athleticsViewController    = [[AthleticsViewController alloc] initWithNibName:@"AthleticsViewController" bundle:nil];
    self.broncoBoardViewController  = [[BroncoBoardViewController alloc] initWithNibName:@"BroncoBoardViewController" bundle:nil];
    self.mapViewController          = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
    self.contactsTableViewController  = [[ContactsTableViewController alloc] initWithNibName:@"ContactsTableViewController" bundle:nil];
}





#pragma mark - Display methods

- (void) displayHomeViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.homeViewController];;
}

- (void) displayAboutViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.aboutViewController];;
}

- (void) displayAthleticsViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.athleticsViewController];;
}

- (void) displayMapViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.mapViewController];
}

- (void) displayBroncoBoardViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.broncoBoardViewController];;
}

- (void) displayContactsViewController{
    
    self.viewDeckController.centerController = [[UINavigationController alloc] initWithRootViewController:self.contactsTableViewController];;
}


- (void) viewDidLoad{
    
    [self initViewControllers];
}


- (void) closeMenu{
    
    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
        
        [NSThread sleepForTimeInterval:(300+arc4random()%700)/1000000.0];
    }];
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 9;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
            
        case 0:
            [self displayHomeViewController];
            break;
            
            
        case 1:
            [self displayAthleticsViewController];
            break;
            
        case 2:
            [self displayMapViewController];
            break;
            
        case 3:
            [self displayBroncoBoardViewController];
            break;
            
            
        case 7:
            [self displayContactsViewController];
            break;
            
            
        case 8:
            [self displayAboutViewController];
            break;
            
            
        default:
            break;
    }
    
    
    [self closeMenu];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: CellIdentifier];
    
    if(cell == nil){
        
        cell = [[UITableViewCell alloc] init];
    }
    
    switch ( indexPath.row )
    {
        case 0:
            cell.textLabel.text = @"Home";
            break;
            
        case 1:
            cell.textLabel.text = @"Athletics";
            break;

        case 2:
            cell.textLabel.text = @"Maps";
            break;
            
        case 3:
            cell.textLabel.text = @"Broncoboard";
            break;
            
        case 4:
            cell.textLabel.text = @"Sodexo";
            break;
            
        case 5:
            cell.textLabel.text = @"Calendar";
            break;
            
        case 6:
            cell.textLabel.text = @"Twitter";
            break;
            
        case 7:
            cell.textLabel.text = @"Contacts";
            break;
            
        case 8:
            cell.textLabel.text = @"About";
            break;

    }

    
 
    return cell;
}

@end
