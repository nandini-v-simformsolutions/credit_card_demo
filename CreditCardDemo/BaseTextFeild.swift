//
//  BaseTextFeild.swift
//  CreditCardDemo
//
//  Created by Nandini Vithlani on 12/04/22.
//

import Foundation
import UIKit
import Combine

open class BaseTextField: UITextField {
    
    var floatingLabel: UILabel = UILabel(frame: CGRect.zero) // Label
    var floatingLabelHeight: CGFloat = 10 // Default height
    
    @IBInspectable
    var placeholderText: String? // we cannot override 'placeholder'
    
    @IBInspectable
    var floatingLabelColor: UIColor = UIColor.black {
        didSet {
            self.floatingLabel.textColor = floatingLabelColor
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.black
    
    @IBInspectable
    var floatingLabelFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            self.floatingLabel.font = self.floatingLabelFont
            self.font = self.floatingLabelFont
            self.setNeedsDisplay()
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.placeholderText = (self.placeholderText != nil) ? self.placeholderText : placeholder
        placeholder = self.placeholderText
        self.floatingLabel = UILabel(frame: CGRect.zero)
        self.addTarget(self, action: #selector(self.addFloatingLabel), for: .editingDidBegin)
        self.addTarget(self, action: #selector(self.removeFloatingLabel), for: .editingDidEnd)
    }
    
    @objc func addFloatingLabel() {
        if self.text == "" {
            self.floatingLabel.textColor = floatingLabelColor
            self.floatingLabel.font = floatingLabelFont
            self.floatingLabel.text = self.placeholderText
            self.floatingLabel.layer.backgroundColor = UIColor.white.cgColor
            self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
            self.floatingLabel.clipsToBounds = true
            self.floatingLabel.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.floatingLabelHeight)
            self.layer.borderColor = self.borderColor.cgColor
            self.addSubview(self.floatingLabel)
            self.floatingLabel.bottomAnchor.constraint(equalTo:
                                                        self.topAnchor, constant: -10).isActive = true
            self.placeholder = ""
        }
        self.setNeedsDisplay()
    }
    
    @objc func removeFloatingLabel() {
        if self.text == "" {
            UIView.animate(withDuration: 0.13) {
                self.floatingLabel.removeFromSuperview()
                self.setNeedsDisplay()
            }
            self.placeholder = self.placeholderText
        }
        self.layer.borderColor = self.borderColor.cgColor
    }
    
}
