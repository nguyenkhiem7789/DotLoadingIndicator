//
//  ViewController.swift
//  DotLoadingIndicator
//
//  Created by nguyenkhiem7789@gmail.com on 05/07/2020.
//  Copyright (c) 2020 nguyenkhiem7789@gmail.com. All rights reserved.
//

import UIKit
import DotLoadingIndicator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clickShowFullScreenButton(_ sender: Any) {
        LoadingView.shared.show()
    }

    @IBAction func clickShowNotFullScreenButton(_ sender: Any) {
        LoadingView.shared.show(type: .notFullScreen)
    }


}

