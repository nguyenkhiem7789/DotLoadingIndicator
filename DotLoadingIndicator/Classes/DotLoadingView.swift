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

    private let timeDelay: Double = 0.4

    private var animDuration: TimeInterval = 0.7

    private var dots: [Dot] = []

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

    override init(frame: CGRect) {
        super.init(frame: frame)
        initDotView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initDotView()
    }

    private func initDotView() {
        for _ in 0 ..< 3 {
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

    override func layoutSubviews() {
        super.layoutSubviews()
        print("XCustom => layoutSubviews")
        let centerX = self.frame.size.width / 2
        let centerY = self.frame.size.height / 2
        let distance = 2 * radius + offset
        let firstDotX = centerX - distance
        for(index, dot) in dots.enumerated() {
            dot.layer?.position = CGPoint(x: firstDotX + CGFloat(index) * distance, y: centerY)
            dot.layer?.add(scaleAnim(index: index), forKey: "scale")
        }
    }

    ///scale  animation
    func scaleAnim(index: Int) -> CABasicAnimation {
        let scaleAnim = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnim.fromValue = 1.0
        scaleAnim.toValue = 0.1
        scaleAnim.repeatCount = .infinity
        scaleAnim.autoreverses = true
        scaleAnim.duration = animDuration
        scaleAnim.beginTime = Double(index) * timeDelay
        return scaleAnim
    }

}
