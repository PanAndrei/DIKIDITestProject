//
//  URLToImageView.swift
//  DIKIDITestProject
//
//  Created by Andrei Panasenko on 13.12.2022.
//

import SwiftUI

struct URLToImageView: View {
    @ObservedObject var urlToImageModel: URLToImageManager
    
    var sizeX: CGFloat?
    var sizeY: CGFloat?
    
    init(urlString: String?, sizeX: CGFloat, sizeY: CGFloat) {
        urlToImageModel = URLToImageManager(urlString: urlString)
        self.sizeX = sizeX
        self.sizeY = sizeY
    }
    
    init(urlString: String?) {
        urlToImageModel = URLToImageManager(urlString: urlString)
        sizeX = UIScreen.main.bounds.width
    }
    
    var body: some View {
        if urlToImageModel.image != nil {
            Image(uiImage: urlToImageModel.image!)
                .resizable()
                .scaledToFit()
                .frame(width: sizeX != nil ? sizeX : .none, height: sizeY != nil ? sizeY : .none)
        } else {
            preloadingImage
        }
    }
    
    private var preloadingImage: some View {
        RoundedRectangle(cornerRadius: 5)
            .foregroundColor(.gray)
            .frame(width: sizeX != nil ? sizeX : .none, height: sizeY != nil ? sizeY : .none)
    }
}

// test 333 
