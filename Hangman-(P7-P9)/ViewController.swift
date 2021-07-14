//
//  ViewController.swift
//  Hangman-(P7-P9)
//
//  Created by Łukasz Nycz on 14/07/2021.
//

import UIKit

class ViewController: UIViewController {

    var letterButtons = [UIButton]()
    @IBOutlet var letterView: UIView!
    @IBOutlet var currentAnswer: UITextField!
    var activatedButtons = [UIButton]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonView = UIView()
        
        let width = 150
        let height = 80
        
        for row in 0..<4 {
            for column in 0..<5 {
                let letterButton = UIButton(type: .system)
                letterButton.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                letterButton.setTitle("WWW", for: .normal)
                letterButton.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                
                let frame = CGRect(x: column * width, y: row * height, width: width, height: height)
                letterButton.frame = frame
                letterView.addSubview(letterButton)
                
                letterButtons.append(letterButton)
            }
        }
    }
    
    @objc func letterTapped(_ sender: UIButton) {
        guard let buttonTitle = sender.titleLabel?.text else { return }
        
        currentAnswer.text = currentAnswer.text?.appending(buttonTitle)
        activatedButtons.append(sender)
        sender.isHidden = true
    }


}

