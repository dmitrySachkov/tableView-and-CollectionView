//
//  ViewController.swift
//  TableView and CollectionView
//
//  Created by Dmitry Sachkov on 19.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var tablrView: UITableView?
   
    let models = ["One", "Two", "Three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tablrView?.reloadData()
    }

    private func setupTableView() {
        tablrView = UITableView()
        guard let tablrView = tablrView else { return }
        view.addSubview(tablrView)
        tablrView.translatesAutoresizingMaskIntoConstraints = false
        tablrView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        tablrView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        tablrView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        tablrView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        tablrView.register(CustomTVCell.self,
                           forCellReuseIdentifier: CustomTVCell.identifier)
        tablrView.separatorInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        tablrView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tablrView.delegate = self
        tablrView.dataSource = self
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTVCell.identifier,
                                                 for: indexPath) as? CustomTVCell
        cell?.configureCell(with: models)
        return cell ?? UITableViewCell()
    }
}
