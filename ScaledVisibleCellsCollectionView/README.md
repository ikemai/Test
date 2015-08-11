# ScaledVisibleCellsCollectionView

[![Carthage Compatibility](https://img.shields.io/badge/carthage-✓-f2a77e.svg?style=flat)](https://github.com/Carthage/Carthage/)
[![Version](https://img.shields.io/cocoapods/v/DynamicBlurView.svg?style=flat)](http://cocoadocs.org/docsets/DynamicBlurView)
[![License](https://img.shields.io/cocoapods/l/DynamicBlurView.svg?style=flat)](http://cocoadocs.org/docsets/DynamicBlurView)
[![Platform](https://img.shields.io/cocoapods/p/DynamicBlurView.svg?style=flat)](http://cocoadocs.org/docsets/DynamicBlurView)

DynamicBlurView is a dynamic and high performance UIView subclass for Blur.

## Demo
* horizontal_center
![Gif](https://github.com/ikemai/assets/blob/master/ScaledVisibleCellsCollectionView/horizontal_center.gif)
* horizontal_left
![Gif](https://github.com/ikemai/assets/blob/master/ScaledVisibleCellsCollectionView/horizontal_left.gif)
* horizontal_right
![Gif](https://github.com/ikemai/assets/blob/master/ScaledVisibleCellsCollectionView/horizontal_right.gif)
* vertical_center
![Gif](https://github.com/ikemai/assets/blob/master/ScaledVisibleCellsCollectionView/vertical_center.gif)
* vertical_top
![Gif](https://github.com/ikemai/assets/blob/master/ScaledVisibleCellsCollectionView/vertical_top.gif)
* vertical_bottom
![Gif](https://github.com/ikemai/assets/blob/master/ScaledVisibleCellsCollectionView/vertical_bottom.gif)

## How to Install DynamicBlurView

### iOS 8+

#### Cocoapods

Add the following to your `Podfile`:

```Ruby
pod "DynamicBlurView"
use_frameworks!
```
Note: the `use_frameworks!` is required for pods made in Swift.

#### Carthage

Add the following to your `Cartfile`:

```Ruby
github "KyoheiG3/DynamicBlurView"
```


## Usage

### import

If target is ios8.0 or later, please import the `ScaledVisibleCellsCollectionView`.

```Swift
import ScaledVisibleCellsCollectionView
```

### Example

* Set propertis

```swift
let collectionView = ScaledVisibleCellsCollectionView(frame: view.bounds)
collectionView.setScaledDesginParam(scaledPattern: .VerticalCenter, maxScale: 1.2, minScale: 0.5, maxAlpha: 1.0, minAlpha: 0.5)
view.addSubview(collectionView)
```

* Set scale(example: scrollView delegate)

```swift
func scrollViewDidScroll(scrollView: UIScrollView) {
  collectionView.scaledVisibleCells()
}
```

### Variable

* Set Scale

```Swift
private var maxScale: CGFloat = 1.0
private var minScale: CGFloat = 0.5
```

* Set Alpha

```Swift
private var maxAlpha: CGFloat = 1.0
private var minAlpha: CGFloat = 0.5
```

* Set Scroll direction & position at biggest scalling cell

```swift
private var scaledPattern: SC_ScaledPattern = .VerticalCenter
```


### Function

* Set Property (* Please always set)

```swift
func setScaledDesginParam(scaledPattern pattern: SC_ScaledPattern, maxScale: CGFloat, minScale: CGFloat, maxAlpha: CGFloat, minAlpha: CGFloat)
```

* Set Scale for visible cells (* Please call at any time)

```swift
func scaledVisibleCells()
```

## Acknowledgements

* Inspired by [FXBlurView](https://github.com/nicklockwood/FXBlurView) in [nicklockwood](https://github.com/nicklockwood).

## LICENSE

Under the MIT license. See LICENSE file for details.