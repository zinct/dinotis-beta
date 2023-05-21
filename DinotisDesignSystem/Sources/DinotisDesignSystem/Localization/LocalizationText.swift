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
    public static let loginTitle = NSLocalizedString(
        "login_title",
        bundle: .module,
        comment: "This string usage for login title in login view"
    )
    public static let registerTitle = NSLocalizedString(
		"register_title",
		bundle: .module,
		comment: "This string usage for register title in login view"
	)
}
