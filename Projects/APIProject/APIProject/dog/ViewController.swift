//
//  ViewController.swift
//  APIProject
//
//  Created by Snir Avrahami on 12/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    
    
    
    let controller = DogInfoController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    func updateUI(with photoInfo: dog) {
        Task {
            do {
                
                dogImageView.image = try? await controller.fetchDogImage(photoInfo.message)
                print("hello world")
            }
            
            
        }
    }
    
    func updateUI(with error: Error) {
        dogImageView.image = UIImage(systemName: "exclamationmark.octagon")
    }
    

    @IBAction func newImageButtonPressed(_ sender: Any) {
        Task {
            do {
                let dog = try await controller.fetchDogImageData()
                updateUI(with: dog)
            } catch {
                updateUI(with: error)
            }
            
        }
        
    }
    
}

