//
//  SegmentController.swift
//  Tripod
//
//  Created by Yevhenii Veretennikov on 10/22/16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

class SegmentController: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let imageNames = ["grid_img", "lines", "location"]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(SegmentCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        let selectedIndexPath: IndexPath = IndexPath(item: 1, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .top)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SegmentCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor(white: 0.7, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width/3, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SegmentCell: UICollectionViewCell {
    
    let divideLineTop = UIView()
    let divideLineBot = UIView()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "lines")?.withRenderingMode(.alwaysTemplate)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.tintColor = UIColor(white: 0.7, alpha: 1)
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.black : UIColor.gray
        }
    }
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.black : UIColor.gray
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(divideLineTop)
        setupDivideLineTop()
        addSubview(divideLineBot)
        setupDivideLineBot()
        addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
    }
    
    func setupDivideLineTop() {
        divideLineTop.backgroundColor = UIColor.gray
        divideLineTop.translatesAutoresizingMaskIntoConstraints = false
        
        divideLineTop.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        divideLineTop.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        divideLineTop.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        divideLineTop.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setupDivideLineBot() {
        divideLineBot.backgroundColor = UIColor.gray
        divideLineBot.translatesAutoresizingMaskIntoConstraints = false
        
        divideLineBot.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        divideLineBot.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        divideLineBot.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        divideLineBot.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



























