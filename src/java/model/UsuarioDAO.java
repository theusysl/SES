package model;

import java.sql.*;
import java.util.*;
import jakarta.servlet.ServletContext;
import util.DBUtil;

public class UsuarioDAO {

    private ServletContext context;

    public UsuarioDAO(ServletContext context) {
        this.context = context;
    }

    // busca usuário pelo email (pra login)
    public Usuario buscarPorEmail(String email) throws Exception {
        Usuario user = null;
        try (Connection con = DBUtil.connect(context)) {
            String sql = "SELECT id, nome, email, senha, role FROM usuarios WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new Usuario(
                    rs.getInt("id"),
                    rs.getString("nome"),
                    rs.getString("email"),
                    rs.getString("senha"),
                    rs.getString("role")
                );
            }
            rs.close();
            ps.close();
        }
        return user;
    }

    // lista todos os usuários (pro painel admin)
    public List<Usuario> listarUsuarios() throws Exception {
        List<Usuario> lista = new ArrayList<>();
        try (Connection con = DBUtil.connect(context)) {
            String sql = "SELECT id, nome, email, senha, role FROM usuarios";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario(
                    rs.getInt("id"),
                    rs.getString("nome"),
                    rs.getString("email"),
                    rs.getString("senha"),
                    rs.getString("role")
                );
                lista.add(u);
            }
            rs.close();
            ps.close();
        }
        return lista;
    }

    // insere novo usuário (pro cadastro)
    public void inserirUsuario(Usuario u) throws Exception {
        try (Connection con = DBUtil.connect(context)) {
            String sql = "INSERT INTO usuarios (nome, email, senha, role) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, u.getNome());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getSenha());
            ps.setString(4, u.getRole());
            ps.executeUpdate();
            ps.close();
        }
    }

    // deleta usuário pelo id
    public void deletarUsuario(int id) throws Exception {
        try (Connection con = DBUtil.connect(context)) {
            String sql = "DELETE FROM usuarios WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            ps.close();
        }
    }

}
