//
//  KLRate.m
//  CurrentCurrency
//
//  Created by Dmitrii on 18.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import "KLRate.h"

@implementation KLRate

- (instancetype)initWithSrcCurrency:(NSString *)sourceCurrency dstCurrency:(NSString *)destinationCurrency sellRate:(double)sellRate buyRate:(double)buyRate {
    self = [super init];
    if (self) {
        self.sourceCurrency = sourceCurrency;
        self.destinationCurrency = destinationCurrency;
        self.sellRate = sellRate;
        self.buyRate = buyRate;
    }
    return self;
}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
