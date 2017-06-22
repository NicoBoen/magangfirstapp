//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Nico Boentoro on 6/19/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var codeoneTextfield: UITextField!
    @IBOutlet weak var codetwoTextfield: UITextField!
    @IBOutlet weak var codethreeTextfield: UITextField!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var addbookTextfield: UITextField!
    var isKeyboardShow = false
    var isKeyboardHide = false
    @IBAction func plusButton(_ sender: Any) {
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addbookTextfield.delegate = self
        self.codeoneTextfield.delegate = self
        self.codetwoTextfield.delegate = self
        self.codethreeTextfield.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //hide keybard when user touches outside keyboard
    /*override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }*/
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    //let point = CGPoint(x: 0, y: 250)
    
        if UIDevice.current.orientation.isLandscape {
            ScrollView.setContentOffset(CGPoint(x: 0, y: 150), animated: true)
        }
    
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
            ScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    @IBAction func backtofront(_ sender: Any) {
            //self.dismiss(animated: true, completion: nil)
        //self.view.endEditing(true)
        if isKeyboardShow == false{
            self.dismiss(animated: true, completion: nil)
            //self.view.endEditing(true)
        }else if isKeyboardHide == true{
            self.dismiss(animated: true, completion: nil)
        }else if isKeyboardShow == true{
            self.view.endEditing(true)
        }
        
    }
    
    
    @IBAction func testGesture(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)
        //self.view.endEditing(true)
        
        //if isKeyboardShow == true {
            //self.dismiss(animated: true, completion: nil)
            self.view.endEditing(true)
        //}
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillShow(){
        isKeyboardShow = true
        print (isKeyboardShow)
    }
    
    func keyboardWillHide(){
        isKeyboardHide = true
        print (isKeyboardHide)
    }
    
   /* let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backtofirst(press:)))
    
    func backtofirst(press: UITapGestureRecognizer){
        self.dismiss(animated: true, completion: nil)
    }*/
   
    


    /*func keyboardShow(){
        UIView.animate(withDuration: 0.5, delay: 0,
                       usingSpringWithDamping: 1, initialSpringVelocity: 1,
                       options: .curveEaseOut, animations:{
                        
                        let _: CGFloat = UIDevice.current.orientation.isLandscape ? -200 : -100
                        self.view.frame = CGRect(x: 0, y: -50, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
        
    }*/
    
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




