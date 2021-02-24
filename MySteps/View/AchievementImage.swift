//
//  AchievementImage.swift
//  MySteps
//
//  Created by Branislav on 27/01/2021.
//

import SwiftUI

struct AchievementImage: View {
    var image:Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 140, height: 140)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

struct AchievementImage_Previews: PreviewProvider {
    static var previews: some View {
        AchievementImage(image: Image("10k"))
    }
}
