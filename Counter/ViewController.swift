//
//  ViewController.swift
//  Counter
//
//  Created by Олег Аксененко on 03.10.2022.
//

import UIKit

class ViewController: UIViewController {
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .center

        return label
    }()

    private let changeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 9
        button.setTitle("Нажми меня", for: .normal)

        // Start Test
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 0
        // End Test

        return button
    }()

    // Для данной задачи это излишне и можно было бы обойтись обычной переменной,
    // но в качестве примера, здесь мы работаем с абстракцией, а не с конкретным
    // классом, поэтому, в дальнейшем, можно было бы писать свои счётчики с разными
    // шагами (например умножающе на 2 своё значение) и встраивать их извне (DI),
    // при этом не меняя логику основного класса
    private var counter: CounterProtocol = Counter()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scoreLabel)
        view.addSubview(changeButton)

        scoreLabel.text = counter.description
        changeButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)

        setupConstraints()
    }
}

// MARK: Constraints

private extension ViewController {
    private enum Constants {
        static let defaultInset: CGFloat = 16

        static let maxScoreLabelHeight: CGFloat = 20

        static let buttonTopInset: CGFloat = 20
        static let buttonHeight: CGFloat = 40
    }

    func setupConstraints() {
        scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scoreLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        scoreLabel.heightAnchor.constraint(lessThanOrEqualToConstant: Constants.maxScoreLabelHeight).isActive = true

        changeButton.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: Constants.buttonTopInset).isActive = true
        changeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.defaultInset).isActive = true
        changeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.defaultInset).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
    }
}

// MARK: Actions

private extension ViewController {
    @objc func buttonDidTap() {
        counter.makeStep()
        scoreLabel.text = counter.description
    }
}
