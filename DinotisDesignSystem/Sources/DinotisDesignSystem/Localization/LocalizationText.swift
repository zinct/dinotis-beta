//
//  LocalizationText.swift
//  
//
//  Created by Gus Adi on 06/12/22.
//

import SwiftUI

public enum LocalizableText {
	public static let testTitle = NSLocalizedString(
		"test_title",
		bundle: .module,
		comment: "This string usage for test title"
	)
}
