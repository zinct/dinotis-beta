//
//  ComicView.swift
//  DinotisSampleProject
//
//  Created by Indra Mahesa on 02/06/23.
//

import SwiftUI
import DinotisData

struct ComicView: View {
    @ObservedObject var viewModel: ComicViewModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Text("\((viewModel.dummyData.value ?? []).count) Total (Comic)")
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                if viewModel.dummyData == .loading {
                    HStack {
                        Spacer()
                        ProgressView()
                            .scaleEffect(2)
                        Spacer()
                    }
                    .padding(.vertical, 100)
                } else {
                    List {
                        ForEach(viewModel.dummyData.value ?? [], id: \.self) { v in
                            NavigationLink(destination: DetailComicView(name: v.name.orEmpty())) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(v.name.orEmpty())
                                            .fontWeight(.semibold)
                                        
                                        HStack {
                                            Text("Data: \(v.startYear.orEmpty())")
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    Text("Detail")
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        Task {
                            await viewModel.getData()
                        }
                    }
                }
                
                Spacer()
                    .navigationTitle("Comic Vine")
            }
            .background(Color.white)
        }
        .onAppear {
            Task {
                await viewModel.getData()
            }
        }
    }
}

struct DetailComicView: View {
    let name: String
    var body: some View {
        Text(name)
    }
}

struct ComicView_Previews: PreviewProvider {
    static var previews: some View {
        ComicView(viewModel: ComicViewModel())
    }
}
//
//import UIKit
//
//class DummyViewController: UIViewController {
//    
//    private let button: UIButton!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        button.titleLabel?.text = "Button"
//        
//        
//    }
//}
