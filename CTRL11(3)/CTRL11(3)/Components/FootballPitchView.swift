//
//  FootballPitchView.swift
//  CTRL11(3)
//
//  Created by huy bin on 15/6/25.
//

import SwiftUI

struct FootballPitchView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("pitch") // tên file trong Assets
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()


            }
        }
    }
}
