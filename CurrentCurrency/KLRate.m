//
//  KLRate.m
//  CurrentCurrency
//
//  Created by Dmitrii on 18.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import "KLRate.h"

@implementation KLRate

- (instancetype)init {
    self = [super init];
    if (self) {
        self.identifier = [[NSUUID UUID] UUIDString];
        self.updated = [NSDate new];
        self.bank = [[KLBank alloc] initWithName:@"USER_RATE"];
    }
    return self;
}

- (instancetype)initWithSrcCurrency:(NSString *)sourceCurrency dstCurrency:(NSString *)destinationCurrency sellRate:(double)sellRate buyRate:(double)buyRate updated:(NSDate *)updateTime {
    self = [super init];
    if (self) {
        self.sourceCurrency = sourceCurrency;
        self.destinationCurrency = destinationCurrency;
        self.sellRate = sellRate;
        self.buyRate = buyRate;
        self.bank = [[KLBank alloc] initWithName:@"USER_RATE"];
        self.updated = updateTime;
    }
    return self;
}

- (instancetype)initWithSrcCurrency:(NSString *)sourceCurrency dstCurrency:(NSString *)destinationCurrency sellRate:(double)sellRate buyRate:(double)buyRate updated:(NSDate *)updateTime bank:(KLBank *)bank  {
    self = [self initWithSrcCurrency:sourceCurrency dstCurrency:destinationCurrency sellRate:sellRate buyRate:buyRate updated:updateTime];
    if (self) {
        self.bank = bank;
    }
    return self;
}

//+ (NSString *)primaryKey {
//    return @"bank";
//}

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
