@_private(sourceFile: "ContentView.swift") import SDCSV01
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftData
import SwiftUI

extension ContentView {
    @_dynamicReplacement(for: deleteItems(offsets:)) private func __preview__deleteItems(offsets: IndexSet) {
        #sourceLocation(file: "/Users/penguin/Documents/dev/swift-project/SDCSV01/SDCSV01/ContentView.swift", line: 50)
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: addItem()) private func __preview__addItem() {
        #sourceLocation(file: "/Users/penguin/Documents/dev/swift-project/SDCSV01/SDCSV01/ContentView.swift", line: 43)
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/penguin/Documents/dev/swift-project/SDCSV01/SDCSV01/ContentView.swift", line: 16)
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label(__designTimeString("#8383.[2].[2].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].arg[0].value", fallback: "Add Item"), systemImage: __designTimeString("#8383.[2].[2].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[1].arg[0].value.[0].arg[1].value.[0].arg[1].value", fallback: "plus"))
                    }
                }
            }
        } detail: {
            Text(__designTimeString("#8383.[2].[2].property.[0].[0].arg[1].value.[0].arg[0].value", fallback: "Select an item"))
        }
    
#sourceLocation()
    }
}

import struct SDCSV01.ContentView
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}



