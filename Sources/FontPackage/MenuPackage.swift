//
import SwiftUI

public struct CustomMenu<Content: View>: View {
    
    @Binding var showmenu: Bool
    @Binding var fontname: String
    
    var colorFont: Color
    var colorRect: Color
    var colorFamily: Color
    
    private let content: () -> Content
        
    public init(showmenu: Binding<Bool>, fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, @ViewBuilder content: @escaping () -> Content){
        self._showmenu = showmenu
        self._fontname = fontname
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.content = content
    }
        
    public var body: some View {
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
                    content()
                }
            }.clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .navigationBarHidden(true)
                .frame(width: 350)
                .frame(minHeight: 100, maxHeight: 1000)
        }
    }
}

