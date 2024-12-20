//
//  UISwift+AxisLayout.swift
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

// swiftlint:disable discouraged_optional_collection
public extension ViewElement {
	@discardableResult
	func center(
		_ view: ViewElement?,
		_ axisVector: AxisVector
	) -> LayoutConstraint? {
		var constraint: LayoutConstraint?

		if let view {
			switch (axisVector.axis, axisVector.constraint) {
			case (.vertical, let axisConstraint):
				constraint = verticalCenterAnchor
					.constraint(
						to: view.verticalCenterAnchor,
						axisConstraint
					)

			case (.horizontal, let axisConstraint):
				constraint = horizontalCenterAnchor
					.constraint(
						to: view.horizontalCenterAnchor,
						axisConstraint
					)
			}
		}

		return constraint
	}

	@discardableResult
	func center(
		_ view: ViewElement?,
		_ axisVectors: [AxisVector]
	) -> AxisConstraints? {
		var constraints: AxisConstraints?

		if let view,
		   axisVectors.isEmpty == false {
			constraints = AxisConstraints()

			for axisVector in axisVectors {
				let constraint: LayoutConstraint? = center(
					view,
					axisVector
				)

				switch axisVector.axis {
				case .vertical:
					constraints?.vertical = constraint

				case .horizontal:
					constraints?.horizontal = constraint
				}
			}
		}

		return constraints
	}

	@discardableResult
	func center(
		_ view: ViewElement?,
		_ axes: [Axis] = .all,
		_ constraint: Constraint = .equal
	) -> AxisConstraints? {
		var constraints: AxisConstraints?

		if let view,
		   axes.isEmpty == false {
			constraints = AxisConstraints()

			for axis in axes {
				let axisVector: AxisVector = AxisVector(
					axis,
					constraint
				)
				let constraint: LayoutConstraint? = center(
					view,
					axisVector
				)

				switch axisVector.axis {
				case .vertical:
					constraints?.vertical = constraint

				case .horizontal:
					constraints?.horizontal = constraint
				}
			}
		}

		return constraints
	}

	@discardableResult
	func center(
		_ view: ViewElement?,
		_ axis: Axis,
		_ constraint: Constraint = .equal
	) -> LayoutConstraint? {
		var axisConstraint: LayoutConstraint?

		if let view {
			let axisVector: AxisVector = AxisVector(
				axis,
				constraint
			)
			axisConstraint = center(
				view,
				axisVector
			)
		}

		return axisConstraint
	}

	@discardableResult
	func center(
		_ views: [ViewElement?]?,
		_ axis: Axis,
		_ constraint: Constraint = .equal
	) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let views,
		   views.isEmpty == false {
			constraints = []

			for view in views {
				let axisVector: AxisVector = AxisVector(
					axis,
					constraint
				)
				let axisConstraint: LayoutConstraint? = center(
					view,
					axisVector
				)
				constraints?.append(axisConstraint)
			}
		}

		return constraints
	}
}

// MARK: - Array sweetness

public extension Array where Element == ViewElement? {
	@MainActor
	@inlinable
	@discardableResult
	func center(
		_ view: ViewElement?,
		_ axisVector: ViewElement.AxisVector
	) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if let view,
		   isEmpty == false {
			constraints = []

			for element in self {
				let constraint: LayoutConstraint? = element?
					.center(
						view,
						axisVector
					)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@MainActor
	@inlinable
	@discardableResult
	func center(
		_ view: ViewElement?,
		_ axisVectors: [ViewElement.AxisVector]
	) -> [ViewElement.AxisConstraints?]? {
		var constraints: [ViewElement.AxisConstraints?]?

		if let view,
		   axisVectors.isEmpty == false {
			constraints = []

			for element in self {
				let constraint: ViewElement.AxisConstraints? = element?
					.center(
						view,
						axisVectors
					)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@MainActor
	@inlinable
	@discardableResult
	func center(
		_ view: ViewElement?,
		_ axes: [ViewElement.Axis] = .all,
		_ constraint: ViewElement.Constraint = .equal
	) -> [ViewElement.AxisConstraints?]? {
		var constraints: [ViewElement.AxisConstraints?]?

		if let view,
		   axes.isEmpty == false {
			constraints = []

			for element in self {
				let constraint: ViewElement.AxisConstraints? = element?
					.center(
						view,
						axes,
						constraint
					)
				constraints?.append(constraint)
			}
		}

		return constraints
	}

	@MainActor
	@inlinable
	@discardableResult
	func centerViews(
		_ axis: ViewElement.Axis,
		_ constraint: ViewElement.Constraint = .equal
	) -> [LayoutConstraint?]? {
		var constraints: [LayoutConstraint?]?

		if isEmpty == false,
		   let firstElement = first {
			constraints = []

			for element in self where element != first {
				let axisConstraint: LayoutConstraint? = element?
					.center(
						firstElement,
						axis,
						constraint
					)
				constraints?.append(axisConstraint)
			}
		}

		return constraints
	}
}
// swiftlint:enable discouraged_optional_collection
