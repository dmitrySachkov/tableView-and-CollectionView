//
//  CustomCollectionViewCell.swift
//  TableView and CollectionView
//
//  Created by Dmitry Sachkov on 19.11.2021.
//

import UIKit
import youtube_ios_player_helper

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private var image: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var player: YTPlayerView = {
       let view = YTPlayerView()
        view.backgroundColor = .gray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray
        contentView.addSubview(player)
        getImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getImage() {
        NSLayoutConstraint.activate([
            player.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            player.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            player.topAnchor.constraint(equalTo: contentView.topAnchor),
            player.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func getQueryStringParameter(url: String, param: String) -> String? {
        guard let url = URLComponents(string: url) else { print("no id")
            return nil }
        let result = url.queryItems?.first(where: { $0.name == param })?.value
        return result
      }
    
    func configure(urlString: String) {
        guard let video = getQueryStringParameter(url: urlString, param: "v") else { return }
        player.load(withVideoId: video)
        player.delegate = self
    }
    
}

extension CustomCollectionViewCell: YTPlayerViewDelegate {
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        print("Ready")
        
    }
}
