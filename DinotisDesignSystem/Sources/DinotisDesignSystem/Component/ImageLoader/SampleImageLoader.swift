//
//  SwiftUIView.swift
//  
//
//  Created by Irham Naufal on 04/06/23.
//

import SwiftUI
import SDWebImageSwiftUI

public enum ImageType {
    case fixed(width: CGFloat, height: CGFloat)
    case flexible
}

public struct SwiftUIView: View {
    
    private let imageURL: String?
    private let imageType: ImageType?
    
    public init(
        imageURL: String?,
        imageType: ImageType? = .flexible
    ) {
        self.imageURL = imageURL
        self.imageType = imageType
    }
    
    public var body: some View {
        switch imageType {
        case .flexible:
            if let imageURL = imageURL {
                WebImage(url: URL(string: imageURL))
                    .resizable()
                    .scaledToFit()
            }
        case .fixed(let width, let height):
            if let imageURL = imageURL {
                WebImage(url: URL(string: imageURL))
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
            }
        default:
            ProgressView()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(imageURL: "https://reqres.in/img/faces/2-image.jpg")
    }
}
