//
//  CloseButton.swift
//  MZComponents
//
//  Created by Mateusz Zając on 19/09/2024.
//


import SwiftUI

public struct CloseButton: View {
    
    var action: () -> Void
    
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    
    public var body: some View {
        Button("", systemImage: "xmark", action: action)
            .foregroundStyle(.secondary)
            .font(.caption)
            .bold()
            .buttonStyle(.bordered)
            .clipShape(.circle)
    }
}

#Preview {
    NavigationStack {
        VStack {
            
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                CloseButton { }
            }
        }
    }
}
