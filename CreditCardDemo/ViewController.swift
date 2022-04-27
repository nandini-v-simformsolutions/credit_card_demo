//
//  ViewController.swift
//  CreditCardDemo
//
//  Created by Nandini Vithlani on 12/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var tfCardNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup(){
        mainView.backgroundColor = .clear
        mainView.roundCorners(15)
        cardView.addViewShadow()
        tfCardNumber.layer.borderColor = UIColor.black.cgColor
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
