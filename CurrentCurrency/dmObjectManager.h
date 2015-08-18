//
//  dmObjectManager.h
//  dmSearcher
//
//  Created by Dmitrii on 16.11.14.
//  Copyright (c) 2014 Dmitrii. All rights reserved.
//

#import "RKObjectManager.h"


@interface dmObjectManager : RKObjectManager 

+ (instancetype) sharedManager;

- (void)setupRequestDescriptors;
- (void)setupResponseDescriptors;

- (void)fetchBanksWithSuccess:(void (^)(NSArray *banks))success
                   andFailure:(void (^)(NSError *error))failure;


@end
