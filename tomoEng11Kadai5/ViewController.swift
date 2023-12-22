//
//  ViewController.swift
//  tomoEng11Kadai5
//
//  Created by 井本智博 on 2023/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var leftTextField: UITextField!
    @IBOutlet weak private var rightTextField: UITextField!
    @IBOutlet weak private var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        leftTextField.keyboardType = .decimalPad
        rightTextField.keyboardType = .decimalPad
    }

    @IBAction private func calculateButtonPressed(_ sender: UIButton) {

        guard leftTextField.text! != "" else {
            showAlert(message: "割る数を入力してください")
            return
        }
        if rightTextField.text! == ""  {
            showAlert(message: "割られる数を入力してください")
        } else if rightTextField.text! == "0" {
            showAlert(message: "0以外の数を入力してください")
        }

        if let leftNumber = Float(leftTextField.text!), let rightNumber = Float(rightTextField.text!) {
            if rightNumber != 0 {
                let result = leftNumber / rightNumber
                resultLabel.text = String(result)
            }
        }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "課題5", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
