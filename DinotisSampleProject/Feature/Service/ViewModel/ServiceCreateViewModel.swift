//
//  ServiceCreateViewModel.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 11/08/23.
//

import SwiftUI
import DinotisData
import DinotisDesignSystem

final class ServiceCreateViewModel: ObservableObject {
    @Published var message = ""
    @Published var date: Date = .now
}
