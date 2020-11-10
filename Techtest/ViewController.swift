//
//  ViewController.swift
//  Techtest
//
//  Created by Ankita on 10/11/20.
//  Copyright © 2020 Ankita. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    public var fields = [RowField]()
    var navTitleString:String?
    let rowsTableView = UITableView()
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        gettingdata()
        setUp()
        // Do any additional setup after loading the view.
    }
    // Runtime Set up Table view
    func setUp() {
            view.backgroundColor = .white
        
        view.addSubview(rowsTableView)
        
        rowsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        rowsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        rowsTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        rowsTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        rowsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        rowsTableView.dataSource = self
        rowsTableView.delegate = self
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return fields.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
       //     let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell

    //      cell.textLabel?.text = contacts[indexPath.row].name
            //cell.contact = contacts[indexPath.row]

            return cell
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
    // MARK: - getting parsing data and load into arry
    func gettingdata()
    {
        let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, err) in
            
            if let d = data {
                if let value = String(data: d, encoding: String.Encoding.ascii) {
                    
                    if let jsonData = value.data(using: String.Encoding.utf8) {
                        do {
                            let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: Any]
                            DispatchQueue.main.async {
                            if let title = json["title"] as? String
                            {
                                self.title = title
                            }
                            if let arr = json["rows"] as? [[String: Any]] {
                                debugPrint(arr)
                                self.fields = RowFieldConfiguration().getallFieldlinkedUp(rows: arr)
                                print(self.fields)
                            }
                            }
                            
                        } catch {
                            NSLog("ERROR \(error.localizedDescription)")
                        }
                    }
                }
                
            }
        }.resume()
    }
    
    
}

