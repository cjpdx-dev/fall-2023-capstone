//
//  ExperienceListView.swift
//  TravelApp
//
//  Created by Bryshon Sweeney on 10/27/23.
//

import SwiftUI

struct ExperienceListView: View {
    @State private var searchText: String = ""
    @State private var experienceData = ExperienceData()
    var filteredResults: [Experience] {
        if searchText.isEmpty {
            return experienceData.experiences
        } else {
            return experienceData.experiences.filter {
                $0.title.contains(searchText) ||
                $0.state.contains(searchText) ||
                $0.city.contains(searchText) ||
                $0.keywords.contains(searchText)
            }
        }
    }
    var experiences: [Experience]
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredResults) { experience in
                    NavigationLink {
                        ExperienceDetailView(experience: experience)
                            .navigationBarBackButtonHidden(true)
                            
                    } label: {
                        ExperienceRowView(experience: experience)
                    }
                }
                
            }
            .navigationTitle("Experiences")
            .listStyle(.plain)
            .toolbar(content: {
                NavigationLink {
                    CreateExperienceScreen()
                        .navigationTitle("Create Experience")
                        .navigationBarBackButtonHidden()
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 27))
                }
                .buttonStyle(PlainButtonStyle())
                
            })
            .searchable(text: $searchText)
            .onAppear {
                experienceData.getExperiences()
            }
        }
    }
}

#Preview {
    ExperienceListView(experiences: experiences)
}