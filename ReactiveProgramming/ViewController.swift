//
//  ViewController.swift
//  ReactiveProgramming
//
//  Created by Zin Min Phyo on 06/09/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = GetTopRatedMovieListsService()
        service.getTopRated(page: 1) { result in
            print("Result is \(result)")
        }
    }


}

