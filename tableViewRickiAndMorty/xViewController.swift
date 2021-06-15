//
//  ViewController.swift
//  tableViewRickiAndMorty
//
//  Created by Turkan Kirill on 17.03.2021.
//

import UIKit
import Alamofire
import Kingfisher




class xViewController: UIViewController {
    
    @IBOutlet weak var table: UITableView!
    //private var structsApi = [Results]
    
    private var name = [Results]()
    var episodes: [String: String] = [:]
    var info: Info?

    
    
    
    
    
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
        let url = "https://rickandmortyapi.com/api/character/?page=1"
        fetchData(by: url)
        
        
        
        
        
        
        //}
        //print(namei.count)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let showVC = segue.destination as? SecondViewController else { return }
        guard let indexPath = table.indexPathForSelectedRow else { return }
        showVC.global = name[indexPath.row]
        showVC.name1 = name.filter{$0.origin.name == name[indexPath.row].origin.name }
        
        showVC.episodes1 = episodes

    }
    
    func fetchData(by url: String) {
        
        AF.request(url).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error received requestiong data: \(error.localizedDescription)")
                return
            }
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                
                let object = try decoder.decode(ApiStruct.self, from: data)
                self.name.append(contentsOf: object.results)
                self.info = object.info
                self.table.reloadData()
                self.fetchDataEpisode()
                
            } catch let jsonError {
                print("Daild to decode JSON", jsonError)
            }
        }
    }
    
    func fetchDataEpisode() {
        for item in name {
            guard let url = item.episode.first else {return}
            AF.request(url).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error received requestiong data: \(error.localizedDescription)")
                return
            }
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                
                let object = try decoder.decode(Episode.self, from: data)
                self.episodes[item.name] = object.name
                
                self.table.reloadData()
                                
                
            } catch let jsonError {
                print("Daild to decode JSON", jsonError)
            }
        }
        }
    }
    
    
        
    
}

extension xViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsfeedCell.reuseId, for: indexPath) as! NewsfeedCell
        
        let personaj = name[indexPath.row]
        cell.nameLabel.text = "\(personaj.name)"
        cell.typeLabel.text = "\(personaj.origin.name)"
        cell.episodeLabel.text = episodes[name[indexPath.row].name]
        
        
        
        cell.imgView.kf.setImage(with: URL(string: personaj.image!))
        
        if indexPath.row == name.count - 1,
             let info = info {
            fetchData(by: info.next)
          }
        
        
        
        
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goto", sender: self)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
