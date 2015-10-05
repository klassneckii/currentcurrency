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

#import "KLBank.h"


#import "CurrencyConstants.h"

@implementation KLCurrencyAPI

- (void)fetchTodayRussianRatesWithCompletitionBlock:(void (^)(RLMResults *, NSError *))completitionBlock {
    [[dmObjectManager sharedManager] getObjectsAtPath:@"xml-table.php"
                                           parameters:@{
                                                        @"kod" : @(7701)
                                                        }
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  NSArray *rates = [self prettyRatesFrom:[mappingResult array]];
                                                  
                                                  [self saveRatesToRealm:rates];
                                                  RLMResults *ratesDB = [self getTodayRatesFromDB];
                                                  completitionBlock(ratesDB, nil);
                                              } failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  completitionBlock(nil, error);
                                              }];
}


- (NSArray *)prettyRatesFrom:(NSArray *)horribleRates {
    NSMutableArray *newRates = [NSMutableArray new];
    
    for (Bank *badRate in horribleRates) {
        
        KLBank *bank = [KLBank new];
        bank.name = badRate.name;
        
        KLRate *rubUSDRate = [[KLRate alloc] initWithSrcCurrency:kAECurrencyRUB
                                                      dstCurrency:kAECurrencyUSD
                                                         sellRate:badRate.usdSell.doubleValue
                                                          buyRate:badRate.usdBuy.doubleValue
                                                         updated:badRate.changeTime];
//        [newRates addObject:rubUSDRate];
        
        KLRate *rubEURRate = [[KLRate alloc] initWithSrcCurrency:kAECurrencyRUB
                                                      dstCurrency:kAECurrencyEUR
                                                         sellRate:badRate.euroSell.doubleValue
                                                          buyRate:badRate.euroBuy.doubleValue
                                                         updated:badRate.changeTime];
//        [newRates addObject:rubEURRate];
        [bank.rates addObject:rubUSDRate];
        [bank.rates addObject:rubEURRate];
        
        [newRates addObject:bank];
    }
    
    return [newRates mutableCopy];
}

#pragma mark - Helpers

- (void)saveRatesToRealm:(NSArray *)rates {
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    for (KLBank *rate in rates) {
        [KLBank createInRealm:realm withValue:rate];
//        [KLRate createOrUpdateInRealm:realm withValue:rate];
    }
    [realm commitWriteTransaction];
}

- (RLMResults *)getTodayRatesFromDB {
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:4];
    [comps setMonth:10];
    [comps setYear:2015];
    [comps setHour:18];
//    self.timestamp = [[NSCalendar currentCalendar] dateFromComponents:comps];
    // Query using an NSPredicate
//    NSPredicate *pred = [NSPredicate predicateWithFormat:@"rates[0].updated > %@", [[NSCalendar currentCalendar] dateFromComponents:comps]];
//    tanDogs = [Dog objectsWithPredicate:pred];
    
    
    return [KLBank allObjects];
}



@end
