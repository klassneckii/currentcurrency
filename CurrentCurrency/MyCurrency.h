//
//  MyCurrency.h
//  CurrentCurrency
//
//  Created by Dmitrii on 25.06.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCurrency : NSObject

@property (nonatomic) NSDate *created;
@property (nonatomic) NSNumber *amount;
@property (nonatomic) NSString *currency;
@property (nonatomic) NSNumber *buyRate;

@end
