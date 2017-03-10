//
//  Book.m
//  ios-mantle-demo
//
//  Created by Eiji Kushida on 2017/03/10.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

#import "Book.h"

@implementation Book

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"title": @"title",
             @"author": @"author",
             @"itemCaption": @"itemCaption",
             @"itemUrl": @"itemUrl",
             @"mediumImageUrl": @"mediumImageUrl"
             };
}


@end
