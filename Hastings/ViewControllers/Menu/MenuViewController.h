//
//  MenuViewController.h
//  RevealControllerStoryboardExample
//
//  Created by Nick Hodapp on 1/9/13.
//  Copyright (c) 2013 CoDeveloper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "AboutViewController.h"
#import "AthleticsViewController.h"
#import "BroncoBoardViewController.h"
#import "MapViewController.h"
#import "ContactsTableViewController.h"




@interface MenuViewController : UITableViewController


@property (strong, nonatomic) HomeViewController        *homeViewController;
@property (strong, nonatomic) AboutViewController       *aboutViewController;
@property (strong, nonatomic) BroncoBoardViewController *broncoBoardViewController;
@property (strong, nonatomic) MapViewController         *mapViewController;
@property (strong, nonatomic) AthleticsViewController   *athleticsViewController;
@property (strong, nonatomic) ContactsTableViewController   *contactsTableViewController;



@end
