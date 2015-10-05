//
//  MyCurrency.h
//  CurrentCurrency
//
//  Created by Dmitrii on 25.06.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KLRate;

@interface MyCurrency : NSObject

@property NSNumber *amount;
@property KLRate *rate;
//@property KLRate *rate;
@property NSDate *created;

@end
