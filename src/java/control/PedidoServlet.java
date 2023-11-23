package control;

import model.dao.CarrinhoDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;

/*import static jdk.nashorn.internal.objects.NativeError.printStackTrace;*/
@WebServlet("/finalizarPedido/*")
public class PedidoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(false);
            // Verifique se a sessão não é nula e se o atributo "idUsuario" está definido
            if (session != null && session.getAttribute("idUsuario") != null) {
                String idUsuario = session.getAttribute("idUsuario").toString();
                System.out.println(idUsuario);
                CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
                if (carrinhoDAO.excluirPorUsuario(idUsuario)) {
                    response.getWriter().write("Pedido finalizado com sucesso.");
                }

            } else {
                response.getWriter().write("Erro ao finalizar o pedido. Usuário não autenticado.");
            }
        } catch (Exception e) {
            // Se ocorrer um erro, envie uma resposta de erro (HTTP 400 Bad Request)
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().println("Erro ao finalizar o pedido. Tente novamente.");
        }
    }

}
