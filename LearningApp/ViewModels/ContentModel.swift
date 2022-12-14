//
//  ContentModel.swift
//  LearningApp
//
//  Created by DEV-BC on 12/13/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    //store modules
    @Published var modules = [Module]()
    
    var styleData: Data?
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        //get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        //read the file into a data object and put it in a do try catch block
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            let decoder = JSONDecoder()
           
            do {
                //try to decode the json into an array of modules
                let modules = try decoder.decode([Module].self, from: jsonData)
                //assign parsed modules to modules property
                self.modules = modules
            } catch {
                print(error)
            }
            
        } catch {
            print(error)
        }
        
           //parse the style data
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
            
        } catch {
            print(error)
        }
        
    }
    
}
