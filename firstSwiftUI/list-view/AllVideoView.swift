//
//  SwiftUIView.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 05/08/2022.
//

import SwiftUI

struct AllVideoView: View {
    var videos:[Video] = VideoList.topTen
    var body: some View {
        NavigationView{
            List(videos,id: \.id){ video in
                NavigationLink (destination: VideoDetails(video: video)) {
                    VideoCell(video: video)
                }
                
            }
            .navigationTitle("omar List")
        }
    }
}

struct AllVideoView_Previews: PreviewProvider {
    static var previews: some View {
        AllVideoView()
    }
}

struct VideoCell: View {
    var video:Video
    var body: some View {
        HStack{
            Image(video.imageName).resizable().scaledToFit().frame(height: 70).cornerRadius(8).padding(.vertical,8)
            VStack(alignment: .leading,spacing: 8){
                Text(video.title).fontWeight(.bold).lineLimit(2).minimumScaleFactor(0.8)
                Text(video.uploadDate).font(.subheadline).foregroundColor(.red)
                
            }
        }
    }
}
