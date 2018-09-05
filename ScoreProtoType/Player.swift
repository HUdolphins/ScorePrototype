//
//  Batter.swift
//  ScoreProtoType
//
//  Created by Kazuki Ohashi on 2018/09/01.
//  Copyright © 2018年 Kazuki Ohashi. All rights reserved.
//

import Foundation


class Plryer: NSObject {
    var name:String
    var position: Int
    var base: Int = 0
    var state: Int
    var team: String
    var battingAverage: Double
    var RBI: Int  //打点
    var hitCounts: Int
    var singleHitCounts: Int
    var twoBaseHitCounts: Int
    var threeBaseHitCounts: Int
    var HRCounts: Int
    var baseHitCounts: Int
    var fourBallCounts: Int
    var deadBallCounts: Int
    var struckOutCounts: Int
    var stolenBasesCounts: Int
    var caghtStealingCounts: Int
    var BuntCounts: Int
    var sacrificeFly: Int
    var doublePlayCounts: Int
    var basePercentage: Double
    var sluggingPercentage: Double
    var errorCounts: Int
    var OPS: Double
    var uniformNumber: Int
    
    
    
    init(_ name:String, _ position: Int) {
        self.name = name
        self.position = position
    }
}
