//
//  KeyframeViewController.swift
//  AnimationEx
//
//  Created by Jinnify on 2020/05/29.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class KeyframeViewController: UIViewController {
  
  @IBOutlet weak var planeImage: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    loop()
  }
  
  /*
   Keyframe
   */
  func loop() {
    
    let originalCenter = planeImage.center
    
    UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [], animations: {
      UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
        self.planeImage.center.x += 80.0
        self.planeImage.center.y -= 10.0
      }
      UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.5) {
        self.planeImage.transform = CGAffineTransform(rotationAngle: -.pi / 8)
      }
      UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
        self.planeImage.center.x += 100
        self.planeImage.center.y -= 50
        self.planeImage.alpha = 0.0
      }
      UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01) {
        self.planeImage.transform = .identity
        self.planeImage.center = CGPoint(x: 0.0, y: originalCenter.y)
      }
      UIView.addKeyframe(withRelativeStartTime: 0.55, relativeDuration: 0.45) {
        self.planeImage.alpha = 1.0
        self.planeImage.center = originalCenter
      }
    }, completion: nil)
    
    delay(seconds: 2) {
      self.loop()
    }
  }
  
}
