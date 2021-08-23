import SwiftUI
import UIKit

public struct FontPackage {
    public private(set) var text = "Hello, World!"

    public init() {
        
    }
}

public struct FontMenu: View{
    
    @Binding var showmenu: Bool
    @Binding var fontname: String
    
    @Binding var colorFont: Color
    @Binding var colorRect: Color
    @Binding var colorFamily: Color
    
    @State var hovereffect = false
    
    public init(showmenu: Binding<Bool>, fontname: Binding<String>, colorFont: Binding<Color>, colorRect: Binding<Color>, colorFamily: Binding<Color>){
        self._showmenu = showmenu
        self._fontname = fontname
        self._colorRect = colorRect
        self._colorFont = colorFont
        self._colorFamily = colorFamily
    }
    
    public var body: some View{
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
//        return ZStack() {
//            
//        }
    }
}
