//
//  HomeViewController.swift
//  iOS_Calculator
//
//  Created by Sergio López on 12/08/2020.
//  Copyright © 2020 Sergio López. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    
    // Resultados
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    // Números
    
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    
    // Operadores
    
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorSubstraction: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    @IBOutlet weak var operatorDecimal: UIButton!
    
    // MARK: - Inicialización
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Ciclos de vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI
        
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        
        operatorAC.round()
        operatorResult.round()
        operatorDecimal.round()
        operatorPercent.round()
        operatorAddition.round()
        operatorDivision.round()
        operatorPlusMinus.round()
        operatorSubstraction.round()
        operatorMultiplication.round()
        
    }
    
    // MARK: - Acciones de los botones
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        // Efecto Brillo
        
        sender.shine()
    }
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        // Efecto Brillo
        
        sender.shine()
    }
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        // Efecto Brillo
        
        sender.shine()
    }
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        // Efecto Brillo
        
        sender.shine()
    }
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        // Efecto Brillo
        
        sender.shine()
    }
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        // Efecto Brillo
        
        sender.shine()
    }
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        // Efecto Brillo
        
        sender.shine()
    }
    @IBAction func operatorDecimalAction(_ sender: UIButton) {
        // Efecto Brillo
        
        sender.shine()
    }
    @IBAction func numberAction(_ sender: UIButton) {
        
        // Efecto Brillo
        
        sender.shine()
    }
    
    
    
    
}
