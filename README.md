<p align="center">
<img src="https://user-images.githubusercontent.com/17319991/84597356-1c235500-ae6c-11ea-8779-2d44f432d83e.png" alt="SwiftySynchronized" title="SwiftySynchronized" width="495"/>
</p>

<p align="center">
<a href="https://travis-ci.org/nik3212/SwiftySynchronized"><img src="https://img.shields.io/travis/nik3212/SwiftySynchronized/master.svg"></a>
<a href="https://github.com/nik3212/SwiftySynchronized/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-blue.svg"></a>
<a href="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat"></a>
<a href="https://img.shields.io/github/repo-size/nik3212/SwiftySynchronized"><img src="https://img.shields.io/github/repo-size/nik3212/SwiftySynchronized"></a>
<a href="https://img.shields.io/badge/Language-Swift-orange.svg"><img src="https://img.shields.io/badge/Language-Swift-orange.svg"></a>
<a href="https://img.shields.io/cocoapods/v/SwiftySynchronized.svg"><img src="https://img.shields.io/cocoapods/v/SwiftySynchronized.svg"></a>
<a href="https://img.shields.io/cocoapods/p/SwiftySynchronized.svg?style=flat"><img src="https://img.shields.io/cocoapods/p/SwiftySynchronized.svg?style=flat"></a>
 
A Swift generic wrapper type to help enforce thread-safe usage of stored properties.

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [Author](#author)
- [License](#license)

## Features

* Available locking strategy 
  * `pthread_mutex_t`
  * `NSLock`
  * `DispatchQueue`
  * `DispatchSemaphore`
  * `Spinlock`
  * `pthread_rwlock_t`
  * `os_unfair_lock`
## Requirements

* iOS 9.0+ / macOS 10.10+ / tvOS 9.0+ / watchOS 2.0+
* Xcode 11+
* Swift 5.1+

## Usage

``` swift
import SwiftySynchronized

struct Example {
    private let count = Synchronized<Int>(value: 0, lock: NSLock())
    
    func updateCount() {
        count.update { (value) in
            value += 1
        }
    }
}
```

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate SwiftySynchronized into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SwiftySynchronized', '~> 0.0.1'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate SwiftySynchronized into your Xcode project using Carthage, specify it in your `Cartfile`:

```
github "nik3212/SwiftySynchronized" ~> 0.0.1
```

```bash
$ carthage update
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but SwiftySynchronized does support its use on supported platforms.

Once you have your Swift package set up, adding SwiftySynchronized as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/nik3212/SwiftySynchronized.git", .upToNextMajor(from: "0.0.1"))
]
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate SwiftySynchronized into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

  ```bash
  $ git init
  ```

- Add SwiftySynchronized as a git [submodule](https://git-scm.com/docs/git-submodule) by running the following command:

  ```bash
  $ git submodule add https://github.com/nik3212/SwiftySynchronized.git
  ```

- Open the new `SwiftySynchronized` folder, and drag the `SwiftySynchronized.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `SwiftySynchronized.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `SwiftySynchronized.xcodeproj` folders each with two different versions of the `SwiftySynchronized.framework` nested inside a `Products` folder.

    > It does not matter which `Products` folder you choose from, but it does matter whether you choose the top or bottom `SwiftySynchronized.framework`.

- Select the top `SwiftySynchronized.framework` for iOS and the bottom one for macOS.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `SwiftySynchronized` will be listed as either `SwiftySynchronized iOS`, `SwiftySynchronized macOS`, `SwiftySynchronized tvOS` or `SwiftySynchronized watchOS`.

- And that's it!

  > The `SwiftySynchronized.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.
  
## Contributing

Please feel free to help out with this project! If you see something that could be made better or want a new feature, open up an issue or send a Pull Request!

## Author

Nikita Vasilev, nv3212@gmail.com

## License

SwiftySynchronized is available under the MIT license. See the LICENSE file for more info.
