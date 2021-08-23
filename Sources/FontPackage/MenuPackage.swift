//
import SwiftUI

@available(iOS 14, macOS 11, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct CustomMenu<Content: View>: View {
    
    @State var showmenu = false
    @Binding var nameButton: String
    
    var colorFont: Color
    var colorRect: Color
    var colorFamily: Color
    
    var colorButton: Color
    var BackgroundButton: Color
    var clipshapeButton: RoundedRectangle
    var paddingbutton: Edge.Set
    var paddingNumButton: CGFloat
    var hovereffect: HoverEffect
    var fontButton: Font
    var fontWeightButton: Font.Weight
    
    var espacement: CGFloat
    
    private let content: () -> Content
        
    public var body: some View {
        ZStack{
            Button(action: {
                withAnimation(.linear(duration: 0.5)){
                    self.showmenu.toggle()
                }
            }) {
                Text(nameButton)
                    .font(fontButton)
                    .fontWeight(fontWeightButton)
            }.foregroundColor(colorButton)
                .padding(paddingbutton, paddingNumButton)
                .background(BackgroundButton)
                .clipShape(clipshapeButton)
                .hoverEffect(hovereffect)
            
            if showmenu{
                ZStack{
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onTapGesture(perform: {
                            withAnimation(.linear(duration: 0.5)){
                                self.showmenu = false
                            }
                        })
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.00000000000000000000000000000000000001)))
                    Rectangle()
                        .frame(width: 350)
                        .frame(minHeight: 5, maxHeight: 1000)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .foregroundColor(colorRect)
                        
                    ScrollView{
                        LazyVStack{
                            content().frame(width: 350).background(colorFont).padding(.bottom, espacement)
                        }
                    }.clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .navigationBarHidden(true)
                        .frame(width: 350)
                        .frame(minHeight: 100, maxHeight: 1000)
                }
            }
        }
    }
}

extension CustomMenu{
    public init(nameButton: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, colorButton: Color, backgroundButton: Color, clipshapeButton: RoundedRectangle, paddingButton: Edge.Set, paddingNumButton: CGFloat, fontButton: Font, fontWeightButton: Font.Weight, hovereffect: HoverEffect, espacement: CGFloat, @ViewBuilder content: @escaping () -> Content){
        self._nameButton = nameButton
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.content = content
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshapeButton
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
        self.hovereffect = hovereffect
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
        self.espacement = espacement
    }
    
    public init(nameButton: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, colorButton: Color, backgroundButton: Color, clipshapeButton: RoundedRectangle, hovereffect: HoverEffect, fontButton: Font, fontWeightButton: Font.Weight, espacement: CGFloat, @ViewBuilder content: @escaping () -> Content){
        self._nameButton = nameButton
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.content = content
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshapeButton
        self.paddingbutton = .all
        self.paddingNumButton = 0
        self.hovereffect = hovereffect
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
        self.espacement = espacement
    }
    
    public init(nameButton: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, colorButton: Color, backgroundButton: Color, clipshapeButton: RoundedRectangle, paddingButton: Edge.Set, paddingNumButton: CGFloat, fontButton: Font, fontWeightButton: Font.Weight, espacement: CGFloat, @ViewBuilder content: @escaping () -> Content){
        self._nameButton = nameButton
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.content = content
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshapeButton
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
        self.hovereffect = .automatic
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
        self.espacement = espacement
    }
    
    public init(nameButton: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, colorButton: Color, backgroundButton: Color, paddingButton: Edge.Set, paddingNumButton: CGFloat, hovereffect: HoverEffect, fontButton: Font, fontWeightButton: Font.Weight, espacement: CGFloat, @ViewBuilder content: @escaping () -> Content){
        self._nameButton = nameButton
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.content = content
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = RoundedRectangle(cornerRadius: 0, style: .continuous)
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
        self.hovereffect = hovereffect
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
        self.espacement = espacement
    }
    
    public init(nameButton: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, colorButton: Color, backgroundButton: Color, clipshapeButton: RoundedRectangle, fontButton: Font, fontWeightButton: Font.Weight, espacement: CGFloat, @ViewBuilder content: @escaping () -> Content){
        self._nameButton = nameButton
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.content = content
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshapeButton
        self.paddingbutton = .all
        self.paddingNumButton = 0
        self.hovereffect = .automatic
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
        self.espacement = espacement
    }
    
    public init(nameButton: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, colorButton: Color, backgroundButton: Color, fontButton: Font, fontWeightButton: Font.Weight, espacement: CGFloat, @ViewBuilder content: @escaping () -> Content){
        self._nameButton = nameButton
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.content = content
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = RoundedRectangle(cornerRadius: 0, style: .continuous)
        self.paddingbutton = .all
        self.paddingNumButton = 0
        self.hovereffect = .automatic
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
        self.espacement = espacement
    }
    
    public init(nameButton: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, colorButton: Color, backgroundButton: Color, clipshapeButton: RoundedRectangle, paddingButton: Edge.Set, paddingNumButton: CGFloat, fontButton: Font, fontWeightButton: Font.Weight, hovereffect: HoverEffect, @ViewBuilder content: @escaping () -> Content){
        self._nameButton = nameButton
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.content = content
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshapeButton
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
        self.hovereffect = hovereffect
        self.fontButton = fontButton
        self.fontWeightButton = fontWeightButton
        self.espacement = -5
    }
    
    public init(nameButton: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, colorButton: Color, backgroundButton: Color, clipshapeButton: RoundedRectangle, paddingButton: Edge.Set, paddingNumButton: CGFloat, hovereffect: HoverEffect, espacement: CGFloat, @ViewBuilder content: @escaping () -> Content){
        self._nameButton = nameButton
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.content = content
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshapeButton
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
        self.hovereffect = hovereffect
        self.fontButton = .headline
        self.fontWeightButton = .regular
        self.espacement = espacement
    }
}

