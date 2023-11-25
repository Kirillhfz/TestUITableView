//
//  ViewController.swift
//  TestUITableView
//
//  Created by Kirill Kornakov on 17.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let words = [
        ["Apple", "Pear", "Watermelon"],
        ["Carrot", "Pickle", "Potato", "Tomato"],
        ["Strawberry", "Raspberry", "Blackberry", "Blueberry"]
    ]
    
    let headers = ["Fruits", "Vegetables", "Berries"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderHeight = 32
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let vegOrFruitArray = words[section] // получили массив по номеру секции
        return vegOrFruitArray.count         // вернули количество элементов в нём
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        var content = cell.defaultContentConfiguration()
        content.text = words[indexPath.section][indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: nil,
                                      message: "Вы нажали на: \(words[indexPath.section][indexPath.row])",
                                      preferredStyle: .alert)                         // 1
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in             // 2
            alert.dismiss(animated: true)                                             // 3
        }
        alert.addAction(okAction)                                                     // 4
        present(alert, animated: true)                                                // 5
    }
}


// изменения такие
// еще здесь



var name = "kirill"

var numbers = 123
