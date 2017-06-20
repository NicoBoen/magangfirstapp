//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Nico Boentoro on 6/19/17.
//  Copyright © 2017 Nico Boentoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBAction func mundurButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var booktitleTextfield: UITextField!
    @IBOutlet weak var codefirstTextfield: UITextField!
    @IBOutlet weak var codesecondTextfield: UITextField!
    @IBOutlet weak var codethirdTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.booktitleTextfield.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //hide keybard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //press return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    

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




