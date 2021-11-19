//
//  CustomCollectionViewCell.swift
//  TableView and CollectionView
//
//  Created by Dmitry Sachkov on 19.11.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private var image: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray
        contentView.addSubview(image)
        getImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getImage() {
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 250),
            image.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func configure(name: String) {
        image.image = UIImage(named: "\(name)")
    }
}
