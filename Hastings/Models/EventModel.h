//
//  EventModel.h
//  Hastings
//
//  Created by Creighton Leif on 7/21/14.
//
//

#import <Foundation/Foundation.h>

@interface EventModel : NSObject

@property (nonatomic, copy) NSString *eventName;
@property (nonatomic, copy) NSString *eventWeek;
@property (nonatomic, retain) NSMutableArray *eventInfo;



@end
