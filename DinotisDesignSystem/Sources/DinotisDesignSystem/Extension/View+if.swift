//
//  View+Default.swift
//  Lead Dinotis Week 1
//
//  Created by Indra Mahesa on 13/05/23.
//
//  Please read the drawbacks of using conditional modifiers before using this: https://www.objc.io/blog/2021/08/24/conditional-view-modifiers/

import SwiftUI

public extension View {
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> TupleView<(Self?, Content?)> {
        if conditional {
            return TupleView((nil, content(self)))
        } else {
            return TupleView((self, nil))
        }
    }
}
