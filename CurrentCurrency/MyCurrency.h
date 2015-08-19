//
//  MyCurrency.h
//  CurrentCurrency
//
//  Created by Dmitrii on 25.06.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KLRate.h"

@interface MyCurrency : NSObject

@property (nonatomic) NSNumber *amount;
@property (nonatomic) KLRate *rate;
@property (nonatomic) NSDate *created;

@end
