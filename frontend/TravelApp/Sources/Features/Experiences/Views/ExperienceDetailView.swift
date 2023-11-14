//
//  ExperienceDetailView.swift
//  TravelApp
//
//  Created by Bryshon Sweeney on 10/25/23.
//

import SwiftUI

struct ExperienceDetailView: View {
    @Environment(\.dismiss) var dismiss
    var experience: Experience
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                //Image
//                experience.image
//                    .resizable()
                AsyncImage(url: URL(string: experience.imageUrl)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: .infinity, height: 250)
                                .clipped()
                        } else if phase.error != nil {
                            Text("There was an error loading the image.")
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(width: .infinity, height: 250)
                    .overlay(alignment: .bottomTrailing) {
                        Image(systemName: "pencil.circle.fill")
                            .symbolRenderingMode(.multicolor)
                            .font(.system(size: 30))
                    }
                
                VStack(alignment: .leading, spacing: 20) {
                    // Title
                    HStack() {
                        Text(experience.title)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        HStack{
                            Image(systemName: "star.fill")
                                .symbolRenderingMode(.multicolor)
                            Text("\(experience.rating)/5")
                        }
                    }
                   
                    HStack {
                        // Location
                        Text("\(experience.city), \(experience.state)")
                            .fontWeight(.semibold)
                        Spacer()
                        // Date
                        HStack {
                            Image(systemName: "calendar")
                            Text(Date.now, style: .date)
                                .fontWeight(.semibold)
                        }
                    }
                    Divider()
                    
                    
                    
                    // Description
                    VStack(alignment: .leading) {
                        Text("Description")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text(experience.description)
                    }
                    
                    Divider()
                    
                    
                    // Date
                }
                .padding(.horizontal)
            }
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .padding(.horizontal, 10)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(
                            Color.gray
                        )
                        .clipShape(Circle())
                }
            }
        }
        
    }
}

#Preview {
    ExperienceDetailView(experience: experiences[0])
}
