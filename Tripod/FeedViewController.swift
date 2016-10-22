//
//  FeedViewController.swift
//  Tripod
//
//  Created by Yevhenii Veretennikov on 10/22/16.
//  Copyright © 2016 Yevhenii Veretennikov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var backgroundPicture = UIImageView()
    private var containerInfo = UIView()
    private var profileImage = UIImageView()
    private var profileName = UILabel()
    private var lastPlace = UILabel()
    private var profileImageShadow = UIImageView()
    private let backgroundPictureHeight: CGFloat = 150
    private let containerInfoHeight: CGFloat = 230
    private var backgroundPictureHeightAnchor: NSLayoutConstraint?
    private var containerInfoHeightAnchor: NSLayoutConstraint?
    private var containerInfoTopAnchor: NSLayoutConstraint?
    var friendLabel = UILabel()
    var photoLabel = UILabel()
    var placeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fromTopToCV = backgroundPictureHeight + containerInfoHeight
        
        navigationController?.isNavigationBarHidden = true
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        collectionView?.addSubview(backgroundPicture)
        setupBackgroundPic()
        
        collectionView?.addSubview(containerInfo)
        setupContainerInfo()
        
        sutupSelector()
        
        collectionView?.contentInset = UIEdgeInsets.init(top: fromTopToCV, left: 0, bottom: 0, right: 0)
        //        collectionView?.scrollIndicatorInsets = UIEdgeInsets.init(top: fromTopToCV, left: 0, bottom: 0, right: 0)
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(openLeftMenu))
        rightSwipeGesture.direction = .right
        collectionView?.addGestureRecognizer(rightSwipeGesture)
    }
    
    let segmentBar: SegmentController = {
        let sb = SegmentController()
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()
    
    func sutupSelector() {
        containerInfo.addSubview(segmentBar)
        
        segmentBar.leftAnchor.constraint(equalTo: containerInfo.leftAnchor).isActive = true
        segmentBar.bottomAnchor.constraint(equalTo: containerInfo.bottomAnchor).isActive = true
        segmentBar.rightAnchor.constraint(equalTo: containerInfo.rightAnchor).isActive = true
        segmentBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    let menuLauncher = MenuLauncher()
    
    func openLeftMenu() {
        menuLauncher.showMenu()
    }
    
    func setupContainerInfo() {
        containerInfo.translatesAutoresizingMaskIntoConstraints = false
        containerInfo.backgroundColor = UIColor.white
        
        containerInfo.addSubview(profileImageShadow)
        
        containerInfo.addSubview(profileImage)
        setupProfileImage()
        
        containerInfo.addSubview(profileName)
        setupProfileName()
        
        containerInfo.addSubview(lastPlace)
        setupLastPlace()
        
        containerInfo.addSubview(friendLabel)
        setupFriendLabel()
        
        containerInfo.addSubview(photoLabel)
        setupPhotoLabel()
        
        containerInfo.addSubview(placeLabel)
        setupPlaceLabel()
        
        containerInfo.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerInfoTopAnchor = containerInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: containerInfoHeight)
        containerInfoTopAnchor?.isActive = true
        containerInfo.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        containerInfoHeightAnchor = containerInfo.heightAnchor.constraint(equalToConstant: containerInfoHeight)
        containerInfoHeightAnchor?.isActive = true
    }
    
    func setupPlaceLabel() {
        placeLabel.text = "777\nМеста"
        placeLabel.font = UIFont.boldSystemFont(ofSize: 14)
        placeLabel.textAlignment = .center
        placeLabel.numberOfLines = 2
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        //        placeLabel.backgroundColor = UIColor.red
        
        placeLabel.bottomAnchor.constraint(equalTo: containerInfo.bottomAnchor, constant: -44).isActive = true
        placeLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        placeLabel.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        placeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupPhotoLabel() {
        photoLabel.text = "888\nФотографии"
        photoLabel.font = UIFont.boldSystemFont(ofSize: 14)
        photoLabel.textAlignment = .center
        photoLabel.numberOfLines = 2
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        //        photoLabel.backgroundColor = UIColor.red
        
        photoLabel.bottomAnchor.constraint(equalTo: containerInfo.bottomAnchor, constant: -44).isActive = true
        photoLabel.leftAnchor.constraint(equalTo: friendLabel.rightAnchor).isActive = true
        photoLabel.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        photoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupFriendLabel() {
        friendLabel.text = "999\nДрузья"
        friendLabel.font = UIFont.boldSystemFont(ofSize: 14)
        friendLabel.textAlignment = .center
        friendLabel.numberOfLines = 2
        friendLabel.translatesAutoresizingMaskIntoConstraints = false
        //        friendLabel.backgroundColor = UIColor.red
        
        friendLabel.bottomAnchor.constraint(equalTo: containerInfo.bottomAnchor, constant: -44).isActive = true
        friendLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        friendLabel.widthAnchor.constraint(equalToConstant: view.frame.width/3).isActive = true
        friendLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupLastPlace() {
        let attributedText = NSMutableAttributedString()
        let attachment = NSTextAttachment()
        let image = UIImage(named: "location")
        attachment.image = image?.resizeImage(image: image!, newWidth: 15)
        attributedText.append(NSAttributedString(attachment: attachment))
        attributedText.append(NSAttributedString(string: "Последний раз в ", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.black]))
        attributedText.append(NSAttributedString(string: "BIONICA NIGHT CLUB", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 13), NSForegroundColorAttributeName: UIColor.red]))
        
        lastPlace.attributedText = attributedText
        lastPlace.translatesAutoresizingMaskIntoConstraints = false
        lastPlace.font = UIFont.boldSystemFont(ofSize: 12)
        lastPlace.textAlignment = .center
        
        lastPlace.leftAnchor.constraint(equalTo: containerInfo.leftAnchor).isActive = true
        lastPlace.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: -15).isActive = true
        lastPlace.rightAnchor.constraint(equalTo: containerInfo.rightAnchor).isActive = true
        lastPlace.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func setupProfileName() {
        profileName.text = "Yevhenii Veretennikov"
        profileName.textAlignment = .center
        profileName.backgroundColor = UIColor.clear
        profileName.font = UIFont(name: "Savoye LET", size: 40)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        
        profileName.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor).isActive = true
        profileName.centerYAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: containerInfoHeight * 0.2).isActive = true
        profileName.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        profileName.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
    }
    
    func setupProfileImage() {
        
        let imageSize: CGFloat = view.frame.width/3
        profileImageShadow.createCircleImageShadow(imageSize: imageSize)
        profileImage.createCircleImage(imageSize: imageSize)
        
        profileImageShadow.centerXAnchor.constraint(equalTo: containerInfo.centerXAnchor).isActive = true
        profileImageShadow.centerYAnchor.constraint(equalTo: containerInfo.topAnchor, constant: -30).isActive = true
        profileImageShadow.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        profileImageShadow.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        
        profileImage.centerXAnchor.constraint(equalTo: containerInfo.centerXAnchor).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: containerInfo.topAnchor, constant: -30).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
    }
    
    func setupBackgroundPic() {
        backgroundPicture.makeBlurImage(named: "ph1")
        backgroundPicture.translatesAutoresizingMaskIntoConstraints = false
        backgroundPicture.clipsToBounds = true
        backgroundPicture.contentMode = .scaleAspectFill
        
        backgroundPicture.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundPicture.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundPicture.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        backgroundPictureHeightAnchor = backgroundPicture.heightAnchor.constraint(equalToConstant: self.backgroundPictureHeight)
        backgroundPictureHeightAnchor?.isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 53
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: self.view.frame.width, height: 400)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let topPart = backgroundPictureHeight + containerInfoHeight
        let offset  = scrollView.contentOffset.y + topPart
        
        if offset < 0 {
            
            let heightBgPicture = -(offset) + backgroundPictureHeight
            let containerTop = -(offset) + backgroundPictureHeight
            //            let scrollInset = -(offset) + backgroundPictureHeight + containerInfoHeight
            //            collectionView?.scrollIndicatorInsets = UIEdgeInsets.init(top: scrollInset, left: 0, bottom: 0, right: 0)
            
            backgroundPicture.isHidden = false
            backgroundPictureHeightAnchor?.isActive = false
            containerInfoTopAnchor?.isActive = false
            
            backgroundPictureHeightAnchor = backgroundPicture.heightAnchor.constraint(equalToConstant: heightBgPicture)
            containerInfoTopAnchor = containerInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: containerTop)
            
            backgroundPictureHeightAnchor?.isActive = true
            containerInfoTopAnchor?.isActive = true
            
        } else if offset > 0 && offset < backgroundPictureHeight {
            
            let heightBgPicture = -(offset) + backgroundPictureHeight
            let containerTop = -(offset) + backgroundPictureHeight
            //            let scrollInset = -(offset) + backgroundPictureHeight + containerInfoHeight
            //            collectionView?.scrollIndicatorInsets = UIEdgeInsets.init(top: scrollInset, left: 0, bottom: 0, right: 0)
            
            backgroundPicture.isHidden = false
            backgroundPictureHeightAnchor?.isActive = false
            containerInfoTopAnchor?.isActive = false
            
            backgroundPictureHeightAnchor = backgroundPicture.heightAnchor.constraint(equalToConstant: heightBgPicture)
            containerInfoTopAnchor = containerInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: containerTop)
            
            backgroundPictureHeightAnchor?.isActive = true
            containerInfoTopAnchor?.isActive = true
            
        } else if offset > backgroundPictureHeight && offset < topPart {
            let containerTop = -(offset) + backgroundPictureHeight
            //            let scrollInset = -(offset) + backgroundPictureHeight + containerInfoHeight
            //            collectionView?.scrollIndicatorInsets = UIEdgeInsets.init(top: scrollInset, left: 0, bottom: 0, right: 0)
            
            containerInfo.isHidden = false
            backgroundPicture.isHidden = true
            containerInfoTopAnchor?.isActive = false
            
            containerInfoTopAnchor = containerInfo.topAnchor.constraint(equalTo: view.topAnchor, constant: containerTop)
            
            containerInfoTopAnchor?.isActive = true
            
        } else if offset > topPart {
            
            containerInfo.isHidden = true
            //            collectionView?.scrollIndicatorInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
            
        }
    }
}



















