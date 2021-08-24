import SwiftUI

@available(iOS 14, macOS 11, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct FontMenu: View{
    
    @Binding var showmenu: Bool
    @Binding var fontname: String
    
    var colorFont: Color
    var colorRect: Color
    var colorFamily: Color
    
    var colorButton: Color
    var BackgroundButton: Color
    var clipshapeButton: RoundedRectangle
    var paddingbutton: Edge.Set
    var paddingNumButton: CGFloat
    
    public var body: some View{
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
                    LazyVStack(alignment: .leading){
                        ForEach(UIFont.familyNames, id: \.self){family in
                            VStack(alignment: .leading){
                                Text("\(family):")
                                    .font(.title2)
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
                                        Label("\(font)", systemImage: fontname == font ? "checkmark.circle" : "")
                                            .font(Font(UIFont(name: "\(font)", size: 20)!))
                                            .foregroundColor(.black)
                                            .padding(EdgeInsets(top: 16, leading: 5, bottom: 16, trailing: 5))
                                            .frame(width: 350, alignment: .leading)
                                            .background(colorFont)
                                            .opacity(0.7)
                                    }.hoverEffect(.highlight)
                                    .padding(.bottom, -5)
                                }
                            }
                        }
                    }
                }.background(colorRect)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .navigationBarHidden(true)
                .frame(width: 350)
                .frame(minHeight: 100, maxHeight: 1000)
            }
        }
    }
}

extension FontMenu{
    public init(showMenu: Binding<Bool>, fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, colorButton: Color, backgroundButton: Color, clipshadeButton: RoundedRectangle, paddingButton: Edge.Set, paddingNumButton: CGFloat){
        self._showmenu = showMenu
        self._fontname = fontname
        self.colorRect = colorRect
        self.colorFont = colorFont
        self.colorFamily = colorFamily
        self.colorButton = colorButton
        self.BackgroundButton = backgroundButton
        self.clipshapeButton = clipshadeButton
        self.paddingbutton = paddingButton
        self.paddingNumButton = paddingNumButton
    }
    
    public init(showMenu: Binding<Bool>, fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, colorButton: Color){
        self._showmenu = showMenu
        self._fontname = fontname
        self.colorRect = colorRect
        self.colorFont = colorFont
        self.colorFamily = colorFamily
        self.colorButton = colorButton
        self.BackgroundButton = Color.clear
        self.clipshapeButton = RoundedRectangle(cornerRadius: 0, style: .continuous)
        self.paddingbutton = .all
        self.paddingNumButton = 0
    }
    
    public init(showMenu: Binding<Bool>, fontname: Binding<String>){
        self._showmenu = showMenu
        self._fontname = fontname
        self.colorRect = Color(#colorLiteral(red: 0.9330300689, green: 0.9330299497, blue: 0.9330299497, alpha: 1))
        self.colorFont = Color(#colorLiteral(red: 0.8600999117, green: 0.8600999713, blue: 0.8600999117, alpha: 0.6019079507))
        self.colorFamily = Color.black
        self.colorButton = Color.blue
        self.BackgroundButton = Color.clear
        self.clipshapeButton = RoundedRectangle(cornerRadius: 0, style: .continuous)
        self.paddingbutton = .all
        self.paddingNumButton = 0
    }
}

