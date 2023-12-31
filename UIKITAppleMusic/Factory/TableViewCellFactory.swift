//
//  TableViewCellFactory.swift
//  UIKITAppleMusic
//
//  Created by Filipe Ilunga on 19/06/23.
//

import UIKit

 protocol AutoLayoutRepresentation {
    //Não sei oq esse camarada faz
    var bundle: Bundle? {get set}
    // Nome do arquivo
    var fileName: String {get set}
    //Id da Xib ou storyboard
    var identifier: String {get set}
}

//MARK: PASSOS PARA CRIAR UMA CÉLULA

//MARK: 1 - Criar uma struct para a célula customizável
fileprivate struct MusicRowCell: AutoLayoutRepresentation {
    var bundle: Bundle?
    var fileName: String
    var identifier: String
}

fileprivate struct EmptyFavorityCell: AutoLayoutRepresentation {
    var bundle: Bundle?
    var fileName: String
    var identifier: String
}

fileprivate struct AlbumImageCell: AutoLayoutRepresentation{
    var bundle: Bundle?
    var fileName: String
    var identifier: String
}

enum CellType {
    //MARK: 2 - Adicionar uma case  dela na cellType
    case musicRow
    case emptyFavorite
    case albumImage
    
    // id da xib
    var identifier: String {
        switch self {
        case .musicRow:
            return "musicRowCellID"
        case .emptyFavorite:
            return "emptyFavoriteCell"
        case .albumImage:
            return "AlbumImage"
        }
    }
    
    //É o nome do arquivo da xib
    var fileName: String {
        switch self {
        case .musicRow:
            return "MusicRowTableViewCell"
        case .emptyFavorite:
            return "EmptyFavoriteTableViewCell"
        case .albumImage:
            return "AlbumImageTableViewCell"
        }
    }
}

extension CellType {
    func cellRepresentation() -> AutoLayoutRepresentation {
        switch self {
        //MARK:  3 - Criar uma representacao dela
        case .musicRow:
            return MusicRowCell(fileName: self.fileName, identifier: self.identifier)
        case .emptyFavorite:
            return EmptyFavorityCell(fileName: self.fileName, identifier: self.identifier)
        case .albumImage:
            return AlbumImageCell(fileName: self.fileName, identifier: self.identifier)
        }
    }
}

// Não é necessário mexer nessa class
class TableViewCellFactory {
    static func createCell(cellType: CellType, for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        let cellRepresentation = cellType.cellRepresentation()
        
        //Pegamos em cache o arquivo da xib e armazenamos ela nessa variável
        let uiNibCell: UINib = UINib(nibName: cellRepresentation.fileName, bundle: nil)
        
        //Registramos a celula na table view
        tableView.register(uiNibCell, forCellReuseIdentifier: cellRepresentation.identifier)
       
        let cell = tableView.dequeueReusableCell(withIdentifier: cellRepresentation.identifier, for: indexPath)
        
        return cell
    }
}


fileprivate struct CategoryCell: AutoLayoutRepresentation {
    var bundle: Bundle?
    var fileName: String
    var identifier: String
}

enum CollectionViewCellType {
    case category
    
    var identifier: String {
        switch self {
        case .category:
            return "categoryCellID"
        }
    }
    
    var fileName: String {
        switch self {
        case .category:
            return "CategoryCollectionViewCell"
        }
    }
}

extension CollectionViewCellType {
    func cellRepresentation() -> AutoLayoutRepresentation {
        switch self {
        case .category:
            return CategoryCell(fileName: self.fileName, identifier: self.identifier)
        }
    }
}

class CollectionViewCellFactory {
    static func createCell(cellType: CollectionViewCellType, for collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellRepresentation = cellType.cellRepresentation()
        
        //Pegamos em cache o arquivo da xib e armazenamos ela nessa variável
        let uiNibCell: UINib = UINib(nibName: cellRepresentation.fileName, bundle: nil)
        
        //Registramos a celula na table view
        collectionView.register(uiNibCell, forCellWithReuseIdentifier: cellRepresentation.identifier)
       
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellRepresentation.identifier, for: indexPath)
        
        return cell
    }
}



