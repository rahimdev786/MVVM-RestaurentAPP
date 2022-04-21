//
//  Extensions.swift
//  MVVM-RestaurentAPP
//
//  Created by arshad on 4/21/22.
//

import Foundation
import UIKit

extension UIViewController{
    //MARK: - Encode Data
    func EncodeData<T:Encodable>(_ value:T) -> Data{
        var jsonData = Data()
        let encode = JSONEncoder()
        encode.outputFormatting = .prettyPrinted
        
        do {
            jsonData  =  try encode.encode(value)
        } catch  {
            
        }
        
        return jsonData
    }

    //MARK: - Alert
 func showAlert(title:String?,message: String?,style:UIAlertController.Style,childAction:[UIAlertAction]){
        let alertController = UIAlertController(title: title, message: message, preferredStyle:style)
         for i in childAction{
             alertController.addAction(i)
         }
         self.present(alertController, animated: true, completion: nil)
     }
}

//MARK: -  UILabel
extension UILabel{

    func addImageLeft(image:UIImage,text:String){
        let addimg = NSTextAttachment(image: image)
        let attachString  = NSAttributedString(attachment: addimg)
        let stringAddeds = NSMutableAttributedString()
        stringAddeds.append(attachString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1
    
        //first added into image
        let stringAdded = NSMutableAttributedString(string: text, attributes: [.baselineOffset: -3])
        stringAddeds.append(stringAdded)
        //then added text to label
        self.attributedText = stringAddeds
    
        
    }
    func addImageRight(image:UIImage,text:String){
        let addimg = NSTextAttachment(image: image)
        addimg.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
        let attachString  = NSAttributedString(attachment: addimg)
        
       // here image are attach after Text
        let stringAdded = NSMutableAttributedString(string: text, attributes: [:])
        stringAdded.append(attachString)
        //then added text to label
        self.attributedText = stringAdded
    }
}

extension UITextField {

    func useUnderline() {

        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}


extension UIView{
    
     func dropShadow() {
         self.layer.shadowColor = UIColor.black.cgColor
         self.layer.masksToBounds = false
         self.layer.shadowOffset = CGSize.zero
         self.layer.shadowRadius = 3
         self.layer.shadowOpacity = 0.2
     }
     func addBottomShadow() {
         self.layer.shadowColor = UIColor.black.cgColor
         self.layer.masksToBounds = false
         self.layer.shadowOffset = CGSize.zero
         self.layer.shadowRadius = 3
         self.layer.shadowOpacity = 0.2
         self.layer.shadowPath = UIBezierPath(rect: CGRect(x: 0, y: self.bounds.maxY - self.layer.shadowRadius, width: self.bounds.width, height: self.layer.shadowRadius)).cgPath
     }
    
    func addBottomShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1) {
        self.layer.shadowColor = color.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowPath = UIBezierPath(rect: CGRect(x: 0, y: self.bounds.maxY - self.layer.shadowRadius, width: self.bounds.width, height: self.layer.shadowRadius)).cgPath
    }
    func addInnerShadow() {
           let innerShadow = CALayer()
           innerShadow.frame = bounds
           // Shadow path (1pt ring around bounds)
           let path = UIBezierPath(rect: innerShadow.bounds.insetBy(dx: -1, dy: -1))
           let cutout = UIBezierPath(rect: innerShadow.bounds).reversing()
           path.append(cutout)
           innerShadow.shadowPath = path.cgPath
           innerShadow.masksToBounds = true
           // Shadow properties
           innerShadow.shadowColor = UIColor(white: 0, alpha: 1).cgColor // UIColor(red: 0.71, green: 0.77, blue: 0.81, alpha: 1.0).cgColor
           innerShadow.shadowOffset = CGSize.zero
           innerShadow.shadowOpacity = 1
           innerShadow.shadowRadius = 3
           innerShadow.name = "innerShadowLayer"
           // Add
           if let idx = layer.sublayers?.firstIndex(where: {$0.name == "innerShadowLayer"}){
           layer.sublayers?.remove(at: idx)}
           layer.addSublayer(innerShadow)
       }
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1) {
        self.layer.shadowColor = color.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowOffset = offSet
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
    }
}


