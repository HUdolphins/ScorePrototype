//
//  InputViewController.swift
//  ScoreProtoType
//
//  Created by Kazuki Ohashi on 2018/08/31.
//  Copyright © 2018年 Kazuki Ohashi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class InputViewController: UIViewController {
    
    var playerArray: [FIRPlayer] = []
    let playerRef = Database.database().reference()
    
    
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    
    var battingOrder = 0
    var outCounts = 0
    var strikeCounts = 0
    var ballCounts = 0
    
    var firstRunnerExists = false
    var secondRunnerExists = false
    var thirdRunnerExists = false
    
    var runnerSituation: String = "走者なし"
    
    
    
    
    
    

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
    
    
    @IBOutlet weak var strikeCountsLabel: UILabel!
    @IBOutlet weak var ballCountsLabel: UILabel!
    @IBOutlet weak var OutCountsLabel: UILabel!
    
    
    
    
    @IBOutlet weak var thirdImageView: UIImageView!
    
    
    @IBAction func thirdGestureRecognizer(_ sender: UIPanGestureRecognizer) {
        thirdImageView.image = UIImage(named: "baseball copy 2.png")
        let move:CGPoint = sender.translation(in: view)
        
        //ドラッグした部品の座標に移動量を加算する。
        sender.view!.center.x += move.x
        sender.view!.center.y += move.y
        
        //ラベルに現在座標を表示する。
        //testLabel.text = "\(sender.view!.frame.origin.x), \(sender.view!.frame.origin.y)"
        
        //移動量を0にする。
        sender.setTranslation(CGPoint.zero, in:view)
    }
    
    
    
    @IBAction func pitcherFlyCatched(_ sender: Any) {
        
        flyCatched()
        
        
        reloadSituation()
        modalAppear(resultString: "ピッチャーフライ")
        
    }
    
    @IBAction func catcherFlyCatched(_ sender: Any) {
        
        flyCatched()
        
        playerArray[battingOrder].results.insert("捕飛", at: 0)
        let results = ["results": playerArray[battingOrder].results]
        playerRef.child("player").child(playerArray[battingOrder].id!).updateChildValues(results)
        if battingOrder == 8{
            battingOrder = 0
        }else{
        battingOrder += 1
        }
        reloadSituation()
        
        modalAppear(resultString: "キャッチャーフライ")
    }
        
    @IBAction func firstFlyCatched(_ sender: Any) {
        
        flyCatched()
        
        reloadSituation()
        
    }
    @IBAction func secondFlyCatched(_ sender: Any) {
        
        flyCatched()
        
        reloadSituation()
    }
    @IBAction func thirdFlyCatched(_ sender: Any) {
        
        flyCatched()
        
        reloadSituation()
    }
    @IBAction func shortFlyCatched(_ sender: Any) {
        
        flyCatched()
        
        reloadSituation()
    }
    @IBAction func LeftFlyCatched(_ sender: Any) {
        
        flyCatched()
        
        reloadSituation()
    }
    @IBAction func centerFlyCatched(_ sender: Any) {
        
        flyCatched()
        
        reloadSituation()
    }
    @IBAction func rightFlyCatched(_ sender: Any) {
        
        flyCatched()
        
        reloadSituation()
    }
    
    @IBAction func LeftSingleHit(_ sender: Any) {
        
        makeBaseHit()
        reloadSituation()
        
    
    }
    
    @IBAction func centerSingleHit(_ sender: Any) {
        
        makeBaseHit()
        reloadSituation()
       
    }
    
    @IBAction func rightSingleHit(_ sender: Any) {
        
        makeBaseHit()
        reloadSituation()
        
    }
    @IBAction func pitcherSingleHit(_ sender: Any) {
        
        makeBaseHit()
        reloadSituation()
        
    }
    @IBAction func firstSingleHit(_ sender: Any) {
        
        makeBaseHit()
        reloadSituation()
       
    }
    @IBAction func secondSingleHit(_ sender: Any) {
        
        makeBaseHit()
        reloadSituation()
        
    }
    @IBAction func thirdSingleHit(_ sender: Any) {
        
        makeBaseHit()
        reloadSituation()
        
    }
    @IBAction func shortSingleHit(_ sender: Any) {
        
        makeBaseHit()
        reloadSituation()
        
    }
    
    
    @IBAction func ballPitched(_ sender: Any) {
        ballCounts += 1
        if ballCounts == 4{
            
            makeBaseHit()
            
        
        }
        reloadSituation()
    }
    
    @IBAction func strikePitched(_ sender: Any) {
        strikeCounts += 1
        if strikeCounts == 3{
            
            batterOut()
            
            
        }
        reloadSituation()
    }
    
    @IBAction func swing(_ sender: Any) {
        strikeCounts += 1
        if strikeCounts == 3{
            
            batterOut()
            
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        playerRef.child("player").observe(.childAdded, with: {(snapshot: DataSnapshot) in
            let playerData = FIRPlayer(snapshot: snapshot)
            self.playerArray.insert(playerData, at: 0)
            print(self.playerArray[0].id!)
        })
        makePlayers()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadSituation()
        // Do any additional setup after loading the view.
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        backgroundImage.image = UIImage(named: "iPhone 8 Copy 2.png")
        backgroundImage.layer.zPosition = -1
        self.view.addSubview(backgroundImage)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pitcherPanGestureRecognizeer(_ sender: UIPanGestureRecognizer) {
        let state = sender.state
        let translation = sender.translation(in: view)
        
        //let thrownBallView = UIImageView(frame: CGRect(x: sender.view!.center.x, y: sender.view!.center.y, width: 100, height: 100))
        //thrownBallView.image = UIImage(named: "baseball copy 2.png")
        //thrownBallView.layer.cornerRadius = thrownBallView.frame.size.width / 2
        //thrownBallView.clipsToBounds = true
        //self.view.addSubview(thrownBallView)
        //startPoint = sender.view!.center
        print("state=\(state.rawValue) translation=\(translation)")
        //if state == .began {
            //print("startPoint=\(startPoint)")
        
        //}
        //thrownBallView.center.x = startPoint.x + translation.x
        //thrownBallView.center.x = startPoint.x + translation.x
        
        sender.view!.center.x += translation.x
        sender.view!.center.y += translation.y
        //if state == .ended {
            //endPoint = sender.view!.center
            //print("lastPoint=\(endPoint)")
            
            
            //let firstRect: CGRect = firstImage.frame
            //if firstRect.contains(endPoint){
               // resultLabel.text = "ピッチャーゴロ"
               // goroOut()
               // DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                  //  self.resultLabel.text = ""
               // }
              //  reloadSituation()
                //sender.view?.center = startPoint
           // }else{
             //   sender.view?.center = startPoint
           // }
            
            
       
        
    }
    
    @IBAction func DemoButton(_ sender: Any) {
        let demoViewController = self.storyboard?.instantiateViewController(withIdentifier: "Demo") as! DemoViewController
        self.present(demoViewController, animated: true, completion: nil)
    }
    
    
    func flyCatched(){
        batterOut()
        if outCounts == 2{
            iningChange()
        }else{
            outCounts += 1
        }
        
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
            
        }else{
            
        }
        if secondRunnerExists{
            
        }else{
            
        }
        if thirdRunnerExists{
            
        }else{
            
        }
        
        if thirdRunnerExists && secondRunnerExists && firstRunnerExists{
            runnerSituation = "満塁"
        }else if !thirdRunnerExists && secondRunnerExists && firstRunnerExists{
            runnerSituation = "1,2塁"
        }else if thirdRunnerExists && !secondRunnerExists && firstRunnerExists {
            runnerSituation = "1,3塁"
        }else if thirdRunnerExists && secondRunnerExists && !firstRunnerExists{
            runnerSituation = "2,3塁"
        }else if thirdRunnerExists && !secondRunnerExists && !firstRunnerExists{
            runnerSituation = "3塁"
        }else if !thirdRunnerExists && secondRunnerExists && !firstRunnerExists{
            runnerSituation = "2塁"
        }else if !thirdRunnerExists && !secondRunnerExists && firstRunnerExists {
            runnerSituation = "1塁"
        }else{
            runnerSituation = "走者なし"
        }
    }
    
    func makePlayers(){
        
        for i in 1...9{
            let playerName = "player\(i)"
            
            let data = ["name": playerName]
            playerRef.child("player").childByAutoId().setValue(data)
            
            
        }
        
        
    }
    
    func modalAppear(resultString: String){
        let modalViewController = storyboard?.instantiateViewController(withIdentifier: "ModalViewController") as! ResultViewController
        modalViewController.modalPresentationStyle = .custom
        modalViewController.x = String(outCounts)
        modalViewController.y = self.runnerSituation
        modalViewController.z = resultString
        modalViewController.transitioningDelegate = self
        present(modalViewController, animated: true, completion: nil)
    }
    
    
    
    

    
}

extension InputViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

class CustomPresentationController: UIPresentationController {
    // 呼び出し元のView Controller の上に重ねるオーバレイView
    var overlayView = UIView()
    
    // 表示トランジション開始前に呼ばれる
    override func presentationTransitionWillBegin() {
        guard let containerView = containerView else {
            return
        }
        overlayView.frame = containerView.bounds
        overlayView.gestureRecognizers = [UITapGestureRecognizer(target: self, action: #selector(CustomPresentationController.overlayViewDidTouch(_:)))]
        overlayView.backgroundColor = .black
        overlayView.alpha = 0.0
        containerView.insertSubview(overlayView, at: 0)
        
        // トランジションを実行
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: {[weak self] context in
            self?.overlayView.alpha = 0.7
            }, completion:nil)
    }
    
    // 非表示トランジション開始前に呼ばれる
    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: {[weak self] context in
            self?.overlayView.alpha = 0.0
            }, completion:nil)
    }
    
    // 非表示トランジション開始後に呼ばれる
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            overlayView.removeFromSuperview()
        }
    }
    
    let margin = (x: CGFloat(30), y: CGFloat(220.0))
    // 子のコンテナサイズを返す
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: parentSize.width - margin.x, height: parentSize.height - margin.y)
    }
    
    // 呼び出し先のView Controllerのframeを返す
    override var frameOfPresentedViewInContainerView: CGRect {
        var presentedViewFrame = CGRect()
        let containerBounds = containerView!.bounds
        let childContentSize = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerBounds.size)
        presentedViewFrame.size = childContentSize
        presentedViewFrame.origin.x = margin.x / 2.0
        presentedViewFrame.origin.y = margin.y / 2.0
        
        return presentedViewFrame
    }
    
    // レイアウト開始前に呼ばれる
    override func containerViewWillLayoutSubviews() {
        overlayView.frame = containerView!.bounds
        presentedView?.frame = frameOfPresentedViewInContainerView
        presentedView?.layer.cornerRadius = 10
        presentedView?.clipsToBounds = true
    }
    
    // レイアウト開始後に呼ばれる
    override func containerViewDidLayoutSubviews() {
    }
    
    // overlayViewをタップした時に呼ばれる
    @objc func overlayViewDidTouch(_ sender: UITapGestureRecognizer) {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}

