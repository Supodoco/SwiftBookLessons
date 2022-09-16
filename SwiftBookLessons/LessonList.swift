//
//  LessonList.swift
//  SwiftBookLessons
//
//  Created by Supodoco on 16.09.2022.
//

import UIKit

class LessonList: UIViewController {
    
    let tableView = UITableView()
    let lessons = (1...2).map { "Lesson \($0)" }
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelConfigure()
        labelMakeConstraints()
        tableViewConfigure()
        tableViewMakeConstraints()
                
    }
    func labelConfigure() {
        label.text = "SwiftBook Lessons"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
    }
    func labelMakeConstraints() {
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            label.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func tableViewConfigure() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
    }
    func tableViewMakeConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16)
        ])
    }
}

extension LessonList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        lessons.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = lessons[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailItem = storyboard.instantiateViewController(identifier: lessons[indexPath.row])
        present(detailItem, animated: true)
    }
}
