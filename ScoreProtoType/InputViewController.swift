//
//  InputViewController.swift
//  ScoreProtoType
//
//  Created by Kazuki Ohashi on 2018/08/31.
//  Copyright © 2018年 Kazuki Ohashi. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    
    var outCounts = 0
    var strikeCounts = 0
    var ballCounts = 0
    
    var firstRunnerExists = false
    var secondRunnerExists = false
    var thirdRunnerExists = false
    
    
    
    
    let batter = Batter("ああ", 3)
    

    @IBOutlet weak var pitcherButton: UIButton!
    @IBOutlet weak var catcherButton: UIButton!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var shortButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var centerButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var leftHitButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var strikeCountsLabel: UILabel!
    @IBOutlet weak var ballCountsLabel: UILabel!
    @IBOutlet weak var OutCountsLabel: UILabel!
    
    
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    
    
    
    
    @IBAction func pitcherFlyCatched(_ sender: Any) {
        resultLabel.text = "ピッチャーフライ"
        flyCatched()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
        reloadSituation()
        
    }
    
    @IBAction func catcherFlyCatched(_ sender: Any) {
        resultLabel.text = "キャッチャーフライ"
        flyCatched()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
        reloadSituation()
    }
        
    @IBAction func firstFlyCatched(_ sender: Any) {
        resultLabel.text = "ファーストフライ"
        flyCatched()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
        reloadSituation()
    }
    @IBAction func secondFlyCatched(_ sender: Any) {
        resultLabel.text = "セカンドフライ"
        flyCatched()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
        reloadSituation()
    }
    @IBAction func thirdFlyCatched(_ sender: Any) {
        resultLabel.text = "サードフライ"
        flyCatched()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
        reloadSituation()
    }
    @IBAction func shortFlyCatched(_ sender: Any) {
        resultLabel.text = "ショートフライ"
        flyCatched()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
        reloadSituation()
    }
    @IBAction func LeftFlyCatched(_ sender: Any) {
        resultLabel.text = "レフトフライ"
        flyCatched()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
        reloadSituation()
    }
    @IBAction func centerFlyCatched(_ sender: Any) {
        resultLabel.text = "センターフライ"
        flyCatched()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
        reloadSituation()
    }
    @IBAction func rightFlyCatched(_ sender: Any) {
        resultLabel.text = "ライトフライ"
        flyCatched()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
        reloadSituation()
    }
    
    @IBAction func LeftSingleHit(_ sender: Any) {
        resultLabel.text = "レフト前ヒット"
        makeBaseHit()
        reloadSituation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
    
    }
    
    @IBAction func centerSingleHit(_ sender: Any) {
        resultLabel.text = "センター前ヒット"
        makeBaseHit()
        reloadSituation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
    }
    
    @IBAction func rightSingleHit(_ sender: Any) {
        resultLabel.text = "ライト前ヒット"
        makeBaseHit()
        reloadSituation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
    }
    @IBAction func pitcherSingleHit(_ sender: Any) {
        resultLabel.text = "ピッチャー前内野安打"
        makeBaseHit()
        reloadSituation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
    }
    @IBAction func firstSingleHit(_ sender: Any) {
        resultLabel.text = "ピッチャー前内野安打"
        makeBaseHit()
        reloadSituation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
    }
    @IBAction func secondSingleHit(_ sender: Any) {
        resultLabel.text = "ピッチャー前内野安打"
        makeBaseHit()
        reloadSituation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
    }
    @IBAction func thirdSingleHit(_ sender: Any) {
        resultLabel.text = "ピッチャー前内野安打"
        makeBaseHit()
        reloadSituation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
    }
    @IBAction func shortSingleHit(_ sender: Any) {
        resultLabel.text = "ピッチャー前内野安打"
        makeBaseHit()
        reloadSituation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.resultLabel.text = ""
        }
    }
    
    
    @IBAction func ballPitched(_ sender: Any) {
        ballCounts += 1
        if ballCounts == 4{
            resultLabel.text = "フォアボール"
            makeBaseHit()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.resultLabel.text = ""
            }
        
        }
        reloadSituation()
    }
    
    @IBAction func strikePitched(_ sender: Any) {
        strikeCounts += 1
        if strikeCounts == 3{
            resultLabel.text = "見逃し三振"
            batterOut()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.resultLabel.text = ""
            }
            
        }
        reloadSituation()
    }
    
    @IBAction func swing(_ sender: Any) {
        strikeCounts += 1
        if strikeCounts == 3{
            resultLabel.text = "空振り三振"
            batterOut()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.resultLabel.text = ""
            }
        }
        reloadSituation()
    }
    
    @IBAction func foul(_ sender: Any) {
        if strikeCounts == 2{
            
        }else{
            strikeCounts += 1
        }
        reloadSituation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftHitButton.backgroundColor = UIColor.red
        reloadSituation()
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pitcherPanGestureRecognizeer(_ sender: UIPanGestureRecognizer) {
        let state = sender.state
        let translation = sender.translation(in: view)
        startPoint = sender.view!.center
        print("state=\(state.rawValue) translation=\(translation)")
        if state == .began {
            print("startPoint=\(startPoint)")
        }
        sender.view!.center.x = startPoint.x + translation.x
        sender.view!.center.y = startPoint.y + translation.y
        if state == .ended {
            endPoint = sender.view!.center
            print("lastPoint=\(endPoint)")
            
            
            let firstRect: CGRect = firstImage.frame
            if firstRect.contains(endPoint){
                resultLabel.text = "ピッチャーゴロ"
                goroOut()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.resultLabel.text = ""
                }
                reloadSituation()
                sender.view?.center = startPoint
            }else{
                sender.view?.center = startPoint
            }
            
            
        }
        
    }
    
    
    
    func flyCatched(){
        batterOut()
        
        batterChange()
    }
    
    func goroOut(){
        batterOut()
        if thirdRunnerExists{
            thirdRunnerExists = false
        }
        if secondRunnerExists{
            secondRunnerExists = false
            thirdRunnerExists = true
        }
        if firstRunnerExists{
            firstRunnerExists = false
            secondRunnerExists = true
        }
        
        
        batterChange()
    }
    
    func makeBaseHit(){
        strikeCounts = 0
        ballCounts = 0
        if secondRunnerExists{
            thirdRunnerExists = true
        }
        if firstRunnerExists{
            secondRunnerExists = true
        }
        firstRunnerExists = true
        
        batterChange()
    }
    
    func batterChange(){
        
    }
    
    func iningChange(){
        outCounts = 0
        firstRunnerExists = false
        secondRunnerExists = false
        thirdRunnerExists = false
    }
    
    func batterOut(){
        strikeCounts = 0
        ballCounts = 0
        outCounts += 1
        if outCounts == 3{
            iningChange()
        }
    }
    
    func reloadSituation(){
        strikeCountsLabel.text = "S \(strikeCounts)"
        ballCountsLabel.text = "B \(ballCounts)"
        OutCountsLabel.text = "O \(outCounts)"
        
        if firstRunnerExists{
            firstImage.image = UIImage(named: "IMG_0333")
        }else{
            firstImage.image = nil
        }
        if secondRunnerExists{
            secondImage.image = UIImage(named: "IMG_0333")
        }else{
            secondImage.image = nil
        }
        if thirdRunnerExists{
            thirdImage.image = UIImage(named: "IMG_0334")
        }else{
            thirdImage.image = nil
        }
    }
    
    
    
    

    
}
