//
//  NutritionViewController.h
//  Hastings
//
//  Created by Creighton Leif on 7/16/14.
//
//

#import <UIKit/UIKit.h>

@interface NutritionViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *itemCalories;
@property (strong, nonatomic) IBOutlet UILabel *itemFats;
@property (strong, nonatomic) IBOutlet UILabel *itemSatFats;
@property (strong, nonatomic) IBOutlet UILabel *itemSodium;
@property (strong, nonatomic) IBOutlet UILabel *itemCarbs;
@property (strong, nonatomic) IBOutlet UILabel *itemSugar;
@property (strong, nonatomic) IBOutlet UILabel *itemProtein;


@end
