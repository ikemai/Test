//
//  TapGestureGeneraterView.swift
//  TapGestureGeneraterViewTest
//
//  Created by Mai Ikeda on 2015/08/12.
//  Copyright © 2015年 mai_ikeda. All rights reserved.
//

import UIKit

class TapGestureGeneraterView: UIView {
    
    // tap
    private var didTapGesture: ((TapGestureGeneraterView) -> Void)?
    private var didDoubleTapGesture: ((TapGestureGeneraterView) -> Void)?
    private var didTripleTapGesture: ((TapGestureGeneraterView) -> Void)?
    
    // touches
    private var didTouchesBegan: ((TapGestureGeneraterView, CGPoint) -> Void)?
    private var didTouchesCancelled: ((TapGestureGeneraterView, CGPoint) -> Void)?
    private var didTouchesEnded: ((TapGestureGeneraterView, CGPoint) -> Void)?
    
    // dragging
    private var draggingGesture: ((TapGestureGeneraterView, CGPoint) -> Void)?
    
    // pinch
    private var pinchGesture: UIPinchGestureRecognizer?
    private var pinchingGesture: ((TapGestureGeneraterView, UIPinchGestureRecognizer) -> Void)?
    private var didPinchInGesture: ((TapGestureGeneraterView, UIPinchGestureRecognizer) -> Void)?
    private var didPinchOutGesture: ((TapGestureGeneraterView, UIPinchGestureRecognizer) -> Void)?
    
    // swip
    private var didSwipToLeftGesture: ((TapGestureGeneraterView, UIGestureRecognizer) -> Void)?
    private var didSwipToRightGesture: ((TapGestureGeneraterView, UIGestureRecognizer) -> Void)?
    private var didSwipToUpGesture: ((TapGestureGeneraterView, UIGestureRecognizer) -> Void)?
    private var didSwipToDownGesture: ((TapGestureGeneraterView, UIGestureRecognizer) -> Void)?
}

//
// MARK:- override method
//
extension TapGestureGeneraterView {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let point = touch.locationInView(self)
        didTouchesBegan?(self, point)
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        
        guard let touch = touches?.first else {
            return
        }
        let point = touch.locationInView(self)
        didTouchesCancelled?(self, point)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let draggingGesture = draggingGesture else {
            return
        }
        if let firstTouch = touches.first {
            let location = firstTouch.locationInView(self)
            let prevLocation = firstTouch.previousLocationInView(self)
            let deltaX = location.x - prevLocation.x
            let deltaY = location.y - prevLocation.y
            let deltaPoint = CGPoint(x: deltaX, y: deltaY)
            draggingGesture(self, deltaPoint)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        guard let touch = touches.first else {
            return
        }
        let point = touch.locationInView(self)
        didTouchesEnded?(self, point)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userInteractionEnabled = true
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        reset()
    }
}

//
// MARK:- All gestures is reset
//
extension TapGestureGeneraterView {
    
    func reset() {
        guard let gestureRecognizers = gestureRecognizers else {
            return
        }
        for gestureRecognizer in gestureRecognizers {
            removeGestureRecognizer(gestureRecognizer)
        }
    }
}

//
// MARK:- Set tap gestures
//
extension TapGestureGeneraterView {
    
    func setTapGesture(event: (TapGestureGeneraterView) -> Void) {
        didTapGesture = event
        let gesture = UITapGestureRecognizer(target: self, action: "tapGestureRecognizerEvent:")
        addGestureRecognizer(gesture)
    }
    
    func setDoubleTapGesture(event: (TapGestureGeneraterView) -> Void) {
        didDoubleTapGesture = event
        let gesture = UITapGestureRecognizer(target: self, action: "doubleTapGestureRecognizerEvent:")
        gesture.numberOfTapsRequired = 2
        addGestureRecognizer(gesture)
    }
    
    func setTripleTapGesture(event: (TapGestureGeneraterView) -> Void) {
        didTripleTapGesture = event
        let gesture = UITapGestureRecognizer(target: self, action: "tripleTapGestureRecognizerEvent:")
        gesture.numberOfTapsRequired = 3
        addGestureRecognizer(gesture)
    }
}

//
// MARK:- Set touches and dragging
//
extension TapGestureGeneraterView {
    
    func setTouchesBegan(event: (TapGestureGeneraterView, CGPoint) -> Void) {
        didTouchesBegan = event
    }
    
    func setTouchesCancelled(event: (TapGestureGeneraterView, CGPoint) -> Void) {
        didTouchesCancelled = event
    }
    
    func setTouchesEnded(event: (TapGestureGeneraterView, CGPoint) -> Void) {
        didTouchesEnded = event
    }
    
    func setDraggingGesture(event: (TapGestureGeneraterView, CGPoint) -> Void) {
        draggingGesture = event
    }
}

//
// MARK:- Set pinch gestures
//
extension TapGestureGeneraterView {
    
    func setPinchingGesture(event: (TapGestureGeneraterView, UIPinchGestureRecognizer) -> Void) {
        if pinchGesture == nil {
            setPinchGesture()
        }
        pinchingGesture = event
    }
    
    func setPinchInGesture(event: (TapGestureGeneraterView, UIPinchGestureRecognizer) -> Void) {
        if pinchGesture == nil {
            setPinchGesture()
        }
        didPinchInGesture = event
    }
    
    func setPinchOutGesture(event: (TapGestureGeneraterView, UIPinchGestureRecognizer) -> Void) {
        if pinchGesture == nil {
            setPinchGesture()
        }
        didPinchOutGesture = event
    }
    
    private func setPinchGesture() {
        pinchGesture = UIPinchGestureRecognizer(target: self, action: "pinchGestureRecognizerEvent:")
        if let pinchGesture = pinchGesture {
            addGestureRecognizer(pinchGesture)
        }
    }
}

//
// MARK:- Set swip gestures
//
extension TapGestureGeneraterView {
    
    func setSwipToLeftGesture(event: (TapGestureGeneraterView, UIGestureRecognizer) -> Void) {
        didSwipToLeftGesture = event
        let gesture = UISwipeGestureRecognizer(target: self, action: "swipToLeftGestureRecognizerEvent:")
        gesture.direction = UISwipeGestureRecognizerDirection.Left
        addGestureRecognizer(gesture)
    }
    
    func setSwipToRightGesture(event: (TapGestureGeneraterView, UIGestureRecognizer) -> Void) {
        didSwipToRightGesture = event
        let gesture = UISwipeGestureRecognizer(target: self, action: "swipToRightGestureRecognizerEvent:")
        gesture.direction = UISwipeGestureRecognizerDirection.Right
        addGestureRecognizer(gesture)
    }
    
    func setSwipToUpGesture(event: (TapGestureGeneraterView, UIGestureRecognizer) -> Void) {
        didSwipToUpGesture = event
        let gesture = UISwipeGestureRecognizer(target: self, action: "swipToUpGestureRecognizerEvent:")
        gesture.direction = UISwipeGestureRecognizerDirection.Up
        addGestureRecognizer(gesture)
    }
    
    func setSwipToDownGesture(event: (TapGestureGeneraterView, UIGestureRecognizer) -> Void) {
        didSwipToDownGesture = event
        let gesture = UISwipeGestureRecognizer(target: self, action: "swipToDownGestureRecognizerEvent:")
        gesture.direction = UISwipeGestureRecognizerDirection.Down
        addGestureRecognizer(gesture)
    }
}

//
// MARK:- Protocol
//
extension TapGestureGeneraterView {
    
    func tapGestureRecognizerEvent(sender: UITapGestureRecognizer) {
        didTapGesture?(self)
    }
    
    func doubleTapGestureRecognizerEvent(sender: UITapGestureRecognizer) {
        didDoubleTapGesture?(self)
    }
    
    func tripleTapGestureRecognizerEvent(sender: UITapGestureRecognizer) {
        didTripleTapGesture?(self)
    }
    
    func pinchGestureRecognizerEvent(sender: UIPinchGestureRecognizer) {
        pinchingGesture?(self, sender)
        
        let firstPoint = sender.scale
        let secondPoint = sender.velocity
        
        if firstPoint < secondPoint {
            didPinchOutGesture?(self, sender)
        } else {
            didPinchInGesture?(self, sender)
        }
    }
    
    func swipToLeftGestureRecognizerEvent(gesture: UIGestureRecognizer) {
        didSwipToLeftGesture?(self, gesture)
    }
    
    func swipToRightGestureRecognizerEvent(gesture: UIGestureRecognizer) {
        didSwipToRightGesture?(self, gesture)
    }
    
    func swipToUpGestureRecognizerEvent(gesture: UIGestureRecognizer) {
        didSwipToUpGesture?(self, gesture)
    }
    
    func swipToDownGestureRecognizerEvent(gesture: UIGestureRecognizer) {
        didSwipToDownGesture?(self, gesture)
    }
}