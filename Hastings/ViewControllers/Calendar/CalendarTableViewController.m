//
//  CalendarTableViewController.m
//  Hastings
//
//  Created by Creighton Leif on 7/16/14.
//
//

#import "CalendarTableViewController.h"
#import "IIViewDeckController.h"

@interface CalendarTableViewController ()

@end

@implementation CalendarTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleLeftView)];
    [self.navigationItem setLeftBarButtonItem: menuButton];
    
    self.title = @"Campus Events";
    
    self.eventInfo = [[NSMutableArray alloc] init];
    [self getEventInfo];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//TODO: count of events 
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.eventInfo.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 static NSString *CellIdentifier = @"CalendarTableViewCell";
 
 CalendarModel * item = [self.eventInfo objectAtIndex:indexPath.row];
 CalendarTableViewCell *cell = (CalendarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
 if(cell == nil){
 
 cell = [[[NSBundle mainBundle] loadNibNamed:@"CalendarTableViewCell" owner:self options:nil] objectAtIndex:0];
 }
 [cell bindCellDetails:item];
 
 return cell;
}


-(NSMutableArray *) getEventInfo{
    NSMutableArray * eventInfo    = [[NSMutableArray alloc] init];
    //move to pull from URL
    //
    NSString *filePath              = [[NSBundle mainBundle] pathForResource:@"event-data" ofType:@"json"];
    NSData *eventData             = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *results           = [NSJSONSerialization JSONObjectWithData:eventData options:kNilOptions error:nil];
    NSDictionary *eventList       = [results objectForKey:@"Events"];
    
    for (NSDictionary * events in eventList) {
        CalendarModel * eventInfo   = [[CalendarModel alloc] init];
        NSDictionary * allEventsList = [events objectForKey:@"AllEvents"];

        
        for(NSDictionary * event in allEventsList){
            
        }
        
        eventInfo.eventName     = [events objectForKey:@"event_title"];
        eventInfo.eventLocation = [events objectForKey:@"event_location"];
        eventInfo.eventTime     = [events objectForKey:@"event_time"];
        
        [self.eventInfo addObject:eventInfo];
        
    }
    return eventInfo;
}
@end
