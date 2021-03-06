//
//  CustomTVCell.swift
//  TableView and CollectionView
//
//  Created by Dmitry Sachkov on 19.11.2021.
//

import UIKit
import youtube_ios_player_helper

class CustomTVCell: UITableViewCell, YTPlayerViewDelegate {
    static let identifier = "CustomTVCell"
    
    var collectionView: UICollectionView?
    
    private var model = [String]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with model: [String]) {
        self.model = model
        collectionView?.reloadData()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        layout.itemSize = CGSize(width: contentView.frame.width - 10,
                                 height: (contentView.frame.width / 3 * 2) - 20)
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: self.contentView.bounds,
                                          collectionViewLayout: layout)
        guard let collectionView = collectionView else { return }
        contentView.addSubview(collectionView)
        collectionView.register(CustomCollectionViewCell.self,
                                forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: contentView.frame.width / 3 * 2)
        ])
        collectionView.delegate = self
        collectionView.dataSource = self

    }
}

extension CustomTVCell: UICollectionViewDelegate,
                        UICollectionViewDataSource,
                        UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell
        let name = model[indexPath.row]
        cell?.configure(urlString: name)
        return cell ?? UICollectionViewCell()
    }
//
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        guard let videoCell = cell as? CustomCollectionViewCell else { return }
//        videoCell.player.delegate = self
//    }
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        collectionView?.visibleCells.forEach({ cell in
//            guard let videoCell = cell as? CustomCollectionViewCell else { return }
//            
//        })
//    }
//    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        collectionView?.visibleCells.forEach({ cell in
//            guard let videoCell = cell as? CustomCollectionViewCell else { return }
//            videoCell.presentVideo()
//        })
//    }
}
