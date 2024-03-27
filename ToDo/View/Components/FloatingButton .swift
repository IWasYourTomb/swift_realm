//
//  FloatingButton .swift
//  ToDo
//
//  Created by matvey on 27.03.2024.
//

import SwiftUI

struct FloatingButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 50)
                .foregroundColor(Color(hue: 0.328, saturation: 0.796, brightness: 0.408))
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .frame(height: 50)
    }
}

#Preview {
    FloatingButton()
}
