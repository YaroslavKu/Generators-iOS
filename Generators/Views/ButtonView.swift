

//
//  ButtonView.swift
//  Generators
//
//  Created by Slavik on 12.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    let imgName:        String
    let text:           String
    
    var body: some View {
        ZStack {
            Image(imgName)
                .resizable()
                .frame(height: 90)
                .cornerRadius(50)
            Text(text)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(Color.white)
        }.shadow(radius: 4)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(imgName: "gradient2", text: "Button")
    }
}
