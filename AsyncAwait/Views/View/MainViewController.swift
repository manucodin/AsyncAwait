//
//  MainViewController.swift
//  AsyncAwait
//
//  Created by Manuel Rodriguez Sebastian on 12/2/23.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var madridWeatherLabel: UILabel!
    @IBOutlet weak var madridTempLabel: UILabel!
    
    @IBOutlet weak var barcelonaWeatherLabel: UILabel!
    @IBOutlet weak var barcelonaTempLabel: UILabel!
    
    @IBOutlet weak var sevillaWeatherLabel: UILabel!
    @IBOutlet weak var sevillaTempLabel: UILabel!
    
    private let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Task {
            await fetchWeatherInfo()
        }
    }
    
    func fetchWeatherInfo() async {
        await viewModel.fetchWeatherInfo()
        
        setupMadridInfo()
        setupBarcelonaInfo()
        setupSevillaInfo()
    }
    
    private func setupMadridInfo() {
        madridWeatherLabel.text = viewModel.madridWeatherInfoText
        madridTempLabel.text = viewModel.madridTempText
    }
    
    private func setupBarcelonaInfo() {
        barcelonaWeatherLabel.text = viewModel.barcelonaWeatherInfoText
        barcelonaTempLabel.text = viewModel.barcelonaTempText
    }
    
    private func setupSevillaInfo() {
        sevillaWeatherLabel.text = viewModel.sevillaWeatherInfoText
        sevillaTempLabel.text = viewModel.sevillaTempText
    }
}
