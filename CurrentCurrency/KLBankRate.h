//
//  KLBankRate.h
//  CurrentCurrency
//
//  Created by Dmitrii on 18.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import "KLRate.h"
#import "KLBank.h"

@interface KLBankRate : KLRate

@property (nonatomic) KLBank *bank;
@property (nonatomic) NSDate *changeTime;

- (instancetype)initWithSrcCurrency:(NSString *)sourceCurrency
                        dstCurrency:(NSString *)destinationCurrency
                           sellRate:(NSNumber *)sellRate
                            buyRate:(NSNumber *)buyRate
                               bank:(KLBank *)bank
                      andChangeTime:(NSDate *)changeTime;

@end
