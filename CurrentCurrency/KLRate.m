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
        self.identifier = [[NSUUID UUID] UUIDString];
        self.sourceCurrency = sourceCurrency;
        self.destinationCurrency = destinationCurrency;
        self.sellRate = sellRate;
        self.buyRate = buyRate;
        self.bank = [[KLBank alloc] initWithName:@"USER_RATE"];
    }
    return self;
}

- (instancetype)initWithSrcCurrency:(NSString *)sourceCurrency dstCurrency:(NSString *)destinationCurrency sellRate:(double)sellRate buyRate:(double)buyRate bank:(KLBank *)bank {
    self = [self initWithSrcCurrency:sourceCurrency dstCurrency:destinationCurrency sellRate:sellRate buyRate:buyRate];
    if (self) {
        self.bank = bank;
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
