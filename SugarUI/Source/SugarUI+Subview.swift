//
//  SugarUI+Subviews.swift
//  SugarUI
//
//  Created by Piyush Banerjee on 04-Mar-2020.
//  Copyright © 2020 Piyush Banerjee. All rights reserved.
//

public extension ViewElement {
	// MARK: Private scope

	private func alignBeginingEdge(_ view: ViewElement?,
								   _ chainVector: ChainVector,
								   _ padding: ViewElement.Dimension,
								   safeArea: Bool) -> (Edge, LayoutConstraint?) {
		var edge = Edge.top

		switch chainVector.direction {
		case .vertical:
			edge = .top
		case .horizontal:
			edge = .lead
		}

		return (edge, align(view,
							edgeVector: .init(edge, padding),
							safeArea: safeArea))
	}

	private func alignEndingEdge(_ view: ViewElement?,
								 _ chainVector: ChainVector,
								 _ padding: ViewElement.Dimension,
								 safeArea: Bool) -> (Edge, LayoutConstraint?) {
		var edge = Edge.bottom

		switch chainVector.direction {
		case .vertical:
			edge = .bottom
		case .horizontal:
			edge = .trail
		}

		return (edge, align(view,
							edgeVector: .init(edge, padding),
							safeArea: safeArea))
	}

	private func alignOtherEdges(_ view: ViewElement?,
								 _ chainVector: ChainVector,
								 _ padding: ViewElement.Dimension,
								 safeArea: Bool) -> EdgeConstraints? {
		var edges: [Edge] = [.lead, .trail]

		switch chainVector.direction {
		case .vertical:
			edges = [.lead, .trail]
		case .horizontal:
			edges = [.top, .bottom]
		}

		return align(view,
					 edges: edges,
					 margin: padding)
	}

	// MARK: Internal scope

	func add(_ subview: ViewElement?) {
		if let subview = subview {
			addSubview(subview)
		}
	}

	func add(_ subviews: [ViewElement?]?) {
		if let subviews = subviews {
			for subview in subviews {
				add(subview)
			}
		}
	}

	@discardableResult
	func embed(_ subview: ViewElement?) -> EdgeConstraints? {
		add(subview)
		return align(subview)
	}

	@discardableResult
	func embed(_ subviews: [ViewElement?]?,
			   _ chainVector: ChainVector,
			   _ padding: ViewElement.Dimension = .equal,
			   safeArea: Bool = false) -> [EdgeConstraints?]? {
		var constraints: [EdgeConstraints?]?

		if let subviews = subviews,
			subviews.count > 0 {
			add(subviews)

			constraints = []
			var previousView: ViewElement?
			var previousEdgeConstraints: EdgeConstraints?

			for view in subviews {
				var edgeConstraints = alignOtherEdges(view,
													  chainVector,
													  padding,
													  safeArea: safeArea)

				if view == subviews.first {
					let result = alignBeginingEdge(view,
												   chainVector,
												   padding,
												   safeArea: safeArea)
					edgeConstraints?.set(result.0, result.1)
				}

				if view == subviews.last {
					let result = alignEndingEdge(view,
												 chainVector,
												 padding,
												 safeArea: safeArea)
					edgeConstraints?.set(result.0, result.1)
				}

				if let constraint = previousView?
					.chain(view,
						   chainVector: chainVector,
						   safeArea: safeArea) {
					switch chainVector.direction {
					case .vertical:
						edgeConstraints?.top = constraint
						previousEdgeConstraints?.bottom = constraint
					case .horizontal:
						edgeConstraints?.lead = constraint
						previousEdgeConstraints?.trail = constraint
					}
				}

				constraints?.append(edgeConstraints)

				previousView = view
				previousEdgeConstraints = edgeConstraints
			}
		}

		return constraints
	}
}
