//
//  SodexoTableViewController.m
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import "SodexoTableViewController.h"


@implementation SodexoTableViewController

@synthesize menuItems = _menuItems;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Sodexo";
    
    //self.menuItems = [self getMockMenuItems];
    self.menuItems = [self getMenuItems];
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"SodexoTableViewCell";
    
    SodexoModel * item = [self.menuItems objectAtIndex:indexPath.row];
    SodexoTableViewCell *cell = (SodexoTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
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
    
    for (int x = 0; x <= 10; x++) {
        SodexoModel * item = [[SodexoModel alloc] init];
        
        item.itemName = @"Oatmeal";
        item.itemDescription = @"Hot breakfast";
        [items addObject:item];
    }
    return items;
}

- (NSMutableArray *) getMenuItems{
    
    NSMutableArray * items = [[NSMutableArray alloc] init];
    NSXMLParser *parser = [[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://forms.hastings.edu/Apps/menu.xml"]];
    [parser setDelegate:self];
    
    [parser parse];
    
    return items;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
          if ( [elementName isEqualToString:@"weeklymenu"])
          {
              SodexoModel * menuItem = [[SodexoModel alloc] init];
              
              menuItem.itemName = [attributeDict valueForKey:@"item_name"];
              NSLog(@"%@", @"Test");
              return;
          }
}

@end
