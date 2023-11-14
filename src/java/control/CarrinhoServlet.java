
import model.dao.CarrinhoDAO;
import model.Carrinho;
import model.Usuario;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class CarrinhoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
        Carrinho carrinho = new Carrinho();
        Usuario usuario = new Usuario();

        // Obtenha os parâmetros da solicitação e defina os campos do carrinho e do usuário        
        carrinho.setIdAlimento(Integer.parseInt(request.getParameter("idAlimento")) );
     

        boolean adicionado = carrinhoDAO.adicionar(carrinho);
        if (adicionado) {
            // O item foi adicionado ao carrinho
            response.getWriter().write("Item adicionado ao carrinho");
        } else {
            // Ocorreu um erro ao adicionar o item ao carrinho
            response.getWriter().write("Erro ao adicionar item ao carrinho");
        }
    }
}
