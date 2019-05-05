//
//  ViewController.swift
//  ScrapingSwift
//
//  Created by 高野隆正 on 2019/02/26.
//  Copyright © 2019 高野隆正. All rights reserved.
//

import UIKit
import Alamofire
import Kanna

class KeyakiViewController: UIViewController {
    
    static func createWithTabBarItem() -> UIViewController {
        let viewController = KeyakiViewController()
        viewController.tabBarItem = UITabBarItem(title: "欅坂", image: UIImage(named: "欅坂"), tag: 0)
        return viewController
    }
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var scrapingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrapingButton.layer.cornerRadius = 10
        
    }
    

    @IBAction func scrapingTapped(_ sender: Any) {
        guard let text = self.textfield.text, let member = MemberOfKeyaki(memberNumber: text) else {
            return
        }
        ScrapingKeyakiBlog.screpeWebsite(member: member)
        print("tapped")
        
    }
}

extension KeyakiViewController: PhotoPresentViewControllerDelegate {
    func photoPresentViewControllerDidTapClose(_ viewController: PhotoPresentViewController) {
        dismiss(animated: true, completion: nil)
    }
}
