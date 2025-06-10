package model;

import jakarta.servlet.ServletContext;
import util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ExercicioDAO {

    private ServletContext context;

    public ExercicioDAO(ServletContext context) {
        this.context = context;
    }
    
    public ExercicioDAO() {
        
    }

    public void salvarExercicio(int idUsuario, String enunciado, boolean descartado) throws Exception {
        try (Connection con = DBUtil.connect(context)) {
            String sql = "INSERT INTO exercicios (id_usuario, enunciado, descartado) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            ps.setString(2, enunciado);
            ps.setBoolean(3, descartado);
            ps.executeUpdate();
            ps.close();
        }
    }

    public boolean enunciadoExiste(String enunciado) throws Exception {
        try (Connection con = DBUtil.connect(context)) {
            String sql = "SELECT 1 FROM exercicios WHERE enunciado = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, enunciado);
            ResultSet rs = ps.executeQuery();
            boolean existe = rs.next();
            rs.close();
            ps.close();
            return existe;
        }
    }

    public List<Exercicio> listarSalvosPorUsuario(int idUsuario) throws Exception {
        List<Exercicio> lista = new ArrayList<>();
        try (Connection con = DBUtil.connect(context)) {
            String sql = "SELECT * FROM exercicios WHERE id_usuario = ? AND descartado = false ORDER BY data_criacao DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Exercicio ex = new Exercicio();
                ex.setId(rs.getInt("id"));
                ex.setIdUsuario(rs.getInt("id_usuario"));
                ex.setEnunciado(rs.getString("enunciado"));
                ex.setDataCriacao(rs.getTimestamp("data_criacao"));
                ex.setDescartado(rs.getBoolean("descartado"));
                lista.add(ex);
            }
            rs.close();
            ps.close();
        }
        return lista;
    }
    
    public void marcarComoSalvo(int idUsuario, String enunciado) {
        String sql = "UPDATE exercicios SET descartado = false WHERE id_usuario = ? AND enunciado = ?";
        try (Connection con = DBUtil.connect(context);
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, idUsuario);
            stmt.setString(2, enunciado);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void excluirExercicio(int idExercicio) throws Exception {
        try (Connection con = DBUtil.connect(context)) {
            String sql = "DELETE FROM exercicios WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, idExercicio);
            ps.executeUpdate();
            ps.close();
        }
    }
}
