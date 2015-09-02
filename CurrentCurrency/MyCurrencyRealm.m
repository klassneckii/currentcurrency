//
//  MyCurrencyRealm.m
//  CurrentCurrency
//
//  Created by Dmitrii on 19.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import "MyCurrencyRealm.h"

@implementation MyCurrencyRealm

- (instancetype)init {
    self = [super init];
    if (self) {
        self.identifier = [[NSUUID UUID] UUIDString];
        self.created = [NSDate new];
    }
    return self;
}

- (instancetype)initWithAmount:(double)amount rate:(KLRate *)rate {
    self = [super init];
    if (self) {
        self.amount = amount;
        self.rate = rate;
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
