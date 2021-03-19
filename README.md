# HookKit

Generic event hook functions and invocation for Swift.


## Install

Add the repository as a dependency:

```swift
.package(url: "https://github.com/binarybirds/hook-kit.git", from: "1.0.0"),
```

Add HookKit to the target dependencies:

```swift
.product(name: "HookKit", package: "hook-kit"),
```

Update the packages and you are ready to use HookKit.


## Basic usage

```swift
let hooks = HookStorage()
hooks.register("test") { _ in "Hello world" }
let result: String? = hooks.invoke("test")
print(result) /// Optional("Hello world")
```

To learn more about hook functions, please read my [article](https://theswiftdev.com/event-driven-generic-hooks-for-swift/).
