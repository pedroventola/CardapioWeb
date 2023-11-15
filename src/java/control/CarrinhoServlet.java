package control;

import model.dao.CarrinhoDAO;
import model.Carrinho;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;
/*import static jdk.nashorn.internal.objects.NativeError.printStackTrace;*/
import model.Alimento;
import model.Usuario;
import model.dao.AlimentoDAO;

@WebServlet("/carrinho/*")
public class CarrinhoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            CarrinhoDAO carrinhoDAO = new CarrinhoDAO();
            Carrinho carrinho = new Carrinho();
            // Obtenha os parâmetros da solicitação e defina os campos do carrinho e do usuário        
            carrinho.setIdAlimento(Integer.parseInt(request.getParameter("idAlimento")));
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            carrinho.setIdUsuario(usuario.getId());
            AlimentoDAO alimentoDAO = new AlimentoDAO();
            Alimento alimentoBuscado;
            alimentoBuscado = alimentoDAO.consultarPorId(Integer.parseInt(request.getParameter("idAlimento")));
            Alimento alimento = new Alimento();
            alimento.setValor(alimentoBuscado.getValor());

            carrinho.setValorTotal(alimento.getValor());
            carrinhoDAO.adicionar(carrinho);
          
        } catch (Exception e) {

            printStackTrace(e.getMessage());
        }
        finally{
            
              System.out.println("Usuario: " + request.getSession().getAttribute("usuario"));
            System.out.println("ID do Alimento: " + request.getParameter("idAlimento"));
             
        }

    }

    private void printStackTrace(String message) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
