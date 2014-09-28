//
//  SearchResult.h
//  StoreSearch
//
//  Created by RoBeRt on 14-9-15.
//  Copyright (c) 2014年 Springshine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchResult : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *artistName;

@property (nonatomic, copy) NSString *artworkURL60;
@property (nonatomic, copy) NSString *artworkURL100;
@property (nonatomic ,copy) NSString *storeURL;
@property (nonatomic, copy) NSString *kind;
@property (nonatomic, copy) NSString *currency;
@property (nonatomic, copy) NSString *genre;
@property (nonatomic, copy) NSDecimalNumber *price;

- (NSComparisonResult)compareName:(SearchResult *)other;
- (NSString *)kindForDisplay;

@end
