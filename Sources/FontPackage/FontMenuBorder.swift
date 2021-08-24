import Foundation
import SwiftUI

@available(iOS 15, macOS 12, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct FontMenuBorder: View{
    
    @State private var showmenu = false
    @Binding var fontname: String
    
    var colorFont: Color
    var colorRect: Color
    var colorFamily: Color
    var widhtBorder: CGFloat
    
    var colorButton: Color
    var BackgroundButton: Color
    var clipshapeButton: RoundedRectangle
    var paddingbutton: Edge.Set
    var paddingNumButton: CGFloat
    var hovereffect: HoverEffect
    var fontButton: Font
    var fontWeightButton: Font.Weight
    
    public var body: some View{
        ZStack{
            Button(action: {
                withAnimation(.linear(duration: 0.5)){
                    self.showmenu.toggle()
                }
            }) {
                Text("Select font: \(fontname)")
                    .font(fontButton)
                    .fontWeight(fontWeightButton)
            }.foregroundColor(colorButton)
                .padding(paddingbutton, paddingNumButton)
                .background(BackgroundButton)
                .clipShape(clipshapeButton)
                .hoverEffect(hovereffect)
            
            if showmenu {
                ZStack{
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onTapGesture(perform: {
                            withAnimation(.linear(duration: 0.5)){
                                self.showmenu = false
                            }
                        })
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.00000000000000000000000000000000000001)))
                    
                    ScrollView(){
                        LazyVStack(){
                            ForEach(UIFont.familyNames, id: \.self){family in
                                VStack(alignment: .leading){
                                    Text("\(family) :")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(colorFamily)
                                        .padding([.top, .leading])
                                    
                                    ForEach(UIFont.fontNames(forFamilyName: family), id: \.self){font in
                                        Button(action: {
                                            self.fontname = font
                                            withAnimation(.linear(duration: 0.5)){
                                                self.showmenu = false
                                            }
                                        }) {
                                            if fontname == font{
                                                Label("\(font)", systemImage: "checkmark.circle")
                                                    .font(Font(UIFont(name: "\(font)", size: 15)!))
                                                    .foregroundColor(.black)
                                                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 5))
                                                    .frame(width: 350, alignment: .leading)
                                                    .background(colorFont)
                                                    .opacity(0.7)
                                            }else{
                                                Text("\(font)")
                                                    .font(Font(UIFont(name: "\(font)", size: 20)!))
                                                    .foregroundColor(.black)
                                                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 5))
                                                    .frame(width: 350, alignment: .leading)
                                                    .background(colorFont)
                                                    .opacity(0.7)
                                            }
                                        }.hoverEffect(.highlight)
                                        .padding(.bottom, -5)
                                    }
                                }
                            }
                        }
                    }.overlay{
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(lineWidth: widhtBorder)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .navigationBarHidden(true)
                    .frame(width: 350)
                    .frame(minHeight: 100, maxHeight: 1000)
                }
            }
        }
    }
}

@available(iOS 15, macOS 12, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension FontMenuBorder{
    public init(fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, widhtBorder: CGFloat, colorButton: Color, backgroundButton: Color, clipshadeButton: RoundedRectangle, paddingButton: Edge.Set, paddingNumButton: CGFloat, hovereffect: HoverEffect, fontButton: Font, fontWeightButton: Font.Weight){
        self._fontname = fontname
        self.colorRect = colorRect
        self.colorFont = colorFont
        self.colorFamily = colorFamily
        self.widhtBorder = widhtBorder
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshadeButton
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
        self.hovereffect = hovereffect
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
    }
    
    public init(fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, widhtBorder: CGFloat, colorButton: Color, backgroundButton: Color, clipshapeButton: RoundedRectangle, hovereffect: HoverEffect, fontButton: Font, fontWeightButton: Font.Weight){
        self._fontname = fontname
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.widhtBorder = widhtBorder
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshapeButton
        self.paddingbutton = .all
        self.paddingNumButton = 0
        self.hovereffect = hovereffect
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
    }
    
    public init(fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, widhtborder: CGFloat, colorButton: Color, backgroundButton: Color, clipshapeButton: RoundedRectangle, paddingButton: Edge.Set, paddingNumButton: CGFloat, fontButton: Font, fontWeightButton: Font.Weight){
        self._fontname = fontname
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.widhtBorder = widhtborder
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshapeButton
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
        self.hovereffect = .automatic
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
    }
    
    public init(fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, widhtborder: CGFloat, colorButton: Color, backgroundButton: Color, paddingButton: Edge.Set, paddingNumButton: CGFloat, hovereffect: HoverEffect, fontButton: Font, fontWeightButton: Font.Weight){
        self._fontname = fontname
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.widhtBorder = widhtborder
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = RoundedRectangle(cornerRadius: 0, style: .continuous)
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
        self.hovereffect = hovereffect
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
    }
    
    public init(fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, widhtborder: CGFloat, colorButton: Color, backgroundButton: Color, clipshapeButton: RoundedRectangle, fontButton: Font, fontWeightButton: Font.Weight){
        self._fontname = fontname
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.widhtBorder = widhtborder
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshapeButton
        self.paddingbutton = .all
        self.paddingNumButton = 0
        self.hovereffect = .automatic
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
    }
    
    public init(fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, widhtborder: CGFloat, colorButton: Color, backgroundButton: Color, fontButton: Font, fontWeightButton: Font.Weight){
        self._fontname = fontname
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.widhtBorder = widhtborder
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = RoundedRectangle(cornerRadius: 0, style: .continuous)
        self.paddingbutton = .all
        self.paddingNumButton = 0
        self.hovereffect = .automatic
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
    }
    
    public init(fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, widhtborder: CGFloat, colorButton: Color, backgroundButton: Color, clipshapeButton: RoundedRectangle, paddingButton: Edge.Set, paddingNumButton: CGFloat, fontButton: Font, fontWeightButton: Font.Weight, hovereffect: HoverEffect){
        self._fontname = fontname
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.widhtBorder = widhtborder
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshapeButton
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
        self.hovereffect = hovereffect
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
    }
    
    public init(fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, widhtborder: CGFloat, colorButton: Color, backgroundButton: Color, clipshapeButton: RoundedRectangle, paddingButton: Edge.Set, paddingNumButton: CGFloat, hovereffect: HoverEffect){
        self._fontname = fontname
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.widhtBorder = widhtborder
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshapeButton
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
        self.hovereffect = hovereffect
        self.fontButton = .headline
        self.fontWeightButton = .regular
    }
    
    public init(fontname: Binding<String>, colorButton: Color, backgroundButton: Color, clipshapeButton: RoundedRectangle, paddingButton: Edge.Set, paddingNumButton: CGFloat, hovereffect: HoverEffect){
        self._fontname = fontname
        self.colorFont = Color(#colorLiteral(red: 0.7202454209, green: 1, blue: 0.947959125, alpha: 1))
        self.colorRect = Color.blue
        self.colorFamily = Color(#colorLiteral(red: 0.697018683, green: 0.7526807189, blue: 1, alpha: 1))
        self.widhtBorder = 5
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshapeButton
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
        self.hovereffect = hovereffect
        self.fontButton = .headline
        self.fontWeightButton = .regular
    }
    
    public init(fontname: Binding<String>){
        self._fontname = fontname
        self.colorFont = Color(#colorLiteral(red: 0.7202454209, green: 1, blue: 0.947959125, alpha: 1))
        self.colorRect = Color.blue
        self.colorFamily = Color(#colorLiteral(red: 0.697018683, green: 0.7526807189, blue: 1, alpha: 1))
        self.widhtBorder = 5
        self.colorButton = Color.white
        self.BackgroundButton = Color.gray
        self.clipshapeButton = RoundedRectangle(cornerRadius: 25, style: .continuous)
        self.paddingbutton = .all
        self.paddingNumButton = 16
        self.hovereffect = .highlight
        self.fontButton = .headline
        self.fontWeightButton = .regular
    }
}
