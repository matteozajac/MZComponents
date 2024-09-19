//
//  TwoColumnSplitView.swift
//  MZComponents
//
//  Created by Mateusz Zając on 19/09/2024.
//


import SDWebImageSwiftUI
import SwiftUI

public struct TwoColumnSplitView<LeadingContent: View, TrailingContent: View>: View {
    private let leadingContent: LeadingContent
    private let trailingContent: TrailingContent

    public init(
        @ViewBuilder leadingContent: @escaping () -> LeadingContent,
        @ViewBuilder trailingContent: @escaping () -> TrailingContent
    ) {
        self.leadingContent = leadingContent()
        self.trailingContent = trailingContent()
    }

    public var body: some View {
        GeometryReader { geometry in
            let leadingContentWidth: CGFloat = geometry.size.width / 2.618
            let trailingContentWidth: CGFloat = geometry.size.width - leadingContentWidth
            HStack(alignment: .top, spacing: 0) {
                leadingContent
                    .frame(maxWidth: leadingContentWidth)
                    .clipped()
                    .frame(minWidth: 0, maxWidth: leadingContentWidth)

                trailingContent
                    .frame(maxWidth: trailingContentWidth)
                    .clipped()
                    .frame(minWidth: 0, maxWidth: trailingContentWidth)
            }
        }
    }
}

#Preview("Standard Layout") {
    TwoColumnSplitView {
        Color.blue.overlay(Text("Leading").foregroundColor(.white)).opacity(0.5)
    } trailingContent: {
        WebImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Sofia_Massif_and_Sofia_Glacier%2C_Karachay-Cherkessia%2C_Caucasus_Mountains.jpg/2880px-Sofia_Massif_and_Sofia_Glacier%2C_Karachay-Cherkessia%2C_Caucasus_Mountains.jpg")!)
            .resizable()
            .clipped()
            .scaledToFill()
            .clipped()
    }
}

#Preview("Right-to-Left") {
    TwoColumnSplitView {
        Color.blue.overlay(Text("Leading").foregroundColor(.white)).opacity(0.5)
    } trailingContent: {
        WebImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Sofia_Massif_and_Sofia_Glacier%2C_Karachay-Cherkessia%2C_Caucasus_Mountains.jpg/2880px-Sofia_Massif_and_Sofia_Glacier%2C_Karachay-Cherkessia%2C_Caucasus_Mountains.jpg")!)
            .resizable()
            .clipped()
            .scaledToFill()
            .clipped()
    }
    .environment(\.layoutDirection, .rightToLeft)
}
