//
//  Bank.h
//  CurrentCurrency
//
//  Created by Dmitrii on 25.06.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bank : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSNumber *usdSell;
@property (nonatomic) NSNumber *euroSell;
@property (nonatomic) NSNumber *usdBuy;
@property (nonatomic) NSNumber *euroBuy;
@property (nonatomic) NSDate *changeTime;

@end
