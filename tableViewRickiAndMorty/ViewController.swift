//
//  ViewController.swift
//  tableViewRickiAndMorty
//
//  Created by Turkan Kirill on 17.03.2021.
//

import UIKit
import Alamofire
import Kingfisher




class ViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    //private var structsApi = [Results]
    
    private var name = [Results]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Rick and Morty"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        table.register(UINib(nibName: "NewsFeedCell", bundle: nil), forCellReuseIdentifier: NewsfeedCell.reuseId)
        table.separatorStyle = .none
        table.backgroundColor = .clear
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        //for index in 1...34{
        
        fetchData()
        
        
        
        //}
        //print(namei.count)
        
    }
    
    func fetchData() { //for id: Int
       let url = "https://rickandmortyapi.com/api/character/?page=1"
        AF.request(url).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error received requestiong data: \(error.localizedDescription)")
                return
            }
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                
                let object = try decoder.decode(ApiStruct.self, from: data)
                self.name = object.results
                self.table.reloadData()
                
                
            } catch let jsonError {
                print("Daild to decode JSON", jsonError)
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsfeedCell.reuseId, for: indexPath) as! NewsfeedCell
        
        let personaj = name[indexPath.row]
        cell.nameLabel.text = "\(personaj.name)"
        cell.typeLabel.text = "\(personaj.origin.name)"

        cell.imgView.kf.setImage(with: URL(string: personaj.image!))
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
   
}