//
//  HomePageViewModel.swift
//  c2cp
//
//  Created by mac on 09.05.24.
//

import Foundation
import Combine

class HomeFirstPageViewModel: ObservableObject {
    @Published var videos: [C2Cyoutube] = []
    
    func fetchVideos() {
        guard let url = URL(string: "https://covertocoverbible.org/api/ApiC2CYoutube") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching videos: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            let decoder = JSONDecoder()
            if let fetchedVideos = try? decoder.decode([C2Cyoutube].self, from: data) {
                DispatchQueue.main.async {
                    self.videos = fetchedVideos
                }
            }
        }.resume()
    }
}
