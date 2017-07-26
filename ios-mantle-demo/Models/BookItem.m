//
//  BookItem.m
//  ios-mantle-demo
//
//  Created by Eiji Kushida on 2017/03/10.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

#import "BookItem.h"

@implementation BookItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"item": @"Item"
             };
}

//手動でのマッピング
+ (NSValueTransformer *)itemByJSONTransformer {
    //NSDictionaryからオブジェクトが返るときの記述
    return [MTLValueTransformer transformerUsingForwardBlock:
            ^id(NSDictionary *value, BOOL *success,
                NSError *__autoreleasing *error) {
        
                //NSDictionaryの値から、プロパティを生成
        BookItem *book = [BookItem new];
        book.item = value[@"Item"];
        return book;
    }];
}

@end
