//
//  RequestLoginView.swift
//  VietFood
//
//  Created by Nguyen on 4/4/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

public enum LoadingViewType {
    case fullScreen
    case notFullScreen
}

public class LoadingView: UIView {

    public static let shared: LoadingView = LoadingView()

    @IBOutlet weak var backgroundView: UIView!

    @IBOutlet weak var topViewConstraint: NSLayoutConstraint!

    @IBOutlet weak var dotLoadingView: DotLoadingView!

    public var timeout: Double = 0.0

    public var heightHeaderView: CGFloat = 40.0

    public var circleRadius: CGFloat = 0.0 {
        didSet {
            self.dotLoadingView.circleRadius = circleRadius
        }
    }

    public var circleOffset: CGFloat = 0.0 {
        didSet {
            self.dotLoadingView.circleOffset = circleOffset
        }
    }

    public var textMessage: String = "" {
        didSet {            
            self.dotLoadingView.textMessage = textMessage
        }
    }

    public var numberDot: Int = 0 {
        didSet {
            self.dotLoadingView.numberDot = numberDot
        }
    }

    public var dotColor: CGColor = UIColor.darkGray.cgColor {
        didSet {
            self.dotLoadingView.dotColor = dotColor
        }
    }

    var containerView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func xibSetup() {
        // setup the view from .xib
        containerView = loadViewFromNib()
        containerView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
    }

    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LoadingView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }

    public func show(type: LoadingViewType? = nil) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        containerView.frame = window.bounds
        containerView.alpha = 0.0
        dotLoadingView.startAnim()
        if let typeLoading = type, typeLoading == .notFullScreen {
            topViewConstraint.constant = CGFloat(heightHeaderView + UIApplication.shared.statusBarFrame.height)
        } else {
            topViewConstraint.constant = CGFloat(0)
        }
        UIView.animate(withDuration: 0.25) {
            [weak self] in
            guard let self = self else { return }
            self.containerView?.alpha = 1.0
            window.addSubview((self.containerView)!)
            if self.timeout > 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + self.timeout) {
                    [unowned self] in
                    self.dimiss()
                }
            }
        }
    }

    public func dimiss() {
        alpha = 1.0
        UIView.animate(withDuration: 0.25, animations: {
            self.containerView.alpha = 0.0
        }) {
            [weak self](finished) in
            self?.containerView.removeFromSuperview()
        }
    }

}
