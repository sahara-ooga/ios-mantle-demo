# ios-mantle-demo

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


## サンプル

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
