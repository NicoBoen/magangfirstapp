//
//  SecondViewController.swift
//  MyFirstApp
//
//  Created by Nico Boentoro on 7/10/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var titleArr: [String] = []
    var codeoneArr: [String] = []
    var codetwoArr: [String] = []
    var codethreeArr: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //var temp = ["titleArr", "codeoneArr", "codetwoArr", "codethreeArr"]
    
    var temp: [Users] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temp.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myTable", for: indexPath)
        let name = temp[indexPath.row]
        cell.textLabel!.text = name.title! + " " + name.codeone! + " " + name.codetwo! + " " + name.codethree!
        //cell.textLabel!.text = name.codeone!
        //cell.textLabel!.text = name.codetwo!
        //cell.textLabel!.text = name.codethree!
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.fetchData()
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    func fetchData(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do{
            temp = try context.fetch(Users.fetchRequest())
        }
        catch{
            
        }

    }

   
}
