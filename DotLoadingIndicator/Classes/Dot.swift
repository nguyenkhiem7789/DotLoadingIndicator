//
//  Dot.swift
//  DotLoadingIndicator
//
//  Created by Nguyen on 5/7/20.
//

import Foundation

struct Dot {

    private var animDuration: TimeInterval = 0.7

    private let timeDelay: Double = 0.4

    var layer: CAShapeLayer?

    func addAnim(index: Int) {
        self.layer?.add(scaleAnim(beginTime: Double(index) * timeDelay), forKey: "scale")
    }

    ///scale  animation
    func scaleAnim(beginTime: CFTimeInterval) -> CABasicAnimation {
        let scaleAnim = CABasicAnimation(keyPath: "transform.scale.xy")
        scaleAnim.fromValue = 1.0
        scaleAnim.toValue = 0.1
        scaleAnim.repeatCount = .infinity
        scaleAnim.autoreverses = true
        scaleAnim.duration = animDuration
        scaleAnim.beginTime = beginTime
        return scaleAnim
    }

}
