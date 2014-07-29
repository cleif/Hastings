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

#import "GAIDictionaryBuilder.h"


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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.eventInfo.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"CalendarTableViewCell";
 
    CalendarModel * calendarItem = [self.eventInfo objectAtIndex:indexPath.row];
    CalendarTableViewCell *cell = (CalendarTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
    if(cell == nil){
 
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CalendarTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    
    [cell bindCellDetails:calendarItem];
 
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CalendarModel *model = [self.eventInfo objectAtIndex:indexPath.row];
    
    EventDetailViewTableViewController *detailViewController = [[EventDetailViewTableViewController alloc] initWithEventModel:model];
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}


-(NSMutableArray *) getEventInfo{
    
    //pulls JSON data FROM web
    //NSURLRequest *urlRequest        = [NSURLRequest requestWithURL: [NSURL URLWithString:@"https://dl.dropboxusercontent.com/s/5vfwlsep6axr823/campus_events.json"]];
    //[[NSURLConnection alloc]initWithRequest:urlRequest delegate:self];
    
    
    
    NSString *filePath              = [[NSBundle mainBundle] pathForResource:@"campus_events" ofType:@"json"];
    NSData *eventData               = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *results           = [NSJSONSerialization JSONObjectWithData:eventData options:kNilOptions error:nil];
    
  
    NSMutableArray *allEventsList = [[NSMutableArray alloc] init];
    
    //Main Events
    NSDictionary *calendarList         = [results objectForKey:@"Events"];
    
    NSArray *eventInfoList = [[NSArray alloc] init];
    
    for (NSDictionary *calendarItem in calendarList) {
        
        CalendarModel *mainCalendarItem = [[CalendarModel alloc] init];
        mainCalendarItem.eventModels    = [[NSMutableArray alloc] init];
        //mainCalendarItem.eventInfoList = [[NSMutableArray alloc] init];
        
        mainCalendarItem.eventName          = [calendarItem valueForKey:@"event"];
        mainCalendarItem.eventWeek          = [calendarItem valueForKey:@"event_week"];
        
        eventInfoList                       = [calendarItem valueForKey:@"event_info"];
        
        for (NSDictionary *eventInfoItem in eventInfoList) {
            
            EventModel *eventModel = [[EventModel alloc] init];
            eventModel.eventInfoModelList = [[NSMutableArray alloc] init];
           
            eventModel.eventDay = [eventInfoItem valueForKey:@"event_day"];
            
            NSDictionary *eventsOfDayList = [eventInfoItem objectForKey:@"events_of_day"];
            
            for (NSDictionary *eventOfDayItem in eventsOfDayList) {
                
                EventInfoModel * eventInfoModel = [[EventInfoModel alloc] init];
                
                eventInfoModel.eventTitle       = [eventOfDayItem valueForKey:@"event_title"];
                eventInfoModel.eventLocation    = [eventOfDayItem valueForKey:@"event_location"];
                eventInfoModel.eventTime        = [eventOfDayItem valueForKey:@"event_time"];
                

                [eventModel.eventInfoModelList addObject:eventInfoModel];
            }
            
            
            [mainCalendarItem.eventModels addObject:eventModel];
        }
        
        
        
   
        [allEventsList addObject:mainCalendarItem];
        
    }
    
    return allEventsList;
}

//google analytics
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    id<GAITracker> tracker  = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Campus Events"];
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

//Old parsing attempts
/*{
//    //NSMutableArray * events      = [[NSMutableArray alloc] init];
//    //move to pull from URL
//    NSString *filePath              = [[NSBundle mainBundle] pathForResource:@"campus_events" ofType:@"json"];
//    NSData *eventData               = [NSData dataWithContentsOfFile:filePath];
//    NSDictionary *results           = [NSJSONSerialization JSONObjectWithData:eventData options:kNilOptions error:nil];
//    NSDictionary *eventList         = [results objectForKey:@"Events"];
//    
//    NSMutableArray * allEventsList  = [[NSMutableArray alloc] init];
//    
//    for (NSDictionary * events in eventList) {
//        
//        EventModel * eventModel     = [[EventModel alloc] init];
//        
//        eventModel.eventName        = [events valueForKey:@"event"];
//        eventModel.eventWeek        = [events valueForKey:@"event_week"];
//        eventModel.eventInfo        = [[NSMutableArray alloc] init];
//        
//        NSDictionary * eventInfoDictionary  = [events objectForKey:@"event_info"];
//        NSMutableArray * eventDayNames      = [[NSMutableArray alloc] init];
//        
//        for (NSDictionary *eventInfo in eventInfoDictionary){
//            
//            NSDictionary * eventsOfDayList      = [eventInfo objectForKey:@"events_of_day"];
//            
//            EventInfoModel * eventInfoModel     = [[EventInfoModel alloc] init];
//            eventInfoModel.eventsOfDayList      = [[NSMutableArray alloc] init];
//            
//            //section header data
//            [eventDayNames addObject: [eventInfo valueForKey:@"event_day"]];
//            //eventInfoModel.eventDay             = [eventInfo valueForKey:@"event_day"];
//            
//            for(NSDictionary * eventDayInfo in eventsOfDayList){
//                
//                eventInfoModel.eventTitle       = [eventDayInfo valueForKey:@"event_title"];
//                eventInfoModel.eventLocation    = [eventDayInfo valueForKey:@"event_location"];
//                eventInfoModel.eventTime        = [eventDayInfo valueForKey:@"event_time"];
//                
//                [eventModel.eventInfo addObject:eventInfoModel];
//                
//            }
//        }
//        [allEventsList addObject:eventModel];
//    }
//    return allEventsList;
//}
}*/
@end
