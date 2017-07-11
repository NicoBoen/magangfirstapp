//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Nico Boentoro on 6/19/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit
import CoreData
//import PCLBlurEffectAlert

protocol DataSentDelegate {
    func banteng(data: String, datasatu: String, datadua: String, datatiga: String)
}

//class nico: NSEntityDescription{
//    
//    let boen = NSEntityDescription.insertNewObject(forEntityName: "Users", into: NSManagedObject) as! rico
//
//}
//
//class rico: NSManagedObject{
//    
//}

class ViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: DataSentDelegate?
    var txtField: UITextField?

    
    @IBOutlet var smallGesture: UITapGestureRecognizer!
    @IBOutlet var bigGesture: UITapGestureRecognizer!
    @IBOutlet weak var codeoneTextfield: UITextField!
    @IBOutlet weak var codetwoTextfield: UITextField!
    @IBOutlet weak var codethreeTextfield: UITextField!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var addbookTextfield: UITextField!
    var isKeyboardShow = true
    var isKeyboardHide = true
    var tempHeight:Int = 0
    var tempWidth:Int = 0
    //var temporary: [String] = []
    //var names: [String] = []
    
    @IBAction func plusButton(_ sender: Any) {
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        //getSizeScreen()
        
    }

    @IBAction func saveButton(_ sender: Any) {
        
        
        //ini yang coding bagian NSNotificationCenter
        /*let dataToPass = ["data1": addbookTextfield.text, "data2": codeoneTextfield.text, "data3": codetwoTextfield.text, "data4": codethreeTextfield.text]
        NotificationCenter.default.post(name: SAVE_NOTIFICATION, object: nil, userInfo: dataToPass)*/
        
        var titleArr: [String] = []
        var codeoneArr: [String] = []
        var codetwoArr: [String] = []
        var codethreeArr: [String] = []
        
        
        
        //Storing Core Data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if addbookTextfield.text != "" || codeoneTextfield.text != "" || codetwoTextfield.text != "" || codethreeTextfield.text != "" {
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            
            newUser.setValue(addbookTextfield.text, forKey: "title")
            newUser.setValue(codeoneTextfield.text, forKey: "codeone")
            newUser.setValue(codetwoTextfield.text, forKey: "codetwo")
            newUser.setValue(codethreeTextfield.text, forKey: "codethree")
            
            //temporary = [judul, codesatu, codedua, codetiga]
            
            do{
                try context.save()
                print("SAVED")
            }
            catch{
                
            }
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(request)
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    if let title = result.value(forKey: "title") as? String{
                        titleArr.append(title)
                        //print("Book title: ", title)
                    }
                    if let codeone = result.value(forKey: "codeone") as? String{
                        codeoneArr.append(codeone)
                        //print("Code one: ", codeone)
                    }
                    if let codetwo = result.value(forKey: "codetwo") as? String{
                        codetwoArr.append(codetwo)
                        //print("Code two: ", codetwo)
                    }
                    if let codethree = result.value(forKey: "codethree") as? String{
                        codethreeArr.append(codethree)
                        //print("Code three: ", codethree)
                    }
                }
                print(titleArr)
                print(codeoneArr)
                print(codetwoArr)
                print(codethreeArr)
            }
        }
        catch{
        
        }
        
        
        
        
        
        
        //ini kita memakai protocol
        if delegate != nil{
                let data1 = addbookTextfield.text
                let data2 = codeoneTextfield.text
                let data3 = codetwoTextfield.text
                let data4 = codethreeTextfield.text
                delegate?.banteng(data: data1!, datasatu: data2!, datadua: data3!, datatiga: data4!)
                dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    
    func getSizeScreen(){
        let screen: CGRect = UIScreen.main.bounds
        let screenWidth = screen.width
        tempWidth = Int(screenWidth)
        let screenHeight = screen.height
        tempHeight = Int(screenHeight)
        
       // print("lebar: ", screenWidth)
       // print("tinggi: ", screenHeight)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ScrollView.setContentOffset(CGPoint(x: 0, y:0), animated: true)
        self.view.endEditing(true)
        self.ScrollView.contentSize.height = 0
        
        
        //Ini yang coding bagian NSNotificationCenter
        /*self.addbookTextfield.delegate = self
        self.codeoneTextfield.delegate = self
        self.codetwoTextfield.delegate = self
        self.codethreeTextfield.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)*/
        
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    //let point = CGPoint(x: 0, y: 250)
        getSizeScreen()
        
        if tempWidth == 1366 && tempHeight == 1024{
            //if UIDevice.current.orientation.isLandscape {
                if codethreeTextfield.isEditing || codeoneTextfield.isEditing || codetwoTextfield.isEditing{
                    ScrollView.setContentOffset(CGPoint(x: 0, y: 50), animated: true)
                    //self.ScrollView.contentSize.height = 0
                }else if addbookTextfield.isEditing{
                    self.ScrollView.contentSize.height = 600
                }else{
                    //self.ScrollView.contentSize.height = 600
            }
            
            //}

        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        ScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        self.ScrollView.contentSize.height = 0
    }
    @IBAction func backtofront(_ sender: Any) {
            if isKeyboardShow == true{
                ScrollView.setContentOffset(CGPoint(x: 0, y:0), animated: true)
                self.view.endEditing(true)
                self.ScrollView.contentSize.height = 0
            self.ScrollView.endEditing(true)
                    isKeyboardShow = false
            }
            //isKeyboardShow = false
            else if isKeyboardShow == false{
                self.dismiss(animated: true, completion: nil)            }
        
    }
    
    
    @IBAction func testGesture(_ sender: Any) {
        ScrollView.setContentOffset(CGPoint(x: 0, y:0), animated: true)
        self.view.endEditing(true)
        self.ScrollView.contentSize.height = 0
    }
    func textFieldShouldReturn( _ textField: UITextField) -> Bool {
        if textField == addbookTextfield{
            codeoneTextfield.becomeFirstResponder()
            //codetwoTextfield.becomeFirstResponder()
        }else if textField == codeoneTextfield{
            codetwoTextfield.becomeFirstResponder()
        }else if textField == codetwoTextfield{
            codethreeTextfield.becomeFirstResponder()
        }else{
            codethreeTextfield.resignFirstResponder()
        }
        
        return true
    }
    

    
 
    @IBAction func codeOneChanged(_ sender: Any) {
        
        let codeOneCount = codeoneTextfield.text!.characters.count
//        ScrollView.setContentOffset(CGPoint(x: 0, y:0), animated: true)
//        self.view.endEditing(true)
//        self.ScrollView.contentSize.height = 0
        if codeOneCount == 5 {
            codeoneTextfield.resignFirstResponder()
            codetwoTextfield.becomeFirstResponder()
            
        }
    }
    
    @IBAction func codeTwoChanged(_ sender: Any) {
        let codeTwoCount = codetwoTextfield.text!.characters.count
        
        if codeTwoCount == 5 {
            codetwoTextfield.resignFirstResponder()
            codethreeTextfield.becomeFirstResponder()
        }
    }
    
    
    @IBAction func codeThreeChanged(_ sender: Any) {
        let codeThreeCount = codethreeTextfield.text!.characters.count
        
        if codeThreeCount == 5 {
                codethreeTextfield.resignFirstResponder()
                
                let alert = UIAlertController(title: "Info", message: "\nYour codes are\n\(codeoneTextfield.text!) \(codetwoTextfield.text!) \(codethreeTextfield.text!)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

            //let alert = PCLBlurEffectAlert.Controller(title: "hahahaha...", message: "testing bro...", effect: UIBlurEffect(style: .dark), style: .alert)
            //let haha = alert.PCLBlurEffectAlert.AlertAction(title: "cancel", style: .cancel, handler: nil)
            //alert.addAction(haha)
            present(alert, animated: true, completion: nil)
            //alert.show()
        
        }
    }
    
}

    
    
    
    




class Draw2D: UIView{

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(2.0)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let components: [CGFloat] = [0.0, 0.0, 1.0, 1.0]
        let color = CGColor(colorSpace: colorSpace, components: components )
        context?.setStrokeColor(color!)
        context?.move(to: CGPoint(x: 50, y: 50))
        context?.addLine(to: CGPoint(x: 300, y: 50))
        context?.strokePath()
        
    }

}




