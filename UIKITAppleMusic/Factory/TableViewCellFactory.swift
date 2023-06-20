//
//  TableViewCellFactory.swift
//  UIKITAppleMusic
//
//  Created by Filipe Ilunga on 19/06/23.
//

import UIKit

struct CellRepresentation {
    let bundle: Bundle?
    let nibName: String
    let cellIdentifier: String
}

enum CellType {
    case musicRow
    
    var cellIdentifier: String {
        switch self {
        case .musicRow:
            return "musicRowCellID"
        }
    }
    
    var nibName: String {
        switch self {
        case .musicRow:
            return "MusicRowTableViewCell"
        }
    }
}

extension UITableView {
    func registerAndDequeueReusableCell(cellType: CellType, indexPath: IndexPath) -> UITableViewCell {
        let cellRepresentation = cellType.cellRepresentation()
        
        let uINibCell: UINib = UINib(nibName: cellRepresentation.nibName, bundle: nil)
        
        self.register(uINibCell, forCellReuseIdentifier: cellRepresentation.cellIdentifier)

        let cell = self.dequeueReusableCell(withIdentifier: cellRepresentation.cellIdentifier, for: indexPath)
        
        return cell
    }
}

extension CellType {
    func cellRepresentation() -> CellRepresentation {
        switch self {
        default:
            return CellRepresentation(bundle: nil, nibName: self.nibName, cellIdentifier: self.cellIdentifier)
        }
    }
}

class TableViewCellFactory {
    static func createCell(cellType: CellType, for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cellRepresentation = cellType.cellRepresentation()
        
        let uINibCell: UINib = UINib(nibName: cellRepresentation.nibName, bundle: nil)
        
        tableView.register(uINibCell, forCellReuseIdentifier: cellRepresentation.cellIdentifier)

        let cell = tableView.dequeueReusableCell(withIdentifier: cellRepresentation.cellIdentifier, for: indexPath)
        
        return cell
    }
}
