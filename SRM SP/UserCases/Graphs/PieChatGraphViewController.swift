//
//  PieChatGraphViewController.swift
//  SRM SP
//
//  Created by Jesus Loaiza Herrera on 28/08/24.
//

import UIKit
import DGCharts


class PieChartGraphViewController: UIViewController {

  @IBOutlet weak var pieChartView: PieChartView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    let producto = ["Camisa", "Pantalon", "Vestido", "Sueter", "Chamarra", "Blusa"]
    let numPrendas = [16, 60, 5, 20, 2.1, 15]
    
    setDataChart(dataPoint: producto, values: numPrendas)
    }
    
  func setDataChart(dataPoint: [String], values: [Double]) {
      var dataEntries: [ChartDataEntry] = []
      for i in 0..<dataPoint.count {
          let dataEntry = PieChartDataEntry(value: values[i], label: dataPoint[i], data: dataPoint[i] as AnyObject)
          dataEntries.append(dataEntry)
      }
      
      //Paso dos
      let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Datos")
      pieChartDataSet.colors = colorsOfCharts(numbersOfColor: dataPoint.count)
      
      //Paso tres. Asignar los datos a la grafica
      let pieChartData = PieChartData(dataSet: pieChartDataSet)
      let format = NumberFormatter()
      format.numberStyle = .none
      let formatter = DefaultValueFormatter(formatter: format)
      pieChartData.setValueFormatter(formatter)
      
    pieChartView.data = pieChartData
      
  }
  
  private func colorsOfCharts(numbersOfColor: Int) -> [UIColor] {
        var colors: [UIColor] = []
        for _ in 0..<numbersOfColor {
          let red = Double(arc4random_uniform(256))
          let green = Double(arc4random_uniform(256))
          let blue = Double(arc4random_uniform(256))
          let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
          colors.append(color)
        }
        return colors
      }



}
