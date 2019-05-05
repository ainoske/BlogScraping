//
//  DataOfmember.swift
//  ScrapingSwift
//
//  Created by 高野隆正 on 2019/05/04.
//  Copyright © 2019 高野隆正. All rights reserved.
//

import UIKit

let blogURLOfKeyaki: String = "http://www.keyakizaka46.com/s/k46o/diary/member/list?ima=0000&ct="

enum MemberOfKeyaki{
    case nizika,uemu,ozeki,oda,michan,yuipon,saitou,satoshi,yukka,suzumon,naako,habuchan,aoi,techi,akanen,berika,berisa,neru,inori,yumi,takemoto,honyo,karin,matsuri,rikopi,runrun,tenchan
    
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
        }else if memberNumber == "井上梨名"{
            self = .inori
        }else if memberNumber == "関有美子"{
            self = .yumi
        }else if memberNumber == "武元唯衣"{
            self = .takemoto
        }else if memberNumber == "田村保乃"{
            self = .honyo
        }else if memberNumber == "藤吉夏鈴"{
            self = .karin
        }else if memberNumber == "松田里奈"{
            self = .matsuri
        }else if memberNumber == "松平璃子"{
            self = .rikopi
        }else if memberNumber == "森田ひかる"{
            self = .runrun
        }else if memberNumber == "山﨑天"{
            self = .tenchan
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
        case .inori:
            memberNumber = "43"
        case .yumi:
            memberNumber = "44"
        case .takemoto:
            memberNumber = "45"
        case .honyo:
            memberNumber = "46"
        case .karin:
            memberNumber = "47"
        case .matsuri:
            memberNumber = "48"
        case .rikopi:
            memberNumber = "49"
        case .runrun:
            memberNumber = "50"
        case .tenchan:
            memberNumber = "51"
        }
        return "\(blogURLOfKeyaki)\(memberNumber)"
    }
}
