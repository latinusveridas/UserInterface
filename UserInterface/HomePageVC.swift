//
//  ViewController.swift
//  UserInterface
//
//  Created by Quentin Duquesne on 01/02/2020.
//  Copyright © 2020 Quentin Duquesne. All rights reserved.
//

import UIKit

class HomePageVC: UIViewController {

    var collectionView: UICollectionView!
    
    lazy var cellSizes: [CGSize] = {
        var cellSizes = [CGSize]()
        
        for _ in 0...100 {
            let random = Int(arc4random_uniform((UInt32(100))))
            
            cellSizes.append(CGSize(width: 140, height: 50 + random))
        }
        
        return cellSizes
    }()    
    
    override func loadView() { 
        super.loadView()
        
        let collectionView = setupCustomCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: collectionView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
        ])
        self.collectionView = collectionView        
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
}

// MARK: - UI Setup
extension HomePageVC {
    
    func setupCustomCollectionView() -> UICollectionView {
        var colView = UICollectionView()
        var layout = CollectionViewWaterfallLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.headerInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        layout.headerHeight = 50
        layout.footerHeight = 20
        layout.minimumColumnSpacing = 10
        layout.minimumInteritemSpacing = 10      
        
        colView.collectionViewLayout = layout
        colView.register(LabelCollectionViewCell.self, forCellWithReuseIdentifier: LabelCollectionViewCell.identifier)
        colView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: CollectionViewWaterfallElementKindSectionHeader, withReuseIdentifier: "Header")
        colView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: CollectionViewWaterfallElementKindSectionFooter, withReuseIdentifier: "Footer")        
        
        return colView
    }
    
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellSizes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {   /************************************/
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.identifier, for: indexPath) as! LabelCollectionViewCell
        
        cell.label.text = String(indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reusableView: UICollectionReusableView?
        
        switch kind {
        case CollectionViewWaterfallElementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath)
            header.backgroundColor = .cyan
            reusableView = header
        case CollectionViewWaterfallElementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)
            footer.backgroundColor = .blue
            reusableView = footer
        default:
            reusableView = nil
        }
        
        return reusableView!
    }
}


// MARK: - CollectionViewWaterfallLayoutDelegate
extension ViewController: CollectionViewWaterfallLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return cellSizes[indexPath.item]
    }
}
