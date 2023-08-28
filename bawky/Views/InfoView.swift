//
//  InfoView.swift
//  bawky
//
//  Created by Constantin Clerc on 28/08/2023.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Credits")
                    .font(.title2)
                VStack {
                    creditView(imageURL: URL(string: "https://avatars.githubusercontent.com/u/102235607?v=4"), name: "c22dev", description: "Main dev")
                    creditView(imageURL: URL(string: "https://avatars.githubusercontent.com/u/63671193?v=4"), name: "lrdsnow", description: "EzKFD")
                    creditView(imageURL: URL(string: "https://avatars.githubusercontent.com/u/68852354?v=4"), name: "hrtowii", description: "FunKFD")
                    creditView(imageURL: URL(string: "https://avatars.githubusercontent.com/u/68208717?v=4"), name: "Little34306", description: "Private kfd offsets")
                    creditView(imageURL: URL(string: "https://avatars.githubusercontent.com/u/59540996?v=4"), name: "leminlimez", description: "Cowabunga")
                    creditView(imageURL: URL(string: "https://avatars.githubusercontent.com/u/121408851?v=4"), name: "straight-tamago", description: "Exploit Help")
                    creditView(imageURL: URL(string: "https://avatars.githubusercontent.com/u/85764897?v=4"), name: "haxi0", description: "The view you're viewing right now !")
                    creditView(imageURL: URL(string: "https://avatars.githubusercontent.com/u/53051058?v=4"), name: "felix-pb", description: "KFD Exploit")
                }
                .padding()
                Text("Socials")
                    .font(.title2)
                Spacer()
                VStack{
                    Button(action: {
                        UIApplication.shared.open(URL(string: "https://discord.gg/8gMyK6DSnB")!)
                    }) {
                        HStack(spacing: 10) {
                            AsyncImage(url: URL(string: "https://i.ibb.co/7YHgcTM/2023-08-28-0rg-Kleki.png")) { phase in
                                switch phase {
                                case .empty:
                                    // Placeholder view while the image is loading
                                    Color.gray.frame(width: 10, height: 19)
                                case .success(let image):
                                    // Loaded image
                                    image
                                        .resizable()
                                        .frame(width: 19, height: 19)
                                case .failure:
                                    // Error view if image loading fails
                                    Image(systemName: "exclamationmark.circle.fill")
                                        .resizable()
                                        .frame(width: 19, height: 19)
                                @unknown default:
                                    // Fallback view
                                    Color.gray.frame(width: 19, height: 19)
                                }
                            }
                            Text("Discord")
                                .fontWeight(.bold)
                        }

                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    Button(action: {
                        UIApplication.shared.open(URL(string: "https://ko-fi.com/c22dev")!)
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                            Text("Donate!")
                                .fontWeight(.bold)
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
            .padding()
            .listStyle(.insetGrouped)
        }.navigationBarTitle("Info", displayMode: .inline)
    }
    
    private func creditView(imageURL: URL?, name: String, description: String) -> some View {
        HStack {
            AsyncImage(url: imageURL, content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 35, maxHeight: 35)
                    .cornerRadius(20)
            }, placeholder: {
                ProgressView()
                    .frame(maxWidth: 35, maxHeight: 35)
            })
            
            VStack(alignment: .leading) {
                Button(name) {
                    if let url = URL(string: "https://github.com/\(name)") {
                        UIApplication.shared.open(url)
                    }
                }
                .font(.headline.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                
                Text(description)
                    .font(.system(size: 13))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    InfoView()
}
