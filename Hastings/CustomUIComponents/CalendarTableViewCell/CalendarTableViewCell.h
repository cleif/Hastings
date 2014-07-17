//
//  CalendarTableViewCell.h
//  Hastings
//
//  Created by Creighton Leif on 7/17/14.
//
//

#import <UIKit/UIKit.h>
#import "CalendarModel.h"

@interface CalendarTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *eventName;
@property (strong, nonatomic) IBOutlet UILabel *eventLocation;
@property (strong, nonatomic) IBOutlet UILabel *eventTime;

-(void) bindCellDetails:(CalendarModel *) eventInfo;

@end
