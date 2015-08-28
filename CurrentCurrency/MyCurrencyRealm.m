//
//  MyCurrencyRealm.m
//  CurrentCurrency
//
//  Created by Dmitrii on 19.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import "MyCurrencyRealm.h"

@implementation MyCurrencyRealm

- (instancetype)initWithAmount:(double)amount rate:(KLRate *)rate {
    self = [super init];
    if (self) {
        self.amount = amount;
        self.rate = rate;
        self.created = [NSDate new];
    }
    return self;
}

+ (NSDictionary *)defaultPropertyValues {
    return @{
             @"identifier" : [[NSUUID UUID] UUIDString]
             };
}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties {
//    return @[];
//}

@end
