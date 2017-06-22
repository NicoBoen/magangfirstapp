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
    
    
    //var jdlbuku = String()
    //var kodesatu = String()
    //var kodedua = String()
    //var kodetiga = String()
    //var kodebuku = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
       /*NotificationCenter.default.addObserver(forName: SAVE_NOTIFICATION, object: nil, queue: nil){notification in
                print("notification is \(notification)")
            //notification.userInfo
            self.judulbukuLabel.isHidden = false
            self.kodekamuLabel.isHidden = false
            self.kodesatuLabel.isHidden = false
            self.kodeduaLabel.isHidden = false
            self.kodetigaLabel.isHidden = false
        }*/
        
        NotificationCenter.default.addObserver(self, selector: #selector(retrieveNotif), name: SAVE_NOTIFICATION, object: nil)
        
        /*judulbukuLabel.text = jdlbuku
        kodesatuLabel.text = kodesatu
        kodeduaLabel.text = kodedua
        kodetigaLabel.text = kodetiga
        //kodekamuLabel.text = kodebuku*/

    }
    
    /*deinit {
        NotificationCenter.default.removeObserver(self)
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retrieveNotif(_ notif: Notification){
        if (notif.userInfo?["data1"] as? String) != nil{
            //notif.userInfo?["data1"] = judulbukuLabel.text
            judulbukuLabel.text = notif.userInfo?["data1"] as! String
            self.judulbukuLabel.isHidden = false
        }
        if (notif.userInfo?["data2"] as! String != nil){
            kodesatuLabel.text = notif.userInfo?["data2"] as! String
            self.kodesatuLabel.isHidden = false
        }
        if (notif.userInfo?["data3"] as! String != nil){
            kodeduaLabel.text = notif.userInfo?["data3"] as! String
            self.kodeduaLabel.isHidden = false
        }
        if (notif.userInfo?["data4"] as! String != nil){
            kodetigaLabel.text = notif.userInfo?["data4"] as! String
            self.kodetigaLabel.isHidden = false
        }
        self.kodekamuLabel.isHidden = false
        
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
