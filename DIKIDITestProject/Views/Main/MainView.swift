//
//  MainView.swift
//  DIKIDITestProject
//
//  Created by Andrei Panasenko on 13.12.2022.
//

import SwiftUI


struct MainView: View {
    @ObservedObject var responseVM: ResponseViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                headerView
                
                ForEach(responseVM.order, id: \.self) { order in
                    buildViewInOrder(order: order)
                }
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    func buildViewInOrder(order: String) -> some View {
        switch order {
        case "vip": vipBlockView
        case "examples": examplesView
        case "catalog": cathalogView
        default: EmptyView()
        }
    }
    
    private var headerView: some View {
        ZStack {
            URLToImageView(urlString: responseVM.responseData?.data.mainImageURL)
            
            Text(responseVM.mainDescription)
                .foregroundColor(.white)
                .lineLimit(2)
                .font(.system(size: 22, weight: .bold))
                .multilineTextAlignment(.center)
        }
    }
    
    private var vipBlockView: some View {
        VStack {
            Rectangle()
                .background(Color.gray)
                .frame(height: 1)
                .opacity(0.2)
            
            HStack {
                Text("Премиум")
                    .padding(.trailing, 4)
                    .font(.system(size: 24, weight: .bold))
                
                Text(String(responseVM.premiumCount))
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("Реклама")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(3)
                    .background(
                        RoundedRectangle(cornerRadius: 2)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                    )
            }
            
            VStack {
                ForEach(responseVM.vipBlock) { vip in
                    VIPunitView(vip: vip)
                }
            }
        }
        .padding()
    }
    
    private var examplesView: some View {
        VStack {
            Rectangle()
                .background(Color.gray)
                .frame(height: 1)
                .opacity(0.2)
                .padding(.horizontal, 8)
            
            HStack {
                Text("Коллекция работ")
                    .font(.system(size: 24, weight: .bold))
                
                Spacer()
            }
            .padding(8)
            
            URLToImageView(urlString: responseVM.examplesImage)
            
            HStack {
                Text("Посмотрите фото работ и выберите куда записаться")
                    .lineLimit(2)
                    .font(.system(size: 12, weight: .medium))
                    .multilineTextAlignment(.leading)
                
                Spacer()
                
                NavigationLink {
                    Text("фото работ")
                } label: {
                    Text("Посмотреть")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.blue)
                        .padding(3)
                        .background(
                            RoundedRectangle(cornerRadius: 2)
                                .foregroundColor(.gray)
                                .opacity(0.3)
                        )
                }
            }
            .padding(.horizontal, 8)
        }
    }
    
    private var cathalogView: some View {
        VStack {
            Rectangle()
                .background(Color.gray)
                .frame(height: 1)
                .opacity(0.2)
            
            HStack {
                Text("Каталог")
                    .padding(.trailing, 4)
                    .font(.system(size: 24, weight: .bold))
                
                Text(responseVM.cathalogCount)
                    .font(.system(size: 24, weight: .medium))
                    .foregroundColor(.gray)
                
                Spacer()
            }
            
            ForEach(responseVM.cathalogUnits) { cathalod in
                CathalogUnitView(cathalog: cathalod)
            }
        }
        .padding()
    }
}

