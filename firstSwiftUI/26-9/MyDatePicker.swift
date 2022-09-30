//
//  MyDatePicker.swift
//  firstSwiftUI
//
//  Created by OmarMattr on 26/09/2022.
//

import SwiftUI

struct MyDatePicker: View {
    @State var dateSelection:Date = Date()
    let startDate = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endDate = Date()
    var dateFormatter :DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }
    var body: some View {
        VStack{
            Text(dateFormatter.string(from: dateSelection))
            DatePicker("select a date", selection: $dateSelection,in: startDate...endDate,displayedComponents: [.date])
                .accentColor(.red)
                .datePickerStyle(.compact)
                .padding(.horizontal)
        }
        
    }
}

struct MyDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        MyDatePicker()
    }
}
