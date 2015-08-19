//
//  ViewController.m
//  CurrentCurrency
//
//  Created by Dmitrii on 24.06.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import "ViewController.h"
#import <CBZSplashView.h>
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

@property (nonatomic, strong) CBZSplashView *splashView;
@property (strong, nonatomic) IBOutlet BKCurrencyTextField *howMuchPayTextfield;

@property (strong, nonatomic) IBOutlet BKCurrencyTextField *currencyAmountTextfield;
@property (strong, nonatomic) IBOutlet UIView *currencyChoiceControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *icon = [UIImage imageNamed:@"SplashLaunchIcon"];
    UIColor *color = [UIColor greenColor];
    
    CBZSplashView *splashView = [CBZSplashView splashViewWithIcon:icon
                                                  backgroundColor:color];
    splashView.animationDuration = 1.0;
    
//    [self.view addSubview:splashView];
    
//    self.splashView = splashView;
    
//    self.currencyAmountTextfield.numberFormatter.currencyCode = @"USD";
//    self.currencyAmountTextfield.numberFormatter.currencySymbol = @"$";
    
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
    
    
    MyCurrencyRealm *currency = [[MyCurrencyRealm alloc] initWithAmount:150.0
                                                                   rate:[[KLRate alloc] initWithSrcCurrency:kAECurrencyRUB
                                                                                                dstCurrency:kAECurrencyEUR
                                                                                                   sellRate:66.5
                                                                                                    buyRate:66.7]];
    [currency description];
//    [bankRate description];
    
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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    /* wait a beat before animating in */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.splashView startAnimation];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
