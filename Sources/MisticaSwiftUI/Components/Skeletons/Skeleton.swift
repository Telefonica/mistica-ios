//
//  Skeleton.swift
//
//  Made with ❤️ by Novum
//
//  Copyright © Telefonica. All rights reserved.
//

import SwiftUI

public enum SkeletonType {
    case line(width: CGFloat)
    case text(numberOfLines: Int = 3)
    case circle(size: CGSize)
    case row
    case rectangle(width: CGFloat, height: CGFloat, isRounded: Bool)
}

public struct Skeleton: View {
    enum Constants {
        static let lineHeight = 8.0
        static let radius = MisticaConfig.currentCornerRadius.container
        static let spacing = 16.0
        static let circleSize = 40.0
    }

    let type: SkeletonType

    public init(type: SkeletonType) {
        self.type = type
    }

    public var body: some View {
        switch type {
        case .line(let width):
            return AnyView(
                skeletonRectangle(width: width)
            )

        case .text(let numberOfLines):
            return AnyView(
                VStack(alignment: .leading, spacing: Constants.spacing) {
                    ForEach(0 ..< numberOfLines, id: \.self) { index in
                        GeometryReader { geometry in
                            if index == numberOfLines - 1 {
                                skeletonRectangle(width: geometry.size.width * 0.8)
                            } else {
                                skeletonRectangle()
                            }
                        }
                    }
                }
            )

        case .circle(let size):
            return AnyView(
                skeletonCircle(size: size)
            )

        case .row:
            return AnyView(
                HStack(alignment: .center, spacing: Constants.spacing) {
                    skeletonCircle(size: .init(width: Constants.circleSize, height: Constants.circleSize))
                    skeletonRectangle()
                }
            )

        case .rectangle(let width, let height, let isRounded):
            return AnyView(
                skeletonRectangle(width: width, height: height, isRounded: isRounded)
            )
        }
    }

    private func skeletonRectangle(width: CGFloat? = nil,
                                   height: CGFloat = Constants.lineHeight,
                                   isRounded: Bool = true) -> some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(.backgroundSkeleton)
            .cornerRadius(isRounded ? Constants.radius : .zero)
            .modifier(PulseAnimation())
    }

    private func skeletonCircle(size: CGSize) -> some View {
        Circle()
            .frame(width: size.width, height: size.height)
            .foregroundColor(.backgroundSkeleton)
            .modifier(PulseAnimation())
    }
}

// MARK: Helpers

struct PulseAnimation: ViewModifier {
    @State private var isAnimating = false

    func body(content: Content) -> some View {
        content
            .opacity(isAnimating ? 1 : 0.5)
            .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: isAnimating)
            .onAppear {
                DispatchQueue.main.async {
                    isAnimating = true
                }
            }
    }
}

// MARK: Previews

#if DEBUG
    struct Skeleton_Previews: PreviewProvider {
        static var previews: some View {
            VStack {
                styledPreviews()
                    .expandHorizontally()
            }
        }

        private static func styledPreviews() -> some View {
            VStack(alignment: .leading, spacing: 40) {
                Skeleton(type: .line(width: 360))
                Skeleton(type: .text())
                Skeleton(type: .circle(size: .init(width: 40, height: 40)))
                Skeleton(type: .row)
                Skeleton(type: .rectangle(width: 360, height: 180, isRounded: true))
            }.padding()
        }
    }
#endif
