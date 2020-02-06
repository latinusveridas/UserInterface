//
//  LabelCollectionViewCell.swift
//  CollectionViewWaterfallLayoutDemo
//
//  Created by Eric Cerney on 9/24/19.
//  Copyright © 2019 Eric Cerney. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
    weak var textLabel: UILabel!
    weak var imgView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imgView)
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imgView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            imgView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ])
        self.imgView = imgView
        
        self.contentView.backgroundColor = .cyan
        //self.textLabel.textAlignment = .center
        
        self.contentView.layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        fatalError("Interface Builder is not supported!")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
