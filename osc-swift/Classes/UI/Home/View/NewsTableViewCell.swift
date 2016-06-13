//
//  NewsTableViewCell.swift
//  osc-swift
//
//  Created by zhaoyuan on 16/6/2.
//  Copyright © 2016年 赵远. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var commentCount: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var content: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setCellContnet(model: NewsModel) {
        
        self.title?.text = model.title!
        self.commentCount?.text = model.commentCount!
        self.time?.text = model.pubDate!
        self.author?.text = model.author!
        self.content?.text = model.body!
        
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
