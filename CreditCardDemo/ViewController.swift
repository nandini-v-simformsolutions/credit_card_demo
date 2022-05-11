//
//  ViewController.swift
//  CreditCardDemo
//
//  Created by Nandini Vithlani on 12/04/22.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var mainView: BaseView!
    @IBOutlet weak var cardView: BaseView!
    @IBOutlet weak var lblCardHolder: UILabel!
    @IBOutlet weak var tfCardHolder: BaseTextField!
    @IBOutlet weak var tfCardNumber: BaseTextField!
    @IBOutlet weak var tfCVV: BaseTextField!
    @IBOutlet weak var tfExpiredDate: BaseTextField!
    @IBOutlet weak var lblCardNumber: UILabel!
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        [tfCardNumber, tfCardHolder].forEach {
            $0?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    //MARK: - Setup
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

//MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case tfCardNumber:
            tfExpiredDate.becomeFirstResponder()
        case tfExpiredDate:
            tfCVV.becomeFirstResponder()
        case tfCVV:
            tfCardHolder.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
}
