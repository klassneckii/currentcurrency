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
#import <PPiFlatSegmentedControl.h>
#import <NSString+FontAwesome.h>

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
        
    } andFailure:^(NSError *error) {
        
    }];
    
    NSString *currencyCode = @"EUR";
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:currencyCode];
    NSString *currencySymbol = [NSString stringWithFormat:@"%@",[locale displayNameForKey:NSLocaleCurrencyCode value:currencyCode]];
    NSLog(@"Currency Symbol : %@", currencySymbol);
}

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
