//
//  ViewController.swift
//  Simple URL Session call to update a TableView from the Swapi.co api
//
//  Created by Laurie Gray on 02/08/2017.

import UIKit

class ViewController: UITableViewController {
    
    // Tweak this URL for lots of different fun results
    let url: String = "https://swapi.co/api/people/1/"
    // Declare an array upfront - it could hold anthying: Int, String, Arrays or Dictionaries
    var filmArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // You need to register a cell class to work with custom cells
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Don't forget to notify the tableView we'll provide the data and delegate method implementations
        tableView.delegate = self
        tableView.dataSource = self
        // Get 'dat DATA!
        loadAPIData(fromURL: url)
    }
    
    // We'll take a String for convenience
    func loadAPIData(fromURL url:String) {
        
        // Cast the String to a URL
        guard let URL = URL(string: url) else {
            print("Sort your URL String")
            return
        }
        
        // 3 things - Request, Config, Session
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let request = URLRequest(url: URL)
        
        //Perform the data task and connect to the web
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            // This can fail so we need to use a do-catch block
            do {
                if let data = data {
                    // Cast the result as ["x":Int, "y":[String], "z":[String:Int]]
                    let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                    // Itterate and append to the array
                    if let films = json!["films"] as? [String] {
                        for film in films {
                            self.filmArray.append(film)
                        }
                    }
                    
                }
                // Upload the tableView with new data as by this point it thinks it has loaded all of the data
                // Do it asynchronously
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        // URLSession Tasks are initialised in a paused state by default, so let us begin...
        dataTask.resume()
    }
    
}


// MARK: TableView delegate method implementation
extension ViewController {
    // How many sections will there be?
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // How many rows in each section?
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filmArray.count
    }
    // Get the cell ready, prepped and dislaying
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = filmArray[indexPath.row]
        
        return cell
    }
}
