//
//  MenuLauncher.swift
//  Tripod
//
//  Created by Yevhenii Veretennikov on 10/22/16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

private let cellId = "menuCellId"

class MenuLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    private var backgroundPicture = UIImageView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.alwaysBounceVertical = true
        return cv
    }()
    
    let bgView = UIView()
    
    func showMenu() {
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(bgView)
            window.addSubview(collectionView)
            
            bgView.backgroundColor = UIColor.clear
            bgView.frame = window.frame
            bgView.alpha = 0
            
            collectionView.frame = CGRect.init(x: 0, y: 0, width: 0, height: window.frame.height)
            collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
            
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
            
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(closeMenu))
            leftSwipe.direction = .left
            window.addGestureRecognizer(leftSwipe)
            
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.bgView.alpha = 1
                self.collectionView.frame = CGRect.init(x: 0, y: 0, width: window.frame.width * 0.8, height: window.frame.height)
                }, completion: nil)
        }
    }
    
    func closeMenu() {
        if let window = UIApplication.shared.keyWindow {
            UIView.animate(withDuration: 0.3, animations: {
                self.bgView.alpha = 0
                self.collectionView.frame = CGRect.init(x: 0, y: 0, width: -window.frame.width * 0.8, height: window.frame.height)
            })
        }
    }
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.contentInset = UIEdgeInsets.init(top: 170, left: 0, bottom: 0, right: 0)
        
        collectionView.addSubview(backgroundPicture)
        setupBackgroundPic()
        
    }
    
    func setupBackgroundPic() {
        backgroundPicture.makeBlurImage(named: "ph1")
        backgroundPicture.translatesAutoresizingMaskIntoConstraints = false
        backgroundPicture.clipsToBounds = true
        backgroundPicture.contentMode = .scaleAspectFill
        
        backgroundPicture.leftAnchor.constraint(equalTo: collectionView.leftAnchor).isActive = true
        backgroundPicture.bottomAnchor.constraint(equalTo: collectionView.topAnchor).isActive = true
        backgroundPicture.rightAnchor.constraint(equalTo: collectionView.rightAnchor).isActive = true
        backgroundPicture.heightAnchor.constraint(equalToConstant: 170).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.collectionView.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
}













