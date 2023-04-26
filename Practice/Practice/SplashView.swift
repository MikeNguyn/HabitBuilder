//
//  SplashView.swift
//  Practice
//
//  Created by Minh Nguyen on 4/26/23.
//

import SwiftUI

struct SplashView: View {
    let screenSize: CGRect = UIScreen.main.bounds
    @State var loading = true
    @StateObject var store = HabitStore()
    var body: some View {
        if loading {
            ZStack {
                Color.green
                    .opacity(0.8)
                    .ignoresSafeArea()
                
                VStack {
                    Image("cactusemoji")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                        .frame(width: screenSize.width/4, height: screenSize.width/4)
                    Text("Habit Garden")
                }
            }.onAppear{
                print(0)
                HabitStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let habits):
                        store.habits = habits
                    }
                }
                print(1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                    self.loading = false
                }
            }
        } else {
            ContentView(habitList: $store.habits) {
                HabitStore.save(habits: store.habits) { result in
                    if case .failure(let error) = result {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .onAppear{
                print(2)
            }
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
