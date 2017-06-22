//
//  FirstViewController.swift
//  MyFirstApp
//
//  Created by Nico Boentoro on 6/19/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBAction func helloButton(_ sender: Any) {
        performSegue(withIdentifier: "helloSegue", sender: nil)
    }
    @IBOutlet weak var judulbukuLabel: UILabel!
    @IBOutlet weak var kodekamuLabel: UILabel!
    @IBOutlet weak var kodesatuLabel: UILabel!
    @IBOutlet weak var kodeduaLabel: UILabel!
    @IBOutlet weak var kodetigaLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(forName: SAVE_NOTIFICATION, object: nil, queue: nil){notification in
                print("notification is \(notification)")
            
            self.judulbukuLabel.isHidden = false
            self.kodekamuLabel.isHidden = false
            self.kodesatuLabel.isHidden = false
            self.kodeduaLabel.isHidden = false
            self.kodetigaLabel.isHidden = false
        }
    }
    
    /*deinit {
        NotificationCenter.default.removeObserver(self)
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
