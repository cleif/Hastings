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
    
    //refresh
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"refresh.png"] style:UIBarButtonItemStylePlain target:self action:@selector(pp:)];
    [self.navigationItem setRightBarButtonItem: refreshButton];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(populateMenuItems)];
    [self.navigationItem setLeftBarButtonItem: menuButton];
    
    self.title = @"Sodexo";
    
    self.menuItems = [[NSMutableArray alloc] init];
    [self populateMenuItems];
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

- (void) populateMenuItems{
    
    NSXMLParser *parser = [[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://forms.hastings.edu/Apps/menu.xml"]];
    [parser setDelegate:self];
    
    [parser parse];
    
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict{
    
      if ( [elementName isEqualToString:@"weeklymenu"]){
          
          //initialize
          SodexoModel * menuItem        = [[SodexoModel alloc] init];


          //set from value found
          menuItem.itemName         = [attributeDict valueForKey:@"item_name"];
          menuDesc.itemDescription  = [attributeDict valueForKey:@"item_desc"];
          menuCal.calories          = [attributeDict valueForKey:@"calories"];
          menuFat.fat               = [attributeDict valueForKey:@"fat"];
          menuSatFat.saturatedFat   = [attributeDict valueForKey:@"satfat"];
          menuSodium.sodium         = [attributeDict valueForKey:@"sodium"];
          menuCarbs.carbohydrates   = [attributeDict valueForKey:@"carbo"];
          menuSugars.sugars         = [attributeDict valueForKey:@"sugars"];
          menuProteins.proteins     = [attributeDict valueForKey:@"protein"];
          menuMealType.mealType     = [attributeDict valueForKey:@"meal"];
          menuDay.day               = [attributeDict valueForKey:@"dayname"];
          
          [self.menuItems addObject:menuItem];
      }
}

@end
