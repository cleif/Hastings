//
//  EventDetailViewTableViewController.m
//  Hastings
//
//  Created by Creighton Leif on 7/18/14.
//
//

#import "EventDetailViewTableViewController.h"
#import  "EventInfoModel.h"

@interface EventDetailViewTableViewController ()

@end

@implementation EventDetailViewTableViewController

-(id)initWithEventModel:(EventInfoModel *) eventModel{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.model  = eventModel;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.eventTitle.text      = self.model.eventTitle;
    //self.eventLocation.text   = self.model.eventLocation;
    //self.eventTime.text       = self.model.eventTime;
}

#pragma mark - Table view data source
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"EventTableViewCell";
    
    
    //EventInfoModel * item = [self.eventInfo objectAtIndex:indexPath.row];
    EventTableViewCell *cell = (EventTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"EventTableViewCell" owner:self options:nil] objectAtIndex:0];
    }
    //[cell bindCellDetails:item];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //Section based off of the number in event_day
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //count of total item in the events of day list
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
@end
