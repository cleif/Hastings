//
//  EventInfoTableViewCell.m
//  HC Mobile
//
//  Created by Checkout on 7/26/14.
//  Copyright (c) 2014 Hastings College. All rights reserved.
//

#import "EventInfoTableViewCell.h"

@implementation EventInfoTableViewCell

@synthesize eventTitle      = _eventTitle;
@synthesize eventLocation   = _eventLocation;
@synthesize eventTime       = _eventTime;

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void) bindCellDetails:(EventInfoModel *) EventDetailInfo{
    
    self.eventTitle.text        = EventDetailInfo.eventTitle;
    self.eventLocation.text     = EventDetailInfo.eventLocation;
    self.eventTime.text         = EventDetailInfo.eventTime;
}

@end
