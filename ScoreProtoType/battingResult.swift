//
//  battingResult.swift
//  ScoreProtoType
//
//  Created by Kazuki Ohashi on 2018/09/09.
//  Copyright © 2018年 Kazuki Ohashi. All rights reserved.
//

import Foundation

enum battingResult: String{
    
    case pitcherGoro = "投ゴロ"
    case catherGoro
    case firstGoro
    case secondGoro
    
    case leftHit
    
    func resultCalculate(name: String){
        let player = Player(name)
        
        switch self {
        case .pitcherGoro:
            player.bats += 1
        case .catherGoro:
            player.bats += 1
        case .leftHit:
            player.bats += 1
            player.hitCounts += 1
            player.baseHitCounts += 1
            player.onBaseCounts += 1
        default :
            print("no result")
            
        }
        
    }
}
