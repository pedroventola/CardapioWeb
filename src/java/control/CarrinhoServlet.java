package control;

import model.dao.CarrinhoDAO;
import model.Carrinho;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
/*import static jdk.nashorn.internal.objects.NativeError.printStackTrace;*/
import model.Alimento;
import model.dao.AlimentoDAO;

@WebServlet("/menu/*")
public class CarrinhoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {

            Alimento alimento = new Alimento();
            AlimentoDAO alimentoDAO = new AlimentoDAO();

            alimento = alimentoDAO.consultarPorId(Integer.parseInt(request.getParameter("idAlimento")));

            CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
            Carrinho carrinho = new Carrinho();

            HttpSession session = request.getSession();

            if (session.getAttribute("idUsuario") != null) {
                String idUsuario = (String) session.getAttribute("idUsuario");
                carrinho.setIdUsuario(idUsuario);
            } else {

                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            }
            carrinho.setIdAlimento(Integer.parseInt(request.getParameter("idAlimento")));
            carrinho.setValorTotal(alimento.getValor());
            carrinhoDAO.adicionar(carrinho);

        } catch (Exception e) {
            printStackTrace(e.getMessage());
        }
    }

    private void printStackTrace(String message) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
