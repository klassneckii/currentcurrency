//
//  KLCurrencyAPI.m
//  CurrentCurrency
//
//  Created by Dmitrii on 31.08.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import "KLCurrencyAPI.h"

#import "dmObjectManager.h"

#import "KLRate.h"
#import "Bank.h"

#import "CurrencyConstants.h"

@implementation KLCurrencyAPI

- (void)fetchTodayRussianRatesWithCompletitionBlock:(void (^)(NSArray *, NSError *))completitionBlock {
    [[dmObjectManager sharedManager] getObjectsAtPath:@"xml-table.php"
                                           parameters:@{
                                                        @"kod" : @(7701)
                                                        }
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  NSArray *rates = [self prettyRatesFrom:[mappingResult array]];
                                                  completitionBlock(rates, nil);
                                              } failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  completitionBlock(nil, error);
                                              }];
}


- (NSArray *)prettyRatesFrom:(NSArray *)horribleRates {
    NSMutableArray *newRates = [NSMutableArray new];
    
    for (Bank *badRate in horribleRates) {
        
        
        KLRate *rubUSDRate = [[KLRate alloc] initWithSrcCurrency:kAECurrencyRUB
                                                      dstCurrency:kAECurrencyUSD
                                                         sellRate:badRate.usdSell.doubleValue
                                                          buyRate:badRate.usdBuy.doubleValue
                                                             bank:[[KLBank alloc] initWithName:badRate.name]];
        [newRates addObject:rubUSDRate];
        
        KLRate *rubEURRate = [[KLRate alloc] initWithSrcCurrency:kAECurrencyRUB
                                                      dstCurrency:kAECurrencyEUR
                                                         sellRate:badRate.euroSell.doubleValue
                                                          buyRate:badRate.euroBuy.doubleValue
                                                             bank:[[KLBank alloc] initWithName:badRate.name]];
        [newRates addObject:rubEURRate];
    }
    
    return [newRates mutableCopy];
}



@end
