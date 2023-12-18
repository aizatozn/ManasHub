//
//  MainViewController.swift
//  UniHub
//
//  Created by Aizat Ozbekova on 13/12/23.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let services = [
        "Time Table": "http://timetable.manas.edu.kg/department-printer/142",
        "Manas Menu": "https://beslenme.manas.edu.kg/menu",
        "Obis": "http://obis.manas.edu.kg",
        "manas.edu.kg": "https://www.manas.edu.kg/kg",
        "@students.manas.edu.kg": "https://www.instagram.com/students.manas.edu.kg/?hl=en"
    ]

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Главный экран"
        
        // Установка фонового изображения
        let backgroundImage = UIImageView(image: UIImage(named: "backgroundImage"))
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.frame = view.bounds
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        view.addSubview(tableView)

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
        cell.textLabel?.text = Array(services.keys)[indexPath.row]
        return cell
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // Получаем ключ (название сервиса) и значение (ссылку) из словаря
        let selectedService = Array(services.keys)[indexPath.row]
        if let serviceURLString = services[selectedService], let serviceURL = URL(string: serviceURLString) {
            UIApplication.shared.open(serviceURL, options: [:], completionHandler: nil)
        }
    }
}
