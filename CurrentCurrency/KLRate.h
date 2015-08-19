//
//  KLRate.h
//  CurrentCurrency
//
//  Created by Dmitrii on 18.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm.h>

@interface KLRate : RLMObject

@property (nonatomic) NSString *sourceCurrency;
@property (nonatomic) NSString *destinationCurrency;
@property (nonatomic) double sellRate;
@property (nonatomic) double buyRate;

- (instancetype)initWithSrcCurrency:(NSString *)sourceCurrency
                        dstCurrency:(NSString *)destinationCurrency
                           sellRate:(double)sellRate
                            buyRate:(double)buyRate;



@end

// This protocol enables typed collections. i.e.:
// RLMArray<MyCurrencyRealm>
RLM_ARRAY_TYPE(KLRate)