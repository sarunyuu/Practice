/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct SpecificPadding: View {
    var body: some View {
        Text("Specific Padding")
        HStack {
            TrainCar(.rear)
            TrainCar(.middle)
                .padding()
                .border(.teal)
                .background(Color.yellow)
            TrainCar(.front)
        }
        TrainTrack()
    }
}

struct SpecificPadding_Previews: PreviewProvider {
    static var previews: some View {
        SpecificPadding()
    }
}
