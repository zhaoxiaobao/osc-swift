//
//  TweetsTableViewCell.swift
//  osc-swift
//
//  Created by zhaoyuan on 16/6/3.
//  Copyright © 2016年 赵远. All rights reserved.
//

import UIKit
import Kingfisher

class TweetsTableViewCell: UITableViewCell {
    @IBOutlet weak var portrait: UIImageView!
    
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var author: UILabel!

    override func awakeFromNib() {
        
        

        super.awakeFromNib()
        // Initialization code
    }
    
    func setCellContnet(model: Tweets) {
        
        if model.portrait != nil{
            
            self.portrait.kf_setImageWithURL(NSURL(string: model.portrait!)!,
                                             placeholderImage: nil,
                                             optionsInfo: [.ForceRefresh])
            
        }
        

        
        self.body?.text = model.body!
        self.author?.text = model.author!
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
