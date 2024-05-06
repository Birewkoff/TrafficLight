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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // StackView
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        
        // Red View
        configureCircularView(redView, color: .red)
        redView.alpha = 0.3
        // Yellow View
        configureCircularView(yellowView, color: .yellow)
        yellowView.alpha = 0.3
        // Green View
        configureCircularView(greenView, color: .green)
        greenView.alpha = 0.3
        
        // Add views to StackView
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(yellowView)
        stackView.addArrangedSubview(greenView)
        
        // Add Stack and Auto Layout
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Button
        switchTrafficLightButton.setTitle("Start", for: .normal)
        switchTrafficLightButton.backgroundColor = .blue
        switchTrafficLightButton.translatesAutoresizingMaskIntoConstraints = false
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
    
    func configureCircularView(_ view: UIView, color: UIColor) {
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 128),
            view.heightAnchor.constraint(equalToConstant: 128)
        ])
        view.layer.cornerRadius = 64
        view.clipsToBounds = true
    }
}
