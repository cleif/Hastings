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
    NSMutableArray * eventInfo      = [[NSMutableArray alloc] init];
    //move to pull from URL
    //
    NSString *filePath              = [[NSBundle mainBundle] pathForResource:@"campus_events" ofType:@"json"];
    NSData *eventData               = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *results           = [NSJSONSerialization JSONObjectWithData:eventData options:kNilOptions error:nil];
    NSDictionary *eventList         = [results objectForKey:@"Events"];
    
    //ISSUE RESOLVED: This array was inside the first for loop - needed to be outside the for loop.
    NSMutableArray * allEventsList  = [[NSMutableArray alloc] init];
    
    for (NSDictionary * events in eventList) {

        EventModel * eventModel     = [[EventModel alloc] init];

        eventModel.eventName        = [events valueForKey:@"event"];
        eventModel.eventWeek        = [events valueForKey:@"event_week"];
        eventModel.eventInfo        = [[NSMutableArray alloc] init];


        NSDictionary * eventInfoDictionary = [events objectForKey:@"event_info"];

        for (NSDictionary *eventInfo in eventInfoDictionary){

            NSDictionary * eventsOfDayList      = [eventInfo objectForKey:@"events_of_day"];

            EventInfoModel * eventInfoModel     = [[EventInfoModel alloc] init];
            eventInfoModel.eventsOfDayList      = [[NSMutableArray alloc] init];

            eventInfoModel.eventDay             = [eventInfo valueForKey:@"event_day"];

            for(NSDictionary * eventDayInfo in eventsOfDayList){


                eventInfoModel.eventTitle       = [eventDayInfo valueForKey:@"event_title"];
                eventInfoModel.eventLocation    = [eventDayInfo valueForKey:@"event_location"];
                eventInfoModel.eventTime        = [eventDayInfo valueForKey:@"event_time"];

                [eventModel.eventInfo addObject:eventInfoModel];

            }
        }
        [allEventsList addObject:eventModel];
    }
    return eventInfo;
}
@end
