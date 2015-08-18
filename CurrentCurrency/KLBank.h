//
//  KLBank.h
//  CurrentCurrency
//
//  Created by Dmitrii on 18.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLBank : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *address;

- (instancetype)initWithName:(NSString *)name;

@end


