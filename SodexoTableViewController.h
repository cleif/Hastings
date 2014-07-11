//
//  SodexoTableViewController.h
//  Hastings
//
//  Created by Creighton Leif 7/2/2014
//
//

#import <UIKit/UIKit.h>
#import "SodexoTableViewCell.h"

@interface SodexoTableViewController : UITableViewController <NSXMLParserDelegate>

@property (strong, nonatomic) NSMutableArray *menuItems;

@end
