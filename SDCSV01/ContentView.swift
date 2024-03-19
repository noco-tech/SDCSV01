//
//  ContentView.swift
//  SDCSV01
//
//  Created by hiro on 2024/03/19.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort:[SortDescriptor(\DeviceName.device)]) private var devices: [DeviceName]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(devices) { item in
                    NavigationLink {
                        Text("\(item.device) の画面サイズ: \(item.screenSize)")
                    } label: {
                        Text(item.device)
                    }
                }
//                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: loadCSV) {
                      Text("Load CSV")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }
    
    private func loadCSV() {
//        print("Load CSV")
        let mainBundle = Bundle.main
        if let path = mainBundle.path(forResource: "device", ofType:  "csv") {
            if let instr = try? String(contentsOfFile: path) {
                instr.enumerateLines{ (line, stop) -> () in
//                  print("line=>\(line)<") // 1行の内容を確認
                    let compo = line.components(separatedBy: ",")
//                    print("compo[0]=「\(compo[0])」, compo[1]=「\(compo[1])」")
                    let newItem = DeviceName(device: compo[0], screenSize: compo[1])
                    modelContext.insert(newItem)
                }
            }
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = DeviceName(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: DeviceName.self, inMemory: true)
}
