//
//  GradientView+UIKit.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

/**
 GradientView is intended to serve as a gradient view for both SwiftUI and UIKit. The reason is that the UIKit gradient through CAGradient differs from the SwiftUI rendering through LinearGradient, less progressive and therefore less similar to the one we want to achieve, which is a gradient similar to the web one. For these reasons it's considered more optimal for the results to use only the SwiftUI rendering for both. Therefore it is necessary to use a UIViewController that contains the UIHostController with the SwiftUI GradientView and use it from UIKit.
 
 Another important reason to use the SwiftUI view is that it allows us to update colors between UserInterfaces (light and dark) without the need to reload the views manually.
 */

public class GradientSwiftUIViewController: UIViewController {
    var colors: [UIColor]
    var stops: [CGFloat]
    var angle: CGFloat
    var ignoreSafeArea: Bool

    public init(colors: [UIColor], stops: [CGFloat], angle: CGFloat, ignoreSafeArea: Bool) {
        self.colors = colors
        self.stops = stops
        self.angle = angle
        self.ignoreSafeArea = ignoreSafeArea
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        let gradientView = GradientView(colors: colors, stops: stops, angle: angle)
        let hostingController = UIHostingController(rootView: gradientView, ignoreSafeArea: ignoreSafeArea)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view
                .centerXAnchor
                .constraint(equalTo: view.centerXAnchor),
            hostingController.view
                .centerYAnchor
                .constraint(equalTo: view.centerYAnchor),
            hostingController.view
                .topAnchor
                .constraint(equalTo: view.topAnchor),
            hostingController.view
                .bottomAnchor
                .constraint(equalTo: view.bottomAnchor),
            hostingController.view
                .leadingAnchor
                .constraint(equalTo: view.leadingAnchor),
            hostingController.view
                .trailingAnchor
                .constraint(equalTo: view.trailingAnchor)
        ])
    }
}


/**
 Why is this necessary? Unfortunately there is not any way to handle with the safe areas when adding GradientView in a UKit full screen view. If we don't indicate to avoid the safe areas we are left with a blank space on the edges. It cannot be put by default since for cases like the UIStackView cases or the own cells of List we would break the UI if we also ignore the safe areas there.
*/
extension UIHostingController {
    public convenience init(rootView: Content, ignoreSafeArea: Bool) {
        self.init(rootView: rootView)

        if ignoreSafeArea {
            disableSafeArea()
        }
    }

    func disableSafeArea() {
        guard let viewClass = object_getClass(view) else { return }

        let viewSubclassName = String(cString: class_getName(viewClass)).appending("_IgnoreSafeArea")
        if let viewSubclass = NSClassFromString(viewSubclassName) {
            object_setClass(view, viewSubclass)
        } else {
            guard let viewClassNameUtf8 = (viewSubclassName as NSString).utf8String else { return }
            guard let viewSubclass = objc_allocateClassPair(viewClass, viewClassNameUtf8, 0) else { return }

            if let method = class_getInstanceMethod(UIView.self, #selector(getter: UIView.safeAreaInsets)) {
                let safeAreaInsets: @convention(block) (AnyObject) -> UIEdgeInsets = { _ in
                    .zero
                }
                class_addMethod(viewSubclass, #selector(getter: UIView.safeAreaInsets), imp_implementationWithBlock(safeAreaInsets), method_getTypeEncoding(method))
            }

            objc_registerClassPair(viewSubclass)
            object_setClass(view, viewSubclass)
        }
    }
}
