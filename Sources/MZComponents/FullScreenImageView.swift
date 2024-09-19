//
//  FullScreenImageView.swift
//  MZComponents
//
//  Created by Mateusz Zając on 19/09/2024.
//


import SDWebImageSwiftUI
import SwiftUI
import Zoomable

public struct FullScreenImageView: View {
    public let imageURL: URL?
    @Environment(\.dismiss) private var dismiss
    
    init(imageURL: URL?) {
        self.imageURL = imageURL
    }

    public var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    Color(uiColor: .systemBackground)
                        .edgesIgnoringSafeArea(.all)

                    WebImage(url: imageURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    #if os(iOS)
                        .zoomable()
                    #endif
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    CloseButton { dismiss() }
                }
            }
        }
    }
}

#Preview {
    FullScreenImageView(imageURL: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Bergwandeltocht_van_Peio_Paese_naar_Lago_Covel_%281%2C839_m%29_in_het_Nationaal_park_Stelvio_%28Italy%29_23.jpg/2880px-Bergwandeltocht_van_Peio_Paese_naar_Lago_Covel_%281%2C839_m%29_in_het_Nationaal_park_Stelvio_%28Italy%29_23.jpg")!
    )
}
