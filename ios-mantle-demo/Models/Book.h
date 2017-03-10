//
//  Book.h
//  ios-mantle-demo
//
//  Created by Eiji Kushida on 2017/03/10.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Book : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) NSString* author;
@property (nonatomic, readonly) NSString* itemCaption;
@property (nonatomic, readonly) NSString* itemUrl;
@property (nonatomic, readonly) NSString* mediumImageUrl;

@end
