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
    
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: - FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        
        // TOOLBAR IMAGE
        switch gridColumn {
            case 1:
                toolbarIcon = "square.grid.2x2"
            case 2:
                toolbarIcon = "square.grid.3x2"
            case 3:
                toolbarIcon = "square.grid.1x2"
            default:
                toolbarIcon = "square.grid.2x2"
        }
    }
    
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
                            
                            CreditsView()
                                .modifier(CenterModifier())
                        } //: LIST
                    } else {
                        ScrollView(.vertical, showsIndicators: false) {
                            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                                ForEach(animals) { animal in
                                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                        AnimalGridItemView(animal: animal)
                                    } //: NAVIGATION LINK
                                } //: LOOP
                            } //: GRID
                            .padding(10)
                            .animation(.easeOut)
                        } //: SCROLL
                    } //: CONDITION
                } //: GROUP
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
                                gridSwitch()
                            } label: {
                                Image(systemName: toolbarIcon )
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

