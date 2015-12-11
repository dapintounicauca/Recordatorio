//
//  Recordatorio.swift
//  Proyecto
//
//  Created by Aplimovil on 10/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import Foundation

class Recordatorio{

    var nombre:String
    var fecha:String
    var valor:Int
    var estado:Int
    
    init(){
        nombre = ""
        //let formatter = NSDateFormatter()
        //formatter.dateFormat = "yyyy/MM/dd hh:mm"
        //fecha = "\(formatter.stringFromDate(fecha))"
        fecha = ""
        valor = 0
        estado = 0
    }
    
    init(nombre:String, fecha:String , valor:Int, estado:Int){
        self.nombre = nombre
        self.fecha = fecha
        self.valor = valor
        self.estado = estado
    }
}
