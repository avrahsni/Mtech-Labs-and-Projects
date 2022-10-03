//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Snir Avrahami on 9/30/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    @IBOutlet weak var resultImageView: UIImageView!
    
    var responces: [Answer]
    
    init?(coder: NSCoder, responces: [Answer]) {
        self.responces = responces
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePeresonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePeresonalityResult() {
        let frequencyOfAnswers = responces.reduce(into: [:]) {
            (counts, answer) in
            counts[answer.person, default: 0] += 1
        }
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are \(mostCommonAnswer)"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        resultImageView.image = UIImage(named: "\(mostCommonAnswer)")
    }
    

}
