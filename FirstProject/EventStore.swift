//
//  EventStore.swift
//  DoDream
//
//  Created by 이정후 on 2022/12/30.
//

import Foundation

@MainActor
class EventStore: ObservableObject {
    @Published var events = [Event]()
    @Published var preview: Bool
    
    init(preview: Bool = false) {
        self.preview = preview
        fetchEvents()
    }
    
    func fetchEvents() {
        if preview {
            events = Event.sampleEvents
        } else {
            // load from your presistence store
        }
    }
    
    func delete(_ event: Event) {
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            events.remove(at: index)
        }
    }
    
    func add(_ event: Event) {
        events.append(event)
    }
    
    func update(_ event: Event) {
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            events[index].date = event.date
            events[index].note = event.note
            events[index].eventType = event.eventType
        }
    }
}
