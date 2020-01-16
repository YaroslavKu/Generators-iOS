

//
//  ButtonView.swift
//  Generators
//
//  Created by Slavik on 12.01.2020.
//  Copyright © 2020 Slavik. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    let text:           String
    
    var body: some View {

        HStack {
            Text(text)
                .font(.title)
                .fontWeight(.medium)
        
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 90)
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color(red: 0.251, green: 0.627, blue: 0.51), Color(red: 0.412, green: 0.914, blue: 0.51)]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(40)
        .shadow(radius: 3)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Button")
    }
}
