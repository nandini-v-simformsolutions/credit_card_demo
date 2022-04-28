//
//  ViewController.swift
//  CreditCardDemo
//
//  Created by Nandini Vithlani on 12/04/22.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var lblCardHolder: UILabel!
    @IBOutlet weak var tfCardHolder: BaseTextField!
    @IBOutlet weak var tfCardNumber: BaseTextField!
    @IBOutlet weak var tfCVV: BaseTextField!
    @IBOutlet weak var tfExpiredDate: BaseTextField!
    @IBOutlet weak var lblCardNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        [tfCardNumber, tfCardHolder].forEach {
            $0?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    func initialSetup(){
        mainView.roundCorners(15)
        cardView.addViewShadow()
        tfCardNumber.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        switch textField {
        case tfCardHolder:
            self.lblCardHolder.text = text
        case tfCardNumber:
            self.lblCardNumber.text = text
        default:
            break
        }
    }
}

extension UIView {
    public func roundCorners(_ cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    
    public func addViewShadow() {
        DispatchQueue.main.asyncAfter(deadline: (.now() + 0.2)) {
            let shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            shadowLayer.shadowColor = UIColor.lightGray.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = CGSize(width: 2.6, height: 2.6)
            shadowLayer.shadowOpacity = 0.8
            shadowLayer.shadowRadius = 8.0
            self.layer.insertSublayer(shadowLayer, at: 0)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfCardNumber:
            tfCardHolder.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
}
