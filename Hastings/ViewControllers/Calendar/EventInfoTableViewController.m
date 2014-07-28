//
//  EventInfoTableViewController.m
//  HC Mobile
//
//  Created by Checkout on 7/26/14.
//  Copyright (c) 2014 Hastings College. All rights reserved.
//

#import "EventInfoTableViewController.h"
#import "EventInfoTableViewCell.h"

@interface EventInfoTableViewController ()

@end

@implementation EventInfoTableViewController

-(id)initWithEventInfoModel:(NSMutableArray *) eventInfoModelList{
    
    self = [super initWithNibName:nil bundle:nil];
    
    if (self) {
        
        self.eventModel.eventInfoModelList = eventInfoModelList;
    }
    return self;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.eventModel.eventInfoModelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"EventInfoTableViewCell";
    
    
    EventModel * item = [self.eventModel.eventInfoModelList objectAtIndex:indexPath.row];
    
    EventInfoTableViewCell *cell = (EventInfoTableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"EventInfoTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    [cell bindCellDetails:item];
    
    return cell;
}

@end
