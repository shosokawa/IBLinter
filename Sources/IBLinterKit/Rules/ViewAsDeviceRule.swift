//
//  ViewAsDeviceRule.swift
//  IBLinterKit
//
//  Created by Shinichi Hosokawa on 2019/03/25.
//

import IBDecodable

fileprivate protocol ViewAsDeviceRule {
    static var deviceIdToFit: DeviceId {get}
}

fileprivate enum DeviceId: String {
    case retina3_5
    case retina4_0
    case retina4_7
    case retina5_5
    case retina5_9
    case retina6_1
    case retina6_5
    case unknown
    init(deviceId: String) {
        self = DeviceId(rawValue: deviceId) ?? .unknown
    }
    static func ==(lhs: DeviceId, rhs: DeviceId) -> Bool {
        switch (lhs, rhs) {
        case (.unknown, _): return false
        case (_, .unknown): return false
        case (let lhs, let rhs): return lhs.rawValue == rhs.rawValue
        }
    }
    var deviceName: String {
        switch self {
        case .retina3_5: return "iPhone 4s"
        case .retina4_0: return "iPhone SE"
        case .retina4_7: return "iPhone 8"
        case .retina5_5: return "iPhone 8 Plus"
        case .retina5_9: return "iPhone XS"
        case .retina6_1: return "iPhone XR"
        case .retina6_5: return "iPhone XS Max"
        case .unknown: return "Unknown device"
        }
    }
}

extension Rules {
    fileprivate static func violation<T: InterfaceBuilderFile>(deviceIdToFit: DeviceId, file: T) -> [Violation] {
        guard let document = file.document as? InterfaceBuilderDocument,
            let deviceId = document.device?.id else {
            let message = "\(file.fileName) is not set View As \(deviceIdToFit.deviceName) explicitly"
            return [Violation(pathString: file.pathString, message: message, level: .warning)]
        }
        let message = "\(file.fileName) is not set View As \(deviceIdToFit.deviceName). It is set View As \(DeviceId(deviceId: deviceId).deviceName)."
        return DeviceId(deviceId: deviceId) == deviceIdToFit ? [] : [Violation(pathString: file.pathString, message: message, level: .warning)]
    }

    /** iPhone 4s: retina3_5 */
    public struct ViewAsRetina3_5Rule: ViewAsDeviceRule, Rule {
        fileprivate static var deviceIdToFit = DeviceId.retina3_5
        public static var identifier: String = "view_as_\(deviceIdToFit)"

        public init(context: Context) {}
        public func validate(storyboard: StoryboardFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: storyboard)
        }
        public func validate(xib: XibFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: xib)
        }
    }

    /** iPhone SE: retina4_0 */
    public struct ViewAsRetina4_0Rule: ViewAsDeviceRule, Rule {
        fileprivate static var deviceIdToFit = DeviceId.retina4_0
        public static var identifier: String = "view_as_\(deviceIdToFit)"

        public init(context: Context) {}
        public func validate(storyboard: StoryboardFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: storyboard)
        }
        public func validate(xib: XibFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: xib)
        }
    }

    /** iPhone 8: retina4_7 */
    public struct ViewAsRetina4_7Rule: ViewAsDeviceRule, Rule {
        fileprivate static var deviceIdToFit = DeviceId.retina4_7
        public static var identifier: String = "view_as_\(deviceIdToFit)"

        public init(context: Context) {}
        public func validate(storyboard: StoryboardFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: storyboard)
        }
        public func validate(xib: XibFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: xib)
        }
    }

    /** iPhone 8 Plus: retina5_5 */
    public struct ViewAsRetina5_5Rule: ViewAsDeviceRule, Rule {
        fileprivate static var deviceIdToFit = DeviceId.retina5_5
        public static var identifier: String = "view_as_\(deviceIdToFit)"

        public init(context: Context) {}
        public func validate(storyboard: StoryboardFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: storyboard)
        }
        public func validate(xib: XibFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: xib)
        }
    }

    /** iPhone XS: retina5_9 */
    public struct ViewAsRetina5_9Rule: ViewAsDeviceRule, Rule {
        fileprivate static var deviceIdToFit = DeviceId.retina5_9
        public static var identifier: String = "view_as_\(deviceIdToFit)"

        public init(context: Context) {}
        public func validate(storyboard: StoryboardFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: storyboard)
        }
        public func validate(xib: XibFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: xib)
        }
    }

    /** iPhone XR: retina6_1 */
    public struct ViewAsRetina6_1Rule: ViewAsDeviceRule, Rule {
        fileprivate static var deviceIdToFit = DeviceId.retina6_1
        public static var identifier: String = "view_as_\(deviceIdToFit)"

        public init(context: Context) {}
        public func validate(storyboard: StoryboardFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: storyboard)
        }
        public func validate(xib: XibFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: xib)
        }
    }

    /** iPhone XS Max: retina6_5 */
    public struct ViewAsRetina6_5Rule: ViewAsDeviceRule, Rule {
        fileprivate static var deviceIdToFit = DeviceId.retina6_5
        public static var identifier: String = "view_as_\(deviceIdToFit)"

        public init(context: Context) {}
        public func validate(storyboard: StoryboardFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: storyboard)
        }
        public func validate(xib: XibFile) -> [Violation] {
            return Rules.violation(deviceIdToFit: type(of: self).deviceIdToFit, file: xib)
        }
    }
}
