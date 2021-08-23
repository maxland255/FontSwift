//
//  SwiftUIView.swift
//  SwiftUIView
//
//  Created by Harry Pieteraerens on 23/08/2021.
//

import SwiftUI

public struct ColorPicker: View {
    
    @State var black = false
    
    @Binding var chosenColor: Color
    @State private var isDragging: Bool = false
    @State private var startLocation: CGFloat = .zero
    @State private var dragOffset: CGSize = .zero
        
    private var colors: [Color] = {
        let hueValues = Array(0...359)
        return hueValues.map {
            Color(UIColor(hue: CGFloat($0) / 359.0 , saturation: 1.0, brightness: 1.0, alpha: 1.0))
        }
    }()
        
    private var circleWidth: CGFloat {
        isDragging ? 35 : 15
    }
        
    private var linearGradientHeight: CGFloat = 200
        
    private var currentColor: Color {
        Color(UIColor.init(hue: 1.0, saturation: 0, brightness: self.normalizeGesture() / linearGradientHeight, alpha: 1.0))
    }
        
    private func normalizeGesture() -> CGFloat {
        let offset = startLocation + dragOffset.height
        let maxY = max(0, offset)
        let minY = min(maxY, linearGradientHeight)
        
        return minY
    }
        
    public var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.white]), startPoint: .top, endPoint: .bottom)
                .frame(width: 10, height: linearGradientHeight)
                .cornerRadius(5)
                .shadow(radius: 8)
                .overlay(
                        RoundedRectangle(cornerRadius: 5).stroke(Color.white, lineWidth: 2.0)
                )
                .gesture(
                    DragGesture()
                        .onChanged({ (value) in
                            self.dragOffset = value.translation
                            self.startLocation = value.startLocation.y
                            self.chosenColor = self.currentColor
                            self.isDragging = true
                        })
                        .onEnded({ (_) in
                            self.isDragging = false
                        })
                )
                
            Circle()
                .foregroundColor(self.currentColor)
                .frame(width: self.circleWidth, height: self.circleWidth, alignment: .center)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: self.circleWidth / 2.0).stroke(Color.white, lineWidth: 2.0)
                )
                .offset(x: self.isDragging ? -self.circleWidth : 0.0, y: self.normalizeGesture() - self.circleWidth / 2)
                .animation(Animation.spring().speed(2))
        }
    }
}

extension ColorPicker{
    public init(chosenColor: Binding<Color>) {
        self._chosenColor = chosenColor
    }
}

