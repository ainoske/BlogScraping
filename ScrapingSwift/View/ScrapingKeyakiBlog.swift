//
//  KeyakiHandler.swift
//  ScrapingSwift
//
//  Created by 高野隆正 on 2019/05/06.
//  Copyright © 2019 高野隆正. All rights reserved.
//

import UIKit
import Alamofire
import Kanna
import RealmSwift

class ScrapingKeyakiBlog: NSObject {
    
    private var completion: (_ error: Error?) -> Void = { _ in }
    
    func screpeWebsite(member: MemberOfKeyaki, completion: @escaping() -> Void) -> Void{
        
        let blogNumber = member.generateBlogURL()
        
        print(blogNumber)
        
        Alamofire.request(blogNumber).responseString{ response in
            print("\(response.result.isSuccess)")
            

            
            if let html = response.result.value{
                self.parseHTML(html: html)
                completion()
            }
        }
        
    }
    func parseHTML(html: String){
        if let doc = try? HTML(html: html, encoding: .utf8){
            for link in doc.css("div"){
                if "\(link["class"] ?? "")" == "box-article" {
                    for me in link.css("img"){
                        guard let imageString = me["src"]
                            else{
                                continue
                        }
                        guard let imageURL = URL(string: imageString)
                            else{
                                fatalError("imageURL error")
                        }
                        if imageURL.pathExtension == "jpg"{
                            downloadImage(imageURL: imageURL)
                        }
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
            let pngData = image.pngData()
            
            let pngImage = UIImage(data: pngData!)!
            guard let ciImage = CIImage(image: image) else{ return }
            let recognitionResult = CoreMLInstance().createCoreMLModel(image: ciImage)
            
            if recognitionResult.identifier == "famale" {
                UIImageWriteToSavedPhotosAlbum(pngImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
            }
        }
        catch let err {
            fatalError("Error : \(err.localizedDescription)")
        }
        
    }
    @objc private func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        completion(error)
    }

}
