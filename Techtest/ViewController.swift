//
//  ViewController.swift
//  Techtest
//
//  Created by Ankita on 10/11/20.
//  Copyright © 2020 Ankita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    public var fields = [RowField]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        gettingdata()
        // Do any additional setup after loading the view.
    }
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

