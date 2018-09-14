//
//  ResultViewController.swift
//  ScoreProtoType
//
//  Created by Kazuki Ohashi on 2018/09/10.
//  Copyright © 2018年 Kazuki Ohashi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var x: String = ""
    var y: String = ""
    var z: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let inputViewController = self.storyboard?.instantiateViewController(withIdentifier: "Game") as! InputViewController
        resultLabel.text = "\(x))死 \(y)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OKButton(_ sender: Any) {
    }
    @IBAction func CancelButton(_ sender: Any) {
    }
    
    
}
