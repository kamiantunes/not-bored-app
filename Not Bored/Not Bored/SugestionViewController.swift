//
//  SugestionViewController.swift
//  Not Bored
//
//  Created by Kamilla Mylena Teixeira Antunes on 20/06/22.
//

import UIKit

class SugestionViewController: UIViewController {

    var categorie = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = categorie
        view.backgroundColor = .backgroundHome
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
