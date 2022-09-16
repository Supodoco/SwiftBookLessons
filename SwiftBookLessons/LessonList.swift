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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SwiftBook Lessons"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.frame = view.bounds
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
        navigationController?.show(detailItem, sender: self)
    }
}
