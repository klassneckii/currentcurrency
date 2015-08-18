//
//  KLRate.h
//  CurrentCurrency
//
//  Created by Dmitrii on 18.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KLRate : NSObject

@property (nonatomic) NSString *sourceCurrency;
@property (nonatomic) NSString *destinationCurrency;
@property (nonatomic) NSNumber *sellRate;
@property (nonatomic) NSNumber *buyRate;
//@property (nonatomic) 

- (instancetype)initWithSrcCurrency:(NSString *)sourceCurrency
                        dstCurrency:(NSString *)destinationCurrency
                           sellRate:(NSNumber *)sellRate
                            buyRate:(NSNumber *)buyRate;

@end
