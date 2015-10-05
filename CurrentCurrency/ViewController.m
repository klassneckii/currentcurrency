//
//  ViewController.m
//  CurrentCurrency
//
//  Created by Dmitrii on 24.06.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import "ViewController.h"

#import "dmObjectManager.h"
#import <NSDate+DateTools.h>
#import <BKCurrencyTextField.h>
#import <BKMoneyKit/BKMoneyUtils.h>
#import <BKForwardingTextField.h>

#import "CurrencyConstants.h"
#include "Bank.h"

#import "KLRate.h"
#import "MyCurrencyRealm.h"
#import <Realm.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *icon = [UIImage imageNamed:@"SplashLaunchIcon"];
    UIColor *color = [UIColor greenColor];

    [[dmObjectManager sharedManager] fetchBanksWithSuccess:^(NSArray *banks) {
//        NSArray *rate = [self prettyRatesFrom:banks];
//        [rate count];
    } andFailure:^(NSError *error) {
        
    }];
    
    NSString *currencyCode = @"EUR";
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:currencyCode];
    NSString *currencySymbol = [NSString stringWithFormat:@"%@",[locale displayNameForKey:NSLocaleCurrencyCode value:currencyCode]];
    NSLog(@"Currency Symbol : %@", currencySymbol);
    
    NSLog(@"Country Code : %@", [NSString stringWithFormat:@"%@",[locale displayNameForKey:NSLocaleCountryCode value:currencyCode]]);
//    NSLog(@"Currency Symbol : %@", currencySymbol);
    
    
}

//- (NSArray *)prettyRatesFrom:(NSArray *)horribleRates {
//    NSMutableArray *newRates = [NSMutableArray new];
//    
//    for (Bank *badRate in horribleRates) {
//        KLBankRate *rubUSDRate = [[KLBankRate alloc] initWithSrcCurrency:kAECurrencyRUB
//                                                             dstCurrency:kAECurrencyUSD
//                                                                sellRate:badRate.usdSell
//                                                                 buyRate:badRate.usdBuy
//                                                                    bank:[[KLBank alloc] initWithName:badRate.name]
//                                                           andChangeTime:badRate.changeTime];
//        [newRates addObject:rubUSDRate];
//        
//        KLBankRate *rubEURRate = [[KLBankRate alloc] initWithSrcCurrency:kAECurrencyRUB
//                                                             dstCurrency:kAECurrencyEUR
//                                                                sellRate:badRate.euroSell
//                                                                 buyRate:badRate.euroBuy
//                                                                    bank:[[KLBank alloc] initWithName:badRate.name]
//                                                           andChangeTime:badRate.changeTime];
//        [newRates addObject:rubEURRate];
//    }
//    
//    return [newRates mutableCopy];
//}
- (IBAction)addCurrency:(id)sender {
    
//    MyCurrencyRealm *currency = [[MyCurrencyRealm alloc] initWithAmount:self.currencyAmountTextfield.numberValue.doubleValue
//                                                                   rate:[[KLRate alloc] initWithSrcCurrency:kAECurrencyRUB
//                                                                                                dstCurrency:kAECurrencyUSD
//                                                                                                   sellRate:self.howMuchPayTextfield.numberValue.doubleValue + 10
//                                                                                                    buyRate:self.howMuchPayTextfield.numberValue.doubleValue]];
//    
//    //    UITextField *textfield = [[UITextField alloc] init];
//    
//    [[RLMRealm defaultRealm] beginWriteTransaction];
//    [[RLMRealm defaultRealm] addObject:currency];
//    [[RLMRealm defaultRealm] commitWriteTransaction];
//    NSLog(@"%@", [[MyCurrencyRealm allObjects] description]);
//    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
