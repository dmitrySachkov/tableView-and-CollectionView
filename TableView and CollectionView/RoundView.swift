//
//  RoundView.swift
//  TableView and CollectionView
//
//  Created by Dmitry Sachkov on 22.11.2021.
//

import UIKit

import UIKit

class RoundView: UIView {

    private var isChecked = false
    
    private let checkMark: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = false
        image.image = UIImage(systemName: "checkmark.circle.fill")
        image.contentMode = .scaleToFill
        image.tintColor = .red
        
        return image
    }()
    
    init() {
        super.init(frame: CGRect())
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(checkMark)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.secondaryLabel.cgColor
        layer.cornerRadius = frame.size.width / 2
        backgroundColor = .systemBackground
        
        NSLayoutConstraint.activate([
            checkMark.centerXAnchor.constraint(equalTo: centerXAnchor),
            checkMark.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkMark.widthAnchor.constraint(equalToConstant: 24.0),
            checkMark.heightAnchor.constraint(equalToConstant: 24.0)
        ])
    }
    

}
