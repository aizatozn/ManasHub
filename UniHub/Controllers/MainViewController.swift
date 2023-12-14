//
//  MainViewController.swift
//  UniHub
//
//  Created by Aizat Ozbekova on 13/12/23.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {

    private let services = ["Time Table", "Manas Menu", "Obis", "manas.edu.kg", "@students.manas.edu.kg"]

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Главный экран"
        
        // Добавляем UITableView на главный экран
        view.addSubview(tableView)

        // Настраиваем констрейнты (могут быть настроены с учетом ваших предпочтений)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return services.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = services[indexPath.row]
        return cell
    }
}

