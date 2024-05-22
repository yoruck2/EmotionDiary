//
//  ViewController.swift
//  EmotionDiary
//
//  Created by dopamint on 5/17/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emotionButtons: [UIButton]!
    @IBOutlet var emotionCountLabels: [UILabel]!
    var emotionStackViews: [UIButton: UILabel] = [:]
    var emotionCount: [String: Int] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpnavigationBar()
        setUpemotionButton()
        setUpemotionCount()
        }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        if let buttonTitle = sender.titleLabel?.text {
            emotionCount[buttonTitle]! += 1
            emotionStackViews[sender]?.text = String(emotionCount[buttonTitle]!) + "   "
        }
    }

    func setUpemotionButton() {
        var index = 1
        zip(emotionButtons,emotionCountLabels).forEach { button, label in
//            button.imageView?.image = UIImage(named: "slime\(index)")
            button.setImage(UIImage(named: "slime\(index)"), for: .normal)
            label.textColor = .black
            emotionStackViews[button] = label
            index += 1
        }
    }
    
    func setUpnavigationBar() {
        navigationItem.title = "감정 다이어리"
        // 기능 확장 가능함
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"))
        navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 17)!]
    }
    
    func setUpemotionCount() {
        emotionButtons.forEach { button in
            button.titleLabel?.textColor = .black
            emotionCount[button.titleLabel?.text ?? "error"] = 0
        }
    }
}

