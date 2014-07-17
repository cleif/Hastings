//
//  SodexoViewController.h
//  Hastings
//
//  Created by Creighton Leif on 7/16/14.
//
//

#import <UIKit/UIKit.h>
#import "SodexoTableViewCell.h"
#import "NutritionViewController.h"

@interface SodexoViewController : UIViewController <NSXMLParserDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *menuItems;
@property (strong, nonatomic) NSMutableArray *allMenuItems;
@property (strong, nonatomic) IBOutlet UISegmentedControl *mealSegment;
@property (strong, nonatomic) IBOutlet UITableView *mealTableView;

@end
