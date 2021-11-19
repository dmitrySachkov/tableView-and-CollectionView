//
//  ViewController.swift
//  TableView and CollectionView
//
//  Created by Dmitry Sachkov on 19.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
//    private var tablrView: UITableView?
    private let tableView = UITableView()
    private var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
//        setupTableView()
    }

//    private func setupTableView() {
////        tablrView = UITableView()
////        guard let tablrView = tablrView else { return }
//        view.addSubview(tableView)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
////        tableView.frame = self.view.frame
//        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
//        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
//        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        tableView.register(CustomTVCell.self,
//                           forCellReuseIdentifier: CustomTVCell.identifier)
//        tableView.backgroundColor = .blue
//    }
//
//}
//
//extension ViewController: UITextViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTVCell.identifier,
//                                                 for: indexPath) as? CustomTVCell
//        return cell ?? UITableViewCell()
//    }
//}

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: view.frame.width - 20,
                                 height: view.frame.height)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        view.addSubview(collectionView)
        collectionView.register(CustomCollectionViewCell.self,
                                forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        cell?.backgroundColor = .white
        return cell ?? UICollectionViewCell()
    }
}
