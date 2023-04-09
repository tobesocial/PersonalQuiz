//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    var answers: [Answer]!
    
    private var numberOfAnimals: [Animal: Int] = [
        .rabbit: 0,
        .dog: 0,
        .cat: 0,
        .turtle: 0
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        sortedAnimalsByCount()
        greatestAnimal()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func sortedAnimalsByCount() {
        for answer in answers {
            numberOfAnimals[answer.animal]! += 1
        }
        print(numberOfAnimals)
    }
    
    private func greatestAnimal() {
        let maxumum = numberOfAnimals.max {
            $0.value < $1.value
        }
        animalLabel.text = "Вы - \(maxumum?.key.rawValue ?? Character(""))"
        definitionLabel.text = "\(maxumum?.key.definition ?? "")"
    }
    
    deinit {
        print("\(type(of: self)) has been deinitialization")
    }
}
