//
import SwiftUI

public struct CustomMenu<Content: View>: View {
    
    @State var showmenu = false
    @Binding var fontname: String
    
    var colorFont: Color
    var colorRect: Color
    var colorFamily: Color
    
    private let content: () -> Content
        
    public init(fontname: Binding<String>, colorFont: Color, colorRect: Color, colorFamily: Color, @ViewBuilder content: @escaping () -> Content){
        self._fontname = fontname
        self.colorFont = colorFont
        self.colorRect = colorRect
        self.colorFamily = colorFamily
        self.content = content
    }
        
    public var body: some View {
        ZStack{
            Button(action: {
                withAnimation(.linear(duration: 0.5)){
                    self.showmenu.toggle()
                }
            }) {
                Text("Select font: \(fontname)")
            }//.foregroundColor(colorButton)
//                .padding(paddingbutton, paddingNumButton)
//                .background(BackgroundButton)
//                .clipShape(clipshapeButton)
//                .hoverEffect(hovereffect)
            
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
                            content()
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

