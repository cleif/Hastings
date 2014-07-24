//
//  CalendarTableViewController.m
//  Hastings
//
//  Created by Creighton Leif on 7/16/14.
//
//

#import "CalendarTableViewController.h"
#import "IIViewDeckController.h"
#import "EventModel.h"
#import "EventInfoModel.h"

@interface CalendarTableViewController ()

@end

@implementation CalendarTableViewController

@synthesize eventInfo   = _eventInfo;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-icon.png"] style:UIBarButtonItemStylePlain target:self.viewDeckController action:@selector(toggleLeftView)];
    [self.navigationItem setLeftBarButtonItem: menuButton];
    
    self.title = @"Campus Events";
    
    self.eventInfo = [[NSMutableArray alloc] init];
    self.eventInfo = [self getEventInfo];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//TODO: count of events 
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.eventInfo.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 static NSString *CellIdentifier = @"CalendarTableViewCell";
 
 EventModel * item = [self.eventInfo objectAtIndex:indexPath.row];
 CalendarTableViewCell *cell = (CalendarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
 if(cell == nil){
 
 cell = [[[NSBundle mainBundle] loadNibNamed:@"CalendarTableViewCell" owner:self options:nil] objectAtIndex:0];
 }
 [cell bindCellDetails:item];
 
 return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    EventModel *model = [self.eventInfo objectAtIndex:indexPath.row];
    EventDetailViewTableViewController *detailViewController = [[EventDetailViewTableViewController alloc] initWithEventModel:model];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}


-(NSMutableArray *) getEventInfo{
    NSMutableArray * eventInfo      = [[NSMutableArray alloc] init];
    //move to pull from URL
    NSString *filePath              = [[NSBundle mainBundle] pathForResource:@"campus_events" ofType:@"json"];
    NSData *eventData               = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *results           = [NSJSONSerialization JSONObjectWithData:eventData options:kNilOptions error:nil];
    NSDictionary *eventList         = [results objectForKey:@"Events"];
    
    NSMutableArray * allEventsList  = [[NSMutableArray alloc] init];
    
    for (NSDictionary * events in eventList) {

        EventModel * eventModel     = [[EventModel alloc] init];

        eventModel.eventName        = [events valueForKey:@"event"];
        eventModel.eventWeek        = [events valueForKey:@"event_week"];
        eventModel.eventInfo        = [[NSMutableArray alloc] init];


        NSDictionary * eventInfoDictionary = [events objectForKey:@"event_info"];

        for (NSDictionary *eventInfo in eventInfoDictionary){

            
           NSDictionary * eventsOfDayList      = [eventInfo objectForKey:@"events_of_day"];


            for(NSDictionary * eventDayInfo in eventsOfDayList){
                
                EventInfoModel * eventInfoModel     = [[EventInfoModel alloc] init];
                eventInfoModel.eventsOfDayList      = [[NSMutableArray alloc] init];
                eventInfoModel.eventDay             = [eventInfo valueForKey:@"event_day"];
                
                eventInfoModel.eventTitle       = [eventDayInfo valueForKey:@"event_title"];
                eventInfoModel.eventLocation    = [eventDayInfo valueForKey:@"event_location"];
                eventInfoModel.eventTime        = [eventDayInfo valueForKey:@"event_time"];

                [eventModel.eventInfo addObject:eventInfoModel];
            }
        }
        
        //new nsmut
        
        
        [allEventsList addObject:eventModel];
    }
    
    return allEventsList;
}
@end
