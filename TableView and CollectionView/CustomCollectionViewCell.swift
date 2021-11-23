//
//  CustomCollectionViewCell.swift
//  TableView and CollectionView
//
//  Created by Dmitry Sachkov on 19.11.2021.
//

import UIKit
import AVKit
import AVFoundation

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    var urlString = ""
    
    var player: AVPlayer?
    
    private var image: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private var videoView: UIView = {
       let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray
        contentView.addSubview(videoView)
        getImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func getImage() {
        NSLayoutConstraint.activate([
            videoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            videoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            videoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            videoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func configure(urlString: String) {
        self.urlString = urlString
    }
    
    func presentVideo() {
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.main.async {
            self.player = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: self.player)
            self.videoView.layer.addSublayer(playerLayer)
            playerLayer.frame = self.frame
            self.player?.play()
        }
    }
    
    func stopPlay() {
        player?.pause()
    }
}
