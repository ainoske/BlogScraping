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

class ViewController: UIViewController {
    
    private static let blogURL: String = "http://www.keyakizaka46.com/s/k46o/diary/member/list?ima=0000&ct="
    
//    var textfield:UITextField!
    
    @IBOutlet weak var textfield: UITextField!
    
    private enum Member{
        case nizika,uemu,ozeki,oda,michan,yuipon,saitou,satoshi,yukka,suzumon,naako,habuchan,aoi,techi,akanen,berika,berisa,neru
        
        init?(memberNumber: String){
            if memberNumber == "石森虹花"{
                self = .nizika
            }else if memberNumber == "上村莉菜"{
                self = .uemu
            }else if memberNumber == "尾関梨香"{
                self = .ozeki
            }else if memberNumber == "織田奈那"{
                self = .oda
            }else if memberNumber == "小池美波"{
                self = .michan
            }else if memberNumber == "小林由依"{
                self = .yuipon
            }else if memberNumber == "齋藤冬優花"{
                self = .saitou
            }else if memberNumber == "佐藤詩織"{
                self = .satoshi
            }else if memberNumber == "菅井友香"{
                self = .yukka
            }else if memberNumber == "鈴本美愉"{
                self = .suzumon
            }else if memberNumber == "長沢菜々香"{
                self = .naako
            }else if memberNumber == "土生瑞穂"{
                self = .habuchan
            }else if memberNumber == "原田葵"{
                self = .aoi
            }else if memberNumber == "平手友梨奈"{
                self = .techi
            }else if memberNumber == "守屋茜"{
                self = .akanen
            }else if memberNumber == "渡辺梨加"{
                self = .berika
            }else if memberNumber == "渡邉理佐"{
                self = .berisa
            }else if memberNumber == "長濱ねる"{
                self = .neru
            }else{
                return nil
            }
        }
        
        func generateBlogURL() -> String {
            
            let memberNumber: String
            switch self {
            case .nizika:
                memberNumber = "01"
            case .uemu:
                memberNumber = "03"
            case .ozeki:
                memberNumber = "04"
            case .oda:
                memberNumber = "05"
            case .michan:
                memberNumber = "06"
            case .yuipon:
                memberNumber = "07"
            case .saitou:
                memberNumber = "08"
            case .satoshi:
                memberNumber = "09"
            case .yukka:
                memberNumber = "11"
            case .suzumon:
                memberNumber = "12"
            case .naako:
                memberNumber = "13"
            case .habuchan:
                memberNumber = "14"
            case .aoi:
                memberNumber = "15"
            case .techi:
                memberNumber = "17"
            case .akanen:
                memberNumber = "18"
            case .berika:
                memberNumber = "20"
            case .berisa:
                memberNumber = "21"
            case .neru:
                memberNumber = "22"
            }
            return "\(blogURL)\(memberNumber)"
        }
    }
    private var completion: (_ error: Error?) -> Void = { _ in }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let textField = UITextField(frame: CGRect(x: 20, y: 100, width: 100, height: 21))
//        textField.backgroundColor = .white
//        self.view.addSubview(textField)
        print("ffff")
    }
    
    func screpeWebsite(){
//        print(self.textfield.text)
        guard let text = self.textfield.text, let member = Member(memberNumber: text) else {
            return
        }
        
        let photoPresentViewController = PhotoPresentViewController()
        self.navigationController?.pushViewController(photoPresentViewController, animated: true)
        
        let blogNumber = member.generateBlogURL()
        Alamofire.request(blogNumber).responseString{ response in
            print("\(response.result.isSuccess)")
            
            if let html = response.result.value{
                self.parseHTML(html: html)
            }
        }
        
    }
    func parseHTML(html: String){
        if let doc = try? HTML(html: html, encoding: .utf8){
            for link in doc.css("div"){
                if "\(link["class"] ?? "")" == "box-article"{
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

