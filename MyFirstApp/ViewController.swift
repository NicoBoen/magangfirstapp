//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Nico Boentoro on 6/19/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit

protocol DataSentDelegate {
    func banteng(data: String, datasatu: String, datadua: String, datatiga: String)
}

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
    @IBAction func plusButton(_ sender: Any) {
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveButton(_ sender: Any) {
        
        
        //ini yang coding bagian NSNotificationCenter
        /*let dataToPass = ["data1": addbookTextfield.text, "data2": codeoneTextfield.text, "data3": codetwoTextfield.text, "data4": codethreeTextfield.text]
        NotificationCenter.default.post(name: SAVE_NOTIFICATION, object: nil, userInfo: dataToPass)*/
        
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Ini yang coding bagian NSNotificationCenter
        /*self.addbookTextfield.delegate = self
        self.codeoneTextfield.delegate = self
        self.codetwoTextfield.delegate = self
        self.codethreeTextfield.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)*/
        
        //CARA NICO
//        codeoneTextfield.addTarget(self, action: "textFieldDidChange", for: UIControlEvents.editingChanged)
//        codetwoTextfield.addTarget(self, action: "textFieldDidChange", for: UIControlEvents.editingChanged)
//        codethreeTextfield.addTarget(self, action: "textFieldDidChange", for: UIControlEvents.editingChanged)
        
       
        
    }
    //CARA NICO
//    
//    func textFieldDidChange(textField: UITextField){
//        let text = textField.text
//        
//        if text?.utf16.count == 1{
//            switch textField {
//            case codeoneTextfield:
//                codetwoTextfield.becomeFirstResponder()
//            case codetwoTextfield:
//                codethreeTextfield.becomeFirstResponder()
//            default:
//                break
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange , replacementString string: String) -> Bool {
        let newLength = (textField.text?.characters.count)! + string.characters.count - range.length
        
        
//            if range.length + range.location  > (textField.text?.characters.count)! {
//                
//                textField.tag += 2
//                return false
//            }
                //let newLength = (codeoneTextfield.text?.characters.count)! + string.characters.count - range.length
        
                
                return newLength <= 5
        
        
    }
    
    //CARA GHANI
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if textField == textField.viewWithTag(1) {
//            textField.resignFirstResponder()
//            textField.viewWithTag(2)?.becomeFirstResponder()
//        }else if textField == textField.viewWithTag(2){
//            textField.resignFirstResponder()
//            textField.viewWithTag(3)?.becomeFirstResponder()
//        }else if textField == textField.viewWithTag(3){
//            textField.resignFirstResponder()
//        }
//        return true
//    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    //let point = CGPoint(x: 0, y: 250)
        
        if UIDevice.current.orientation.isLandscape {
            if codethreeTextfield.isEditing || codeoneTextfield.isEditing || codetwoTextfield.isEditing{
                ScrollView.setContentOffset(CGPoint(x: 0, y: 90), animated: true)
            }
        }
    
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
            ScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    @IBAction func backtofront(_ sender: Any) {
            if isKeyboardShow == true{
            self.ScrollView.endEditing(true)
                    isKeyboardShow = false
            }
            //isKeyboardShow = false
            else if isKeyboardShow == false{
                self.dismiss(animated: true, completion: nil)            }
        
    }
    
    
    @IBAction func testGesture(_ sender: Any) {
            self.view.endEditing(true)
    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
//    func keyboardWillShow(){
//        isKeyboardShow = true
//        print (isKeyboardShow)
//    }

    
 
    @IBAction func codeOneChanged(_ sender: Any) {
        let codeOneCount = codeoneTextfield.text!.characters.count
        
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
                
//                let alert = UIAlertController(title: "info", message: "\nAll code already typed", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Mantab", style: .default, handler: nil))
//                present(alert, animated: true, completion: nil)
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




