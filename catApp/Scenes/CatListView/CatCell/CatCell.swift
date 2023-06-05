//
//  CatCell.swift
//  catApp
//
//  Created by alejandro on 5/06/23.
//

import UIKit

class CatCell: UICollectionViewCell {
    static let identifier: String = "CatCell"
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var origin: UILabel!
    @IBOutlet weak var intelligence: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var reuseIdentifier: String? {
        return CatCell.identifier
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        name.text = nil
        origin.text = nil
        intelligence.text = nil
        image.image = nil
    }
    func setdata(model: CatModel) {
        self.name.text = model.name
        self.origin.text = model.origin
        self.intelligence.text = String(model.intelligence)
    }

}
