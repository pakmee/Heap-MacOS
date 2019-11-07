# Heap for MacOS 📞

An extremely light Heap MacOS Framework for sending events and tracking users.

<img src="/Assets/GithubHeader.png?raw=true" width="888">

### Installation: Carthage

1.  Add `github "marvelapp/Heap-MacOS" "master"` to your Cartfile.
2.  Run carthage update.
3.  Go to your Xcode project's "General" settings. Drag `marvelapp/Heap-MacOS.framework` from `Carthage/Build/macOS` to the "Embedded Binaries" section. Make sure “Copy items if needed” is selected and click Finish.

### Example

```
import Heap

Heap.shared.setup(appId: "YOUR APP ID", identity: "max@marvelapp.com")

var customAttributes: [String: Any] {
  "Name": "Maxime De Greve"
}

Heap.shared.events.track(event: "Sign Up Click", properties: customAttributes)

```

### More documentation

Soon
