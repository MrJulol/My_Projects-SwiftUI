//
//  ContentView.swift
//  Note-Taking
//
//  Created by Julian Thaler on 29/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var items: [NoteItem] = {
        guard let data = UserDefaults.standard.data(forKey: "notes") else { return [] }
        if let json = try? JSONDecoder().decode([NoteItem].self, from: data) {
            return json
        }
        return []
    }()
    
    @State var taskText: String = ""
    @State var showAlert = false
    @State var deleteall = false
    @State var itemToDelete: NoteItem?
    
    var deleteAlert: Alert {
        Alert(title: Text("Hey!"),
              message: Text("Are you sure you want to delete this item?"),
              primaryButton: .destructive(Text("Delete"), action: deleteNote),
              secondaryButton: .cancel())
    }
    
    var deleteAllAlert: Alert {
        Alert(title: Text("Hey!"),
              message: Text("Are you sure you want to delete all items?"),
              primaryButton: .destructive(Text("Delete"), action: deleteAllNotes),
              secondaryButton: .cancel())
    }
    
    var inputView: some View {
        HStack {
            TextField("Write a new note ...", text: $taskText)
                .padding(EdgeInsets(top: 6, leading: 16, bottom: 0, trailing: 16))
                .clipped()
                .onSubmit {
                    didTapAddTask()
                }
            Button(action: didTapAddTask, label: { Text("NOTE!") }).padding(8)
        }
    }
    
    var listView:some View{
        List(items) { item in
            HStack{
                VStack(alignment: .leading) {
                    Text(item.dateText).font(.headline)
                    Text(item.text).lineLimit(nil).multilineTextAlignment(.leading)
                }
                .onLongPressGesture {
                    self.itemToDelete = item
                    self.showAlert = true
                }
                .padding(10)
                
                Spacer()
                
                VStack{
                    Button{
                        self.itemToDelete = item
                        self.showAlert = true
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
        .alert(isPresented: $showAlert, content: {
            deleteAlert
        })
    }
    
    var body: some View {
        ZStack {
            BackgroundView(color: Color.black)
            VStack {
                inputView
                
                Divider()
                
                listView
                
                Spacer()
                
                Button{
                    deleteall.toggle()
                } label: {
                    Text("Mark all as done")
                }
                .padding(8)
                .alert(isPresented: $deleteall, content: {deleteAllAlert})
                .keyboardShortcut("d")
            }
            
        }
    }
    
    func didTapAddTask() {
        let id = items.reduce(0) { max($0, $1.id) } + 1
        items.insert(NoteItem(id: id, text: taskText), at: 0)
        taskText = ""
        save()
    }
    
    func deleteNote() {
        guard let itemToDelete = itemToDelete else { return }
        items = items.filter { $0 != itemToDelete }
        save()
    }
    
    func save() {
        guard let data = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.set(data, forKey: "notes")
        for item in items {print(String(item.id) + " : " + item.text)}
    }
    
    func deleteAllNotes(){
        for item in items {
            self.itemToDelete = item
            deleteNote()
        }
    }
}

#Preview {
    ContentView()
}
