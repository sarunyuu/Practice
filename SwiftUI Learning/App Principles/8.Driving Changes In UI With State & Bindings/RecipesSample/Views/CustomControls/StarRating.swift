import SwiftUI

struct StarRating: View {
    @Binding var rating: Int
    private let maxRating = 5

    var body: some View {
        HStack {
            ForEach(1...maxRating, id: \.self) { value in
                Image(systemName: "star")
                    .symbolVariant(value <= rating ? .fill : .none)
                    .foregroundColor(.red)
                    .onTapGesture {
                        if value != rating {
                            rating = value
                        } else {
                            rating = 0
                        }
                    }
            }
        }
    }
}

