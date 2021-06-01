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
    private var name1 = [Results]()
    
    @IBOutlet weak var imageViewS: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var seenLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
        nameLabel.text = global?.name
        locationLabel.text = global?.origin.name
        seenLabel.text = global?.status
        statusLabel.text = global?.status
        imageViewS.kf.setImage(with: URL(string: (global?.image!)!))
        imageViewS.layer.cornerRadius = 10
    }
    
    
    
    
    
    

}
extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsfeedCell.reuseId, for: indexPath) as! NewsfeedCell
        
       
        
        
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
   
}
