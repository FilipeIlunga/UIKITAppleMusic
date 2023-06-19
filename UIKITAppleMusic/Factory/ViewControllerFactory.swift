//
//  ViewControllerFactory.swift
//  UIKITAppleMusic
//
//  Created by Filipe Ilunga on 19/06/23.
//

import Foundation

import UIKit

struct StoryboardRepresentation {
    let bundle: Bundle?
    let storyboardName: String
    let storyboardId: String
}

enum TypeOfViewController {
    case home
    case detail
    
    var storyboardId: String {
        switch self {
        case .home:
            return "HomeViewControllerID"
        case .detail:
            return "DetailViewViewControllerID"
        }
    }
    
    var storyboardName: String {
        switch self {
        case .home:
            return "Main"
        case .detail:
            return "Main"
        }
    }
}

extension TypeOfViewController {
    func storyboardRepresentation() -> StoryboardRepresentation {
        switch self {
        case .home:
            return StoryboardRepresentation(bundle: nil, storyboardName: self.storyboardName, storyboardId: self.storyboardId)
        case .detail:
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
