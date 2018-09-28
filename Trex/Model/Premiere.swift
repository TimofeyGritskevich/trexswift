//
//  Premiere.swift
//  Trex
//
//  Created by Tima on 28.09.2018.
//  Copyright © 2018 Timofey Gritkevich. All rights reserved.
//

import UIKit
import SwiftyJSON

class Premiere: NSObject {
    
    var coverImageName: String?
    var nameRus: String?
    var nameEng: String?
    var premiere: String?
    var content: String?
    
    init(json: JSON) {
        self.content = json["description"].stringValue
        self.nameRus = json["name"].stringValue
        self.nameEng = json["name_eng"].stringValue
        self.premiere = String("премьера: \(json["premiere"].stringValue)")
        self.coverImageName = json["image"].stringValue
    }   
}
