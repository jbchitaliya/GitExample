//
//  ViewController.swift
//  JsonEX
//
//  Created by Rahul on 3/23/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //let url = URL(string:"https://api.nytimes.com/svc/movies/v2/reviews/search.json?api-key=28fed6d7f29348f984a91bbbfe14eada")
    
    let url = URL(string: "http://services.groupkt.com/country/get/all")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadList()
    {
        let task = URLSession.shared.dataTask(with: url!)
        {
            (data, response, error)in
            
            if error != nil
            {
                print("Error")
            }
            else
            {
                do
                {
                    if let content = data
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: .mutableContainers)
                        //print(myJson)
                        if let jsonData = myJson as? [String:Any]
                        {
                            if let restData = jsonData["RestResponse"] as? [String:Any]
                            {
                                //print(myResult)
                                if let myResult = restData["result"] as? [[String : Any]]
                                {
                                
                                    for value in myResult
                                    {
                                        if let title = value["name"] as? String
                                        {
                                            print(title)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                catch{
                    print("Errorrrr....")
                }
            }
        }
        task.resume()
    }
    
}

