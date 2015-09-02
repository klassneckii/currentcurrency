//
//  AddOperationFormViewController.m
//  CurrentCurrency
//
//  Created by Dmitrii on 02.09.15.
//  Copyright (c) 2015 Dmitrii. All rights reserved.
//

#import "AddOperationFormViewController.h"

#import <RLMRealm.h>

#import "MyCurrencyRealm.h"
#import "KLRate.h"

#import <MYSForms.h>

#import "CurrencyConstants.h"

@interface AddOperationFormViewController ()

@end

@implementation AddOperationFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MyCurrencyRealm *myCurrency = [[MyCurrencyRealm alloc] init];
    myCurrency.rate = [[KLRate alloc] init];
    
    self.model = myCurrency;
    
    
    self.navigationItem.title = @"Новая операция";
//    self.model = [MYSExampleUser new];
//    MYSExampleUser *exampleUser = self.model;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureForm {
    
    MYSFormLabelElement *footnoteElement = [MYSFormLabelElement labelElementWithText:@"Выберите то, то и то"];
    footnoteElement.theme.padding = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(10, 0, 10, 0)];
    [self addFormElement:footnoteElement];
    
    MYSFormPickerElement *pickerSrcElement = [MYSFormPickerElement pickerElementWithLabel:@"Исходная валюта" modelKeyPath:@"rate.sourceCurrency"];
//    pickerElement.valueTransformer = [MYSFormStringFromNumberValueTransformer new];
    for (NSString *code in [self currencyCodes]) {
        [pickerSrcElement addValue:code];
    }
    [self addFormElement:pickerSrcElement];
    
    MYSFormPickerElement *pickerDstElement = [MYSFormPickerElement pickerElementWithLabel:@"Валюта назначения" modelKeyPath:@"rate.destinationCurrency"];
    //    pickerElement.valueTransformer = [MYSFormStringFromNumberValueTransformer new];
    pickerDstElement.theme.padding = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(5, 0, 10, 0)];
    for (NSString *code in [self currencyCodes]) {
        [pickerDstElement addValue:code];
    }
    [self addFormElement:pickerDstElement];
    
    
    
    MYSFormTextFieldElement *currencyAmountElement = [MYSFormTextFieldElement textFieldElementWithLabel:@"Количество валюты" modelKeyPath:@"amount"];
    currencyAmountElement.theme.padding = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(5, 0, 10, 0)];
    currencyAmountElement.keyboardType = UIKeyboardTypeDecimalPad;
    currencyAmountElement.valueTransformer = [MYSFormStringFromNumberValueTransformer new];
    [self addFormElement:currencyAmountElement];
    
    
    MYSFormTextFieldElement *rateSellElement = [MYSFormTextFieldElement textFieldElementWithLabel:@"За сколько купил" modelKeyPath:@"rate.sellRate"];
    rateSellElement.keyboardType = UIKeyboardTypeDecimalPad;
    rateSellElement.valueTransformer = [MYSFormStringFromNumberValueTransformer new];
    [self addFormElement:rateSellElement];

    
    MYSFormTextFieldElement *rateBuyElement = [MYSFormTextFieldElement textFieldElementWithLabel:@"За сколько продам" modelKeyPath:@"rate.buyRate"];
    rateBuyElement.theme.padding = [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(5, 0, 10, 0)];
    rateBuyElement.keyboardType = UIKeyboardTypeDecimalPad;
    rateBuyElement.valueTransformer = [MYSFormStringFromNumberValueTransformer new];
    [self addFormElement:rateBuyElement];
    
    
    
    MYSFormButton *addOperationButton = [MYSFormButton formButtonWithTitle:@"Добавить операцию!"
                                                                     style:MYSFormButtonStyleDefault
                                                                    action:^(MYSFormElement *element) {
                                                                        
                                                                        [[RLMRealm defaultRealm] beginWriteTransaction];
                                                                        [MyCurrencyRealm createInDefaultRealmWithValue:self.model];
                                                                        [[RLMRealm defaultRealm] commitWriteTransaction];
                                                                        NSLog(@"%@", [[MyCurrencyRealm allObjects] description]);
                                                                    }];
    
    MYSFormButtonElement *addOperationElement = [MYSFormButtonElement buttonElementWithButtons:@[addOperationButton]];
    
    [self addFormElement:addOperationElement];

    

}

- (NSArray *)currencyCodes {
    return @[
             kAECurrencyRUB,
             kAECurrencyUSD,
             kAECurrencyEUR
             ];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
