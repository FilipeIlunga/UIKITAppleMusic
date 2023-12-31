//
//  ViewControllerFactory.swift
//  UIKITAppleMusic
//
//  Created by Filipe Ilunga on 19/06/23.
//

import Foundation

import UIKit

struct StoryboardRepresentation {
    let bundle: Bundle? //oq é?
    let storyboardName: String
    let storyboardId: String
}

enum TypeOfViewController {
    case library
    case favorites
    case search
    case libraryCollection
    case playlist
    case songs
    case individualSong
    
    var storyboardId: String {
        #warning("COLOCAR OS NOMES PLSSS")
        switch self {
        case .library:
            return "HomeViewControllerID"
        case .favorites:
            return "DetailViewViewControllerID"
        case .search:
            return ""
        case .libraryCollection:
            return "LibraryCollectionID"
        case .playlist:
            return "PlaylistViewController"
        case .songs:
            return "SongsListViewController"
        case .individualSong:
            return "PlayingSong"
        }
    }
    
    var storyboardName: String {
        switch self {
        case .library:
            return "Main"
        case .favorites:
            return "Main"
        case .libraryCollection:
            return "LibraryCollection"
        case .search:
            return "Main"
        case .playlist:
            return "PlaylistView"
        case .songs:
            return "SongsListView"
        case .individualSong:
            return "PlayingSong"
        }
    }
}

extension TypeOfViewController {
    func storyboardRepresentation() -> StoryboardRepresentation {
        switch self {
        default:
            return StoryboardRepresentation(bundle: nil, storyboardName: self.storyboardName, storyboardId: self.storyboardId)

        }
    }
}

class ViewControllerFactory: NSObject {
    static func viewController(for typeOfVC: TypeOfViewController) -> UIViewController {
        let metada = typeOfVC.storyboardRepresentation()
        let storyboard = UIStoryboard(name: metada.storyboardName, bundle: metada.bundle)
        let viewController = storyboard.instantiateViewController(withIdentifier: metada.storyboardId)
        return viewController
    }
}
