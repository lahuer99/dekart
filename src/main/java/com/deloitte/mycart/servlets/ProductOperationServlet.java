package com.deloitte.mycart.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.deloitte.mycart.dao.CategoryDao;
import com.deloitte.mycart.dao.ProductDao;
import com.deloitte.mycart.entities.Category;
import com.deloitte.mycart.entities.Product;
import com.deloitte.mycart.helper.FactoryProvider;

//import jdk.internal.util.xml.impl.Input;

/**
 * Servlet implementation class ProductOperationServlet
 */
//multipart/form-data acceptable; for img
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		//this servlet adds categories and products
		try {
			//hidden field operation : Session Tracking(Session management techniques)
			String op=request.getParameter("operation");
			if(op.trim().equals("addCategory")) {
				String categoryName=request.getParameter("category_name");
				String categoryDesc=request.getParameter("category_desc");
				
				Category category=new Category(categoryName, categoryDesc);
				//category.setCategoryTitle(categoryName);
				//category.setCategoryDescription(categoryDesc);
				
				CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
				int catId = categoryDao.saveCategory(category);
				
				//out.println("Category saved: "+catId);
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message", "Category saved: "+catId);
				
				response.sendRedirect("admin.jsp");
				
				
			}else if(op.trim().equals("addProduct")) {
				//addProduct
				String pName=request.getParameter("product_name");
				String pDesc=request.getParameter("product_desc");
				int pPrice=Integer.parseInt(request.getParameter("product_price"));
				int pDiscount=Integer.parseInt(request.getParameter("product_discount"));
				int pQty=Integer.parseInt(request.getParameter("product_quantity"));
				int pCatId=Integer.parseInt(request.getParameter("product_category"));
				
				//fetch file using Part
				Part part = request.getPart("product_pic");
				
				Product product=new Product(pName,pDesc,part.getSubmittedFileName(),pPrice,pDiscount,pQty);
				
				CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
				Category categoryById = cdao.getCategoryById(pCatId);
				product.setCategory(categoryById);
				
//				ProductDao
				ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
				pdao.saveProduct(product);
				
				//code for uploading image
				//File.separator is \
				String path = request.getSession().getServletContext().getRealPath("images")+File.separator+ "products" + File.separator+part.getSubmittedFileName() ;
				System.out.println("path of img is getting stored"+ path);
				
				try {
					//code to upload image to server using java.io
					FileOutputStream fos=new FileOutputStream(path); //for writing the date and pass path
					InputStream is=part.getInputStream(); //reading the data
					
					byte[] data=new byte[is.available()]; //gives size of img
					is.read(data); //actual data will be saved in 'data'
					
					//writing data to server
					fos.write(data);
					
					fos.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				
//				out.println("product saved suxx "+product);
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message", "Product saved successfully");
				
				response.sendRedirect("admin.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		doGet(request, response);
	}

}
