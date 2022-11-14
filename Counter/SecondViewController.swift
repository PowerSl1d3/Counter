//
//  SecondViewController.swift
//  Counter
//
//  Created by Олег Аксененко on 17.10.2022.
//

import UIKit

class SecondViewController: UIViewController {
    private let viewControllerName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .center
        label.text = String(describing: SecondViewController.self)
        label.textColor = .black

        return label
    }()

    private let enterSecondViewControllerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 9
        button.setTitle("Открыть \(String(describing: SecondViewController.self))", for: .normal)

        return button
    }()

    // Для данной задачи это излишне и можно было бы обойтись обычной переменной,
    // но в качестве примера, здесь мы работаем с абстракцией, а не с конкретным
    // классом, поэтому, в дальнейшем, можно было бы писать свои счётчики с разными
    // шагами (например умножающе на 2 своё значение) и встраивать их извне (DI),
    // при этом не меняя логику основного класса

    // Вызывается после инициализации всех полей ViewController'а и загрузке View
    // На этом этапе границы View не установлены, поэтому мы не можем обращаться
    // к значениям геометрии (высота, ширина и пр.)
    override func viewDidLoad() {
        super.viewDidLoad()

        print(#function, "Контроллер загрузился в память")

        view.backgroundColor = .yellow

        view.addSubview(viewControllerName)
        view.addSubview(enterSecondViewControllerButton)
        enterSecondViewControllerButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)

        setupConstraints()
    }

    // Деинициализатор может быть написан только в самом классе
    deinit {
        print(#function, "ViewController сейчас будет выгружен из памяти")
    }
}

// MARK: Lifecycle

extension SecondViewController {
    // Вызывается перед появлением View на экране.
    // Этот метод вызывается перед тем как View будет добавлено в текущую
    // иерархию, перед отработкой какой бы то ни было анимации. Этот метод
    // можно использовать для более тонкой настройки Subview, которые нужно сделать без анимаций.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        print(#function, "View сейчас готовится к показу на экране")
    }

    // После вызова viewWillAppear устанавливаются границы View и геометрические
    // значения становятся доступны. Расположение всех элементов пользовательского
    // интерфейса задаются параметрами AutoLayout.
    // viewWillLayoutSubviews и viewDidLayoutSubviews вызваются, чтобы убедится,
    // что расстановка выполнена правильно. Эти методы вызываются до начала расстановки
    // и сразу же после расстановки. Если не использовать AutoLayout, то метод
    // viewDidLayoutSubviews является местом где можно изменить размеры Subviews и
    // их положение.
    override func viewWillLayoutSubviews() {
        // В данном методе обращение к своему суперклассу избыточное и не требуется. По умолчанию ничего не делает
        super.viewWillLayoutSubviews()

        print(#function, "Метод срабатывает перед тем, как размер View изменится под размер экрана")
    }

    // На этом этапе жизненного цикла можно быть уверенным, что View выставила корректно положения
    // для всех своих потомков. В этом методе можно сохранять последнее состояние объекта (положение
    // scrollView, выделение нужной ячейки)
    override func viewDidLayoutSubviews() {
        // В данном методе обращение к своему суперклассу избыточное и не требуется. По умолчанию ничего не делает
        super.viewDidLayoutSubviews()

        print(#function, "Метод срабатывает после того, как размер View изменился под размер экрана")
    }

    // В остальных случаях для изменения значений constraint'ов (например при повороте экрана)
    // используется updateViewConstraints. Вызов метода происходит перед viewWillLayoutSubviews.
    override func updateViewConstraints() {
        print(#function, "Изменение значений констант для констрейнтов")

        // Обязательно нужно вызвать в конце метода
        super.updateViewConstraints()
    }

    // Метод является финальным в цепочке жизненного цикла viewController'а.
    // Вызывается, когда представление уже загружено, и мы хотим что-то показать.
    // Может быть вызван не один раз в течении жизненного цикла viewController'а.
    // В этом методе можно размещать ресурсоёмкие операции, например связанные с
    // получением данных. Можно вызвать becomeFirstResponder, чтобы сразу начать
    // ввод в нужное поле.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        print(#function, "View сейчас перейдёт в состояние показа на экране")
    }

    // Вызывается когда View уходит с экрана. Тут обычно коммитят изменения,
    // ставят на паузу выполняемые изменения. Отменяют анимации и стиль статус бара, если
    // он менялся, можно почистить данные, обнулить кэш.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        print(#function, "View сейчас выйдет из состояния показа на экране")
    }

    // Оповещает когда View было удалено из иерархии. Зона ответственности примерно такая же
    // как и у viewWillDisappear, только следует понимать, что этот метод вызывается
    // после анимации удаления View, а предыдущий - перед.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        print(#function, "View сейчас начнёт выгружаться из памяти")
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        print(#function, "View сейчас изменит ориентацию")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        print(#function, "View получила предупреждение о большом использованиие памяти и нужно сгрузить неиспользуемые объекты")
    }
}

// MARK: Not lifecycle methods

extension SecondViewController {
    // Не является частью жизненного цикла viewController'а, но нужно понимать,
    // что он вызывается сразу после инициализацией, перед подготовкой перехода у
    // viewController'а, который задан при помощи storyboard'а.
    override func awakeFromNib() {
        super.awakeFromNib()

        print(#function)
    }

    // Используется при ручной инициализации View. Если не использовать метод, то
    // viewController делает это автоматически. В этом методе можно создать view
    // и присвоить ему какие либо первоначальные значение, например цвет и пр.
    override func loadView() {
        super.loadView()

        print(#function)
    }
}

// MARK: Constraints

private extension SecondViewController {
    private enum Constants {
        static let defaultInset: CGFloat = 16

        static let maxScoreLabelHeight: CGFloat = 20

        static let buttonTopInset: CGFloat = 20
        static let buttonHeight: CGFloat = 40
    }

    func setupConstraints() {
        viewControllerName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewControllerName.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewControllerName.heightAnchor.constraint(lessThanOrEqualToConstant: Constants.maxScoreLabelHeight).isActive = true

        enterSecondViewControllerButton.topAnchor.constraint(equalTo: viewControllerName.bottomAnchor, constant: Constants.buttonTopInset).isActive = true
        enterSecondViewControllerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.defaultInset).isActive = true
        enterSecondViewControllerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.defaultInset).isActive = true
        enterSecondViewControllerButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight).isActive = true
    }
}

// MARK: Actions

private extension SecondViewController {
    @objc func buttonDidTap() {
        let viewController = SecondViewController()
        present(viewController, animated: true)
    }
}
