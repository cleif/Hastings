//
//  SodexoModel.h
//  Hastings
//
//  Created by Creighton Leif on 7/3/14.
//
//

#import <Foundation/Foundation.h>

@interface SodexoModel : NSObject

@property (nonatomic, assign) NSString *itemName;
@property (nonatomic, assign) NSString *itemDescription;
@property (nonatomic, assign) NSString *calories;
@property (nonatomic, assign) NSString *fat;
@property (nonatomic, assign) NSString *saturatedFat;
@property (nonatomic, assign) NSString *sodium;
@property (nonatomic, assign) NSString *carbohydrates;
@property (nonatomic, assign) NSString *sugars;
@property (nonatomic, assign) NSString *proteins;
@property (nonatomic, assign) NSString *mealType;
@property (nonatomic, assign) NSString *day;
@property (nonatomic, assign) NSString *menuDate;

@end
