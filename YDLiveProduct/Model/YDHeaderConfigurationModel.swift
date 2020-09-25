//
//  YDHeaderConfigurationModel.swift
//  YDLiveProduct
//
//  Created by Douglas Hennrich on 31/08/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit

public class YDHeaderConfigurationModel {

	let width: CGFloat?
	let height: CGFloat
	let title: String

	public init(
		withWidth width: CGFloat? = nil,
		withHeight height: CGFloat = 60,
		withTitle title: String
	) {
		self.width = width
		self.height = height
		self.title = title
	}

}
