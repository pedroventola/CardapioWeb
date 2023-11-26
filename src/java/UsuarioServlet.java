import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;
import model.dao.UsuarioDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;


@WebServlet("/logar/*")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("email");
            String password = request.getParameter("senha");
            Usuario usuario = isValidUser(username, password);
            if (usuario != null) {
                // Cria uma nova sessão
                HttpSession session = request.getSession();
                // Define atributos na sessão
                session.setAttribute("email", usuario.getEmail());
                session.setAttribute("idUsuario", usuario.getId());
                session.setAttribute("nomeUsuario", usuario.getNome());
                session.setAttribute("endereco", usuario.getEndereco());
                // Redireciona para a página principal
                response.sendRedirect(request.getContextPath() + "/tela_cardapio.jsp");
            } else {
                // Redireciona de volta para a página de login com uma mensagem de erro
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Usuário não encontrado");
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "Ocorreu um erro durante o processamento. Tente novamente mais tarde.");
        }
    }

    public Usuario isValidUser(String email, String senha) {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        return usuarioDAO.buscarUsuario(email, senha);
    }
}
