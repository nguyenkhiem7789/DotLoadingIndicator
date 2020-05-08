# DotLoadingIndicator

[![CI Status](https://img.shields.io/travis/nguyenkhiem7789@gmail.com/DotLoadingIndicator.svg?style=flat)](https://travis-ci.org/nguyenkhiem7789@gmail.com/DotLoadingIndicator)
[![Version](https://img.shields.io/cocoapods/v/DotLoadingIndicator.svg?style=flat)](https://cocoapods.org/pods/DotLoadingIndicator)
[![License](https://img.shields.io/cocoapods/l/DotLoadingIndicator.svg?style=flat)](https://cocoapods.org/pods/DotLoadingIndicator)
[![Platform](https://img.shields.io/cocoapods/p/DotLoadingIndicator.svg?style=flat)](https://cocoapods.org/pods/DotLoadingIndicator)

<img src="https://user-images.githubusercontent.com/18132015/81379345-28ace300-9133-11ea-84f7-1031f820e129.jpeg" width="300"/>

## Example

https://www.youtube.com/watch?v=bVFdYGB3F1A&feature=youtu.be

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DotLoadingIndicator is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DotLoadingIndicator'
```

## How to use?

In storyboard, you need create a DotLoadingView

<img src="https://user-images.githubusercontent.com/18132015/81379459-5bef7200-9133-11ea-84a9-14489301d54a.png"/>

And in swift code, you cant set value for circle progress:

    @IBAction func clickShowFullScreenButton(_ sender: Any) {
        LoadingView.shared.show()
    }

    @IBAction func clickShowNotFullScreenButton(_ sender: Any) {
        LoadingView.shared.show(type: .notFullScreen)
    }


## Author

nguyenkhiem7789@gmail.com, nguyenkhiem7789@gmail.com

## License

DotLoadingIndicator is available under the MIT license. See the LICENSE file for more info.
