package com.manisha.manishamart.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(
                request.getContextPath() + "/login"
            );
            return;
        }

        request.getRequestDispatcher("/checkout.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(
                request.getContextPath() + "/login"
            );
            return;
        }

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");

        if (isBlank(fullName)
                || isBlank(email)
                || isBlank(phone)
                || isBlank(address)
                || isBlank(paymentMethod)) {

            request.setAttribute(
                "error",
                "Please fill in all delivery and payment fields."
            );

            request.getRequestDispatcher("/checkout.jsp")
                   .forward(request, response);
            return;
        }

        if (!phone.matches("[0-9]{10}")) {
            request.setAttribute(
                "error",
                "Please enter a valid 10-digit phone number."
            );

            request.getRequestDispatcher("/checkout.jsp")
                   .forward(request, response);
            return;
        }

        if (!paymentMethod.equals("COD")
                && !paymentMethod.equals("ONLINE")) {

            request.setAttribute(
                "error",
                "Please select a valid payment method."
            );

            request.getRequestDispatcher("/checkout.jsp")
                   .forward(request, response);
            return;
        }

        /*
         * NEXT STEP:
         * Connect this point to your existing cart and order database.
         *
         * The order must be saved successfully before the cart is cleared
         * and the buyer is redirected to the Orders page.
         *
         * Do not report a successful order until database saving works.
         */

        request.setAttribute(
            "error",
            "Your details are valid, but order processing is not connected yet."
        );

        request.getRequestDispatcher("/checkout.jsp")
               .forward(request, response);
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}
