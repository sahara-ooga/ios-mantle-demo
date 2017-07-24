# ios-mantle-demo
Objective-C向けのマッピングのフレームワーク、mantleのサンプルです。

## Homebrewの導入

### インストール
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### 更新
```
brew update
```

## Carthageの導入

### インストール
```
brew install carthage
```

### Carthage バージョンの確認
```
carthage version
```

### Cartfileの作成
```
vi Cartfile
```

```
github "Mantle/Mantle"
```

### ビルド
```
carthage update --platform iOS
```

## プロジェクトに外部ライブラリを追加

### Frameworkの追加
Target > General > Linked Frameworks and BinariesにFrameworkを追加する

### Run Scriptに下記を追加
/usr/local/bin/carthage copy-frameworks

### Run ScriptのInput Fileに下記を追加
$(SRCROOT)/Carthage/Build/iOS/Mantle.framework


## JSONサンプル

```
{
    "carrier": 0, 
    "count": 148, 
    "first": 1, 
    "hits": 30, 
    "last": 30, 
    "page": 1, 
    "pageCount": 5,
    "GenreInformation": [], 
    "Items": [
        {
            "Item": {
                "affiliateUrl": "", 
                "artistName": "", 
                "author": "西 磨翁", 
                "availability": "1", 
                "booksGenreId": "001005001006/001005005011", 
                "chirayomiUrl": "", 
                "discountPrice": 0, 
                "discountRate": 0, 
                "hardware": "", 
                "isbn": "9784797389821", 
                "itemCaption": "アプリを作り、Ａｐｐ　Ｓｔｏｒｅに公開するまでを、ヤフーの「黒帯」が爆速で支援します。アプリのアイデアの出し方から、Ｘｃｏｄｅのセットアップと使い方、Ｓｗｉｆｔプログラムの書き方、アプリの公開方式まで、基本と押さえておくべきポイントを、実際にサンプルアプリを作る手順の流れでしっかり解説しています。", 
                "itemPrice": 2970, 
                "itemUrl": "http://books.rakuten.co.jp/rb/14506521/", 
                "jan": "", 
                "label": "", 
                "largeImageUrl": "http://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/9821/9784797389821.jpg?_ex=200x200", 
                "limitedFlag": 0, 
                "listPrice": 0, 
                "mediumImageUrl": "http://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/9821/9784797389821.jpg?_ex=120x120", 
                "os": "", 
                "postageFlag": 1, 
                "publisherName": "SBクリエイティブ", 
                "reviewAverage": "0.0", 
                "reviewCount": 0, 
                "salesDate": "2016年12月12日", 
                "smallImageUrl": "http://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/9821/9784797389821.jpg?_ex=64x64", 
                "title": "本気ではじめるiPhoneアプリ作り Xcode 8.x＋Swift 3.x対応"
            }
        },
    ], 
}
```

### クラス構成

|クラス名|説明 |
|---|---|
| BookItemResults |最上位レベルのデータ型 |
| BookItem |Items以下のデータ構造 |
| Book |Item以下のデータ構造 |

### MTLModelオブジェクトの作成

#### BookItemResultsクラス

```:BookItemResults.h
#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "BookItem.h"

@interface BookItemResults : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly) NSInteger count;
@property (nonatomic, readonly) NSInteger page;
@property (nonatomic, readonly) NSInteger pageCount;
@property (nonatomic, readonly) NSArray<BookItem*> *items;

@end
```

配列のマッピングは、○○JSONTransformerメソッドを実装して、手動でマッピングする

```
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
```

#### BookItemクラス

```
#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "Book.h"

@interface BookItem : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) Book* item;

@end
```

独自で作成したクラスも手動でマッピングする。

```
#import "BookItem.h"

@implementation BookItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"item": @"Item"
             };
}

+ (NSValueTransformer *)itemByJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:
            ^id(NSDictionary *value, BOOL *success, NSError *__autoreleasing *error) {
        
        BookItem *book = [BookItem new];
        book.item = value[@"Item"];
        return book;
    }];
}

@end
```

#### Bookクラス

```
#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Book : MTLModel<MTLJSONSerializing>

@property (nonatomic, readonly) NSString* title;
@property (nonatomic, readonly) NSString* author;
@property (nonatomic, readonly) NSString* itemCaption;
@property (nonatomic, readonly) NSString* itemUrl;
@property (nonatomic, readonly) NSString* mediumImageUrl;

@end
```

```
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
```

### 使い方(Usage)

```

    BookItemResults *result = [MTLJSONAdapter modelOfClass:BookItemResults.class
                                              fromJSONDictionary:jsonDic
                                                     error:nil];
    NSLog(@"%zd", result.count);
    NSLog(@"%zd", result.page);
    NSLog(@"%zd", result.pageCount);
    
    NSLog(@"%@", result.items[0].item.title);
    NSLog(@"%@", result.items[0].item.author);
    NSLog(@"%@", result.items[0].item.itemCaption);
```

## 参考
[【Objective-C】MantleでJSONをマッピング](http://qiita.com/KentaKudo/items/3688a8be8262ed272c36)