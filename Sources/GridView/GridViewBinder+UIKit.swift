//
//  GridViewBinder+UIKit.swift
//  UISwift
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

import Collections
import Foundation
import Observe

// swiftlint:disable weak_delegate unused_parameter
#if canImport(UIKit)
import UIKit

internal typealias GridDataSource = UICollectionViewDataSource
internal typealias GridDelegate = UICollectionViewDelegate

@MainActor
public final class GridViewBinder<T,
								  Grid: ObservableGrid<T>,
								  View: GridView,
								  ItemView: GridItemView> {
	// MARK: + Internal scope

	final class DataSource: NSObject,
							GridDataSource {
		var observerRefs: [Grid.LinearIndex: ObservableValue<T?>.ObserverRef] = [:]

		weak var grid: Grid?
		weak var gridView: View?
		var onUpdate: UpdateHandler?

		func numberOfSections(in collectionView: GridView) -> Int {
			grid?.dimensions[0] ?? 0
		}

		func collectionView(
			_ collectionView: GridView,
			numberOfItemsInSection section: Int
		) -> Int {
			grid?.dimensions[1] ?? 0
		}

		func collectionView(
			_ collectionView: GridView,
			cellForItemAt indexPath: IndexPath
		) -> GridItemView {
			guard
				let grid,
				let cell = collectionView.dequeueReusableCell(
					withReuseIdentifier: "gridView.cellReuseIdentifier",
					for: indexPath
				) as? ItemView
			else {
				fatalError("Cell or gridView configuration is invalid.")
			}

			let row: Int = indexPath.section
			let column: Int = indexPath.item
			let linearIndex: Grid.LinearIndex = grid.linearIndex(row, column)

			if let observerRef = observerRefs[linearIndex] {
				grid[row, column]?.removeObserver(observerRef)
			}

			let observerRef: ObservableValue<T?>.ObserverRef? = grid
				.observe(row, column) { value in
					DispatchQueue.main.async { [weak self] in
						self?.onUpdate?(
							[row, column],
							value,
							cell
						)
					}
				}

			observerRefs[linearIndex] = observerRef

			return cell
		}

		deinit {
			guard let grid else {
				return
			}

			for (linearIndex, observerRef) in observerRefs {
				let gridIndex: Grid.GridIndex = grid.linearToGridIndex(
					linearIndex
				)
				grid[gridIndex[0], gridIndex[1]]?
					.removeObserver(observerRef)
			}
		}
	}

	final class Delegate: NSObject,
						  GridDelegate {
		weak var grid: Grid?
		weak var gridView: View?
		var onSelect: SelectHandler?

		func collectionView(
			_ collectionView: GridView,
			didSelectItemAt indexPath: IndexPath
		) {
			guard
				let grid,
				let cell = collectionView.cellForItem(at: indexPath) as? ItemView
			else {
				return
			}

			let row: Int = indexPath.section
			let column: Int = indexPath.item

			if let item = grid[row, column] {
				onSelect?([row, column], item, cell)
			}
		}

		deinit {
			//
		}
	}

	weak var grid: Grid?
	weak var gridView: View?

	let dataSource: DataSource = .init()
	let delegate: Delegate = .init()

	deinit {
		//
	}

	// MARK: + Public scope

	public typealias UpdateHandler = (Grid.GridIndex, T?, ItemView) -> Void
	public typealias SelectHandler = (Grid.GridIndex, T?, ItemView) -> Void

	public init(
		grid: Grid,
		gridView: View,
		onUpdate: @escaping UpdateHandler
	) {
		self.grid = grid
		self.gridView = gridView

		dataSource.grid = grid
		dataSource.gridView = gridView
		dataSource.onUpdate = onUpdate
		gridView.register(
			ItemView.self,
			forCellWithReuseIdentifier: "gridView.cellReuseIdentifier"
		)

		delegate.grid = grid
		delegate.gridView = gridView

		gridView.dataSource = dataSource
		gridView.delegate = delegate
	}

	public func onSelect(_ handler: SelectHandler?) {
		delegate.onSelect = handler
	}
}
#endif
// swiftlint:enable weak_delegate unused_parameter
