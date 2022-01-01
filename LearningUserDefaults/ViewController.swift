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
        
        var color: UIColor? {
            guard let name = userDefaults.object(forKey: "theme") as? String,
                    let color = Color(rawValue: name) else { return nil }
                switch color {
                case .black: return .black
                case .white: return .white
            }
        }
        
        switcher.isOn = userDefaults.bool(forKey: "switcher")
        imageView.image = UIImage(named: userDefaults.string(forKey: "photo")!)
        view.backgroundColor = color
    }
    
    @IBAction func switchClick(_ sender: Any) {
        if switcher.isOn {
            userDefaults.set("gogol", forKey: "photo")
            userDefaults.set(true, forKey: "switcher")
            userDefaults.set(Color.black.rawValue, forKey: "theme")
            
            imageView.image = #imageLiteral(resourceName: "gogol")
            view.backgroundColor = .black
        } else {
            userDefaults.set("turgenev", forKey: "photo")
            userDefaults.set(false, forKey: "switcher")
            userDefaults.set(Color.white.rawValue, forKey: "theme")
            
            imageView.image = #imageLiteral(resourceName: "turgenev")
            view.backgroundColor = .white
        }
    }
}

enum Color: String {
    case black
    case white
}
