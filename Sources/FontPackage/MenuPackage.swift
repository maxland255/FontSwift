import SwiftUI

@available(iOS 14, macOS 11, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct CustomMenu<Content: View>: View {
    
    @Binding var showmenu: Bool
    
    var colorFont: Color
    var colorRect: Color
    
    var espacement: CGFloat
    
    private let content: () -> Content
        
    public var body: some View {
        if showmenu{
            VStack{
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
                        .frame(minHeight: 15, maxHeight: 1000)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .foregroundColor(colorRect)
                        
                    ScrollView{
                        LazyVStack{
                            content().frame(width: 350).background(colorFont).padding(.bottom, espacement)
                        }
                    }.clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .navigationBarHidden(true)
                        .frame(width: 350)
                        .frame(minHeight: 15, maxHeight: 1000)
                }
                Spacer()
            }
        }
    }
}

extension CustomMenu{
    public init(showMenu: Binding<Bool>, colorFont: Color, colorRect: Color, espacement: CGFloat, @ViewBuilder content: @escaping () -> Content){
        self._showmenu = showMenu
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.content = content
        self.espacement = espacement
    }
    
    public init(showMenu: Binding<Bool>, colorFont: Color, colorRect: Color, @ViewBuilder content: @escaping () -> Content){
        self._showmenu = showMenu
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.content = content
        self.espacement = -5
    }
}

