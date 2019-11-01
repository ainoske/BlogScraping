//
//  CoreMLInstance.swift
//  ScrapingSwift
//
//  Created by 高野隆正 on 2019/11/01.
//  Copyright © 2019 高野隆正. All rights reserved.
//

import UIKit
import Vision

class CoreMLInstance {
    func createCoreMLModel(image: CIImage) -> VNClassificationObservation{
        var observation = VNClassificationObservation()

        let handler = VNImageRequestHandler(ciImage: image)

        guard let model = try? VNCoreMLModel(for: HumanModel().model) else { return VNClassificationObservation()}

        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            guard let firstObservation = results.first else { return }
            observation = firstObservation
        }
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
        
        return observation
    }
}
