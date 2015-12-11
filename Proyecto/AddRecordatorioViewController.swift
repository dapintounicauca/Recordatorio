//
//  AddRecordatorioViewController.swift
//  Proyecto
//
//  Created by Aplimovil on 10/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class AddRecordatorioViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    var list:ViewController!
    var pos:Int?
    
    @IBOutlet var valor:UITextField!
    @IBOutlet var fecha: UIDatePicker!
    @IBOutlet var picker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerData = ["Energìa Electrica", "Acueducto", "Gas Natural", "TV Cable", "Internet"]
        self.picker.delegate = self
        self.picker.dataSource = self
        
        if(pos != nil){
            self.title = "Editar"
            
            picker.selectRow(getRow(list.data[pos!].nombre)!, inComponent: 0, animated: true)
            
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy/MM/dd hh:mm aa"
            fecha.date = formatter.dateFromString(list.data[pos!].fecha)!
            valor.text = "\(list.data[pos!].valor)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    
    
    @IBAction func saveRecordatorio(sender:AnyObject){
        if(pos != nil){
            
            list.data[pos!].nombre = getNombre(picker.selectedRowInComponent(0))!
            var date = NSDate()
            date = fecha.date
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy/MM/dd hh:mm aa"
            let stringFecha = "\(formatter.stringFromDate(date))"
        
            list.data[pos!].fecha = stringFecha
            list.data[pos!].valor = Int(valor.text!)!
            
        }
        else{
            let r:Recordatorio = Recordatorio()
            
            r.nombre = getNombre(picker.selectedRowInComponent(0))!
        
            var date = NSDate()
            date = fecha.date
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy/MM/dd hh:mm aa"
            let stringFecha = "\(formatter.stringFromDate(date))"
            
            r.fecha = stringFecha
            r.valor = Int(valor.text!)!
            
            list.data.append(r)
        }
        self.navigationController?.popToViewController(list, animated: true)
    }
    func getNombre(pos:Int)->String?{
        
        if (pos == 0){
            return "Energìa Electrica"
        }
        if (pos == 1){
            return "Acueducto"
        }
        if (pos == 2){
            return "Gas Natural"
        }
        if (pos == 3){
            return "TV Cable"
        }
        if (pos == 4){
            return "Internet"
        }
        return ""
    }
    func getRow(nombre:String)->Int?
    {
        
        for var index = 0; index < pickerData.count ; ++index
        {
            if(nombre == pickerData[index])
            {
                return index
            }
            
        }
        return 0
    }
}
