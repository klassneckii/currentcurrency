//
//  MyCurrencyRealm.h
//  CurrentCurrency
//
//  Created by Dmitrii on 19.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Realm/Realm.h>
#import "KLRate.h"

@interface MyCurrencyRealm : RLMObject

@property (nonatomic) NSString *identifier;
@property (nonatomic) double amount;
@property (nonatomic) KLRate *rate;
@property (nonatomic) NSDate *created;

- (instancetype)initWithAmount:(double)amount rate:(KLRate *)rate;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<MyCurrencyRealm>
RLM_ARRAY_TYPE(MyCurrencyRealm)
