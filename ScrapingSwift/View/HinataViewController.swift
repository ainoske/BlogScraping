//
//  HinataViewController.swift
//  ScrapingSwift
//
//  Created by 高野隆正 on 2019/05/05.
//  Copyright © 2019 高野隆正. All rights reserved.
//

import UIKit
import Alamofire
import Kanna

class HinataViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    
    @IBOutlet weak var scrapingButton: UIButton!
    
    private var completion: (_ error: Error?) -> Void = { _ in }
    
    static func createWithTabBarItem() -> UIViewController {
        let viewController = HinataViewController()
        viewController.tabBarItem = UITabBarItem(title: "日向坂", image: UIImage(named: "日向坂"), tag: 1)
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrapingButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func scrapingTapped(_ sender: Any) {
        
        guard let text = self.textfield.text, let member = MemberOfHinata(memberNumber: text) else {
            return
        }
        
        let scrape = ScrapingHinataBlog()
        scrape.screpeWebsite(member: member, completion: { [weak self] in
            DispatchQueue.main.async { [weak self] in
                let hinataSuccessPresenter = PhotoPresentHinataViewController()
                hinataSuccessPresenter.delegate = self
                self?.present(hinataSuccessPresenter, animated: true)
            }
        })        
    }
}

extension HinataViewController: PhotoPresentHinataViewControllerDelegate {
    func photoPresentHinataViewControllerDidTapClose(_ viewController: PhotoPresentHinataViewController) {
        dismiss(animated: true, completion: nil)
    }
}
