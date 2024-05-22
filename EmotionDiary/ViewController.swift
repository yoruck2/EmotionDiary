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
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpnavigationBar()
        setUpemotionButton()
        setUpemotionCount()
        
    }
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        // 바꿔보기
        // 반환값이 아니라 라인 자체를 변수에 넣기??
        if let buttonTitle = sender.titleLabel?.text {
            let count = userDefaults.integer(forKey: "\(buttonTitle)")
            userDefaults.set(count + 1, forKey: "\(buttonTitle)")
            emotionStackViews[sender]?.text = String(userDefaults.integer(forKey: "\(buttonTitle)")) + "   "
        }
    }
    
    @IBAction func resetEmotionButtonTapped(_ sender: UIButton) {
        emotionButtons.forEach { button in
            userDefaults.set(0, forKey: "\(button.titleLabel?.text ?? "")")
            emotionStackViews[button]?.text = String(userDefaults.integer(forKey: "\(button.titleLabel?.text ?? "")")) + "   "
        }
    }
    
    
    func setUpemotionButton() {
        var index = 1
        zip(emotionButtons,emotionCountLabels).forEach { button, label in
            button.setImage(UIImage(named: "slime\(index)"), for: .normal)
            label.textColor = .black
            emotionStackViews[button] = label
            index += 1
        }
    }
    
    func setUpnavigationBar() {
        navigationItem.title = "감정 다이어리"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"))
        navigationItem.leftBarButtonItem?.tintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 17)!]
    }
    
    func setUpemotionCount() {
        let launchedBefore = userDefaults.bool(forKey: "launchedBefore")
        
        if launchedBefore == false {
            emotionButtons.forEach { button in
                button.titleLabel?.textColor = .black
                emotionCount[button.titleLabel?.text ?? "error"] = 0
            }
            userDefaults.set(true, forKey: "launchedBefore")
        }
        emotionButtons.forEach { button in
            emotionStackViews[button]?.text = String(userDefaults.integer(forKey: "\(button.titleLabel?.text ?? "")")) + "   "
        }
        
    }
}

