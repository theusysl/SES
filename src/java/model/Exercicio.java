package model;

import java.sql.Timestamp;

public class Exercicio {
    private int id;
    private int idUsuario;
    private String enunciado;
    private Timestamp dataCriacao;
    private boolean descartado;

    public Exercicio() {
        // construtor vazio
    }

    public Exercicio(int id, int idUsuario, String enunciado, Timestamp dataCriacao, boolean descartado) {
        this.id = id;
        this.idUsuario = idUsuario;
        this.enunciado = enunciado;
        this.dataCriacao = dataCriacao;
        this.descartado = descartado;
    }
    
    // getters e setters
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getEnunciado() {
        return enunciado;
    }

    public void setEnunciado(String enunciado) {
        this.enunciado = enunciado;
    }

    public Timestamp getDataCriacao() {
        return dataCriacao;
    }

    public void setDataCriacao(Timestamp dataCriacao) {
        this.dataCriacao = dataCriacao;
    }

    public boolean isDescartado() {
        return descartado;
    }

    public void setDescartado(boolean descartado) {
        this.descartado = descartado;
    }
    
}
