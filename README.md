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
