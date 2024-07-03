//
//  ComplexLayoutCellView.swift
//  WBMessager
//
//  Created by Anna on 03.07.2024.
//

import SwiftUI

enum CellPosition: CaseIterable {
    case top, bottom, left, right
    
    static var randomPosition: CellPosition {
        return CellPosition.allCases.randomElement()!
    }
}

struct ComplexLayoutCellView: View {
    
    var emoji: String
    var position: CellPosition
    
    var body: some View {
        ZStack {
            switch position {
            case .top: topCellPosition
            case .bottom: bottomCellPossition
            case .left: leftCellPosition
            case .right: rightCellPosition
            }
            
            Text(emoji)
                .font(.system(size: 250))
                .opacity(0.5)
        }
        .frame(maxHeight: .infinity)
        .padding(.all, 20)
    }
    
    private var dashedShape: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(style: StrokeStyle(lineWidth: 3, dash: [10,5]))
    }
    
    private var topCellPosition: some View {
        VStack(spacing: 20) {
            dashedShape
            HStack(spacing: 20) {
                dashedShape
                dashedShape
            }
        }
    }
    
    private var bottomCellPossition: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                dashedShape
                dashedShape
            }
            dashedShape
        }
    }
    
    private var leftCellPosition: some View {
        HStack(spacing: 20) {
            VStack(spacing: 20) {
                dashedShape
                dashedShape
            }
            dashedShape
        }
    }
    
    private var rightCellPosition: some View {
        HStack(spacing: 20) {
            dashedShape
            VStack(spacing: 20) {
                dashedShape
                dashedShape
            }
        }
    }
}
