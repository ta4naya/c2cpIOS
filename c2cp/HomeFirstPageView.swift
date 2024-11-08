import SwiftUI


struct HomeFirstPageView: View {
    @ObservedObject private var viewModel = HomeFirstPageViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                                 
                    let news = viewModel.carousel
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack {
                            Text("Carousel")
                                .font(.headline)
                        }
                        HStack(spacing: 0) {
                            if  let titles = news?.picsPath {
                                Text("News: \(titles)")
                            }
                            ForEach(viewModel.carousels, id: \.id) { carousel in
                                if let path = carousel.picsPath, let url = URL(string: path) {
                                    AsyncImage(url: url) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.width, height: 300)
                                    .clipped()
                                }
                            }
                        } .frame(height: 300)
                    }
                    .padding(.horizontal)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    
                  
                    
                    if let news = viewModel.latestNews, let newsImageURLString = news.picsPath,let url = URL(string: newsImageURLString){
                        VStack {
                            HStack {
                                Text("Latest News")
                                    .font(.headline)
                            }
                            HStack {
                                if  let titles = news.title {
                                    Text("News: \(titles)")
                                        .padding()
                                        .lineLimit(nil) // Allows text to wrap onto multiple lines
                                        .fixedSize(horizontal: false, vertical: true) // Ensures the Text view grows vertically
                                        .background(RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.black, lineWidth: 1))
                                }
                                Spacer()
                                
                                // NavigationLink to open the image in a new WebView
                                NavigationLink(destination: HtmlWebView(htmlContent: news.content ?? "Nothing")){
                                    if let imageURLString = news.picsPath, let imageURL = URL(string: imageURLString) {
                                        AsyncImage(url: imageURL) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView() // Shows a loading indicator while the image is loading
                                        }
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 200)
                                    } else {
                                        Image("tree") // Use a default placeholder image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 100, height: 100)
                                    }
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .padding()
                        
                    } else {
                        Text("Loading Latest news")
                            .padding()
                            .onAppear {
                                print("News data not available yet")
                                
            
                            }            }
                    

                    VStack {
                        
                            HStack {
                                Text("Latest News")
                                    .font(.headline)
                            }     
                        
                            ScrollView(.horizontal,showsIndicators: false) {
                                       HStack(spacing: 15) {
                                           ForEach(viewModel.dailyVerse,id: \.id) { verse in
                                               if let imagePath = verse.picsPath, let url = URL(string: imagePath) {
                                                   AsyncImage(url: url) { image in
                                                       image.resizable()
                                                           .aspectRatio(contentMode: .fill)
                                                           .frame(width: 200, height: 200)
                                                           .clipped()
                                                   } placeholder: {
                                                       ProgressView()
                                                   }
                                               }
                                           }
                                       }
                                       .padding(.top, 10)
                                   }
                                 
                        
                                   
                                   Spacer()
                               }
                               .padding(.leading, 10)
                               .padding(.horizontal)
                               .background(Color(.systemGray6))
                               .cornerRadius(12)
                               .shadow(radius: 5)
                               .padding()                 
                    if let video = viewModel.latestVideo, let videoURLString = video.videoURL, let url = URL(string: videoURLString) {
                        VStack {
                            HStack {
                                Text("Latest Cover2Cover")
                                    .font(.headline)
                            }
                            
                            HStack {
                                Text("Day \(video.day)")
                                    .padding()
                                    .lineLimit(nil) // Allows text to wrap onto multiple lines
                                    .fixedSize(horizontal: false, vertical: true) // Ensures the Text view grows vertically
                                    .background(RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 2))
                                
                                Spacer()
                                
                                // NavigationLink to open the image in a new WebView
                                NavigationLink(destination: VideoWebView(url: url)) {
                                    if let imageURLString = video.picsPath, let imageURL = URL(string: imageURLString) {
                                        AsyncImage(url: imageURL) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView() // Shows a loading indicator while the image is loading
                                        }
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 250, height: 200)
                                    } else {
                                        Image("defaultImage") // Use a default placeholder image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 200, height: 200)
                                    }
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .shadow(radius: 5)
                        .padding()
                        
                    } else {
                        Text("Loading latest video...")
                            .padding()
                    }
                   
                }
                .edgesIgnoringSafeArea(.bottom)
                .onAppear {
                    viewModel.fetchLatestVideo()
                    viewModel.fetchLatestNews()
                    viewModel.fetchCarousels()
                    viewModel.fetchDailyVerses()
                }
                
            }
        }
    }
    
}
