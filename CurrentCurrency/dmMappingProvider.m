//
//  MappingProvider.m
//  dmSearcher
//
//  Created by Dmitrii on 16.11.14.
//  Copyright (c) 2014 Dmitrii. All rights reserved.
//

#import "dmMappingProvider.h"
#import "Bank.h"
#import <NSDate+DateTools.h>

@implementation dmMappingProvider

+ (RKObjectMapping *)kovalutBankMapping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[Bank class]];
    
    RKValueTransformer *uppercaseStringTransformer = [RKBlockValueTransformer valueTransformerWithValidationBlock:^BOOL(__unsafe_unretained Class sourceClass, __unsafe_unretained Class destinationClass) {
        // We transform a `NSString` into another `NSString`
        return ([sourceClass isSubclassOfClass:[NSString class]] && [destinationClass isSubclassOfClass:[NSNumber class]]);
    } transformationBlock:^BOOL(id inputValue, __autoreleasing id *outputValue, Class outputValueClass, NSError *__autoreleasing *error) {
        // Validate the input and output
        RKValueTransformerTestInputValueIsKindOfClass(inputValue, [NSString class], error);
        RKValueTransformerTestOutputValueClassIsSubclassOfClass(outputValueClass, [NSNumber class], error);
        
        // Perform the transformation
        
        
        NSString *valueWithDot = [(NSString *)inputValue stringByReplacingOccurrencesOfString:@"," withString:@"."];
        
        *outputValue = [NSNumber numberWithDouble:[valueWithDot doubleValue]];
        return YES;
    }];
    
    RKValueTransformer *dateFromStringTransformer = [RKBlockValueTransformer valueTransformerWithValidationBlock:^BOOL(__unsafe_unretained Class sourceClass, __unsafe_unretained Class destinationClass) {
        // We transform a `NSString` into another `NSString`
        return ([sourceClass isSubclassOfClass:[NSString class]] && [destinationClass isSubclassOfClass:[NSDate class]]);
    } transformationBlock:^BOOL(id inputValue, __autoreleasing id *outputValue, Class outputValueClass, NSError *__autoreleasing *error) {
        // Validate the input and output
        RKValueTransformerTestInputValueIsKindOfClass(inputValue, [NSString class], error);
        RKValueTransformerTestOutputValueClassIsSubclassOfClass(outputValueClass, [NSDate class], error);
        
        // Perform the transformation
        
        //Role players.
        NSString *dateString = (NSString *)inputValue;
        __block NSDate *detectedDate;
        
        //Detect.
        NSDataDetector *detector = [NSDataDetector dataDetectorWithTypes:NSTextCheckingAllTypes error:nil];
        [detector enumerateMatchesInString:dateString
                                   options:kNilOptions
                                     range:NSMakeRange(0, [dateString length])
                                usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop)
        { detectedDate = result.date; }];
        
        
//        NSString *oldDate = (NSString *)inputValue;
//        NSDateFormatter *dateFormatter = [NSDateFormatter new];
//        dateFormatter.dateFormat = @"MM.dd.yyyy HH:mm";
//        NSDate *newDate = [dateFormatter dateFromString:oldDate];
        *outputValue = detectedDate;
//        NSString *valueWithDot = [(NSString *)inputValue stringByReplacingOccurrencesOfString:@"," withString:@"."];
        
//        *outputValue = [NSDate dateWithString:(NSString *)inputValue formatString:@"MM.dd.yyyy HH:mm"];
        
//        *outputValue = [NSNumber numberWithDouble:[valueWithDot doubleValue]];
        return YES;
    }];
    
    
    [mapping addAttributeMappingsFromDictionary:@{
                                                  @"Name.text" : @"name"
                                                  }];
    
    RKAttributeMapping *changeTime = [RKAttributeMapping attributeMappingFromKeyPath:@"ChangeTime.text" toKeyPath:@"changeTime"];
    changeTime.valueTransformer = dateFromStringTransformer;
    [mapping addPropertyMapping:changeTime];
    
    RKAttributeMapping *usdSellMapping = [RKAttributeMapping attributeMappingFromKeyPath:@"USD.Sell.text" toKeyPath:@"usdSell"];
    RKAttributeMapping *usdBuyMapping = [RKAttributeMapping attributeMappingFromKeyPath:@"USD.Buy.text" toKeyPath:@"usdBuy"];
    RKAttributeMapping *eurSellMapping = [RKAttributeMapping attributeMappingFromKeyPath:@"EUR.Buy.text" toKeyPath:@"euroBuy"];
    RKAttributeMapping *eurBuyMapping = [RKAttributeMapping attributeMappingFromKeyPath:@"EUR.Sell.text" toKeyPath:@"euroSell"];
    
    usdSellMapping.valueTransformer = uppercaseStringTransformer;
    usdBuyMapping.valueTransformer = uppercaseStringTransformer;
    eurSellMapping.valueTransformer = uppercaseStringTransformer;
    eurBuyMapping.valueTransformer = uppercaseStringTransformer;
    
    [mapping addPropertyMapping:usdSellMapping];
    [mapping addPropertyMapping:usdBuyMapping];
    [mapping addPropertyMapping:eurSellMapping];
    [mapping addPropertyMapping:eurBuyMapping];
    
    
    
//    mapping.forceCollectionMapping = YES;
    return mapping;
}

//+ (RKObjectMapping *)registerDataMapping {
//    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[RegisterData class]];
//    
//    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"PersonalInfo"
//                                                                                    toKeyPath:@"PersonalInfo"
//                                                                                  withMapping:[self personalDataMapping]]];
//    
//    [mapping addAttributeMappingsFromDictionary:@{
//                                                  @"Login": @"Login",
//                                                  @"Email": @"Email",
//                                                  @"Password": @"Password"
//                                                  }];
//    return mapping;
//}


@end
