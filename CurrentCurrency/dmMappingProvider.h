//
//  MappingProvider.h
//  dmSearcher
//
//  Created by Dmitrii on 16.11.14.
//  Copyright (c) 2014 Dmitrii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit.h>

@class RKObjectMapping;

@interface dmMappingProvider : NSObject

+ (RKObjectMapping *)kovalutBankMapping;

@end
