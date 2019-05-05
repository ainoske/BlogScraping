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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
