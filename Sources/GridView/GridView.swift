//
//  GridView.swift
//  UISwift
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

// swiftlint:disable file_types_order
#if canImport(UIKit)
import UIKit
public typealias GridView = UICollectionView
#elseif os(OSX)
import AppKit
public typealias GridView = NSCollectionView
#else
#error("Unsupported platform")
#endif

import Observe

public protocol UISwiftGridView: UISwiftView {
	//
}

extension GridView: UISwiftGridView {
	public enum Layout {
		case vertical
		case horizontal
	}
}

#if canImport(UIKit)
public extension GridView {
	@inlinable
	static func instance(_ layout: Layout) -> Self {
		func instance<T: GridView>() -> T {
			let flowLayout = UICollectionViewFlowLayout()
			flowLayout.scrollDirection = layout == .vertical
			? .vertical
			: .horizontal
			flowLayout.minimumInteritemSpacing = 5
			flowLayout.minimumLineSpacing = 1
			flowLayout.itemSize = CGSize(width: 50, height: 50)

			let instance: T = T(
				frame: .zero,
				collectionViewLayout: flowLayout
			)
			instance.translatesAutoresizingMaskIntoConstraints = false
			instance.clipsToBounds = true
			instance.backgroundColor = .clear
			return instance
		}

		return instance()
	}
}
#endif

#if canImport(AppKit)
public extension GridView {
	@inlinable
	static func instance(_ layout: Layout) -> Self {
		func instance<T: GridView>() -> T {
			let flowLayout = NSCollectionViewFlowLayout()
			flowLayout.scrollDirection = layout == .vertical
			? .vertical
			: .horizontal
			flowLayout.minimumInteritemSpacing = 5
			flowLayout.minimumLineSpacing = 1
			flowLayout.itemSize = NSSize(width: 50, height: 50)

			let instance: T = T(frame: .zero)
			instance.collectionViewLayout = flowLayout
			instance.translatesAutoresizingMaskIntoConstraints = false
			instance.wantsLayer = true
			instance.layer?.backgroundColor = NSColor.clear.cgColor
			return instance
		}

		return instance()
	}
}
#endif
// swiftlint:enable file_types_order
