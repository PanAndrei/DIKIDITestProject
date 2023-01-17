//
//  CathalogUnitView.swift
//  DIKIDITestProject
//
//  Created by Andrei Panasenko on 14.12.2022.
//

import SwiftUI

struct CathalogUnitView: View {
    let cathalog: CatalogUnit
    
    var body: some View {
        NavigationLink {
            Text("тут будет описание \(cathalog.name)")
        } label: {
            HStack {
                URLToImageView(urlString: cathalog.images.thumbURL, sizeX: 90, sizeY: 90)
                
                VStack(alignment: .leading) {
                    Text(cathalog.name)
                        .lineLimit(2)
                        .font(.system(size: 18, weight: .bold))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                    
                    Text(cathalog.street + " " + cathalog.house)
                        .lineLimit(2)
                        .font(.system(size: 14, weight: .medium))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.black)
                    
                    HStack {
                        Text(String(format: "%.1f", cathalog.rating))
                            .lineLimit(1)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(.black)
                        
                        ForEach(1...5, id: \.self) { raiting in
                            Image(systemName: "star.fill")
                                .foregroundColor(Int(cathalog.rating) >= raiting ? Color.yellow : Color.gray)
                        }
                    }
                }
                
                Spacer()
            }
            .background(
            RoundedRectangle(cornerRadius: 5)
                .stroke()
                .foregroundColor(.gray.opacity(0.2))
                .shadow(radius: 1)
            )
        }
    }
}

// git test 4
