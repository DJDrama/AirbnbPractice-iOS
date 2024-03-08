//
//  ExploreView.swift
//  AirbnbPractice
//
//  Created by Dongjun Lee on 3/7/24.
//

import SwiftUI

struct ExploreView: View {
    @State
    private var showDestinationSearchView = false
    
    @StateObject
    var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            if(showDestinationSearchView){
                DestinationSearchView(show: $showDestinationSearchView,
                viewModel: viewModel)
            }else{
                ScrollView {
                    SearchAndFilterBar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings){ listing in
                            NavigationLink(value: listing){
                                ListingItemView(listing: listing)
                            }
                        }
                    }
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
