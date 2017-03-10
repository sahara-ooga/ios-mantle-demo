//
//  BookItemResults.m
//  ios-mantle-demo
//
//  Created by Eiji Kushida on 2017/03/10.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

#import "BookItemResults.h"

@implementation BookItemResults

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"count": @"count",
             @"page": @"page",
             @"pageCount": @"pageCount",
             @"items": @"Items"
             };
}


/// 配列をマッピング
+ (NSValueTransformer *)itemsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:BookItem.class];
}


@end
