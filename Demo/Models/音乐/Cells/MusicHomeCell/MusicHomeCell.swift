//
//  MusicHomeCell.swift
//  Demo
//
//  Created by wangyongyue on 2019/11/16.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import VueSwift
class MusicHomeCell: UITableViewCell {
    

    lazy private var headerLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .left
        return a
    }()
   
    lazy private var subLabel:UILabel = {
        let a = UILabel()
        a.textAlignment = .right
        a.textColor = UIColor.lightGray
        a.text = "更多"
        a.font = UIFont.boldSystemFont(ofSize: 12)
        return a
    }()
    
   
    
    lazy private var tap:UITapGestureRecognizer = {
        let a = UITapGestureRecognizer()
        return a
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.headerLabel)
        self.contentView.addSubview(self.subLabel)

        
        self.headerLabel.snp.makeConstraints { (make) in
            
            make.left.equalTo(12)
            make.centerY.equalTo(self.contentView)
            
        }
        
        self.subLabel.snp.makeConstraints { (make) in
            
            make.right.equalTo(-12)
            make.centerY.equalTo(self.contentView)
        }
       
        self.contentView.addGestureRecognizer(tap)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func setV_Model(_ aModel: VueData) {
        if aModel is MusicHomeCellModel{
            
            let m = aModel as! MusicHomeCellModel
            headerLabel.text = m.name
            tap.v_tap {
                m.v_identifier = 0
                m.v_to()
            }
        }
    }
}
class MusicHomeCellModel:VueData{
    
    var name:String?
    convenience init(_ a:String){
        self.init()
        name = a
    }
    
    override func v_height() -> CGFloat {
        
        return 50
    }
}
