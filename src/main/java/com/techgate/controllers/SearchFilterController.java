package com.techgate.controllers;

import com.google.gson.Gson;
import com.techgate.domain.CustomProduct;
import com.techgate.util.GeneralFunction;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "searchFilterServlet", urlPatterns = "/searchFiltrer")
public class SearchFilterController extends HttpServlet {


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response) throws IOException {

        Gson gson = new Gson();
        String saerchCriteria = request.getParameter("saerchCriteria");

        String vanityCheck = request.getParameter("search");
        if (vanityCheck != null) {
            vanityCheck = vanityCheck.replaceAll("\\<[^>]*>", "");
            vanityCheck = vanityCheck.replaceAll("-", "");
            vanityCheck = vanityCheck.replaceAll("&nbsp;", "");
            vanityCheck = vanityCheck.replaceAll("\\s+", "").trim();
        }

        if (vanityCheck != null && vanityCheck.matches("[0-9]+")) {
            HttpSession session = request.getSession();
            session.setAttribute("currency", "INR");
            ClassPathXmlApplicationContext context = (ClassPathXmlApplicationContext)request.getServletContext().getAttribute("context");
            GeneralFunction generfunc = (GeneralFunction) context.getBean("generalFunction");
            String productName = request.getParameter("search");
            List<CustomProduct> products = null;
            String pricefilter = request.getParameter("pricefilter");
            String orderby = "";
            if (pricefilter == null) {
            } else if ("high".equalsIgnoreCase(pricefilter)) {
                orderby = "desc";
            } else if ("low".equalsIgnoreCase(pricefilter)) {
                orderby = "asc";
            }
            products = generfunc.getProductListSearch(productName, saerchCriteria, orderby);
            products = generfunc.getProductListSearch(productName, saerchCriteria, orderby);
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.write(gson.toJson(products));
            response.setStatus(200);
        }
    }
}
