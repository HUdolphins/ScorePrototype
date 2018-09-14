//
//  ViewController.swift
//  ScoreProtoType
//
//  Created by Kazuki Ohashi on 2018/08/31.
//  Copyright © 2018年 Kazuki Ohashi. All rights reserved.
//

import UIKit
import ESTabBarController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTab()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupTab(){
        let tabBarController: ESTabBarController = ESTabBarController(tabIconNames: ["Home", "Game", "Data", "Account"])
        tabBarController.selectedColor = UIColor(displayP3Red: 26 / 255, green: 12 / 255, blue: 0 / 255, alpha: 1)
        tabBarController.buttonsBackgroundColor = UIColor(displayP3Red: 13 / 255, green: 104 / 255, blue: 5 / 255, alpha: 1)
        tabBarController.selectionIndicatorHeight = 3
        
        addChildViewController(tabBarController)
        let tabBarView = tabBarController.view!
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tabBarView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([tabBarView.topAnchor.constraint(equalTo: safeArea.topAnchor), tabBarView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor), tabBarView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor), tabBarView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)])
        tabBarController.didMove(toParentViewController: self)
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "Home")
        let dataViewController = storyboard?.instantiateViewController(withIdentifier: "Data")
        let accountViewController = storyboard?.instantiateViewController(withIdentifier: "Account")
        
        tabBarController.setView(homeViewController, at: 0)
        tabBarController.setView(dataViewController, at: 2)
        tabBarController.setView(accountViewController, at: 3)
        
        tabBarController.highlightButton(at: 1)
        tabBarController.setAction({
            let gameViewController = self.storyboard?.instantiateViewController(withIdentifier: "game")
            self.present(gameViewController!, animated: true, completion: nil)
        }, at: 1)
        
        
    }


}

