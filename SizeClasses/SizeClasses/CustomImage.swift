//
//  CustomButton.swift
//  TDAUX
//
//  Created by NIRAL SHAH on 27/02/17.
//  Copyright © 2017 Envale Systems. All rights reserved.
//

import UIKit

@IBDesignable class CustomImage: UIImageView {
    
    @IBInspectable var linesWidth: CGFloat = 0.0 { didSet{ drawLines() } }
    
    @IBInspectable var linesColor: UIColor = UIColor.black { didSet{ drawLines() } }
    
    @IBInspectable var leftLine: Bool = false { didSet{ drawLines() } }
    @IBInspectable var rightLine: Bool = false { didSet{ drawLines() } }
    @IBInspectable var bottomLine: Bool = false { didSet{ drawLines() } }
    @IBInspectable var topLine: Bool = false { didSet{ drawLines() } }

    var isLine: Bool = false
    @IBInspectable var roundRect: CGFloat = 0.0 { didSet{ roundRadius() } }
    @IBInspectable var isRoundRadius: Bool = false { didSet{ roundRadius() } }

    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    func roundRadius() {
        if isRoundRadius == true
        {
            self.layer.cornerRadius = self.layer.frame.size.height/roundRect
        }
    }
    
    func drawLines() {
        
        if bottomLine {
            
            if isLine == false
            {
                isLine = true
            }
            else
            {
                add(line: CGRect.init(x: 0, y: frame.size.height - 1, width: frame.size.width, height: linesWidth))
                isLine = false
            }
        }
        
        if topLine {
            add(line: CGRect.init(x: 0, y: 0, width: frame.size.width, height: linesWidth))
        }
        
        if rightLine {
            add(line: CGRect.init(x: frame.size.width - linesWidth, y: 0, width: linesWidth, height: frame.size.height))
        }
        
        if leftLine {
            add(line: CGRect.init(x: 0, y: 0, width: linesWidth, height: frame.size.height))
        }
        
    }
    
    typealias Line = CGRect
    private func add(line: Line) {
        let border = CALayer()
        border.frame = line
        border.backgroundColor = linesColor.cgColor
        layer.addSublayer(border)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawLines()
        roundRadius()
    }
}
