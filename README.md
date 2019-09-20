# Localize directly from Storyboard or Xib

[![CI Status](https://img.shields.io/travis/Narek1994/NSVLocalizationKit.svg?style=flat)](https://travis-ci.org/Narek1994/NSVLocalizationKit)
[![Version](https://img.shields.io/cocoapods/v/NSVLocalizationKit.svg?style=flat)](https://cocoapods.org/pods/NSVLocalizationKit)
[![License](https://img.shields.io/cocoapods/l/NSVLocalizationKit.svg?style=flat)](https://cocoapods.org/pods/NSVLocalizationKit)
[![Platform](https://img.shields.io/cocoapods/p/NSVLocalizationKit.svg?style=flat)](https://cocoapods.org/pods/NSVLocalizationKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Requirements

Swift 5.0

## Installation

NSVLocalizationKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NSVLocalizationKit'
```
## Usage

NSVLocalizationKit allows you to localize directly from ```Storyboard``` or ```Xib```, it uses ```Localize-Swift``` and will automatically update all views, when language is changed.

```UIBarButtonItem```

Set ```localized Title```.

```UIButton```

Set ```localized Title```.

```UILabel```

Set ```localized Text```.

```UINavigationItem```

Set ```localized Title```.

```UISegmentedControl```

Set ```localized Titles```. Because we can't use arrays as a ```@IBInspectable```, you will have to give string seperated with comma, for each segment. Check the example project. 

```UITabBarItem```

Set ```localized Title```.


```UITextField```

Set ```localized Text``` for text and ```localized Placeholder``` for placeholder.

```UITextView```

Set ```localized Text```.

## Author

Narek1994, nareksimonyan94@gmail.com

## License

NSVLocalizationKit is available under the MIT license. See the LICENSE file for more info.
