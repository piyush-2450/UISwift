//
//  UISwift+ViewController.swift
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
extension ViewController: @preconcurrency UISwiftView {
	@inlinable
	public var bgColor: ViewColor? {
		get {
			view.bgColor
		}
		set {
			view.bgColor = newValue
		}
	}

	@inlinable
	public var leadAnchor: HorizontalAnchor {
		view.leadAnchor
	}

	@inlinable
	public var trailAnchor: HorizontalAnchor {
		view.trailAnchor
	}

	@inlinable
	public var headAnchor: VerticalAnchor {
		view.headAnchor
	}

	@inlinable
	public var footAnchor: VerticalAnchor {
		view.footAnchor
	}

	@inlinable
	public var horizontalCenterAnchor: HorizontalAnchor {
		view.horizontalCenterAnchor
	}

	@inlinable
	public var verticalCenterAnchor: VerticalAnchor {
		view.verticalCenterAnchor
	}

	@inlinable
	public func add(_ subview: ViewElement?) {
		view.add(subview)
	}

	@inlinable
	public func add(_ subviews: [ViewElement?]?) {
		view.add(subviews)
	}

	@discardableResult
	@inlinable
	public func embed(
		_ subview: ViewElement?,
		_ constraint: ViewElement.Constraint = .equal
	) -> ViewElement.EdgeConstraints? {
		view.embed(
			subview,
			constraint
		)
	}

	@discardableResult
	@inlinable
	public func embed(
		_ subview: ViewElement?,
		_ edgeVectors: [ViewElement.EdgeVector]
	) -> ViewElement.EdgeConstraints? {
		view.embed(
			subview,
			edgeVectors
		)
	}

	@discardableResult
	@inlinable
	public func embed(
		_ subviews: [ViewElement?]?,
		_ chainVector: ViewElement.ChainVector,
		_ padding: ViewElement.Constraint = .equal
	) -> [ViewElement.EdgeConstraints?]? {
		view.embed(
			subviews,
			chainVector,
			padding
		)
	}

	@discardableResult
	@inlinable
	public func center(
		_ view: ViewElement?,
		_ axisVector: ViewElement.AxisVector
	) -> LayoutConstraint? {
		self.view.center(
			view,
			axisVector
		)
	}

	@discardableResult
	@inlinable
	public func center(
		_ view: ViewElement?,
		_ axisVectors: [ViewElement.AxisVector]
	) -> ViewElement.AxisConstraints? {
		self.view.center(
			view,
			axisVectors
		)
	}

	@discardableResult
	@inlinable
	public func center(
		_ view: ViewElement?,
		_ axes: [ViewElement.Axis] = .all,
		_ constraint: ViewElement.Constraint = .equal
	) -> ViewElement.AxisConstraints? {
		self.view.center(
			view,
			axes,
			constraint
		)
	}

	@discardableResult
	@inlinable
	public func center(
		_ view: ViewElement?,
		_ axis: ViewElement.Axis,
		_ constraint: ViewElement.Constraint = .equal
	) -> LayoutConstraint? {
		self.view.center(
			view,
			axis,
			constraint
		)
	}

	@discardableResult
	@inlinable
	public func center(
		_ views: [ViewElement?]?,
		_ axis: ViewElement.Axis,
		_ constraint: ViewElement.Constraint = .equal
	) -> [LayoutConstraint?]? {
		view.center(
			views,
			axis,
			constraint
		)
	}

	@discardableResult
	@inlinable
	public func chain(
		_ view: ViewElement?,
		_ chainVector: ViewElement.ChainVector
	) -> LayoutConstraint? {
		self.view.chain(
			view,
			chainVector
		)
	}

	@inlinable
	public static func chain(
		_ views: [ViewElement?]?,
		_ chainVector: ViewElement.ChainVector
	) -> [LayoutConstraint?]? {
		ViewElement.chain(
			views,
			chainVector
		)
	}

	@discardableResult
	@inlinable
	public func align(
		_ subview: ViewElement?,
		_ edgeVector: ViewElement.EdgeVector
	) -> LayoutConstraint? {
		view.align(
			subview,
			edgeVector
		)
	}

	@discardableResult
	@inlinable
	public func align(
		_ subview: ViewElement?,
		_ edgeVectors: [ViewElement.EdgeVector]
	) -> ViewElement.EdgeConstraints? {
		view.align(
			subview,
			edgeVectors
		)
	}

	@discardableResult
	@inlinable
	public func align(
		_ subview: ViewElement?,
		_ edges: [ViewElement.Edge] = .all,
		_ constraint: ViewElement.Constraint = .equal
	) -> ViewElement.EdgeConstraints? {
		view.align(
			subview,
			edges,
			constraint
		)
	}

	@discardableResult
	@inlinable
	public func matchSize(
		_ view: ViewElement?,
		_ sizeVector: ViewElement.SizeVector
	) -> LayoutConstraint? {
		self.view.matchSize(
			view,
			sizeVector
		)
	}

	@discardableResult
	@inlinable
	public func matchSize(
		_ view: ViewElement?,
		_ sizeVectors: [ViewElement.SizeVector]
	) -> ViewElement.SizeConstraints? {
		self.view.matchSize(
			view,
			sizeVectors
		)
	}

	@discardableResult
	@inlinable
	public func matchSize(
		_ view: ViewElement?,
		_ sizes: [ViewElement.Size] = .all,
		_ constraint: ViewElement.Constraint = .equal
	) -> ViewElement.SizeConstraints? {
		self.view.matchSize(
			view,
			sizes,
			constraint
		)
	}

	@discardableResult
	@inlinable
	public func matchSize(
		_ view: ViewElement?,
		_ constraint: ViewElement.Constraint = .equal
	) -> ViewElement.SizeConstraints? {
		self.view.matchSize(
			view,
			constraint
		)
	}

	@discardableResult
	@inlinable
	public func fixSize(_ sizeVector: ViewElement.SizeVector) -> LayoutConstraint? {
		view.fixSize(sizeVector)
	}

	@discardableResult
	@inlinable
	public func fixSize(_ sizeVectors: [ViewElement.SizeVector]) -> ViewElement.SizeConstraints? {
		view.fixSize(sizeVectors)
	}

	@discardableResult
	@inlinable
	public func fixSize(
		_ axes: [ViewElement.Size] = .all,
		_ constraint: ViewElement.Constraint = .equal
	) -> ViewElement.SizeConstraints? {
		view.fixSize(
			axes,
			constraint
		)
	}

	@discardableResult
	@inlinable
	public func height(_ sizeConstraint: ViewElement.Constraint = .equal) -> LayoutConstraint? {
		view.height(sizeConstraint)
	}

	@discardableResult
	@inlinable
	public func height(_ sizeConstraints: [ViewElement.Constraint]) -> [LayoutConstraint?]? {
		view.height(sizeConstraints)
	}

	@discardableResult
	@inlinable
	public func width(_ sizeConstraint: ViewElement.Constraint = .equal) -> LayoutConstraint? {
		view.width(sizeConstraint)
	}

	@discardableResult
	@inlinable
	public func width(_ sizeConstraints: [ViewElement.Constraint]) -> [LayoutConstraint?]? {
		view.width(sizeConstraints)
	}
}

public extension ViewController {
	@inlinable
	static func instance() -> Self {
		func instance<T: ViewController>() -> T {
			let instance: T = T()
			instance.view.translatesAutoresizingMaskIntoConstraints = false
#if canImport(UIKit)
			instance.view.clipsToBounds = true
#endif
			instance.view.bgColor = .clear
			return instance
		}

		return instance()
	}
}

open class BaseViewController: ViewController {
	open override func viewDidLoad() {
		super.viewDidLoad()
		setupViewLayout()
		setupDataBindings()
		resetState()
	}

	open func setupViewLayout() {
		//
	}

	open func setupDataBindings() {
		//
	}

	open func resetState() {
		//
	}
}

// swiftlint:enable discouraged_optional_collection
