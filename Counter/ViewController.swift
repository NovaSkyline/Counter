//
//  ViewController.swift
//  Counter
//
//  Created by Руслан Камалов on 17.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var countLabel: UILabel!
    @IBOutlet private var changeHistory: UITextView!
    private var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countLabel.text = "Значение счётчика: \(counter)"
        changeHistory.text = "История изменений: \n"
        changeHistory.isEditable = false
    }
    
    // Увеличивает значение счетчика на 1.
    @IBAction private func buttonDidIncrease(_ sender: UIButton) {
        counter += 1
        countLabel.text = "Значение счётчика: \(counter)"
        addNewHistoryMessage("значение изменено на +1")
    }
    
    // Уменьшает значение счетчика на 1, если оно больше 0.
    @IBAction private func buttonDidDecrease(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            countLabel.text = "Значение счётчика: \(counter)"
            addNewHistoryMessage("значение изменено на -1")
        } else {
            addNewHistoryMessage("попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    // Сбрасывает значение счетчика до 0.
    @IBAction private func buttonDidReset(_ sender: UIButton) {
        counter = 0
        countLabel.text = "Значение счётчика: \(counter)"
        addNewHistoryMessage("значение сброшено")
    }
    
    // Добавляет новое сообщение в историю изменений с текущей датой и временем.
    private func addNewHistoryMessage(_ message: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        let historyMessage = "\(dateString):\n\(message)\n"
        changeHistory.text += historyMessage
        let range = NSRange(location: changeHistory.text.count - historyMessage.count, length: historyMessage.count)
        changeHistory.scrollRangeToVisible(range)
    }
}
