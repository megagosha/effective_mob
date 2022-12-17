//
//  CategoryIconSelector.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 10.12.2022.
//

import SwiftUI

struct CategoryOption: Identifiable {
    let name: String
    let icon: String
    let id: Int
    var selected: Bool = false
}

struct CategoryButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 71, height: 71)
            .foregroundColor(Color.black)
    }
}


struct CategoryIconSelector: View {
    
    @State var categories: [CategoryOption] = [
        CategoryOption(name: "Phones", icon: "Phone", id: 0),
        CategoryOption(name: "Computer", icon: "Computer", id: 1),
        CategoryOption(name: "Books", icon: "Book", id: 3),
        CategoryOption(name: "Health", icon: "Health", id: 2),
        CategoryOption(name: "Photo", icon: "Photo", id: 4),
        
    ]
    
    func clearSelected() {
        for el in 0..<categories.count {
            if categories[el].selected {
                categories[el].selected = false
                break;
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleView(title: "Select Category", buttonText: "view all").padding(.trailing, 33)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<categories.count, id: \.self) { index in
                        VStack {
                            Button(action: {
                                print("Category \(categories[index].name) pressed")
                                clearSelected()
                                categories[index].selected.toggle()
                                
                            }) {
                                Image(categories[index].icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: 31)
                                    .foregroundColor(
                                        categories[index].selected ? .white : Color(red: 179 / 255, green: 179 / 255, blue: 195 / 255)
                                    )
                            }
                            .background(categories[index].selected ? Color("Accent") : .white)
                            .buttonStyle(CategoryButtonStyle())
                            .clipShape(Circle())
                            Text(categories[index].name).font(.custom("MarkPro", size: 12)).foregroundColor(categories[index].selected ? Color("Accent") : .black)
                        }
                        .padding(.leading, 10)
                    }
                }
            }
            .frame(height: 71)
        }.padding(.leading, 17)
    }
}

struct CategoryIconSelector_Previews: PreviewProvider {
    static var previews: some View {
        CategoryIconSelector()
    }
}
