//
//  CinemaCell.swift
//  Trex
//
//  Created by Tima on 28.09.2018.
//  Copyright © 2018 Timofey Gritkevich. All rights reserved.
//

import UIKit

class CinemaCell: BaseCell {
    
    var premiere: Premiere? {
        didSet {
            
            if let name = premiere?.coverImageName {
                Manager.getCover(coverURL: name, completion: { (image) in
                    self.coverImageName.image = image
                })
            }
            premiereNameRus.text = premiere?.nameRus
            premiereNameEng.text = premiere?.nameEng
            premiereTextView.text = premiere?.premiere
            premiereContentView.text = premiere?.content
        }
    }
    
    let coverImageName: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    let separatorView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let premiereNameRus: UITextView = {
        
        let textView = UITextView()
        textView.text = "text"
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "HelveticaNeue", size: 20)
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0)
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        
        return textView
    }()
    
    let premiereNameEng: UITextView = {
        
        let textView = UITextView()
        textView.text = "text"
        textView.textColor = .darkGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "HelveticaNeue", size: 15)
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0)
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        
        return textView
    }()
    
    let premiereTextView: UITextView = {
        
        let textView = UITextView()
        textView.text = "text"
        textView.textColor = .black
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont(name: "HelveticaNeue", size: 15)
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0)
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        
        return textView
    }()
    
    let premiereContentView: UITextView = {
        
        let textView = UITextView()
        textView.text = "text"
        textView.textColor = .darkGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.font = UIFont(name: "HelveticaNeue", size: 12)
        textView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0)
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        
        return textView
    }()
    
    override func setupViews() {
        
        addSubview(coverImageName)
        addSubview(separatorView)
        addSubview(premiereNameRus)
        addSubview(premiereNameEng)
        addSubview(premiereTextView)
        addSubview(premiereContentView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(90)]-8-[v1]-8-|", views: coverImageName, premiereNameRus)
        addConstraintsWithFormat(format: "V:|-8-[v0(120)]", views: coverImageName)
        addConstraintsWithFormat(format: "V:|-8-[v0]-0-[v1]-4-[v2]-4-[v3]", views: premiereNameRus, premiereNameEng, premiereTextView, premiereContentView)
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: separatorView)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: separatorView)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-[v1]-8-|", views: coverImageName, premiereNameEng)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-[v1]-8-|", views: coverImageName, premiereTextView)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-[v1]-8-|", views: coverImageName, premiereContentView)
    }
}
