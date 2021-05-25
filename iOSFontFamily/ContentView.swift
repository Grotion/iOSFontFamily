//
//  ContentView.swift
//  iOSFontFamily
//
//  Created by Shaun Ku on 2021/4/4.
//

import SwiftUI

struct ContentView: View {
    @State private var fontNames:[String] = [""]
    @State private var selectedIndex:Int = -1
    @State private var sampleText = ""
    
    func setNames(){
        fontNames.removeAll()
        fontNames = UIFont.returnAll()
    }
    var body: some View {
        GeometryReader{
            geometry in
            let screenWidth:CGFloat = geometry.size.width
            let screenHeight:CGFloat = geometry.size.height
            let unit:CGFloat = screenWidth/428.0
            ZStack{
                VStack{
                    HStack{
                        TextField("Enter text here", text: $sampleText)
                        .font(Font.custom(selectedIndex<0 ? "" : fontNames[selectedIndex], size: unit*20))
                        .foregroundColor(.black)
                    }
                    .frame(width: screenWidth*6/7, height: (screenHeight*1/7)+(unit*10))
                    List{
                        ForEach(fontNames.indices, id: \.self)
                        {
                            (index) in
                            HStack{
                                Image(systemName: "checkmark")
                                .font(.system(size: unit*14, weight: .bold))
                                .foregroundColor(Color.white)
                                .frame(width: unit*26, height:unit*26)
                                .background(Circle().fill(Color.green))
                                .opacity(selectedIndex==index ? 1 : 0)
                                .padding(.bottom, unit*10)
                                Button(action: {
                                    selectedIndex=index
                                    sampleText = fontNames[index]
                                }, label: {
                                    Text("\(fontNames[index])")
                                    .font(Font.custom(fontNames[index], size: unit*20))
                                    .foregroundColor(.black)
                                })
                            }
                        }
                    }
                    .padding(.top, unit*(-45))
                    .frame(height: (screenHeight*6/7)-(unit*20))
                }
            }
        }
        .onAppear(){
            setNames()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
