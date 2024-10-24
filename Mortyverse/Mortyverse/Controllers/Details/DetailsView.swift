//
//  DetailsView.swift
//  Mortyverse
//
//  Created by Mugalu on 24/10/2024.
//

import SwiftUI

struct DetailsView: View {
    @ObservedObject var viewModel: DetailsViewModel

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color("Background").edgesIgnoringSafeArea(.all) // Background Color

            if viewModel.isLoading {
                ProgressView("Loading...")
                    .padding()
            } else if let character = viewModel.character {
                ScrollView {
                    VStack(spacing: 24) {
                        // Character Image with back button floating on top
                        ZStack(alignment: .topLeading) {
                            AsyncImage(url: URL(string: character.image)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width - 32, height: 300)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .shadow(radius: 8)
                            } placeholder: {
                                ProgressView()
                            }

                            // Floating Back Button
                            Button(action: {
                                UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
                            }) {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.primary)
                                    .frame(width: 44, height: 44)
                                    .background(Circle().fill(Color.white))
                                    .shadow(radius: 4)
                            }
                            .padding(16)
                        }
                        .padding(.horizontal, 16)

                        // Character Name
                        HStack {
                            Text(character.name)
                                .font(.system(size: 28, weight: .bold))
                                .foregroundColor(Color("PrimaryText"))
                            Spacer()
                            // Status Button Aligned to the Right
                            Button(action: {}) {
                                Text(character.status)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(Capsule().fill(Color.blue))
                            }
                        }
                        .padding(.horizontal, 24)

                        // Character Species and Gender
                        Text("\(character.species) • \(character.gender)")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 24)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        // Location Section with Subtitle
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Location:" + character.location.name)
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal, 24)

                        Spacer()
                    }
                    .padding(.top, 16)
                }
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .navigationBarHidden(true) // Hide the default navigation bar
        .onAppear {
            // Fetch details if needed
            if viewModel.character == nil {
                viewModel.fetchCharacterDetails(id: 1) // Example ID
            }
        }
    }
}
