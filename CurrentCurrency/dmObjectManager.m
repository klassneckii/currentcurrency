//
//  dmObjectManager.m
//  dmSearcher
//
//  Created by Dmitrii on 16.11.14.
//  Copyright (c) 2014 Dmitrii. All rights reserved.
//

#import "dmObjectManager.h"
#import <RestKit.h>
#import "dmMappingProvider.h"
#import "RKXMLReaderSerialization.h"
static dmObjectManager *sharedManager = nil;

@implementation dmObjectManager

+ (instancetype)sharedManager {
    
    [RKMIMETypeSerialization registerClass:[RKXMLReaderSerialization class] forMIMEType:@"text/html"];
    [RKMIMETypeSerialization registerClass:[RKXMLReaderSerialization class] forMIMEType:RKMIMETypeTextXML];
    [RKMIMETypeSerialization registerClass:[RKXMLReaderSerialization class] forMIMEType:RKMIMETypeXML];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
 
        NSURL *server = [NSURL URLWithString:@"http://informer.kovalut.ru/webmaster/"];
        
        sharedManager = [self managerWithBaseURL:server];
//        sharedManager.requestSerializationMIMEType = RKMIMETypeFormURLEncoded;

        /*
         THIS CLASS IS MAIN POINT FOR CUSTOMIZATION:
         - setup HTTP headers that should exist on all HTTP Requests
         - override methods in this class tof change default behavior for all HTTP Requests
         - define methods that should be available across all object managers
         */
//        
        [sharedManager setupRequestDescriptors];
        [sharedManager setupResponseDescriptors];
//        [sharedManager setupCoreDataResponseDescriptors];
        //[sharedManager.HTTPClient setDefaultHeader:@"Authorization" value: [NSString stringWithFormat:@"token %@", PERSONAL_ACCESS_TOKEN]];
    });
    
    return sharedManager;
}

- (void) setupRequestDescriptors {

}

- (void) setupResponseDescriptors {
  
    RKResponseDescriptor *responseKo = [RKResponseDescriptor responseDescriptorWithMapping:[dmMappingProvider kovalutBankMapping]
                                                                                    method:RKRequestMethodGET
                                                                               pathPattern:@"xml-table.php"
                                                                                   keyPath:@"Exchange_Rates.Actual_Rates.Bank"
                                                                               statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [self addResponseDescriptor:responseKo];
}

#pragma mark Register&Auth

- (void)fetchBanksWithSuccess:(void (^)(NSArray *banks))success
                   andFailure:(void (^)(NSError *error))failure {
    RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelDebug);
    [self getObjectsAtPath:@"xml-table.php"
                parameters:@{
                             @"kod" : @(7701)
                             }
                   success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                       success([mappingResult array]);
                   } failure:^(RKObjectRequestOperation *operation, NSError *error) {
                       failure(error);
                   }];
}



@end
