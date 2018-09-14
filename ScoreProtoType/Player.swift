//
//  Batter.swift
//  ScoreProtoType
//
//  Created by Kazuki Ohashi on 2018/09/01.
//  Copyright © 2018年 Kazuki Ohashi. All rights reserved.
//

import Foundation


class Player: NSObject {
    var name:String
    var position: Int = 0
    var base: Int = 0
    var state: Int = -1
    var team: String?
    var battingAverage: Double = 0
    var bats: Int = 0
    var RBI: Int = 0  //打点
    var hitCounts: Int = 0
    var singleHitCounts: Int = 0
    var twoBaseHitCounts: Int = 0
    var threeBaseHitCounts: Int = 0
    var HRCounts: Int = 0
    var baseHitCounts: Int = 0
    var fourBallCounts: Int = 0
    var deadBallCounts: Int = 0
    var struckOutCounts: Int = 0
    var stolenBasesCounts: Int = 0
    var caghtStealingCounts: Int = 0
    var BuntCounts: Int = 0
    var sacrificeFly: Int = 0
    var doublePlayCounts: Int = 0
    var onBaseCounts: Int = 0
    var basePercentage: Double = 0
    var sluggingPercentage: Double = 0
    var errorCounts: Int = 0
    var OPS: Double = 0
    var uniformNumber: Int?
    
    
    
    init(_ name:String ) {
        self.name = name
        
    }
}
