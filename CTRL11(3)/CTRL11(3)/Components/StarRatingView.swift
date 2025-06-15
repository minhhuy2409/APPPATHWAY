//
//  StarRatingView.swift
//  CTRL11(3)
//
//  Created by huy bin on 14/6/25.
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    var maxRating: Int = 5

    var body: some View {
        HStack {
            ForEach(1...maxRating, id: \.self) { number in
                Image(systemName: number > rating ? "star" : "star.fill")
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
}
