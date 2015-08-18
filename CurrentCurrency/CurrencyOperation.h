//
//  CurrencyOperation.h
//  CurrentCurrency
//
//  Created by Dmitrii on 18.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyOperation : NSObject

@property (nonatomic) NSDate *created;
@property (nonatomic) NSNumber *amount;
@property (nonatomic) NSString *currency;
@property (nonatomic) NSNumber *buyRate;

@end
