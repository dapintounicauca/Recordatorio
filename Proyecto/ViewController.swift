//
//  ViewController.swift
//  Proyecto
//
//  Created by Aplimovil on 10/12/15.
//  Copyright © 2015 Aplimovil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    var data:[Recordatorio] = [Recordatorio]()
    @IBOutlet var table:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [Recordatorio]()
        var r:Recordatorio = Recordatorio()
        r.nombre = "Energía"
        r.fecha = "2015/12/23 11:30 AM"
        r.valor = 62000
        r.estado = 1
        data.append(r)
        
        r = Recordatorio()
        r.nombre = "Acueducto"
        r.fecha = "2015/12/25 07:00 AM"
        r.valor = 73000
        r.estado = 3
        data.append(r)
        
        r = Recordatorio()
        r.nombre = "TV Cable"
        r.fecha = "2015/12/12 08:00 AM"
        r.valor = 53300
        r.estado = 2
        data.append(r)
        
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Datasource TableView
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:RecordatorioTableViewCell! = tableView.dequeueReusableCellWithIdentifier("cell") as! RecordatorioTableViewCell
        
        let r:Recordatorio = data[indexPath.row]
        
        cell.nombre.text = r.nombre
        cell.fecha.text = r.fecha
        cell.valor.text = "\(r.valor)"
        
        switch r.estado {
        case 1 :
            cell.estado.backgroundColor = UIColor.init(colorLiteralRed: 0.29, green: 0.53, blue: 0.91, alpha: 1.0)
        case 2:
            cell.estado.backgroundColor = UIColor.init(colorLiteralRed: 0.88, green: 0.40, blue: 0.40, alpha:1.0)
        case 3:
            cell.estado.backgroundColor = UIColor.init(colorLiteralRed: 0.42, green: 0.66, blue: 0.31, alpha: 1.0)
        default:
            cell.estado.backgroundColor = UIColor.grayColor()
        }
        
        return cell
    }
    //MARK: - CRUD Actions
    @IBAction func editRecordatorio(sender:AnyObject){
    
        if(table.indexPathForSelectedRow == nil){
            self.showUnselectedMessage("Editar Recordatorio")
        }else{
            performSegueWithIdentifier("edit", sender: nil)
        }
    }
    @IBAction func deleteRecordatorioAlert(sender:AnyObject){
        
        if(table.indexPathForSelectedRow == nil){
            self.showUnselectedMessage("Eliminar Recordatorio")
        }else{
            showDeleteRecordatorio()
        }
    }
    
    func showDeleteRecordatorio(){
        let r:Recordatorio = data[(table.indexPathForSelectedRow?.row)!]
        
        let alert: UIAlertController = UIAlertController(title: "Eliminar Recordatorio", message: "Desea eliminar el Recordatorio de pago de \(r.nombre)?", preferredStyle: UIAlertControllerStyle.Alert)
        let actionOk:UIAlertAction = UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default){
            (UIAlertAction)-> Void in
            self.data.removeAtIndex((self.table.indexPathForSelectedRow?.row)!)
            self.table.reloadData()
        }
        let actionCancel:UIAlertAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func showUnselectedMessage(title:String){
        let alert:UIAlertController = UIAlertController(title: title, message: "Seleccione un Recordatorio", preferredStyle: UIAlertControllerStyle.Alert)
        let action:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    //MARK: Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextRecordatorio:AddRecordatorioViewController = segue.destinationViewController as! AddRecordatorioViewController
        
        if(segue.identifier == "edit"){
            nextRecordatorio.pos = table.indexPathForSelectedRow?.row
        }
        nextRecordatorio.list = self
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


}

