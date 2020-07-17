//
//  ViewController.swift
//  pig_latin
//
//  Created by Andrei Tekhtelev on 2020-05-31.
//  Copyright © 2020 HomeDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var textField: UITextField!
    @IBOutlet weak var translationTextView: UITextView!
    @IBOutlet weak var copyButtonLabel: UIButton!
    @IBOutlet weak var firstPigLabel: UILabel!
    @IBOutlet weak var secondPigLabel: UILabel!
    
    @IBAction func copyButton(sender: AnyObject) {
        UIPasteboard.general.string = translationTextView.text
        copyButtonLabel.isEnabled = false
         copyButtonLabel.alpha = 0.5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        translationTextView.layer.cornerRadius = 5
        translationTextView.clipsToBounds = true
        translationTextView.layer.borderWidth = 1.0
        translationTextView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        copyButtonLabel.layer.cornerRadius = 5
        copyButtonLabel.clipsToBounds = true
        copyButtonLabel.layer.borderWidth = 1.0
        copyButtonLabel.layer.borderColor = #colorLiteral(red: 0.7972511649, green: 0.7871587873, blue: 1, alpha: 1)
        copyButtonLabel.isEnabled = false
        copyButtonLabel.alpha = 0.5
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let translation = Translation()
        let rowArray  = translation.breakString(string: textField.text ?? "")
        let translatedArray = translation.translateArray(stringArray: rowArray)
        translationTextView.text = translatedArray.joined(separator: " ")
        copyButtonLabel.isEnabled = true
        copyButtonLabel.alpha = 1
        firstPigLabel.text = textField.text ?? ""
        secondPigLabel.text = translatedArray.joined(separator: " ")
        textField.text = ""
        return true
    }
}
