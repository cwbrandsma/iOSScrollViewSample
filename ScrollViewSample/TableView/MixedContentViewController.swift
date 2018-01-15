//
//  MixedContentViewController.swift
//  ScrollViewSample
//
//  Created by Chris Brandsma on 1/6/18.
//  Copyright © 2018 CSpace. All rights reserved.
//
//  Displaying tableview (which is a scrollview), to display different types of content

import Foundation
import UIKit

class MixedContentViewController : UIViewController {
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(CollectionTableCell.self, forCellReuseIdentifier: "collectionCell")
        
        self.view.addSubview(tableView, withConstraints: LC.fill(ofView: tableView, toView: self.view))
    }
    
    func longTextCell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell") ?? UITableViewCell()
        
        cell.textLabel?.text = Assets.longText
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        return cell
    }
    
    func imageCell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell") ?? UITableViewCell()
        
        cell.imageView?.image = Assets.boiseFireImage
        cell.imageView?.contentMode = .scaleAspectFill
        return cell
    }
    
    func collectionViewCell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collectionCell") ?? CollectionTableCell()
        
        return cell
    }
}

extension MixedContentViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            return longTextCell(tableView)
        }
        if indexPath.row == 1 {
            return imageCell(tableView)
        }
        if indexPath.row == 2 {
            return collectionViewCell(tableView)
        }
        return longTextCell(tableView)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            let cell = tableView.cellForRow(at: indexPath)
            if let imgView = cell?.imageView {
                let image = imgView.image!
                
                let ratio = image.size.width / image.size.height
                let rHeight = image.size.height * ratio
                return rHeight
                
            }
            return CGFloat(200)
        }
        if indexPath.row == 2 {
            return CGFloat(200)
        }
        return UITableViewAutomaticDimension
    }
}

class CollectionTableCell: UITableViewCell {
    var collectionView: UICollectionView!
    
    let list = [Assets.boiseFireImage, Assets.boiseFireImage, Assets.boiseFireImage]
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 200, height: 200)
        
        self.collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.contentView.addSubview(collectionView, withConstraints: LC.fill(ofView: collectionView, toView: self.contentView))
    }
}

extension CollectionTableCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ImageCollectionViewCell ?? ImageCollectionViewCell()
        
        let img = list[indexPath.row]
        cell.imageView.image = img
        
        return cell
    }
}

class ImageCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = 8
        
        self.contentView.addSubview(imageView, withConstraints: LC.fill(ofView: imageView, toView: self.contentView))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ImageCollectionViewCell.imageTap(recognizer:)))
        tapGesture.delegate = self
        imageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func imageTap(recognizer: UITapGestureRecognizer) {
        print("Image tapped")
    }
}

