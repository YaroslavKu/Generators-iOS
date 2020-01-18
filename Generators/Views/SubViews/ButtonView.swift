

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
        .background(LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.2689464986, green: 0.5739820004, blue: 0.5094514489, alpha: 1)), Color.init(#colorLiteral(red: 0.4704491496, green: 0.9181039929, blue: 0.5166531801, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(40)
        .shadow(radius: 3)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Button")
    }
}
