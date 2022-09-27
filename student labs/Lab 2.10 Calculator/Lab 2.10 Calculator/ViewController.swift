//
//  ViewController.swift
//  Lab 2.10 Calculator
//
//  Created by Snir Avrahami on 9/6/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var operationButtons: [UIButton]!
    @IBOutlet weak var calcView: UILabel!
    @IBOutlet var optionButtons: [UIButton]!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var val1: UILabel!
    @IBOutlet weak var val2: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    
    var operation = ""
    var value1: Float = 0.0
    var value2: Float?
    var answer: Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        operationLabel.text = "operation: " + operation
        answerLabel.text = String(answer)
    }
    
    
    
    func addition(v1: Float, v2: Float?) -> Float {
        guard let val2 = v2 else {return 0}
        let sum: Float = Float(v1 + val2)
        answer = sum
        answerLabel.text = String(answer)
        operationLabel.text = "operation: " + operation
        return sum
    }
    
    func subtraction(v1: Float, v2: Float?) -> Float {
        guard let val2 = v2 else {return 0}
        let difference = v1 - val2
        answer = difference
        answerLabel.text = String(answer)
        return difference
    }

    func multiplication(v1: Float, v2: Float?) -> Float {
        guard let val2 = v2 else {return 0}
        let product = v1 * val2
        answer = product
        answerLabel.text = String(answer)
        return product
    }
    
    func division(v1: Float, v2: Float?) -> Float {
        guard let val2 = v2 else {return 0}
        let quotient = v1 / val2
        answer = quotient
        answerLabel.text = String(answer)
        return quotient
    }
    
    func equation(v1: Float?, v2: Float?) -> Float? {
        guard let value1 = v1, let value2 = v2 else {return nil}
        //calcView.text = "\(value1), \(value2)"
        switch operation {
        case "+":
            return addition(v1: value1, v2: value2)
        case "-":
            return subtraction(v1: value1, v2: value2)
        case "x":
            return multiplication(v1: value1, v2: value2)
        default:
            return division(v1: value1, v2: value2)
        }
        //return nil
    }
    
    
    
    
    func clear() {
        value1 = 0
        value2 = nil
        calcView.text = "0"
        operation = ""
        answer = 0
        val1.text = "Value1: " + "\(value1)"
        val2.text = "Value2: " + "\(value2)"
        operationLabel.text = "operation: " + operation
        answerLabel.text = String(answer)
        
    }
    
    func getPercent() {
        calcView.text = "\(Double(calcView.text!)! / 100)"
        answer = Float(calcView.text!)!
        value1 = answer
        
    }
    
    func plusMinus() {
        if floor(answer) == answer {
            calcView.text = "\(Int(-1 * Double(calcView.text!)!))"
        } else {
            calcView.text = "\(-1 * Double(calcView.text!)!)"
        }
        //calcView.text = "\(-1 * Double(calcView.text!)!)"
        updateValues()
    }
    
    func updateValues() {
        if operation == "" {
            value1 = Float(calcView.text!)!
            value2 = nil
            val1.text = "Value1: " + "\(value1)"
            val2.text = "Value2" + "\(value2)"
        }
        else {
            value2 = Float(calcView.text!)!
            val1.text = "Value1: " + "\(value1)"
            val2.text = "Value2" + "\(value2)"
        }
    }
    
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        let buttonTitle: String = (sender.titleLabel?.text)!
        if calcView.text == "0" {
            calcView.text = ""
        }
        if buttonTitle == "." {
            if calcView.text!.contains(".") {
                
            } else {
                calcView.text?.append(buttonTitle)
            }
        } else {
            calcView.text?.append(buttonTitle)
        }
        updateValues()
        answerLabel.text = String(answer)
    }
    
    
    
    
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        
        val1.text = "Value1: " + "\(value1)"
        val2.text = "Value2" + "\(value2)"
        answerLabel.text = String(answer)
        switch sender.titleLabel?.text {
        case "+":
            operation = "+"
            operationLabel.text = "operation: " + operation
            calcView.text = "0"
            if value2 != nil {
                answer = addition(v1: value1, v2: value2)
                calcView.text = String(answer)
                
                if floor(answer) == answer {
                    //calcView.text = "\(Int(answer))"
                    calcView.text = "0"
                } else {
                    calcView.text = "0"
                }
                if value2 != nil {
                    value1 = answer
                    value2 = nil
                    operation = "+"
                }
            }
        case "-":
//            answer = Float(calcView.text!)!
//            value1 = answer
            operation = "-"
            operationLabel.text = "operation: " + operation
            calcView.text = "0"
            if value2 != nil {
                answer = subtraction(v1: value1, v2: value2)
                calcView.text = String(answer)
                
                if floor(answer) == answer {
                    //calcView.text = "\(Int(answer))"
                    calcView.text = "0"
                } else {
                    calcView.text = "0"
                }
                if value2 != nil {
                    value1 = answer
                    value2 = nil
                    operation = "-"
                }
            }
        case "x":
            operation = "x"
            operationLabel.text = "operation: " + operation
            calcView.text = "0"
            if value2 != nil {
                answer = multiplication(v1: value1, v2: value2)
                calcView.text = String(answer)
                
                if floor(answer) == answer {
                    calcView.text = "0"
                } else {
                    calcView.text = "0"
                }
                if value2 != nil {
                    value1 = answer
                    value2 = nil
                    operation = "x"
                }
            }
        case "÷":
            operation = "÷"
            operationLabel.text = "operation: " + operation
            calcView.text = "0"
            if value2 != nil {
                answer = division(v1: value1, v2: value2)
                calcView.text = String(answer)
                
                if floor(answer) == answer {
                    calcView.text = "0"
                } else {
                    calcView.text = "0"
                }
                if value2 != nil {
                    value1 = answer
                    value2 = nil
                    operation = "÷"
                }
            }
        default:
            guard let value2 = value2 else {return}
            if let answer = equation(v1: value1, v2: value2) {
                if floor(answer) == answer {
                        calcView.text = "\(Int(answer))"
                    } else {
                        calcView.text = "\(answer)"
                    }
            }
        }
    }
    
    
    
    
    
    
    @IBAction func optionButtonsPressed(_ sender: UIButton) {
        
        switch sender.titleLabel?.text {
        case "AC":
            clear()
        case "%":
            getPercent()
        default:
            plusMinus()
        }
    }
    
    
    
}

