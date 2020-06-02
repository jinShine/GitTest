//
//  ViewController.swift
//  AnimationEx
//
//  Created by Seungjin on 19/12/2019.
//  Copyright © 2019 Jinnify. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let viewControllers = ["Animate", "Transition", "Keyframe", "AutoLayout"]

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

}

extension ViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewControllers.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { return UITableViewCell() }

    cell.textLabel?.text = viewControllers[indexPath.row]

    return cell
  }

}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: viewControllers[indexPath.row])
    navigationController?.pushViewController(viewController, animated: true)
  }
}
