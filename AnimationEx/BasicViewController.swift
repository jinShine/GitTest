//
//  BasicViewController.swift
//  AnimationEx
//
//  Created by Jinnify on 2020/05/27.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController {
  
  @IBOutlet weak var object: UIView!
  @IBOutlet weak var animationToggle: UISwitch!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    reset()
  }
  
  @IBAction func animationToggle(_ sender: UISwitch) {
    sender.isOn ? start() : reset()
  }
  
  private func start() {
    //    basicAnimation()
    //    springAnimation()
    optionsAnimation()
  }
  
  private func basicAnimation() {
    UIView.animate(withDuration: 1.0, animations: {
      //하나만 가능한게 아니고 동시에 여러개의 속성의 애니메이션이 가능하다.
      self.object.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
      self.object.alpha = 0.5
      self.object.backgroundColor = .magenta
    }, completion: { finished in
      UIView.animate(withDuration: 1.0) {
        self.reset()
      }
    })
  }
  
  private func springAnimation() {
    UIView.animate(withDuration: 1.0,
                   delay: 0,
                   usingSpringWithDamping: 0.2,
                   initialSpringVelocity: 0.2,
                   options: .curveEaseInOut,
                   animations: {
                    self.object.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
                    self.object.alpha = 0.5
                    self.object.backgroundColor = .magenta
    }, completion: nil)
  }
  
  private func optionsAnimation() {
    
    UIView.animate(withDuration: 1.0,
                   delay: 0,
                   options: [.transitionCrossDissolve],
                   animations: {
                    self.object.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
                    self.object.alpha = 0.5
                    self.object.backgroundColor = .magenta
    }, completion: nil)
  }
  
  private func reset() {
    object.frame = CGRect(x: 50, y: 150, width: 50, height: 50)
    object.alpha = 1.0
    object.backgroundColor = UIColor.yellow
    // 애니메이션을 제거 하는 방법
    object.layer.removeAllAnimations()
  }
  
}
