//
//  BookItem.h
//  ios-mantle-demo
//
//  Created by Eiji Kushida on 2017/03/10.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "Book.h"

@interface BookItem : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) Book* item;

@end
