//
//  ViewController.swift
//  TableView and CollectionView
//
//  Created by Dmitry Sachkov on 19.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var tablrView: UITableView?
   
    let models = ["https://www.youtube.com/watch?v=_gQ5lZJtggY", "https://www.youtube.com/watch?v=dzaLuNriPzk", "https://www.youtube.com/watch?v=SBadAYwuunE", "https://www.youtube.com/watch?v=tHK3lQoKoYY"]

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
        tablrView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        tablrView.backgroundColor = .cyan
        tablrView.register(CustomTVCell.self,
                           forCellReuseIdentifier: CustomTVCell.identifier)
        tablrView.separatorInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        tablrView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
        tablrView.rowHeight = UITableView.automaticDimension
        tablrView.estimatedRowHeight = UITableView.automaticDimension
        tablrView.delegate = self
        tablrView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tablrView?.setNeedsLayout()
        tablrView?.layoutIfNeeded()
        tablrView?.reloadData()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTVCell.identifier,
                                                 for: indexPath) as? CustomTVCell
        cell?.configureCell(with: models)
//        let name = models[indexPath.row]
//        cell?.configure(with: name)
        return cell ?? UITableViewCell()
    }

}
