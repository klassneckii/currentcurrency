//
//  CurrencyConstants.m
//  CurrentCurrency
//
//  Created by Dmitrii on 25.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CurrencyConstants.h"

@interface CurrencyConstants ()



@end

@implementation CurrencyConstants

+ (NSArray *)countryCurrencies {
    return @[
             kAECurrencyRUB,
             kAECurrencyUSD,
             kAECurrencyEUR
             ];
}

@end