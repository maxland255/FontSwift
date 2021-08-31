import SwiftUI

@available(iOS 14, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct Menu<Content: View>: View {
    
    @Binding var showmenu: Bool
    
    var colorFont: Color
    var colorRect: Color
    
    var espacement: CGFloat
    
    private let content: () -> Content
    
    @State private var height: CGFloat = 0
        
    public var body: some View {
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
                    
                ScrollView{
                    GeometryReader{Value in
                        LazyVStack{
                            content().frame(width: 350).background(colorFont).padding(.bottom, espacement)
                        }.onAppear(perform: {
                            height = Value.size.height
                            print(Value.size.height)
                        })
                    }
                }.background(colorRect)
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .navigationBarHidden(true)
                .frame(width: 350)
                .frame(maxHeight: .infinity)
            }
        }
    }
}

extension Menu{
    public init(showMenu: Binding<Bool>, colorFont: Color, colorRect: Color, espacement: CGFloat, @ViewBuilder content: @escaping () -> Content){
        self._showmenu = showMenu
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.espacement = espacement
        self.content = content
    }
    
    public init(showMenu: Binding<Bool>, colorFont: Color, colorRect: Color, @ViewBuilder content: @escaping () -> Content){
        self._showmenu = showMenu
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.espacement = -5
        self.content = content
    }
}

