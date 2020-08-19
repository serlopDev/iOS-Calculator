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
    
    // MARK: - Variables
    
    private var total:Double = 0                    // Total de nuestro calculo
    private var temp:Double = 0                     // Datos temporales que mostraremos en el visor
    private var operating:Bool = false              // Si estamos operando o no
    private var decimal:Bool = false                // Si tenemos números decimales
    private var operation:OperationType = .none     // Definir los calculos posibles
    
    // MARK: - Constantes
    
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaximumLength = 9
    private let kTotal = "total"
    
    private enum OperationType {
        case none, adicction, substraction, division, multiplication, percent
    }
    
    
    //MARK: - Formateadores
    
    // Formateador de valores auxiliares
   
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
    } ()
    
    
    // Formateador de valores por pantalla por defecto
    
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.maximumIntegerDigits = 9
        formatter.maximumFractionDigits = 8
        formatter.minimumFractionDigits = 0
        
        return formatter
    } ()
    
    // Formateador de valores cientificos
    
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
        
        return formatter
    } ()
    
    // Formateador auxiliar de total
    
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        
        return formatter
    }()
    
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
        
        operatorDecimal.setTitle(kDecimalSeparator, for: .normal)
        total = UserDefaults.standard.double(forKey: kTotal)
        result()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
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
        
        clean()
        
        sender.shine()
    }
    
    @IBAction func equalAction(_ sender: UIButton) {
        
        result()
        sender.shine()
    }
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        
        temp = temp * (-1)
        resultsLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        sender.shine()
    }
    
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        
        if operation != .percent {
            result()
        }
        
        operating = true
        operation = .percent
        result()
        
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .division
        
        sender.selectOperation(selected: true)
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .adicction
                
        sender.selectOperation(selected: true)
        sender.shine()
    }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .substraction
        
        sender.selectOperation(selected: true)
        sender.shine()
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .multiplication
        
        sender.selectOperation(selected: true)
        sender.shine()
    }
    
    @IBAction func operatorDecimalAction(_ sender: UIButton) {
        
        let currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        if !operating && currentTemp.count > kMaximumLength {
            return
        }
        
        resultsLabel.text = resultsLabel.text! + kDecimalSeparator
        decimal = true
        
        visualSelectedOperation()
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        
        operatorAC.setTitle("C", for: .normal)
        
        var currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaximumLength {
            return
        }
        
        
        // Hemos seleccionado una operación
        
        if operating {
            total = total == 0 ? temp : total
            resultsLabel.text = ""
            currentTemp = ""
            operating = false
        }
        
        // Hemos seleccionado una operación con decimales
        
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        
        // Imprimimos resultados por pantalla
        
        resultsLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        visualSelectedOperation()
        sender.shine()
    }
    
    // Limpiar pantalla y temporales
    
    private func clean(){
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        
        if temp != 0 {
            temp = 0
            resultsLabel.text = "0"
        } else {
            total = 0
            return result()
        }
    }
    
    // Calcular resultados
    
    private func result(){
        
        // Comprobaremos que operación estamos realizando
        
        switch operation {
            
        case .none:
            // No hace nada
            break
        case .adicction:
            total = total + temp
            break
        case .substraction:
            total = total - temp
            break
        case .division:
            total = total / temp
        case .multiplication:
            total = total * temp
        case .percent:
            temp = temp / 100
            total = temp
        }
        
        // Formateo de resultados
        
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > kMaximumLength {
            resultsLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        } else {
            resultsLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        operation = .none
        
        UserDefaults.standard.set(total, forKey: kTotal)
        visualSelectedOperation()
    }
    
    // Mostrar de distinto color el botón de la operación seleccionada
    
    private func visualSelectedOperation (){
        
        if !operating {
            // No se hará nada
            operatorAddition.selectOperation(selected: false)
            operatorSubstraction.selectOperation(selected: false)
            operatorDivision.selectOperation(selected: false)
            operatorMultiplication.selectOperation(selected: false)
        } else {
            switch operation {
            case .none, .percent:
                // No hará nada
                operatorAddition.selectOperation(selected: false)
                operatorSubstraction.selectOperation(selected: false)
                operatorDivision.selectOperation(selected: false)
                operatorMultiplication.selectOperation(selected: false)
                break
            case .adicction:
                // Invertimos los colores
                operatorAddition.selectOperation(selected: true)
                operatorSubstraction.selectOperation(selected: false)
                operatorDivision.selectOperation(selected: false)
                operatorMultiplication.selectOperation(selected: false)
                break
            case .substraction:
                // Invertimos los colores
                operatorAddition.selectOperation(selected: false)
                operatorSubstraction.selectOperation(selected: true)
                operatorDivision.selectOperation(selected: false)
                operatorMultiplication.selectOperation(selected: false)
                break
            case .division:
                // Invertimos los colores
                operatorAddition.selectOperation(selected: false)
                operatorSubstraction.selectOperation(selected: false)
                operatorDivision.selectOperation(selected: true)
                operatorMultiplication.selectOperation(selected: false)
                break
            case .multiplication:
                // Invertimos los colores
                operatorAddition.selectOperation(selected: false)
                operatorSubstraction.selectOperation(selected: false)
                operatorDivision.selectOperation(selected: false)
                operatorMultiplication.selectOperation(selected: true)
                break
            }
        }
    }
    
    
    
}
