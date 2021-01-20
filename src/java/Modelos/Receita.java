/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

/**
 *
 * @author User
 */
public class Receita {
    private int id;
    private String descricao;
    private float valor;
    private Date data;
    
    public boolean salvar(){
    String sql = "insert into receita(descricao, valor, data)";
                  sql += "values(?,?,?)";
        Connection con = Conexao.conectar();
       
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1, this.descricao);
           stm.setFloat(2, this.valor);
           stm.setDate(3, this.data);
           
           stm.execute();           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
           return false;
        }        
        return true;
    }
    public boolean alterar(){
        Connection con = Conexao.conectar();
        String sql = "update receita set ";
              sql +="descricao = ?,";
              sql +="valor = ?,";
              sql +="data = ?,";
              sql +=" where id = ?";
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1, this.descricao);
           stm.setFloat(2, this.valor);
           stm.setDate(3, this.data);
           stm.setInt(4, this.id);
           
           stm.execute();           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
           return false;
        }        
        return true;
    } 
    public Receita consultar(int id){
        Connection con = Conexao.conectar();
        String sql = "select id, descricao, valor, data"
                 + " from receita where id = ?";
        Receita receita = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
            receita = new Receita();
            receita.setId(id);
            receita.setDescricao(rs.getString("descricao"));
            receita.setValor(rs.getFloat("valor"));
            receita.setData(rs.getDate("data"));           
            }
           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
        }      
    return receita;  
    }  

    public List<Receita> consultar(){
        List<Receita> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select id, descricao, valor, data from receita";
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           ResultSet rs = stm.executeQuery();
           while(rs.next()){
            Receita receita = new Receita();
            receita.setId(rs.getInt("id"));
            receita.setDescricao(rs.getString("descricao"));
            receita.setValor(rs.getFloat("valor"));
            receita.setData(rs.getDate("data"));           
            
             
             lista.add(receita);
           }
           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
        }      
        return lista; 
}

public boolean excluir(){
        Connection con = Conexao.conectar();
        String sql = "delete from receita ";
              sql +=" where id = ?";
        try {
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setInt(1, this.id);
           stm.execute();           
        } catch (SQLException ex) {
           System.out.println("Erro: " + ex.getMessage());
           return false;
        }        
        return true;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
} 

