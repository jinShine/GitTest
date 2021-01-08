//
//  TransitionViewController.swift
//  AnimationEx
//
//  Created by Jinnify on 2020/05/27.
//  Copyright © 2020 Jinnify. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {
  
  @IBOutlet weak var bgImagView: UIImageView!
  @IBOutlet weak var cloud1: UIImageView!
  @IBOutlet weak var cloud2: UIImageView!
  @IBOutlet weak var plane: UIImageView!
  @IBOutlet weak var balloon: UIImageView!
  @IBOutlet weak var flightNr: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    animateCloud(cloud1)
    animateCloud(cloud2)
    animateCloud(balloon)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
    reset()
  }
  
  @IBAction func animateAction(_ sender: UIButton) {
    
    basicTransition()
    cubeTransition(label: flightNr, text: "ZY 2014", direction: .up)
    crossfadingTransition(imageView: bgImagView, toImage: UIImage(named: "bg-snowy")!)
  }
  
  func animateCloud(_ cloud: UIImageView) {
    let speed = 60.0 / self.view.frame.width
    let duration = (self.view.frame.width - cloud.frame.origin.x) * speed
    
    UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: .curveLinear, animations: {
      cloud.frame.origin.x = self.view.frame.width
    }) { _ in
      cloud.frame.origin.x = -cloud.frame.width
      self.animateCloud(cloud)
    }
  }
  
  /*
   Transitions
   */
  func basicTransition() {
    UIView.transition(with: plane, duration: 3.0, options: [], animations: {
      self.plane.frame.origin.x = self.view.frame.width
      self.plane.alpha = 0.0
    }, completion: { _ in
      self.plane.frame.origin.x = 30
      self.plane.alpha = 1.0
    })
  }
  
  /*
   Crossfading
   */
  func crossfadingTransition(imageView: UIImageView, toImage: UIImage) {
    UIView.transition(with: imageView, duration: 2.0, options: [.transitionCrossDissolve], animations: {
      imageView.image = toImage
    }, completion: { _ in
      delay(seconds: 1) {
        self.crossfadingTransition(imageView: imageView, toImage: UIImage(named: "bg-sunny")!)
      }
    })
  }
  
  /*
  Cube transitions
  */
  
  enum CubeDirection: Int {
    case up = -1
    case down = 1
  }
  
  func cubeTransition(label: UILabel, text: String, direction: CubeDirection) {
    let replaceLabel = UILabel(frame: label.frame)
    replaceLabel.text = text
    replaceLabel.font = label.font
    replaceLabel.textAlignment = label.textAlignment
    replaceLabel.textColor = label.textColor
    replaceLabel.backgroundColor = .clear
    
    let replaceLabelOffset = CGFloat(direction.rawValue) * label.frame.height / 2
    replaceLabel.transform = CGAffineTransform(translationX: 0.0, y: replaceLabelOffset).scaledBy(x: 1.0, y: 0.1)
    
    label.superview?.addSubview(replaceLabel)
    
    UILabel.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
      replaceLabel.transform = .identity
      label.transform = CGAffineTransform(translationX: 0.0, y: -replaceLabelOffset).scaledBy(x: 1.0, y: 0.1)
    }, completion: { _ in
      label.transform = .identity
      label.text = replaceLabel.text
      
      replaceLabel.removeFromSuperview()
    })
    
    
  }
  
  func reset() {
    bgImagView = nil
    cloud1 = nil
    cloud2 = nil
    plane = nil
    balloon = nil
    flightNr = nil
  }
  
}

func delay(seconds: Double, completion: @escaping ()-> Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: completion)
}
