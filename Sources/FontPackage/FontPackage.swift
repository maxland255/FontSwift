import SwiftUI
import UIKit

public struct FontMenu: View{
    
    @State var showmenu = false
    @Binding var fontname: String
    
    var colorFont: Color
    var colorRect: Color
    var colorFamily: Color
    
    var colorButton: Color
    var BackgroundButton: Color
    var clipshapeButton: RoundedRectangle
    var paddingbutton: Edge.Set
    var paddingNumButton: CGFloat
    var hovereffect: HoverEffect
    
    public init(fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, colorButton: Color, backgroundButton: Color, clipshadeButton: RoundedRectangle, paddingButton: Edge.Set, paddingNumButton: CGFloat, hovereffect: HoverEffect){
        self._fontname = fontname
        self.colorRect = colorRect
        self.colorFont = colorFont
        self.colorFamily = colorFamily
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshadeButton
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
        self.hovereffect = hovereffect
    }
    
    public var body: some View{
        ZStack{
            Button(action: {
                withAnimation(.linear(duration: 0.5)){
                    self.showmenu.toggle()
                }
            }) {
                Text("Select font: \(fontname)")
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
                        .frame(minHeight: 100, maxHeight: 1000)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .foregroundColor(colorRect)
                        
                    ScrollView{
                        LazyVStack{
                            ForEach(UIFont.familyNames, id: \.self){family in
                                VStack{
                                    Button(action: {
                                        withAnimation(.linear(duration: 0.5)){
                                            self.showmenu = false
                                        }
                                    }) {
                                        Text("\(family):")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(colorFamily)
                                    }.padding(.top)
                                    
                                    ForEach(UIFont.fontNames(forFamilyName: family), id: \.self){font in
                                        Button(action: {
                                            self.fontname = font
                                            withAnimation(.linear(duration: 0.5)){
                                                self.showmenu = false
                                            }
                                        }) {
                                            ZStack{
                                                Rectangle()
                                                    .frame(minHeight: 30, maxHeight: 1000)
                                                    .foregroundColor(colorFont)
                                                    .opacity(0.7)
                                                Text("\(font)")
                                                    .font(Font(UIFont(name: "\(font)", size: 20)!))
                                                    .foregroundColor(.black)
                                                    .padding(.vertical)
                                                    .padding(.horizontal, 5)
                                            }.frame(width: 350)
                                        }.hoverEffect(.highlight)
                                        .padding(.bottom, -5)
                                    }
                                }
                            }
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
