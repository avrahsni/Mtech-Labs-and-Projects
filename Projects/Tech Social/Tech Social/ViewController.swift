//
//  ViewController.swift
//  Tech Social
//
//  Created by Snir Avrahami on 10/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var posterName: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    
    
    struct post {
        var poster: String
        var image: UIImage
        var description: String
        
        init(poster: String, image: UIImage, description: String) {
            self.poster = poster
            self.image = image
            self.description = description
        }
    }
    var posts = [post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        posts.append(post(poster: username, image: UIImage(named: "swift")!, description: "My First Post"))
        maskUserCircle()
        loadTopImage()
        loadPost()
    }
    
    var username = "avrahsni000"
    
    func maskUserCircle() {
        let pic = userImage
        pic?.contentMode = .scaleAspectFill
        pic?.layer.cornerRadius = (pic?.frame.height)! / 2
        pic?.layer.masksToBounds = false
        pic?.clipsToBounds = true
        pic?.image = UIImage(named: "eagle")
    }
    
    func loadTopImage() {
        topImage.contentMode = .scaleAspectFill
        topImage.image = UIImage(named: "italy")
    }
    
    func loadPost() {
        print(posts[0].poster)
        posterName.isEnabled = true
        posterName.isHidden = false
        postImageView.image = posts[0].image
        posterName.text = posts[0].poster
        postDescription.text = "\(username): \(posts[0].description)"
    }
}

