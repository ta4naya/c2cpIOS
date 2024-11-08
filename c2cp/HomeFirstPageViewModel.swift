//
//  HomeFirstPageViewModel.swift
//  c2cp
//
//  Created by mac on 09.05.24.
//

import Foundation
import Combine

class HomeFirstPageViewModel: ObservableObject {
    @Published var latestVideo: C2Cyoutube?
    @Published var latestNews: LatestNews?
    @Published var carousel: Carousel?
    @Published var dailyVerse: [DailyVerse] = []
    @Published var carousels: [Carousel] = []
    init() {
        fetchLatestVideo()
        fetchLatestNews()
        fetchCarousels()

    }
    
    func fetchLatestVideo() {
        guard let url = URL(string: "https://covertocoverbible.org/api/ApiC2Cyoutube/latest") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching video: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            // Print the JSON string for debugging
            let jsonString = String(data: data, encoding: .utf8)
            print("Received JSON string: \(jsonString ?? "Invalid JSON Data")")
            
            let decoder = JSONDecoder()
            do {
                let fetchedVideo = try decoder.decode(C2Cyoutube.self, from: data)
                DispatchQueue.main.async {
                    self.latestVideo = fetchedVideo
                }
            } catch {
                print("Failed to decode video: \(error)")
            }
        }.resume()
    }
    
    func fetchLatestNews() {
        guard let url = URL(string: "https://covertocoverbible.org/api/ApiPostNews/latest") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching News: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            // Print the JSON string for debugging
            let jsonString = String(data: data, encoding: .utf8)
            print("Received JSON string: \(jsonString ?? "Invalid JSON Data")")
            
            let decoder = JSONDecoder()
            do {
                let fetchedNews = try decoder.decode(LatestNews.self, from: data)
                DispatchQueue.main.async {
                    self.latestNews = fetchedNews
                }
            } catch {
                print("Failed to decode news: \(error)")
            }
            
        }.resume()
    }
    func fetchCarousels() {
        guard let url = URL(string: "https://covertocoverbible.org/api/ApiC2Cyoutube/carousels") else {
            print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching carousels: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            let decoder = JSONDecoder()
            do {
                let fetchedCarousels = try decoder.decode([Carousel].self, from: data)
                DispatchQueue.main.async {
                    self.carousels = fetchedCarousels
                }
            } catch {
                print("Failed to decode carousels: \(error)")
            }
        }.resume()
    }
    func fetchDailyVerses() {
            guard let url = URL(string: "https://covertocoverbible.org/api/ApiC2Cyoutube/dailyverse") else {
                print("Invalid URL")
                return
            }

            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                    return
                }

                guard let data = data else {
                    print("No data")
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let verses = try decoder.decode([DailyVerse].self, from: data)
                    DispatchQueue.main.async {
                        self.dailyVerse = verses
                    }
                } catch {
                    print("Error decoding data: \(error.localizedDescription)")
                    
                }
            }.resume()
        }
}
