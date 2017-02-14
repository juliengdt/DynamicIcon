//
//  ViewController.swift
//  Dynamic Icon
//
//  Created by Julien Goudet on 14/02/2017.
//  Copyright © 2017 jlngdt. All rights reserved.
//

import UIKit


enum StyleType: Int {
    
    case adn = 1
    case home = 2
    case soccer = 3
    
    
    var iconName: String {
        switch self {
        case .adn:
            return "adn"
        case .home:
            return "home"
        case .soccer:
            return "soccer"
        }
    }
    
}

class ViewController: UIViewController {

    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - User Interactions

    /// Action handled when user tap on a given stylished style. See:
    /// - StyleType enum
    @IBAction func changeStyle(_ sender: UIButton) {
        
        guard UIApplication.shared.supportsAlternateIcons,
            let newStyle = StyleType(rawValue: sender.tag) else { return }
        
        UIApplication.shared.setAlternateIconName(newStyle.iconName) { err in
            if let err = err {
                print("/!\\ Woops ! \(String(describing: err))")
            }
        }
        
    }
    
    /// Action handled when user tap on the "I want to reset the app icon" button
    @IBAction func resetAppIcon() {
        
        guard UIApplication.shared.supportsAlternateIcons else { return }
        
        UIApplication.shared.setAlternateIconName(nil) { err in
            if let err = err {
                print("/!\\ Woops ! \(String(describing: err))")
            }
        }
        
    }

}
