//
//  AutoLayoutExViewController.swift
//  AnimationEx
//
//  Created by Jinnify on 2020/06/01.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class AutoLayoutExViewController: UIViewController {
  
  @IBOutlet var buttonMenu: UIButton!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet weak var menuHeightConstraint: NSLayoutConstraint!
  
  //bottom
  @IBOutlet weak var bottomToggleButton: UIButton!
  @IBOutlet weak var bottomHeightConstraints: NSLayoutConstraint!
  
  var isMenuOpen = false
  var isBottomOpen = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func actionToggleMenu(_ sender: AnyObject) {
    
    titleLabel.superview?.constraints.forEach({ constraint in
      print(" -> \(constraint.description)")
    })
    
    isMenuOpen = !isMenuOpen
    
    titleLabel.superview?.constraints.forEach { constraint in
      if constraint.firstItem === titleLabel && constraint.firstAttribute == .centerX {
        constraint.constant = isMenuOpen ? -100.0 : 0.0
      }
    }
    
    menuHeightConstraint.constant = isMenuOpen ? 200.0 : 80.0
    titleLabel.text = isMenuOpen ? "Open" : "Close"
    
    let angle: CGFloat = isMenuOpen ? .pi / 4 : 0.0
    buttonMenu.transform = CGAffineTransform(rotationAngle: angle)
    
    UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10.0, options: .curveEaseIn, animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }
  
  @IBAction func actionBottomToggle(_ sender: UIButton) {
    
    isBottomOpen = !isBottomOpen
    
    bottomToggleButton.superview?.constraints.forEach { constraint in
      print(" -> \(constraint.description)")
      if constraint.firstItem === bottomToggleButton && constraint.firstAttribute == .leading {
        constraint.constant = isBottomOpen ? 200.0 : 30.0
      }
    }
    
    bottomHeightConstraints.constant =  isBottomOpen ? 300.0 : 100.0
    
    let buttonTitle = isBottomOpen ? "Pop down" : "Pop up"
    bottomToggleButton.setTitle(buttonTitle, for: .normal)
    
    UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10.0, options: .curveEaseIn, animations: {
      self.view.layoutIfNeeded()
    }, completion: nil)
  }
}
