//
//  NoteTableViewCell.swift
//  NotesCore
//
//  Created by Dogukaim on 30.12.2023.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    
    static let identifier = "NoteTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    
    func setup(note: Note) {
        titleLabel.text = note.title
        descriptionLabel.text = note.desc
    }
    
}
