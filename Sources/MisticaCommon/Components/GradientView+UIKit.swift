//
//  GradientView+UIKit.swift
//
//
//  Created by Alejandro Ruiz on 22/4/24.
//

import SwiftUI

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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
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

extension UIHostingController {
    convenience public init(rootView: Content, ignoreSafeArea: Bool) {
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
        }
        else {
            guard let viewClassNameUtf8 = (viewSubclassName as NSString).utf8String else { return }
            guard let viewSubclass = objc_allocateClassPair(viewClass, viewClassNameUtf8, 0) else { return }
            
            if let method = class_getInstanceMethod(UIView.self, #selector(getter: UIView.safeAreaInsets)) {
                let safeAreaInsets: @convention(block) (AnyObject) -> UIEdgeInsets = { _ in
                    return .zero
                }
                class_addMethod(viewSubclass, #selector(getter: UIView.safeAreaInsets), imp_implementationWithBlock(safeAreaInsets), method_getTypeEncoding(method))
            }
            
            objc_registerClassPair(viewSubclass)
            object_setClass(view, viewSubclass)
        }
    }
}
