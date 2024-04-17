//
//  GradientViewController.swift
//  MisticaCatalog
//
//  Created by Alejandro Ruiz on 11/3/24.
//

import UIKit
import Mistica

class GradientViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let colors: [UIColor] = [MisticaConfig.currentColors.backgroundSkeletonInverse,
                                 MisticaConfig.currentColors.backgroundSkeletonInverse,
                                 MisticaConfig.currentColors.borderHigh]
        let stops: [NSNumber] = [0, 0.3, 1]
        let angle: CGFloat = 180
        
        view.applyLinearGradient(colors: colors, locations: stops, angle: angle)
    }
}

