//
//  FIRPlayer.swift
//  ScoreProtoType
//
//  Created by Kazuki Ohashi on 2018/09/10.
//  Copyright © 2018年 Kazuki Ohashi. All rights reserved.
//

import Foundation
import FirebaseDatabase

class FIRPlayer: NSObject {
    var id: String?
    var name: String?
    var results: [String] = []
    //第一打席ならgame-1.
    
    init(snapshot: DataSnapshot){
        self.id = snapshot.key
        
        
        let valueDictionary = snapshot.value as! [String:Any]
        if let results = valueDictionary["results"] as? [String]{
            self.results = results
        }
        self.name = valueDictionary["name"] as? String
    }
    
}
