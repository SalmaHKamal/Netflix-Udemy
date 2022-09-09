//
//  StringExtension.swift
//  Netflix-Udemy
//
//  Created by Salma Hassan on 29/07/2022.
//

import UIKit

extension String {
	func getTextWidth(withFont font: UIFont) -> CGFloat {
		let fontAttributes = [NSAttributedString.Key.font: font]
		let size = self.size(withAttributes: fontAttributes)
		return size.width
	}
}
