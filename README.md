# FontPackage

FontPackage vous permet d'avoir un menu custom dans lequel vous aurez toutes les polices d'apple que vous pouvez récupérer avec une varibale string pour les utilisées dans vos projets.


Exemple: 

import SwiftUI
import UIKit
import FontPackage

struct MenuCustom: View {

    @State var fontname = ""

    @State var colorFont: Color = Color(#colorLiteral(red: 0.4877697825, green: 0.5191714168, blue: 0.8583083749, alpha: 0.6019079507))
    @State var colorRect: Color = Color(#colorLiteral(red: 0.6581935287, green: 0.6499102712, blue: 0.9234976172, alpha: 1))
    @State var colorFamily: Color = Color(#colorLiteral(red: 0.1326799691, green: 0.2375315726, blue: 0.8680827022, alpha: 1))

    var body: some View {
        VStack{
            if !fontname.isEmpty{
                Text(fontname).font(Font(UIFont(name: fontname, size: 20)!))
            }

            FontMenu(fontname: self.$fontname, colorFont: self.colorFont, colorRect: self.colorRect, colorFamily: self.colorFamily, colorButton: Color.black, backgroundButton: Color.gray, clipshadeButton: RoundedRectangle(cornerRadius: 25, style: .continuous), paddingButton: .all, paddingNumButton: 16, hovereffect: .highlight)

            CustomMenu(fontname: self.$fontname, colorFont: self.colorFont, colorRect: self.colorRect, colorFamily: self.colorFamily, colorButton: Color.white, backgroundButton: Color.gray, clipshapeButton: RoundedRectangle(cornerRadius: 25, style: .continuous), paddingButton: .all, paddingNumButton: 10, hovereffect: .highlight, content: {
                ForEach(UIFont.familyNames, id: \.self){family in
                    Text("\(family)").font(.title3).padding()
                }
            })
        }
    }
}
