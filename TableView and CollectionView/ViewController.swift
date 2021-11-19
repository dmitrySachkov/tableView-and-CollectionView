//
//  ViewController.swift
//  TableView and CollectionView
//
//  Created by Dmitry Sachkov on 19.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var tablrView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupTableView()
    }

    private func setupTableView() {
        tablrView = UITableView()
        guard let tablrView = tablrView else { return }
        view.addSubview(tablrView)
        tablrView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.frame = self.view.frame
        tablrView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        tablrView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        tablrView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        tablrView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tablrView.register(CustomTVCell.self,
                           forCellReuseIdentifier: CustomTVCell.identifier)
        tablrView.backgroundColor = .blue
        tablrView.delegate = self
        tablrView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTVCell.identifier,
                                                 for: indexPath)
        return cell
    }
}
