//
//  KLRate.h
//  CurrentCurrency
//
//  Created by Dmitrii on 18.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm.h>

#import "KLBank.h"

@interface KLRate : RLMObject

@property NSString *identifier;
@property NSString *sourceCurrency;
@property NSString *destinationCurrency;
@property double sellRate;
@property double buyRate;
@property NSDate *updated;
@property KLBank *bank;

- (instancetype)initWithSrcCurrency:(NSString *)sourceCurrency
                        dstCurrency:(NSString *)destinationCurrency
                           sellRate:(double)sellRate
                            buyRate:(double)buyRate;

- (instancetype)initWithSrcCurrency:(NSString *)sourceCurrency
                        dstCurrency:(NSString *)destinationCurrency
                           sellRate:(double)sellRate
                            buyRate:(double)buyRate
                               bank:(KLBank *)bank;


@end

// This protocol enables typed collections. i.e.:
// RLMArray<MyCurrencyRealm>
RLM_ARRAY_TYPE(KLRate)