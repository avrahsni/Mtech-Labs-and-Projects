//
//  ViewController.swift
//  Lab4.2AppEventCount
//
//  Created by Snir Avrahami on 10/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var sceneWillConnectToOptions = 0, sceneDidBecomeActive = 0, sceneWillResignActive = 0
    var sceneWillEnterForeground = 0, sceneDidEnterBackground = 0
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    @IBOutlet weak var launchCountLabel: UILabel!
    @IBOutlet weak var configForConnectingCountLabel: UILabel!
    @IBOutlet weak var sceneWillConnectCountLabel: UILabel!
    @IBOutlet weak var sceneDidBecomeActiveCountLabel: UILabel!
    @IBOutlet weak var sceneWillResignActiveCountLabel: UILabel!
    @IBOutlet weak var sceneWillEnterForegroundCountLabel: UILabel!
    @IBOutlet weak var sceneDidEnterBackgroundCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func updateView() {
        launchCountLabel.text = "The app has launched \(appDelegate.launchCount) times"
        configForConnectingCountLabel.text = "application(_:configurationForConnecting:options:  \(appDelegate.configurationForConnectingCount))"
        sceneWillConnectCountLabel.text = "scene(_:willConnectTo:Options: \(sceneWillConnectToOptions))"
        sceneDidBecomeActiveCountLabel.text = "sceneDidBecomeActive(_: \(sceneDidBecomeActive))"
        sceneWillResignActiveCountLabel.text = "sceneWillResignActive(_: \(sceneWillResignActive))"
        sceneWillEnterForegroundCountLabel.text = "sceneWillEnterForeground(_: \(sceneWillEnterForeground))"
        sceneDidEnterBackgroundCountLabel.text = "sceneDidEnterBackground(_: \(sceneDidEnterBackground))"
    }

}

