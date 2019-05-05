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
    
    func screpeWebsite(){
        
        guard let text = self.textfield.text, let member = MemberOfHinata(memberNumber: text) else {
            return
        }
        
        
        let blogNumber = member.generateBlogURL()
        
        print(blogNumber)
        
        Alamofire.request(blogNumber).responseString{ response in
            print("\(response.result.isSuccess)")
            
            let photoPresentViewController = PhotoPresentViewController()
            photoPresentViewController.delegate = self
            self.present(photoPresentViewController, animated: true, completion: nil)
            
            if let html = response.result.value{
                self.parseHTML(html: html)
            }
        }
        
    }
    func parseHTML(html: String){
        if let doc = try? HTML(html: html, encoding: .utf8){
            for link in doc.css("div"){
                if "\(link["class"] ?? "")" == "c-blog-article__text"{
                    for me in link.css("img"){
                        guard let imageString = me["src"]
                            else{
                                fatalError("imageString error")
                        }
                        guard let imageURL = URL(string: imageString)
                            else{
                                fatalError("imageURL error")
                        }
                        downloadImage(imageURL: imageURL)
                    }
                }
            }
        }
    }
    func downloadImage(imageURL: URL){
        
        do{
            let data = try Data(contentsOf: imageURL)
            guard let image = UIImage(data: data)
                else{
                    fatalError("image error")
            }
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
        catch let err {
            fatalError("Error : \(err.localizedDescription)")
        }
        
    }
    @objc private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        completion(error)
    }
    @IBAction func scrapingTapped(_ sender: Any) {
        screpeWebsite()
        print("tapped")
        
    }
}

extension HinataViewController: PhotoPresentViewControllerDelegate {
    func photoPresentViewControllerDidTapClose(_ viewController: PhotoPresentViewController) {
        dismiss(animated: true, completion: nil)
    }
}
