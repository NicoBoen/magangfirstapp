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
        
        
        //Ini yang coding bagian NSNotificationCenter
        /*NotificationCenter.default.addObserver(self, selector: #selector(retrieveNotif), name: SAVE_NOTIFICATION, object: nil)*/

    }
    

    
    
    //ini kita memakai protocol
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "helloSegue"{
            let vc: ViewController = segue.destination as! ViewController
            vc.delegate = self
        }
        
    }
    
    
    
    
    
    
   
    //Ini yang coding bagian NSNotificationCenter
    /* func retrieveNotif(_ notif: Notification){
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
        
    }*/


}

extension FirstViewController: DataSentDelegate{
    func banteng(data: String, datasatu: String, datadua: String, datatiga: String) {
        judulbukuLabel.text = data
        kodesatuLabel.text = datasatu
        kodeduaLabel.text = datadua
        kodetigaLabel.text = datatiga
    }
}

