//
//  ViewController.swift
//  TrafficLight
//
//  Created by Артур Бирюков on 04.05.2024.
//
import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let redView = UIView()
    let yellowView = UIView()
    let greenView = UIView()
    let switchTrafficLightButton = UIButton()
    
    //
    var currentViewIndex = -1
    var views: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initializing Views
        views = [redView, yellowView, greenView]
        
        // Stack View
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        
        // Red View
        configureCircularView(redView, color: .red)
        // Yellow View
        configureCircularView(yellowView, color: .yellow)
        // Green View
        configureCircularView(greenView, color: .green)
        
        // Add views to StackView
        views.forEach { stackView.addArrangedSubview($0) }
        
        // Add Stack and Auto Layout
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Button
        switchTrafficLightButton.setTitle("Start", for: .normal)
        switchTrafficLightButton.backgroundColor = .blue
        switchTrafficLightButton.translatesAutoresizingMaskIntoConstraints = false
        switchTrafficLightButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(switchTrafficLightButton)
        
        // Constraint Stack
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Constrain Button
        NSLayoutConstraint.activate([
            switchTrafficLightButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            switchTrafficLightButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            switchTrafficLightButton.widthAnchor.constraint(equalToConstant: 200),
            switchTrafficLightButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func buttonTapped() {
        // Увеличиваем индекс текущего представления и выполняем модуль для обеспечения цикличности
        currentViewIndex = (currentViewIndex + 1) % views.count
        
        // Устанавливаем прозрачность для текущего представления
        let switchOffColorView: CGFloat = 0.3
        let switchOnColorView: CGFloat = 1.0
        views[currentViewIndex].alpha = switchOnColorView
        
        // Сбрасываем прозрачность для предыдущего представления
        let previousViewIndex = (currentViewIndex == 0) ? views.count - 1 : currentViewIndex - 1
        views[previousViewIndex].alpha = switchOffColorView
        
        switchTrafficLightButton.setTitle("Next", for: .normal)
    }
    
    func configureCircularView(_ view: UIView, color: UIColor) {
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 128),
            view.heightAnchor.constraint(equalToConstant: 128)
        ])
        view.layer.cornerRadius = 64
        view.clipsToBounds = true
        view.alpha = 0.3
    }
}
