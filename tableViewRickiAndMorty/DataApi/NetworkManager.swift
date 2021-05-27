//
//  NetworkManager.swift
//  tableViewRickiAndMorty
//
//  Created by Turkan Kirill on 17.03.2021.
//

import Foundation
import Alamofire

struct NetworkManager{
    
    var onCompletion: ((TransformDataApi) -> Void)?
    
    func rickDates(for id: Int){
        let urlString = "https://rickandmortyapi.com/api/character/\(id)";
        
        AF.request(urlString).response { (dataResponse) in
            if let error = dataResponse.error {
                print("Error recived requestion: \(error.localizedDescription)")
                return
            }
            guard let data = dataResponse.data else { return }
            let someString = String(data: data, encoding: .utf8)
            print(someString ?? "")
        }
        
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) {data, response, error in
            if let data = data {
                
                if let currentData = self.parseJSON(withData: data) {
                    self.onCompletion?(currentData)
                }
            }
        }
        task.resume()
        }
    
    func parseJSON(withData data: Data) -> TransformDataApi?  {
        let decoder = JSONDecoder()
        
        do {
            let currentData = try decoder.decode(DataApi.self, from: data)
            
            guard let newCurrentData = TransformDataApi(dataApi: currentDatadataApi) else {
                return nil
            }
            return newCurrentData
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
    
