//
//  CalendarTableViewController.h
//  Hastings
//
//  Created by Creighton Leif on 7/16/14.
//
//

#import <UIKit/UIKit.h>
#import "calendarTableViewCell.h"
#import "EventDetailViewTableViewController.h"

@interface CalendarTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *eventInfo;

@end
