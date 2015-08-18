//
//  KLBankRate.m
//  CurrentCurrency
//
//  Created by Dmitrii on 18.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import "KLBankRate.h"

@implementation KLBankRate

- (instancetype)initWithSrcCurrency:(NSString *)sourceCurrency
                        dstCurrency:(NSString *)destinationCurrency
                           sellRate:(NSNumber *)sellRate
                            buyRate:(NSNumber *)buyRate
                               bank:(KLBank *)bank
                      andChangeTime:(NSDate *)changeTime {
    self = [super initWithSrcCurrency:sourceCurrency dstCurrency:destinationCurrency sellRate:sellRate buyRate:buyRate];
    if (self) {
        self.bank = bank;
        self.changeTime = changeTime;
    }
    return self;
}

@end
