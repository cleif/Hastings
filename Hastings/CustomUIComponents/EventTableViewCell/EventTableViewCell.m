//
//  EventTableViewCell.m
//  Hastings
//
//  Created by Creighton Leif on 7/22/14.
//
//

#import "EventTableViewCell.h"

@implementation EventTableViewCell

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

@end
