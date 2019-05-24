//
//  PhotoPresentHinataViewController.swift
//  ScrapingSwift
//
//  Created by 高野隆正 on 2019/05/10.
//  Copyright © 2019 高野隆正. All rights reserved.
//

import UIKit

protocol PhotoPresentHinataViewControllerDelegate: AnyObject {
    func photoPresentHinataViewControllerDidTapClose(_ viewController: PhotoPresentHinataViewController)
}

class PhotoPresentHinataViewController: UIViewController {
    
    weak var delegate: PhotoPresentHinataViewControllerDelegate?

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeSuccess(_ sender: UIButton) {
        delegate?.photoPresentHinataViewControllerDidTapClose(self)
    }

}
