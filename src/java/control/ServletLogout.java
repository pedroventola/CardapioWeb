package control;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/logout/*")
public class ServletLogout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtém a sessão (se existir)
        HttpSession session = request.getSession(false);

        // Verifica se existe uma sessão
        if (session != null) {
            // Invalida a sessão (remove todos os atributos associados)
            session.invalidate();
        }

        // Configura o cabeçalho de redirecionamento
        response.sendRedirect(request.getContextPath() + "/login/index_login.jsp");
    }
}

