//
//  DataOfHinata.swift
//  ScrapingSwift
//
//  Created by 高野隆正 on 2019/05/05.
//  Copyright © 2019 高野隆正. All rights reserved.
//

import UIKit

let blogURLOfHinata: String = "https://www.hinatazaka46.com/s/official/diary/member/list?ima=0000&ct="

enum MemberOfHinata{
    case iguchi,ushio,memi,kagechan,katoshi,kyonko,sasaku,sasami,manafi,otake,meimei,osushi,hina,kosakana,paripi,nibuchan,hiyotan,konoka,manamo,bemiho,hinano
    
    init?(memberNumber: String){
        if memberNumber == "井口眞緒"{
            self = .iguchi
        }else if memberNumber == "潮紗理菜"{
            self = .ushio
        }else if memberNumber == "柿崎芽実"{
            self = .memi
        }else if memberNumber == "影山優佳"{
            self = .kagechan
        }else if memberNumber == "加藤史帆"{
            self = .katoshi
        }else if memberNumber == "斉藤京子"{
            self = .kyonko
        }else if memberNumber == "佐々木久美"{
            self = .sasaku
        }else if memberNumber == "佐々木美玲"{
            self = .sasami
        }else if memberNumber == "高瀬愛奈"{
            self = .manafi
        }else if memberNumber == "高本彩花"{
            self = .otake
        }else if memberNumber == "東村芽依"{
            self = .meimei
        }else if memberNumber == "金村美玖"{
            self = .osushi
        }else if memberNumber == "河田陽菜"{
            self = .hina
        }else if memberNumber == "小坂菜緒"{
            self = .kosakana
        }else if memberNumber == "富田鈴花"{
            self = .paripi
        }else if memberNumber == "丹生明里"{
            self = .nibuchan
        }else if memberNumber == "濱岸ひより"{
            self = .hiyotan
        }else if memberNumber == "松田好花"{
            self = .konoka
        }else if memberNumber == "宮田愛萌"{
            self = .manamo
        }else if memberNumber == "渡邉美穂"{
            self = .bemiho
        }else if memberNumber == "上村ひなの"{
            self = .hinano
        }else{
            return nil
        }
    }
    
    func generateBlogURL() -> String {
        
        let memberNumber: String
        switch self {
        case .iguchi:
            memberNumber = "1"
        case .ushio:
            memberNumber = "2"
        case .memi:
            memberNumber = "3"
        case .kagechan:
            memberNumber = "4"
        case .katoshi:
            memberNumber = "5"
        case .kyonko:
            memberNumber = "6"
        case .sasaku:
            memberNumber = "7"
        case .sasami:
            memberNumber = "8"
        case .manafi:
            memberNumber = "9"
        case .otake:
            memberNumber = "10"
        case .meimei:
            memberNumber = "11"
        case .osushi:
            memberNumber = "12"
        case .hina:
            memberNumber = "13"
        case .kosakana:
            memberNumber = "14"
        case .paripi:
            memberNumber = "15"
        case .nibuchan:
            memberNumber = "16"
        case .hiyotan:
            memberNumber = "17"
        case .konoka:
            memberNumber = "18"
        case .manamo:
            memberNumber = "19"
        case .bemiho:
            memberNumber = "20"
        case .hinano:
            memberNumber = "21"
        }
        return "\(blogURLOfHinata)\(memberNumber)"
    }
}
