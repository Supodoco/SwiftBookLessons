//
//  ViewController.swift
//  SwiftBookLessons
//
//  Created by Supodoco on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {
        
    let stackTraficLight = UIStackView()
    let views = [UIView(), UIView(), UIView()]
    let colors: [UIColor] = [.red, .yellow, .green]
    let buttonTurnOnLight = UIButton()
    let alpha = 0.30000001192092896
    var width: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        width = view.frame.width / 3
        buttonConfigure()
        stackConfigure()
        viewsMakeConstraints()
    }
    func stackConfigure() {
        stackTraficLight.distribution = .equalSpacing
        stackTraficLight.axis = .vertical
        stackTraficLight.alignment = .center
        
        view.addSubview(stackTraficLight)
        
        for (index, view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = width / 2
            view.alpha = alpha
            view.backgroundColor = colors[index]
            view.heightAnchor.constraint(equalToConstant: width).isActive = true
            view.widthAnchor.constraint(equalToConstant: width).isActive = true
            stackTraficLight.addArrangedSubview(view)
        }
        stackTraficLight.addArrangedSubview(buttonTurnOnLight)
        stackTraficLight.translatesAutoresizingMaskIntoConstraints = false
    }
    func buttonConfigure() {
        buttonTurnOnLight.backgroundColor = .gray
        buttonTurnOnLight.setTitle("START", for: .normal)
        buttonTurnOnLight.setTitleColor(.white, for: .normal)
        buttonTurnOnLight.layer.cornerRadius = 8
        buttonTurnOnLight.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    @objc func buttonTapped() {
        if views[0].alpha == alpha && views[1].alpha == alpha {
            buttonTurnOnLight.setTitle("NEXT", for: .normal)
            views[0].alpha = 1
            views[2].alpha = alpha
        } else if views[1].alpha == alpha {
            views[1].alpha = 1
            views[0].alpha = alpha
        } else {
            views[2].alpha = 1
            views[1].alpha = alpha
        }
    }
    func viewsMakeConstraints() {
        NSLayoutConstraint.activate([
            stackTraficLight.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackTraficLight.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackTraficLight.widthAnchor.constraint(equalToConstant: width),
            stackTraficLight.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            
            buttonTurnOnLight.widthAnchor.constraint(equalToConstant: width),
            buttonTurnOnLight.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
}

