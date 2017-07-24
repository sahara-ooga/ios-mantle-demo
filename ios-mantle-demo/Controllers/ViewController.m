//
//  ViewController.m
//  ios-mantle-demo
//
//  Created by Kushida　Eiji on 2017/03/09.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

#import "ViewController.h"
#import <Mantle/Mantle.h>
#import "BookItemResults.h"
#import "BookItem.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary* jsonDic = [self loadJSON];
    [self parseJSON:jsonDic];
}

- (NSDictionary *)loadJSON {
    
    NSError *error = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:path
                                                           encoding:NSUTF8StringEncoding
                                                              error: &error];
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUnicodeStringEncoding];
    
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                            options:0
                                                              error:nil];
    
    return jsonDic;
}

- (void)parseJSON:(NSDictionary*)jsonDic {

//    {
//        "Items": [
//                  {
//                      "Item": {
//                          "author": "",
//                          "isbn": "",
//                          "itemCaption": "",
//                          "itemPrice": 2970,
//                          "itemUrl": "http://books.rakuten.co.jp/rb/14506521/",
//                          "title": ""
//                      }
//                  },
//        ],
//        "carrier": 0,
//        "count": 148, 
//        "first": 1, 
//        "hits": 30, 
//        "last": 30, 
//        "page": 1, 
//        "pageCount": 5
//    }
    
    BookItemResults *result = [MTLJSONAdapter modelOfClass:BookItemResults.class
                                              fromJSONDictionary:jsonDic
                                                     error:nil];
    NSLog(@"%zd", result.count);
    NSLog(@"%zd", result.page);
    NSLog(@"%zd", result.pageCount);
    
    NSLog(@"%@", result.items[0].item.title);
    NSLog(@"%@", result.items[0].item.author);
    NSLog(@"%@", result.items[0].item.itemCaption);
}

@end
