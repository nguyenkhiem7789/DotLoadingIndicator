//
//  DotLoadingView.swift
//  DotLoadingIndicator
//
//  Created by Nguyen on 5/7/20.
//

import UIKit

@IBDesignable
class DotLoadingView: UIView {

    private var animGroup = CAAnimationGroup()

    private var radius: CGFloat = 10.0

    private var offset: CGFloat = 10.0    

    private var dots: [Dot] = []

    private var text: String = "Loading..."

    private var number: Int = 3

    @IBInspectable
    public var circleRadius: CGFloat = 0.0 {
        didSet {
            self.radius = circleRadius
        }
    }

    @IBInspectable
    public var circleOffset: CGFloat = 0.0 {
        didSet {
            self.offset = circleOffset
        }
    }

    @IBInspectable
    public var textMessage: String = "" {
        didSet {
            self.text = textMessage
        }
    }

    @IBInspectable
    public var numberDot: Int = 0 {
        didSet {
            self.number = numberDot
            self.removeDots()
            self.initDotView()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initDotView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initDotView()
    }

    private func initDotView() {
        self.initText()
        for _ in 0 ..< number {
            var dot = Dot()
            let layer = CAShapeLayer()
            layer.frame = CGRect(origin: .zero, size: CGSize(width: radius * 2.0, height: radius * 2.0))
            let centerPoint = CGPoint(x: 0, y: 0)
            let circlePath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: CGFloat(-(0.5 * Double.pi)), endAngle: CGFloat(1.5 * Double.pi), clockwise: true)
            layer.anchorPoint = centerPoint
            layer.contentsGravity = "center"
            layer.path = circlePath.cgPath
            layer.fillColor = UIColor.red.cgColor
            dot.layer = layer
            dots.append(dot)
            self.layer.addSublayer(layer)
        }
    }

    private func removeDots() {
        for(_, dot) in dots.enumerated() {
            dot.layer?.removeFromSuperlayer()
        }
        dots.removeAll()
    }

    private func initText() {
        let centerY = self.frame.size.height / 2
        let textLayer = CATextLayer()
        textLayer.frame = CGRect(x: 0, y: centerY + radius + 16, width: self.frame.size.width, height: 20)
        textLayer.rasterizationScale = UIScreen.main.scale
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.fontSize = 14
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.alignmentMode = "center"
        textLayer.string = text
        self.layer.addSublayer(textLayer)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let centerX = self.frame.size.width / 2
        let centerY = self.frame.size.height / 2
        let distance = 2 * radius + offset        
        let firstDotX = centerX - CGFloat((CGFloat(number) - 1)/2) * distance
        for(index, dot) in dots.enumerated() {
            dot.layer?.position = CGPoint(x: firstDotX + CGFloat(index) * distance, y: centerY)
            dot.addAnim(index: index)
        }
    }

    func startAnim() {
        for(index, dot) in dots.enumerated() {            
            dot.addAnim(index: index)
        }
    }

}
