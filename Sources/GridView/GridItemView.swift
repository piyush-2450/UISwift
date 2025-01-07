//
//  GridView.swift
//  UISwift
//
//  Created by Piyush Banerjee on 06-Mar-2022.
//  Copyright © 2022 Piyush Banerjee. All rights reserved.
//

// swiftlint:disable file_types_order one_declaration_per_file modifier_order
#if canImport(UIKit)
import UIKit
public typealias GridItemView = UICollectionViewCell
#elseif os(OSX)
import AppKit
public typealias GridItemView = NSCollectionViewItem
#else
#error("Unsupported platform")
#endif

import Observe

public protocol UISwiftGridItemView: UISwiftView {
	//
}

extension GridItemView: UISwiftGridItemView {
	//
}

open class BaseGridItemView: GridItemView {
	// MARK: - Internal scope

	deinit {
		//
	}

	// MARK: - Public scope

#if canImport(UIKit)
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	public override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
#endif

#if canImport(AppKit)
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	public override init(
		nibName nibNameOrNil: NSNib.Name?,
		bundle nibBundleOrNil: Bundle?
	) {
		super.init(
			nibName: nibNameOrNil,
			bundle: nibBundleOrNil
		)
		setup()
	}
#endif

	open func setup() {
		//
	}
}
// swiftlint:enable file_types_order one_declaration_per_file modifier_order
