//
//  VideoCardView.swift
//  c2cp
//
//  Created by mac on 09.05.24.
//


import SwiftUI

struct VideoCard: View {
    var video: C2Cyoutube
    
    var body: some View {
        VStack(alignment: .leading) {
            if let imagePath = video.picsPath, let url = URL(string: imagePath) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView() // Displayed while the image is loading
                    case .success(let image):
                        image.resizable()
                             .aspectRatio(contentMode: .fill)
                             .frame(width: 300, height: 200)
                             .clipped()
                    case .failure:
                        Image(systemName: "photo") // Displayed if the image fails to load
                             .frame(width: 300, height: 200)
                             .foregroundColor(.gray)
                             .background(Color.black.opacity(0.1))
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "photo.fill") // Default placeholder if no URL is available
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
                    .background(Color.black.opacity(0.1))
            }
            
            Text(video.title ?? "No Title Provided")
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.top, 8)
            
            Text("Hosted by: \(video.hosts)")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.bottom, 8)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}
