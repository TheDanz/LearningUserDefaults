//
//  ViewController.swift
//  LearningUserDefaults
//
//  Created by Danil Ryumin on 01.01.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var switcher: UISwitch!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switcher.isOn = userDefaults.bool(forKey: "switcher")
        imageView.image = UIImage(named: userDefaults.string(forKey: "photo")!)
    }
    
    @IBAction func switchClick(_ sender: Any) {
        if switcher.isOn {
            userDefaults.set("gogol", forKey: "photo")
            userDefaults.set(true, forKey: "switcher")
            imageView.image = #imageLiteral(resourceName: "gogol")
        } else {
            userDefaults.set("turgenev", forKey: "photo")
            userDefaults.set(false, forKey: "switcher")
            imageView.image = #imageLiteral(resourceName: "turgenev")
        }
    }
}

