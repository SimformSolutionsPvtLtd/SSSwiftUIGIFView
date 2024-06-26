<p align="center">
<img src="SSSwiftUIGIFView.gif" width="100%" height="100%"/>
</p>

# SSSwiftUIGIFView

![Swift Package Index](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FSimformSolutionsPvtLtd%2FSSSwiftUIGIFView%2Fbadge%3Ftype%3Dswift-versions)
![Swift Package Index](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FSimformSolutionsPvtLtd%2FSSSwiftUIGIFView%2Fbadge%3Ftype%3Dplatforms)
![SPM Compatible-badge](https://img.shields.io/badge/Swift_Package_Manager-compatible-coolgreen)
[![Version](https://img.shields.io/cocoapods/v/SSSwiftUIGIFView.svg?style=flat)](https://cocoapods.org/pods/SSSwiftUIGIFView)
[![License](https://img.shields.io/cocoapods/l/SSSwiftUIGIFView.svg?style=flat)](https://cocoapods.org/pods/SSSwiftUIGIFView)
[![PRs Welcome][PR-image]][PR-url]
[![Twitter](https://img.shields.io/badge/Twitter-@simform-blue.svg?style=flat)](https://twitter.com/simform)

SSSwiftUIGIFView is a custom controller designed to help load GIFs in SwiftUI. It supports loading GIFs from remote URLs, is compatible with both iOS and macOS, and implements a caching mechanism to improve loading times and reduce data usage. Additionally, it provides both a default progress view and support for custom progress views while loading the GIF.

## Features

- [x] Support for loading local GIFs and GIFs from remote URLs
- [x] Cache mechanism support
- [x] Cross-platform compatibility (iOS & macOS)
- [x] Custom and default progress view support

## Requirements
  - iOS 14.0+
  - MacOS 13.0+
  - Xcode 11+

## Installation
 **CocoaPods**

SSSwiftUIGIFView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SSSwiftUIGIFView'
```

**Swift Package Manager**

When using Xcode 11 or later, you can install `SSSwiftUIGIFView` by going to your Project settings > `Swift Packages` and add the repository by providing the GitHub URL. Alternatively, you can go to `File` > `Add Package Dependencies...`

         dependencies: [
             .package(url: "https://github.com/SimformSolutionsPvtLtd/SSSwiftUIGIFView.git", from: "2.0.0")
         ]
         
**Manually**

1. Add `GIFCache.swift`, `GIFImageViewModel.swift`, `GIFPlayerView.swift` and `SwiftUIGIFPlayerView.swift` to your project.
2. Grab yourself a cold 🍺.

## Documentation

[Documentation](https://swiftpackageindex.com/SimformSolutionsPvtLtd/SSSwiftUIGIFView/master/documentation/ssswiftuigifview) - Find the full API reference for more detailed documentation.

## Usage example
-
    **Import framework**

        import SSSwiftUIGIFView
   
-
    **Load GIF with SwiftUIGIFPlayerView function**
      
        SwiftUIGIFPlayerView(gifName: "Gif Name")

-        
    **Load GIF URL with SwiftUIGIFPlayerView function**
      
        SwiftUIGIFPlayerView(gifURL: gifURL) // Here the gifURL is a link to a GIF.
-        
    **If we want to show the default progress bar while loading a GIF**
    
        // Default value for isShowProgressView is false 
        
        SwiftUIGIFPlayerView(gifURL: gifURL, isShowProgressView: true)
        
-        
    **If we want to show a custom progress bar while loading a GIF**
            
        SwiftUIGIFPlayerView(gifURL: gifURL) {
            //Custom Progress bar view
        }
    
<br> </br>
<p align="center">
<img src="demo.gif" width="40%" height="40%"/>
</p>
<br> </br>

## How to Contribute 🤝 

Whether you're helping us fix bugs, improve the docs, or a feature request, we'd love to have you! :muscle:
Check out our [**Contributing Guide**](CONTRIBUTING.md) for ideas on contributing.

## Find this example useful? ❤️

Support it by joining [stargazers](https://github.com/SimformSolutionsPvtLtd/SSSwiftUIGIFView/stargazers) :star: for this repository.

## Bugs and Feedback

For bugs, feature feature requests, and discussion use [GitHub Issues](https://github.com/SimformSolutionsPvtLtd/SSSwiftUIGIFView/issues).


## Check out our other Libraries

<h3><a href="https://github.com/SimformSolutionsPvtLtd/Awesome-Mobile-Libraries"><u>🗂 Simform Solutions Libraries→</u></a></h3>


## MIT License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

[PR-image]:https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat
[PR-url]:http://makeapullrequest.com
[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[Swift Compatibility-badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FSimformSolutionsPvtLtd%2FSSSwiftUIGIFView%2Fbadge%3Ftype%3Dswift-versions
[Platform Compatibility-badge]: https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FSimformSolutionsPvtLtd%2FSSSwiftUIGIFView%2Fbadge%3Ftype%3Dplatforms
