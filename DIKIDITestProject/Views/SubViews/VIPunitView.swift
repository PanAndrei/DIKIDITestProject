//
//  VIPunitView.swift
//  DIKIDITestProject
//
//  Created by Andrei Panasenko on 14.12.2022.
//

import SwiftUI

struct VIPunitView: View {
    @State private var showAllert: Bool = false
    
    let vip: VIPUnit
    
    var body: some View {
        HStack {
            NavigationLink {
                URLToImageView(urlString: vip.images.originURL)
            } label: {
                HStack {
                    URLToImageView(urlString: vip.images.thumbURL, sizeX: 75, sizeY: 75)
                        .padding(.trailing, 8)
                    
                    VStack(alignment: .leading) {
                        Text(vip.name)
                            .lineLimit(1)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.black)
                        
                        Text(vip.categories?.randomElement() ?? "")
                        .lineLimit(1)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.gray)
                    }
                }
            }
            
            Spacer()
            
            Button {
                showAllert.toggle()
            } label: {
                Text("Записаться")
                    .foregroundColor(.white)
                    .padding(4)
                    .background(
                        Capsule()
                            .foregroundColor(.pink)
                    )
            }
        }
        .alert(isPresented: $showAllert) { () -> Alert in
            Alert(title: Text(""),
                  message: Text("Нужна регистрация"),
                  primaryButton: .destructive(Text("Лаадно")),
                  secondaryButton: .default(Text("Лаадно")))
        }
    }
}
