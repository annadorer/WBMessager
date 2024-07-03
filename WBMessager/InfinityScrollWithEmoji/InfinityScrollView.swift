//
//  InfinityScrollView.swift
//  WBMessager
//
//  Created by Anna on 01.07.2024.
//

import SwiftUI

struct InfinityScrollView: View {
    
    @State private var iterationNumbers = Array(0...50)
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(iterationNumbers, id: \.self) { index in
                    ComplexLayoutCellView(emoji: randomEmoji(), position: CellPosition.randomPosition)
                        .onAppear {
                            if index == iterationNumbers.count - 1 {
                                iterationNumbers.append(contentsOf: iterationNumbers.count + 1...iterationNumbers.count + 50)
                            }
                        }
                }
            }
        }
    }
    
    private func randomEmoji() -> String {
        let unicodeRange = 0x1F300...0x1F3F0
        let randomScalar = UnicodeScalar(unicodeRange.randomElement()!)!
        return String(randomScalar)
    }
}

struct InfinityScrollView_Previews: PreviewProvider {
    static var previews: some View {
        InfinityScrollView()
    }
}
