//
//  UISwift+Size.swift
//  UISwift
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#elseif os(OSX)
import AppKit
#endif

public extension ViewElement {
	enum Size {
		case height
		case width

		@MainActor public static let all: [Self] = [
			.height,
			.width
		]
	}

	struct SizeVector {
		private(set) var size: Size
		private(set) var constraint: Constraint

		init(
			_ axis: Size,
			_ constraint: Constraint = .equal
		) {
			self.size = axis
			self.constraint = constraint
		}

		@inlinable
		public static var height: Self {
			height()
		}

		@inlinable
		public static var width: Self {
			width()
		}

		public static func height(_ constraint: Constraint = .equal) -> Self {
			.init(
				.height,
				constraint
			)
		}

		public static func width(_ constraint: Constraint = .equal) -> Self {
			.init(
				.width,
				constraint
			)
		}
	}

	struct SizeConstraints {
		var height: LayoutConstraint?
		var width: LayoutConstraint?

		@MainActor
		var activate: Bool = false {
			didSet {
				height?.isActive = activate
				width?.isActive = activate
			}
		}

		mutating func set(
			_ axis: Size,
			_ constraint: LayoutConstraint?
		) {
			switch axis {
			case .height:
				height = constraint

			case .width:
				width = constraint
			}
		}
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement.Size {
	@MainActor
	@inlinable
	static var all: [ViewElement.Size] {
		ViewElement.Size.all
	}
}
