//
//  UISwift.swift
//  UISwift
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

#if canImport(UIKit)
import UIKit
public typealias Unit = CGFloat
public typealias ViewController = UIViewController
public typealias ViewElement = UIView
public typealias ViewColor = UIColor
public typealias LayoutConstraint = NSLayoutConstraint
public typealias LayoutPriority = UILayoutPriority
public typealias HorizontalAnchor = NSLayoutXAxisAnchor
public typealias VerticalAnchor = NSLayoutYAxisAnchor
public typealias LayoutAnchor = NSLayoutAnchor
public typealias LayoutDimension = NSLayoutDimension
#elseif os(OSX)
import AppKit
public typealias Unit = CGFloat
public typealias ViewController = NSViewController
public typealias ViewElement = NSView
public typealias ViewColor = NSColor
public typealias LayoutConstraint = NSLayoutConstraint
public typealias LayoutPriority = NSLayoutConstraint.Priority
public typealias HorizontalAnchor = NSLayoutXAxisAnchor
public typealias VerticalAnchor = NSLayoutYAxisAnchor
public typealias LayoutAnchor = NSLayoutAnchor
public typealias LayoutDimension = NSLayoutDimension
#else
#error("Unsupported platform")
#endif

// swiftlint:disable discouraged_optional_collection
public protocol UISwiftView {
	@inlinable
	var bgColor: ViewColor? { get set }

	@inlinable
	var leadAnchor: HorizontalAnchor { get }

	@inlinable
	var trailAnchor: HorizontalAnchor { get }

	@inlinable
	var headAnchor: VerticalAnchor { get }

	@inlinable
	var footAnchor: VerticalAnchor { get }

	@inlinable
	var horizontalCenterAnchor: HorizontalAnchor { get }

	@inlinable
	var verticalCenterAnchor: VerticalAnchor { get }

	@inlinable
	func add(_ subview: ViewElement?)

	@inlinable
	func add(_ subviews: [ViewElement?]?)

	@discardableResult
	@inlinable
	func embed(
		_ subview: ViewElement?,
		_ constraint: ViewElement.Constraint
	) -> ViewElement.EdgeConstraints?

	@discardableResult
	@inlinable
	func embed(
		_ subview: ViewElement?,
		_ edgeVectors: [ViewElement.EdgeVector]
	) -> ViewElement.EdgeConstraints?

	@discardableResult
	@inlinable
	func embed(
		_ subviews: [ViewElement?]?,
		_ chainVector: ViewElement.ChainVector,
		_ padding: ViewElement.Constraint
	) -> [ViewElement.EdgeConstraints?]?

	@discardableResult
	@inlinable
	func center(
		_ view: ViewElement?,
		_ axisVector: ViewElement.AxisVector
	) -> LayoutConstraint?

	@discardableResult
	@inlinable
	func center(
		_ view: ViewElement?,
		_ axisVectors: [ViewElement.AxisVector]
	) -> ViewElement.AxisConstraints?

	@discardableResult
	@inlinable
	func center(
		_ view: ViewElement?,
		_ axes: [ViewElement.Axis],
		_ constraint: ViewElement.Constraint
	) -> ViewElement.AxisConstraints?

	@discardableResult
	@inlinable
	func center(
		_ view: ViewElement?,
		_ axis: ViewElement.Axis,
		_ constraint: ViewElement.Constraint
	) -> LayoutConstraint?

	@discardableResult
	@inlinable
	func center(
		_ views: [ViewElement?]?,
		_ axis: ViewElement.Axis,
		_ constraint: ViewElement.Constraint
	) -> [LayoutConstraint?]?

	@discardableResult
	@inlinable
	func chain(
		_ view: ViewElement?,
		_ chainVector: ViewElement.ChainVector
	) -> LayoutConstraint?

	@discardableResult
	static func chain(
		_ views: [ViewElement?]?,
		_ chainVector: ViewElement.ChainVector
	) -> [LayoutConstraint?]?

	@discardableResult
	@inlinable
	func align(
		_ subview: ViewElement?,
		_ edgeVector: ViewElement.EdgeVector
	) -> LayoutConstraint?

	@discardableResult
	@inlinable
	func align(
		_ subview: ViewElement?,
		_ edgeVectors: [ViewElement.EdgeVector]
	) -> ViewElement.EdgeConstraints?

	@discardableResult
	@inlinable
	func align(
		_ subview: ViewElement?,
		_ edges: [ViewElement.Edge],
		_ constraint: ViewElement.Constraint
	) -> ViewElement.EdgeConstraints?

	@discardableResult
	@inlinable
	func matchSize(
		_ view: ViewElement?,
		_ sizeVector: ViewElement.SizeVector
	) -> LayoutConstraint?

	@discardableResult
	@inlinable
	func matchSize(
		_ view: ViewElement?,
		_ sizeVectors: [ViewElement.SizeVector]
	) -> ViewElement.SizeConstraints?

	@discardableResult
	@inlinable
	func matchSize(
		_ view: ViewElement?,
		_ sizes: [ViewElement.Size],
		_ constraint: ViewElement.Constraint
	) -> ViewElement.SizeConstraints?

	@discardableResult
	@inlinable
	func matchSize(
		_ view: ViewElement?,
		_ constraint: ViewElement.Constraint
	) -> ViewElement.SizeConstraints?

	@discardableResult
	@inlinable
	func fixSize(_ sizeVector: ViewElement.SizeVector) -> LayoutConstraint?

	@discardableResult
	@inlinable
	func fixSize(_ sizeVectors: [ViewElement.SizeVector]) -> ViewElement.SizeConstraints?

	@discardableResult
	@inlinable
	func fixSize(
		_ axes: [ViewElement.Size],
		_ constraint: ViewElement.Constraint
	) -> ViewElement.SizeConstraints?

	@discardableResult
	@inlinable
	func height(_ sizeConstraint: ViewElement.Constraint) -> LayoutConstraint?

	@discardableResult
	@inlinable
	func height(_ sizeConstraints: [ViewElement.Constraint]) -> [LayoutConstraint?]?

	@discardableResult
	@inlinable
	func width(_ sizeConstraint: ViewElement.Constraint) -> LayoutConstraint?

	@discardableResult
	@inlinable
	func width(_ sizeConstraints: [ViewElement.Constraint]) -> [LayoutConstraint?]?
}

public extension ViewColor {
	static func random() -> Self {
		.init(
			red: CGFloat.random(in: 0...1),
			green: CGFloat.random(in: 0...1),
			blue: CGFloat.random(in: 0...1),
			alpha: 1.0
		)
	}
}
// swiftlint:enable discouraged_optional_collection
