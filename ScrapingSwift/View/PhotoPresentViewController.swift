//
//  PhotoPresentViewController.swift
//  ScrapingSwift
//
//  Created by 高野隆正 on 2019/02/26.
//  Copyright © 2019 高野隆正. All rights reserved.
//

import UIKit

protocol PhotoPresentViewControllerDelegate: AnyObject {
    func photoPresentViewControllerDidTapClose(_ viewController: PhotoPresentViewController)
}

class PhotoPresentViewController: UIViewController {
    
    weak var delegate: PhotoPresentViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func closeSuccess(_ sender: UIButton) {
        delegate?.photoPresentViewControllerDidTapClose(self)
    }

}
