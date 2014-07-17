//
//  NutritionViewController.m
//  Hastings
//
//  Created by Creighton Leif on 7/16/14.
//
//

#import "NutritionViewController.h"
#import "SodexoModel.h"
@interface NutritionViewController ()

@end

@implementation NutritionViewController

@synthesize itemName            = _itemName;
@synthesize itemCaloriesValue   = _itemCaloriesValue;
@synthesize itemFatsValue       = _itemFatsValue;
@synthesize itemSatFatsValue    = _itemSatFatsValue;
@synthesize itemSodiumValue     = _itemSodiumValue;
@synthesize itemCarbsValue      = _itemCarbsValue;
@synthesize itemSugarValue      = _itemSugarValue;
@synthesize itemProteinValue    = _itemProteinValue;
@synthesize model               = _model;

-(id)initWithSodexoModel:(SodexoModel *) sodexoModel{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.model  = sodexoModel;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.itemName.text              = self.model.itemName;
    self.itemCaloriesValue.text     = self.model.calories;
    self.itemFatsValue.text         = self.model.fat;
    self.itemSatFatsValue.text      = self.model.saturatedFat;
    self.itemSodiumValue.text       = self.model.sodium;
    self.itemCarbsValue.text        = self.model.carbohydrates;
    self.itemSugarValue.text        = self.model.sugars;
    self.itemProteinValue.text      = self.model.proteins;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
