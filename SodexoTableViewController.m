//
//  SodexoTableTableViewController.m
//  Hastings
//
//  Created by Creighton Leif on 7/2/14.
//
//

#import "SodexoTableViewController.h"


@implementation SodexoTableViewController

@synthesize menuItems = _menuItems;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Sodexo";
    
    self.menuItems = [self getMockMenuItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.menuItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SodexoModel * item = [self.menuItems objectAtIndex:indexPath.row];
    SodexoTableViewCell *cell = (SodexoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"SodexoTableViewCell" forIndexPath:indexPath];
    if(cell == nil){
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SodexoTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    [cell bindCellDetails:item];
    
    return cell;
    
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (NSMutableArray *) getMockMenuItems{
    
    NSMutableArray * items = [[NSMutableArray alloc] init];
    
    for (int x = 0; x <= 4; x++) {
        SodexoModel * item = [[SodexoModel alloc] init];
        
        item.itemName = @"Oatmeal";
        item.itemDescription = @"Hot breakfast";
        [items addObject:item];
    }
    return items;
}

@end
