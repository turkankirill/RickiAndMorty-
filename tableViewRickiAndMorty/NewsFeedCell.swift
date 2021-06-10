//
//  NewsFeedCell.swift
//  tableViewRickiAndMorty
//
//  Created by Turkan Kirill on 17.03.2021.
//

import Foundation
import UIKit
import Alamofire

class NewsfeedCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imgView: WebImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    static let reuseId = "NewsfeedCell"
//    private func shadow(){
//        let shadow = UIImageView()
//        cardView.addSubview(shadow)
//
//    }
    override func awakeFromNib(){
        super.awakeFromNib()
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        backgroundColor = .clear
        selectionStyle = .none
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7.0
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        
        
    }

   
    
}
