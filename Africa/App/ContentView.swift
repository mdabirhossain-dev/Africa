//
//  ContentView.swift
//  Africa
//
//  Created by Md Abir Hossain on 16-04-2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            NavigationView {
                Group {
                    if !isGridViewActive {
                        List {
                            CoverImageView()
                                .frame(height: 300)
                                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalListItemView(animal: animal)
                                } //: LINK
                            } //: LOOP
                        } //: LIST
                    } else {
                        Text("Grid View is active")
                    } //: CONDITION
                }
                .navigationTitle("Africe")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        HStack(spacing: 16) {
                            // LIST
                            Button {
                                print("List view is activated")
                                isGridViewActive = false
                                haptics.impactOccurred()
                            } label: {
                                Image(systemName: "square.fill.text.grid.1x2")
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? Color.primary : Color.accentColor)
                            }
                            
                            // GRID
                            Button {
                                print("Grid view is activated")
                                isGridViewActive = true
                                haptics.impactOccurred()
                            } label: {
                                Image(systemName: "square.grid.2x2")
                                    .font(.title2)
                                    .foregroundColor(isGridViewActive ? Color.accentColor : Color.primary)
                            }
                        } //: HSTACK
                    } //: TOOBAR BUTTONS
                } //:TOOLBAR
            } //: NAVIGATION
        }
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

