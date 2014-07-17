//
//  NutritionViewController.h
//  Hastings
//
//  Created by Creighton Leif on 7/16/14.
//
//

#import <UIKit/UIKit.h>
#import "SodexoModel.h"

@interface NutritionViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *itemName;

@property (strong, nonatomic) IBOutlet UILabel *itemCalories;
@property (strong, nonatomic) IBOutlet UILabel *itemFats;
@property (strong, nonatomic) IBOutlet UILabel *itemSatFats;
@property (strong, nonatomic) IBOutlet UILabel *itemSodium;
@property (strong, nonatomic) IBOutlet UILabel *itemCarbs;
@property (strong, nonatomic) IBOutlet UILabel *itemSugar;
@property (strong, nonatomic) IBOutlet UILabel *itemProtein;

@property (strong, nonatomic) IBOutlet UILabel *itemCaloriesValue;
@property (strong, nonatomic) IBOutlet UILabel *itemFatsValue;
@property (strong, nonatomic) IBOutlet UILabel *itemSatFatsValue;
@property (strong, nonatomic) IBOutlet UILabel *itemSodiumValue;
@property (strong, nonatomic) IBOutlet UILabel *itemCarbsValue;
@property (strong, nonatomic) IBOutlet UILabel *itemSugarValue;
@property (strong, nonatomic) IBOutlet UILabel *itemProteinValue;

@property (retain, nonatomic) SodexoModel        *model;

-(id)initWithSodexoModel:(SodexoModel *) sodexoModel;

@end
