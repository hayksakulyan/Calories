//
//  EditFoodView.swift
//  Calories
//
//  Created by Hayk Sakulyan on 24.08.23.
//

import SwiftUI

struct EditFoodView: View {
    @Environment (\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    
    var food: FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    
    var body: some View {
        Form {
            Section {
                TextField("\(food.name!)", text: $name)
                    .onAppear {
                        name = food.name!
                        calories = food.calories
                    }
                VStack {
                    Text("Calories \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                HStack {
                    Button {
                        DataController().editFood(food: food, name: name, calories: calories, context: managedObjectContext)
                        dismiss()
                    } label: {
                        Text("Submit")
                    }

                }
            }
        }
    }
}

//struct EditFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditFoodView()
//    }
//}
