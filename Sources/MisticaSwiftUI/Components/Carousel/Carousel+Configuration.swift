import Foundation
import Shared

public enum CarouselStyle: CaseIterable {
    case `default`
    case fullWidth
}

public enum CarouselAutoplay {
    case inactive
    case active(TimeInterval)
}

extension CarouselAutoplay {
    public static var defaultActive: Self {
        .active(5)
    }

    var isActive: Bool {
        switch self {
        case .active(let t): return t > 0
        case .inactive: return false
        }
    }

    var interval: TimeInterval {
        switch self {
        case .active(let t): return t
        case .inactive: return 0
        }
    }
}

public enum CarouselScrollStyle: CaseIterable {
    case free
    case paginated
}

public enum CarouselControlStyle: CaseIterable {
    case disabled
    case bullets
}

public enum CarouselScrollDirection: CaseIterable {
    case forward
    case none
    case backward
}
