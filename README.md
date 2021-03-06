# FontPackage

FontPackage vous permet d'avoir un menu custom dans lequel vous aurez toutes les polices d'apple que vous pouvez récupérer avec une variable string pour les utilisées dans vos projets.


Exemple: 

import SwiftUI
import FontPackage

struct MenuCustom: View {

    @State var showMenu = false
    @State var showmenu = false
    @State var fontname = ""

    @State var colorFont: Color = Color(#colorLiteral(red: 0.4877697825, green: 0.5191714168, blue: 0.8583083749, alpha: 0.6019079507))
    @State var colorRect: Color = Color(#colorLiteral(red: 0.6581935287, green: 0.6499102712, blue: 0.9234976172, alpha: 1))
    @State var colorFamily: Color = Color(#colorLiteral(red: 0.1326799691, green: 0.2375315726, blue: 0.8680827022, alpha: 1))
    
    @State var color: Color = Color.black
    
    var body: some View {
        ZStack{
            
            FontMenu(showMenu: self.$showMenu, fontname: self.$fontname)
            
            VStack{
                if !fontname.isEmpty{
                    Text(fontname).font(Font(UIFont(name: fontname, size: 20)!))
                }
                
                Button(action: {
                    withAnimation(.linear(duration: 0.5)){
                        self.showMenu.toggle()
                    }
                }) {
                    Text("Select font: \(fontname)")
                }
                                        
                FontMenuButton(fontname: self.$fontname, colorFont: self.colorFont, colorRect: self.colorRect, colorFamily: self.colorFamily, colorButton: Color.black, backgroundButton: Color.gray, clipshadeButton: RoundedRectangle(cornerRadius: 25, style: .continuous), paddingButton: .all, paddingNumButton: 16, hovereffect: .highlight)
                
                CustomMenuButton(showMenu: self.$showmenu, nameButton: "Font: \(fontname)", colorFont: self.colorFont, colorRect: self.colorRect, colorButton: Color.white, backgroundButton: Color.blue, clipshapeButton: RoundedRectangle(cornerRadius: 25, style: .continuous), paddingButton: .all, paddingNumButton: 5, fontButton: .headline, fontWeightButton: .semibold, hovereffect: .highlight, espacement: -5, content: {
                    ForEach(UIFont.familyNames, id: \.self){family in
                        Text("\(family)").font(.title3).padding()
                        
                        ForEach(UIFont.fontNames(forFamilyName: "\(family)"), id: \.self){font in
                            Button(action: {
                                self.fontname = font
                                withAnimation(.linear(duration: 0.5)){
                                    self.showmenu.toggle()
                                }
                            }, label: {
                                Text("\(font)").font(Font(UIFont(name: font, size: 15)!))
                            }).padding()
                        }
                    }
                })
            }
        }
    }
}

Exemple 2:

import SwiftUI
import FontPackage

struct TestView: View {
    
    @State var showMenu = false
    
    @State var showmenu = false
    @State var fontname = ""

    @State var colorFont: Color = Color(#colorLiteral(red: 0.4877697825, green: 0.5191714168, blue: 0.8583083749, alpha: 0.6019079507))
    @State var colorRect: Color = Color(#colorLiteral(red: 0.6581935287, green: 0.6499102712, blue: 0.9234976172, alpha: 1))
    @State var colorFamily: Color = Color(#colorLiteral(red: 0.1326799691, green: 0.2375315726, blue: 0.8680827022, alpha: 1))
    
    @State var color: Color = Color.black
    
    var body: some View {
        ZStack{
            
            FontMenu(showMenu: self.$showmenu, fontname: self.$fontname).zIndex(10)
            
            CustomMenu(showMenu: self.$showMenu, colorFont: colorFont, colorRect: colorRect, content: {
                Text("Coucou")
                Text("Coucou 2")
            }).zIndex(10)
            
            VStack{
                Button(action: {
                    withAnimation(.linear(duration: 0.5)){
                        self.showmenu.toggle()
                    }
                }) {
                    Text("Select font: \(fontname)")
                }
                
                Button(action: {
                    withAnimation(.linear(duration: 0.5)){
                        self.showMenu.toggle()
                    }
                }) {
                    Text("Select font: \(fontname)")
                }
                FontList()
            }
        }
    }
}
