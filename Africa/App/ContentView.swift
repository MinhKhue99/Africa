    //
    //  ContentView.swift
    //  Africa
    //
    //  Created by Phạm Minh Khuê on 01/09/2022.
    //

import SwiftUI

struct ContentView: View {

        // MARK: - PROPERTY
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActived: Bool = false
    @State private var gridColumn: Int = 1
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var toolbarIcon: String = "square.grid.2x2"

        // MARK: - FUNCTION
    func swithGridLayout() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("GridColumn: \(gridColumn)")
        switch gridColumn {
            case 1:
                toolbarIcon = "square.grid.2x2"
            case 2:
                toolbarIcon = "square.grid.3x2"
            case 3:
                toolbarIcon = "rectangle.grid.1x2"
            default:
                toolbarIcon = "square.grid.2x2"
        }
    }

        // MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActived {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

                        ForEach(animals) {animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout , alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .animation(.easeIn, value: UUID())
                        .padding(10)
                    }
                }
            }
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            print("Listview is activated")
                            isGridViewActived = false
                            haptic.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActived ? .primary : .accentColor)
                        }

                        Button(action: {
                            print("Grid is activated")
                            isGridViewActived = true
                            haptic.impactOccurred()
                            swithGridLayout()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActived ? .accentColor : .primary)
                        }

                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
