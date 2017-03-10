//
//  BookItemResults.h
//  ios-mantle-demo
//
//  Created by Eiji Kushida on 2017/03/10.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "BookItem.h"

@interface BookItemResults : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly) NSInteger count;
@property (nonatomic, readonly) NSInteger page;
@property (nonatomic, readonly) NSInteger pageCount;
@property (nonatomic, readonly) NSArray<BookItem*> *items;

@end
