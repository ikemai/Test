# TapGestureGeneraterView

[![Carthage Compatibility](https://img.shields.io/badge/carthage-✓-f2a77e.svg?style=flat)](https://github.com/Carthage/Carthage/)
[![Version](https://img.shields.io/cocoapods/v/DynamicBlurView.svg?style=flat)](http://cocoadocs.org/docsets/DynamicBlurView)
[![License](https://img.shields.io/cocoapods/l/DynamicBlurView.svg?style=flat)](http://cocoadocs.org/docsets/DynamicBlurView)
[![Platform](https://img.shields.io/cocoapods/p/DynamicBlurView.svg?style=flat)](http://cocoadocs.org/docsets/DynamicBlurView)

TapGestureGeneraterView can get a verirty of gestures

## How to Install DynamicBlurView

### iOS 8+

#### Cocoapods

Add the following to your `Podfile`:

```Ruby
pod "TapGestureGeneraterView"
use_frameworks!
```
Note: the `use_frameworks!` is required for pods made in Swift.

#### Carthage

Add the following to your `Cartfile`:

```Ruby
github "ikemai/TapGestureGeneraterView"
```

## Usage

### import

If target is ios8.0 or later, please import the `ScaledVisibleCellsCollectionView`.

```Swift
import TapGestureGeneraterView
```

### Example


* Set TapGestureGeneraterView

```swift
gestureView = TapGestureGeneraterView(frame: view.frame)
view.addSubview(gestureView)
```

* Remove all seted gestures

```swift
gestureView.reset()
```

* Set tap gesture

```swift
// Tap
gestureView.setTapGesture({[weak self] tapGestureView in
if let me = self {
me.gestureView.backgroundColor = me.tapColor
me.labelView.text = "Tap Gesture"
me.summaryLabelView.text = ""
}
})

// Double tap
gestureView.setDoubleTapGesture({[weak self] tapGestureView in
if let me = self {
me.gestureView.backgroundColor = me.tapColor
me.labelView.text = "Double Tap Gesture"
me.summaryLabelView.text = ""
}
})

// Triple tap
gestureView.setTripleTapGesture({[weak self] tapGestureView in
if let me = self {
me.gestureView.backgroundColor = me.tapColor
me.labelView.text = "Triple Tap Gesture"
me.summaryLabelView.text = ""
}
})
```

* Set touches and dragging

```swift
// Touches began
gestureView.setTouchesBegan({[weak self] tapGestureView, point in
if let me = self {
me.gestureView.backgroundColor = me.touchColor
me.labelView.text = "Touches Began"
me.summaryLabelView.text = "point = \(point)"
}
})
// Touches cancelled
gestureView.setTouchesCancelled({[weak self] tapGestureView, point in
if let me = self {
me.gestureView.backgroundColor = me.touchColor
me.labelView.text = "Touches Cancelled"
me.summaryLabelView.text = "point = \(point)"
}
})
// Touches ended
gestureView.setTouchesEnded({[weak self] tapGestureView, point in
if let me = self {
me.gestureView.backgroundColor = me.touchColor
me.labelView.text = "Touches Ended"
me.summaryLabelView.text = "point = \(point)"
}
})
// Dragging
gestureView.setDraggingGesture({[weak self] tapGestureView, deltaPoint in
if let me = self {
me.gestureView.backgroundColor = me.touchColor
me.labelView.text = "Drraging"
me.summaryLabelView.text = "deltaPoint = \(deltaPoint)"
}
})
```

* Set pinch gestures

```swift
// Pinching
gestureView.setPinchingGesture({[weak self] tapGestureView, sender in
if let me = self {
me.gestureView.backgroundColor = me.pinchColor
me.labelView.text = "Pinching Gesture"
me.summaryLabelView.text = "sender = \(sender)"
}
})
// Pinch in
gestureView.setPinchInGesture({[weak self] tapGestureView, sender in
if let me = self {
me.gestureView.backgroundColor = me.pinchColor
me.labelView.text = "Pinch In Gesture"
me.summaryLabelView.text = "sender = \(sender)"
}
})
// Pinch out
gestureView.setPinchOutGesture({[weak self] tapGestureView, sender in
if let me = self {
me.gestureView.backgroundColor = me.pinchColor
me.labelView.text = "Pinch Out Gesture"
me.summaryLabelView.text = "sender = \(sender)"
}
})
```

* Set swip gestures

```swift
// Swip to left
gestureView.setSwipToLeftGesture({[weak self] tapGestureView, gesture in
if let me = self {
me.gestureView.backgroundColor = me.swipColor
me.labelView.text = "Swip To Left"
me.summaryLabelView.text = "gesture = \(gesture)"
}
})
// Swip to right
gestureView.setSwipToRightGesture({[weak self] tapGestureView, gesture in
if let me = self {
me.gestureView.backgroundColor = me.swipColor
me.labelView.text = "Swip To Right"
me.summaryLabelView.text = "gesture = \(gesture)"
}
})
// Swip to top
gestureView.setSwipToUpGesture({[weak self] tapGestureView, gesture in
if let me = self {
me.gestureView.backgroundColor = me.swipColor
me.labelView.text = "Swip To Up"
me.summaryLabelView.text = "gesture = \(gesture)"
}
})
// Swip to down
gestureView.setSwipToDownGesture({[weak self] tapGestureView, gesture in
if let me = self {
me.gestureView.backgroundColor = me.swipColor
me.labelView.text = "Swip To Down"
me.summaryLabelView.text = "gesture = \(gesture)"
}
})
```

### Function

* Remove all seted gestures

```swift
reset()
```

* Set tap gesture

```swift
// Tap
func setTapGesture(event: (TapGestureGeneraterView) -> Void)

// Double tap
func setDoubleTapGesture(event: (TapGestureGeneraterView) -> Void)

// Triple tap
func setTripleTapGesture(event: (TapGestureGeneraterView) -> Void)
```

* Set touches and dragging

```swift
// Touches began
func setTouchesBegan(event: (TapGestureGeneraterView, CGPoint) -> Void)

// Touches cancelled
func setTouchesCancelled(event: (TapGestureGeneraterView, CGPoint) -> Void)

// Touches ended
func setTouchesEnded(event: (TapGestureGeneraterView, CGPoint) -> Void)

// Dragging
func setDraggingGesture(event: (TapGestureGeneraterView, CGPoint) -> Void)
```

* Set pinch gestures

```swift
// Pinching
func setPinchingGesture(event: (TapGestureGeneraterView, UIPinchGestureRecognizer) -> Void)

// Pinch in
func setPinchInGesture(event: (TapGestureGeneraterView, UIPinchGestureRecognizer) -> Void)

// Pinch out
func setPinchOutGesture(event: (TapGestureGeneraterView, UIPinchGestureRecognizer) -> Void)
```

* Set swip gestures

```swift
// Swip to left
func setSwipToLeftGesture(event: (TapGestureGeneraterView, UIGestureRecognizer) -> Void)

// Swip to right
func setSwipToRightGesture(event: (TapGestureGeneraterView, UIGestureRecognizer) -> Void)

// Swip to top
func setSwipToUpGesture(event: (TapGestureGeneraterView, UIGestureRecognizer) -> Void)

// Swip to down
func setSwipToDownGesture(event: (TapGestureGeneraterView, UIGestureRecognizer) -> Void)
```

## Acknowledgements

* Inspired by [FXBlurView](https://github.com/nicklockwood/FXBlurView) in [nicklockwood](https://github.com/nicklockwood).

## LICENSE

Under the MIT license. See LICENSE file for details.
