//
//  SecondViewController.swift
//  tableViewRickiAndMorty
//
//  Created by Turkan Kirill on 18.03.2021.
//

import UIKit
import SwiftUI


class SecondViewController: UIViewController {

    var global: Results?
    var name1 = [Results]()
    
    @IBOutlet weak var tableSecond: UITableView!
    
    @IBOutlet weak var imageViewS: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var seenLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var alsoFrom: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        nameLabel.text = global?.name
        locationLabel.text = global?.origin.name
        seenLabel.text = global?.status
        statusLabel.text = global?.status
        
        alsoFrom.text = "Also From '\(global?.origin.name ?? "")'"
        imageViewS.kf.setImage(with: URL(string: (global?.image!)!))
        imageViewS.layer.cornerRadius = 10
        tableSecond.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: NewsfeedCell.reuseId)
        tableSecond.rowHeight = 140
        tableSecond.separatorStyle = .none
        
    }
    
    
    
    
    
    

}
extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsfeedCell.reuseId, for: indexPath) as! NewsfeedCell
        
        let personaj1 = name1[indexPath.row]
        cell.nameLabel.text = "\(personaj1.name)"
        cell.typeLabel.text = "\(personaj1.origin.name)"
        cell.episodeLabel.text = "\(personaj1.episode)"
        cell.imgView.kf.setImage(with: URL(string: personaj1.image!))
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
   

    
   
}
