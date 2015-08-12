//
//  ViewController.swift
//  TapGestureGeneraterViewTest
//
//  Created by Mai Ikeda on 2015/08/12.
//  Copyright © 2015年 mai_ikeda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var summaryLabelView: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    @IBOutlet weak var touchButton: UIButton!
    @IBOutlet weak var pinchingButton: UIButton!
    @IBOutlet weak var pinchInOutButton: UIButton!
    @IBOutlet weak var SwipButton: UIButton!
    
    private var gestureView: TapGestureGeneraterView!
    
    private let tapColor = UIColor.greenColor()
    private let touchColor = UIColor.magentaColor()
    private let pinchColor = UIColor.blueColor()
    private let swipColor = UIColor.orangeColor()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gestureView = TapGestureGeneraterView(frame: view.frame)
        gestureView.backgroundColor = UIColor.whiteColor()
        view.addSubview(gestureView)
        view.sendSubviewToBack(gestureView)
        
        labelView.text = ""
        summaryLabelView.text = ""
        
        setButton(tapButton, color: tapColor)
        setButton(touchButton, color: touchColor)
        setButton(pinchingButton, color: pinchColor)
        setButton(pinchInOutButton, color: pinchColor)
        setButton(SwipButton, color: swipColor)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapButtonDidDown(sender: AnyObject) {
        gestureView.reset()
        setTapGestures()
    }
    @IBAction func touchButtonDidDown(sender: AnyObject) {
        gestureView.reset()
        setTouchesAndDrag()
    }
    @IBAction func pinchingButtonDidDown(sender: AnyObject) {
        gestureView.reset()
        setPinchingGesture()
    }
    
    @IBAction func pinchInOutButtonDidDown(sender: AnyObject) {
        gestureView.reset()
        setPinchInOutGesture()
    }
    @IBAction func SwipButtonDidDown(sender: AnyObject) {
        gestureView.reset()
        setSwipGesture()
    }
    private func setButton(button: UIButton, color: UIColor) {
        button.backgroundColor = color
        button.layer.cornerRadius = tapButton.bounds.width / 2
        button.layer.masksToBounds = true
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.whiteColor().CGColor
    }
}

//
// MARK:- Set tap gestures
//
extension ViewController {
    
    private func setTapGestures() {
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
    }
}

//
// MARK:- Set touches and dragging
//
extension ViewController {
    
    private func setTouchesAndDrag() {
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
    }
}

//
// MARK:- Set pinch gestures
//
extension ViewController {
    
    private func setPinchingGesture() {
        // Pinching
        gestureView.setPinchingGesture({[weak self] tapGestureView, sender in
            if let me = self {
                me.gestureView.backgroundColor = me.pinchColor
                me.labelView.text = "Pinching Gesture"
                me.summaryLabelView.text = "sender = \(sender)"
            }
            })
    }
    
    private func setPinchInOutGesture() {
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

    }
}

//
// MARK:- Set swip gestures
//
extension ViewController {
    
    private func setSwipGesture() {
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
    }
}
