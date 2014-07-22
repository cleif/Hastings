//
//  CalendarTableViewCell.m
//  Hastings
//
//  Created by Creighton Leif on 7/17/14.
//
//

#import "CalendarTableViewCell.h"

@implementation CalendarTableViewCell

@synthesize eventName   = _eventName;

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) bindCellDetails:(EventModel *) eventInfo{
    
    self.eventName.text     = eventInfo.eventName;
}

@end
