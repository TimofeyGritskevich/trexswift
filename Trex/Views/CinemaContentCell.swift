//
//  CinemaContentCell.swift
//  Trex
//
//  Created by Tima on 28.09.2018.
//  Copyright © 2018 Timofey Gritkevich. All rights reserved.
//

import UIKit

class CinemaContentCell: BaseCell {
    
    var premiere: Premiere? {
        didSet {
            
            if let rus = premiere?.nameRus, let eng = premiere?.nameEng {
                premiereName.text = "\(rus) (\(eng))"
            }
            premiereTextView.text = premiere?.premiere
            premiereContentView.text = premiere?.content
        }
    }
    
    let premiereName: UITextView = {
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
        textView.font = UIFont(name: "HelveticaNeue", size: 12)
        textView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0)
        textView.isEditable = false
        
        return textView
    }()
    
    override func setupViews() {
        
        addSubview(premiereName)
        addSubview(premiereTextView)
        addSubview(premiereContentView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: premiereName)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: premiereTextView)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: premiereContentView)
        
        addConstraintsWithFormat(format: "V:|-4-[v0]-0-[v1]-4-[v2]-8-|", views: premiereName, premiereTextView, premiereContentView)
    }
}

