//
//  SwiftUIView.swift
//  
//
//  Created by Indra Mahesa on 18/05/23.
//

import SwiftUI

public struct DinotisCountryPickerSheet: View {
    
    private let countries = Country.getAll()
    @Binding private var isSheetOpen: Bool
    @Binding private var selectedCountry: Country
    
    public init(
        isSheetOpen: Binding<Bool>,
        selectedCountry: Binding<Country>
    ) {
        self._isSheetOpen = isSheetOpen
        self._selectedCountry = selectedCountry
    }
    
    public var body: some View {
        VStack {
            HStack {
                Text("Pilih Negara")
                    .font(.robotoBold(size: 14))
                    .foregroundColor(Color(hex: "#413F48"))
                
                Spacer()
                
                Button(action: {
                    isSheetOpen = false
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(hex: "#413F48"))
                }
            }
            
            DinotisPrimaryTextField("Cari negara", text: .constant(""), prefix: {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color(hex: "#3A3A3A"))
            })
            
            HStack {
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("Reset Default")
                        .font(.robotoBold(size: 12))
                        .foregroundColor(Color.primaryPurple)
                        .underline()
                }
            }
            .padding(.bottom, 13)
            
            ScrollView {
                ForEach(countries) { country in
                    Button(action: {
                        selectedCountry = country
                        isSheetOpen = false
                    }) {
                        HStack {
                            Text(country.name)
                                .font(.robotoLight(size: 14))
                                .foregroundColor(Color(hex: "#52575C"))
                            Spacer()
                            Text(country.code)
                                .font(.robotoBold(size: 14))
                                .foregroundColor(Color(hex: "#52575C"))
                        }
                    }
                    .padding(.bottom, 24)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 25)
    }
}

struct DinotisCountriesSheet_Previews: PreviewProvider {
    static var previews: some View {
        DinotisCountryPickerSheet(isSheetOpen: .constant(true), selectedCountry: .constant(Country.getAll()[0]))
    }
}
