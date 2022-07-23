/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.marketing.sliders;

import controller.authentication.BaseAuthController;
import dal.SliderDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Setting;
import model.Slider;
import model.User;

/**
 *
 * @author Vu Dai Luong
 */
public class slidersEditController extends BaseAuthController {

    @Override
    protected boolean isPermission(HttpServletRequest request) {
        UserDBContext userDB = new UserDBContext();
        User user = (User)request.getSession().getAttribute("user");
        int numRead = userDB.hasPermission(user.getUserID(), "Marketing");
        return numRead >= 1;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        SliderDBContext sliderDB = new SliderDBContext();
        ArrayList<Setting> status = sliderDB.getSliderStatus();
        Slider slider = sliderDB.getslidersbyID(id);  
        request.setAttribute("status", status);
        request.setAttribute("slider", slider);
        request.getRequestDispatcher("/View/marketing/SliderEdit.jsp").forward(request, response);
    }

    
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SliderDBContext sliderDB = new SliderDBContext();
        String id = request.getParameter("id");
        String img = request.getParameter("Img");
        String Title = request.getParameter("title");
        int Status = Integer.parseInt(request.getParameter("status")) ;
        String note = request.getParameter("note");
        Setting set = new Setting();
        set.setSettingID(Status);
        Slider slider = new Slider();
        slider.setImg(img);
        slider.setSliderID(Integer.parseInt(id));
        slider.setTitle(Title);
        slider.setStatus(set);
        slider.setContent(note);
        sliderDB.UpdateSlider(slider);
        response.getWriter().print(slider.getSliderID());
        response.sendRedirect("http://localhost:8080/Online_Shop_SWP391_TuanVM/sliders");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
