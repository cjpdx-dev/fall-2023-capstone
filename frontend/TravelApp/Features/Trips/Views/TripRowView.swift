//
//  TripRowView.swift
//  TravelApp
//
//  Created by Rachel Pratt on 11/2/23.
//

import SwiftUI

struct TripRowView: View {
    var trip: Trip
    
    var body: some View {
        HStack() {
            Image("trip")
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text(trip.name)
                    .font(.headline)
                
                Text(trip.formattedDateRange)
                    .font(.subheadline)
            }
            Spacer()
        }
    }
}

#Preview {
    Group {
        TripRowView(trip: trips[0])
        TripRowView(trip: trips[1])
    }
   
}