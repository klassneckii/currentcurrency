//
//  KLBank.h
//  CurrentCurrency
//
//  Created by Dmitrii on 18.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm.h>

@class KLRate;
#import "KLRate.h"

@interface KLBank : RLMObject

- (instancetype)initWithName:(NSString *)name;

@property NSString *name;
@property RLMArray<KLRate *><KLRate> *rates;

@end

