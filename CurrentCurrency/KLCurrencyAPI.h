//
//  KLCurrencyAPI.h
//  CurrentCurrency
//
//  Created by Dmitrii on 31.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLCurrencyAPI : NSObject

- (void)fetchTodayRussianRatesWithCompletitionBlock:(void (^)(NSArray *rates, NSError *error))completitionBlock;

@end
