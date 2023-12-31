//
//  DetailNote.swift
//  NotesCore
//
//  Created by Dogukaim on 28.12.2023.
//

import UIKit

class DetailNote: UIViewController {

    
    static let identifier = "DetailNote"
    
    var note: Note!
    weak var delegate: ListNoteDelegate?
    
    
    @IBOutlet var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = note?.text
        
    }

    override func viewDidAppear(_ animated: Bool) {
        textView.becomeFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func updateNote() {
        note.lastUpdated = Date()
        delegate?.refreshNotes()
    }
    
    private func deleteNote() {
        
        if let id = note.id {
            delegate?.deleteNote(with: id)
        }
        
    }
    


}


extension DetailNote: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        note?.text = textView.text
        if note?.title.isEmpty ?? true {
            deleteNote()
        }else {
            updateNote()
        }
    }
}


