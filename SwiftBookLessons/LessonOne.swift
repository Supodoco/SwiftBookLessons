//
//  LessonThree.swift
//  SwiftBookLessons
//
//  Created by Supodoco on 16.09.2022.
//

import UIKit

class LessonOne: UIViewController {
    let views = [UIView(), UIView()]
    let colors: [UIColor] = [.systemPink, .systemMint]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        for (index, view) in views.enumerated() {
            view.backgroundColor = colors[index]
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            views[0].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            views[0].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            views[0].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            views[1].leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            views[1].trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            views[1].bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            views[0].heightAnchor.constraint(equalTo: views[1].heightAnchor),
            views[1].topAnchor.constraint(equalTo: views[0].bottomAnchor, constant: 20)
        ])
    }
}
