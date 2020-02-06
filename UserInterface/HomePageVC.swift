//
//  ViewController.swift
//  UserInterface
//
//  Created by Quentin Duquesne on 01/02/2020.
//  Copyright © 2020 Quentin Duquesne. All rights reserved.
//

import UIKit

class HomePageVC: UIViewController {
    
    weak var headerFrame: UIView!
    var headerSize: CGFloat! = 130
    
    weak var profilPic: UIImageView!
    var profilPicSize: CGFloat! = 50
    
    weak var walletPic: UIImageView!
    var walletPicSize: CGFloat! = 50
    
    weak var cameraPic: UIImageView!
    var cameraPicSize: CGFloat! = 50
    
    weak var collectionView: UICollectionView!
    
    lazy var cellSizes: [CGSize] = {
        var cellSizes = [CGSize]()
        
        for _ in 0...100 {
            let random = Int(arc4random_uniform((UInt32(100))))
            
            cellSizes.append(CGSize(width: 140, height: 50 + random))
        }
        
        return cellSizes
    }()
    
    lazy var picCol: [UIImage] = {
        let col = [
            UIImage(named: "rolex1", in: Bundle.main, compatibleWith: nil)!,
            UIImage(named: "rolex2", in: Bundle.main, compatibleWith: nil)!,
            UIImage(named: "rolex3", in: Bundle.main, compatibleWith: nil)!
        ]
        return col
    }()
    
    override func loadView() {
        super.loadView()
        
        setupHeader()
        setupCamera()
        setupWalletIcon()
        setupProfilIcon
        
        headerFrame.backgroundColor = .brown
        
        let layout = CollectionViewWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.headerFrame.bottomAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        self.collectionView = collectionView
        
        
    }
            
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")

    }
    
}

extension HomePageVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 80
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        //cell.textLabel.text = String(indexPath.row + 1)
        cell.imgView.image = self.picCol.randomElement()
        return cell
    }
    
}

extension HomePageVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row + 1 )
    }
    
}

// MARK: - CollectionViewWaterfallLayoutDelegate (Replace CollectionViewFlow)
extension HomePageVC: CollectionViewWaterfallLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return cellSizes[indexPath.item]
    }
}

// MARK: - Other UI elements
extension HomePageVC {
    
    func setupHeader() {
        let headerFrame = UIView(frame: .zero)
        self.view.addSubview(headerFrame)
        
        headerFrame.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerFrame.topAnchor.constraint(equalTo: self.view.topAnchor),
            headerFrame.heightAnchor.constraint(equalToConstant: headerSize),
            headerFrame.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            headerFrame.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        self.headerFrame = headerFrame
    }
    
    func setupProfilIcon() {
        let iconFrame = UIImageView(named: "rolex1", in: Bundle.main, compatibleWith: nil)
        self.headerFrame.addSubview(iconFrame)
        
        iconFrame.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconFrame.heightAnchor.constraint(equalTo: profilPicSize),
            iconFrame.weightAnchor.constraint(equalTo: profilPicSize)
            iconFrame.topAnchor.constraint(equalTo: self.headerFrame.topAnchor, constant: -10),
            iconFrame.trailingAnchor.constraint(equalTo: self.headerFrame.trailingAnchor, constant: -10),
        ])
        
        iconFrame.layer.cornerRadius = 5
        
        self.profilPic = iconFrame
    }
    
    func setupWalletIcon() {
        let iconFrame = UIImageView(named: "wallet", in: Bundle.main, compatibleWith: nil)
        self.headerFrame.addSubview(iconFrame)
        
        iconFrame.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconFrame.heightAnchor.constraint(equalTo: walletPicSize),
            iconFrame.weightAnchor.constraint(equalTo: walletPicSize)
            iconFrame.topAnchor.constraint(equalTo: self.headerFrame.topAnchor, constant: -10),
            iconFrame.trailingAnchor.constraint(equalTo: self.profilPic.leadingAnchor, constant: -10),
        ])
        
        iconFrame.layer.cornerRadius = 5
        
        self.walletPic = iconFrame
    }
    
    func setupCamera() {
        let iconFrame = UIImageView(named: "camera", in: Bundle.main, compatibleWith: nil)
        self.headerFrame.addSubview(iconFrame)
        
        iconFrame.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            iconFrame.heightAnchor.constraint(equalTo: cameraPicSize),
            iconFrame.weightAnchor.constraint(equalTo: cameraPicSize)
            iconFrame.topAnchor.constraint(equalTo: self.headerFrame.topAnchor, constant: -10),
            iconFrame.leadingAnchor.constraint(equalTo: self.headerFrame.leadingAnchor, constant: 10),
        ])
        
        iconFrame.layer.cornerRadius = 0
        
        self.walletPic = iconFrame
    }
    
    
    
}