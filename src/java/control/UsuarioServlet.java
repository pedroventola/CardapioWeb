package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import model.dao.UsuarioDAO;

/*@WebServlet("/logar/*")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            String username = request.getParameter("email");
            String password = request.getParameter("senha");

            if (isValidUser(username, password)) {
                // Cria uma nova sessão
                HttpSession session = request.getSession();
                // Define um atributo na sessão
                session.setAttribute("email", username);

                // Redireciona para a página inicial
                response.sendRedirect("/Cardapio/Consultar/index_consulta_alimentos.jsp");
            } else {
                // Redireciona de volta para a página de login com uma mensagem de erro
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("index_login.jsp").forward(request, response);
            }*/
@WebServlet("/logar/*")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String username = request.getParameter("email");
            String password = request.getParameter("senha");

            if (isValidUser(username, password)) {
                // Cria uma nova sessão
                HttpSession session = request.getSession();
                // Define um atributo na sessão
                session.setAttribute("email", username);

                // Redireciona para a página inicial
                response.sendRedirect(request.getContextPath() + "/Cardapio/Consulta/index_consulta_alimentos.jsp");
            } else {
                // Redireciona de volta para a página de login com uma mensagem de erro
                request.setAttribute("errorMessage", "Invalid username or password");
                request.getRequestDispatcher("index_login.jsp").forward(request, response);
            }

            /*} catch (IOException | ServletException e) {
        } finally {


            System.out.println("Usuario: " + request.getSession().getAttribute("usuario"));
            System.out.println("ID do Alimento: " + request.getParameter("idAlimento"));

        }*/
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("Email do Usuario: " + request.getSession().getAttribute("email"));
            System.out.println("ID do Alimento: " + request.getParameter("idAlimento"));
        }

    }

    public boolean isValidUser(String email, String senha) {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        return usuarioDAO.buscarUsuario(email, senha);
    }

}
