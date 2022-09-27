//
//  ListView.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 03/09/2022.
//

import SwiftUI

struct ListView: View {
    @State var books : [Book] = [Book(name: "omar", auther: "mattr"),Book(name: "mmm", auther: "jjjjj")]
    var body: some View {
        NavigationView {
            
            List{
              //  Section("xx"){
                    ForEach(books) { book in
                        VStack (alignment: .leading, content: {
                            Text("\(book.id.hashValue)")
                            HStack {
                                Text(book.name)
                                Spacer()
                                Text(book.auther)
                                Spacer()
                            }.padding(.vertical,16)
                        })
                    }
                    .onDelete { indexSet in
                        books.remove(atOffsets: indexSet)
                    }
                    .onMove { indexSet, to in
                        books.move(fromOffsets: indexSet, toOffset: to)
                    }
                
           // }
            }
            .navigationBarItems(leading: EditButton(),trailing: Button("Add"){
                books.append(Book(name: "new", auther: "new"))
            })
            .navigationTitle("My List")
        }
      
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
struct Book:Identifiable{
    let id=UUID()
    let name,auther:String
}
