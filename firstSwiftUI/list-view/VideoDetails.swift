//
//  VideoDetails.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 05/08/2022.
//

import SwiftUI

struct VideoDetails: View {
    var video:Video
    var body: some View {
        VStack( spacing: 20){
            Spacer()
            Image(video.imageName).resizable().scaledToFit().frame( height: 150).cornerRadius(8)
            Text(video.title).font(.title2).fontWeight(.semibold).lineLimit(2).multilineTextAlignment(.center).padding(.horizontal)
            HStack( spacing: 40){
                Label("\(video.viewCount)", systemImage: "eye.fill").font(.subheadline).foregroundColor(.secondary)
                
                Text(video.uploadDate).font(.subheadline).foregroundColor(.secondary)
            }
            Text(video.description).font(.body).padding()
            Spacer()
            Link(destination: video.url) {
                Text("Watch Now").bold().font(.title2).frame(width: 200, height: 50)
                    .background(.red).foregroundColor(.white).cornerRadius(8)

            }

        }
    }
}

struct VideoDetails_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetails(video: VideoList.topTen.first!)
    }
}
