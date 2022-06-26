//
//  ContentView.swift
//  rain_finder_1.4
//
//  Created by Tomasz Zuczek on 26/06/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    let dataProvider = DataProvider()
    @State var myAirports: [Airport] = []
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }.onAppear(){
            dataProvider.loadCsvData(then: {result in
                switch result{
                case .success(let string):
                    let csvData = string.components(separatedBy: "\n").dropFirst().dropLast()
                    for airports in csvData{
                        let airport = airports.components(separatedBy: ",")
                        let myAirport = Airport(icaoCode: airport[1], type: airport[2], latitude: airport[4], longitude: airport[5])
                        myAirports.append(myAirport)
                        for airport in myAirports {
                                addAirport(airport: airport)
                                getRecordsCount()
                        }
                    }
                    
                case .failure(let error):
                    print("error \(error)")
                }
            })
            
        }
    }
    private func addAirport(airport: Airport) {
        let newAirport = AirportEntity(context: viewContext)
        newAirport.icaoCode = airport.icaoCode
        newAirport.type = airport.type
        newAirport.latitude = airport.latitude
        newAirport.longitude = airport.longitude
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func deleteAirport(airport: Airport){
        
    }
    
    private func getRecordsCount() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AirportEntity")
        do {
            let count = try viewContext.count(for: fetchRequest)
            print(count)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteAllData(_ entity:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try viewContext.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                viewContext.delete(objectData)
            }
        } catch let error {
            print("Detele all data in \(entity) error :", error)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
