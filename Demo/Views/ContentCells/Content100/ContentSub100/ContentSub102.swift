//
//  ContentSub102.swift
//  Demo
//
//  Created by apple on 2019/12/11.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class ContentSub102: UICollectionViewCell {
    
    lazy private var headImage:UIImageView = {
        let a = UIImageView()
        a.layer.cornerRadius = 6
        a.layer.masksToBounds = true
        a.image = UIImage.init(named: "feng_1")
        return a
    }()
    
    
    lazy private var headerLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        a.text = "如果，爱"
        a.numberOfLines = 1
        a.font = UIFont.boldSystemFont(ofSize: 13)
        return a
    }()
    
   
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    override init(frame: CGRect) {
    super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        self.contentView.addSubview(self.headImage)
        
       
        self.contentView.addSubview(self.headerLabel)
        
        self.headImage.snp.makeConstraints { (make) in
            
            make.top.equalTo(12)
            make.left.equalTo(12)
            make.bottom.equalTo(-30)
            make.right.equalTo(-12)
            
        }
        self.headerLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.headImage.snp_bottomMargin).offset(12)
            make.right.equalTo(-12)
            make.left.equalTo(12)

        }
        
       
        self.contentView.addGestureRecognizer(tap)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is ContentSub102Model{
            
            let m = aModel as! ContentSub102Model
            
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class ContentSub102Model:VueData{
    
    var name:String?
    
    override func v_height() -> CGFloat {
        
        return 120
    }
}

