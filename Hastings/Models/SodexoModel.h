//
//  SodexoModel.h
//  Hastings
//
//  Created by Creighton Leif on 7/3/14.
//
//

#import <Foundation/Foundation.h>

@interface SodexoModel : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *itemDescription;
@property (nonatomic, copy) NSString *calories;
@property (nonatomic, copy) NSString *fat;
@property (nonatomic, copy) NSString *saturatedFat;
@property (nonatomic, copy) NSString *sodium;
@property (nonatomic, copy) NSString *carbohydrates;
@property (nonatomic, copy) NSString *sugars;
@property (nonatomic, copy) NSString *proteins;
@property (nonatomic, copy) NSString *mealType;
@property (nonatomic, copy) NSString *day;
@property (nonatomic, copy) NSString *menuDate;

@end
