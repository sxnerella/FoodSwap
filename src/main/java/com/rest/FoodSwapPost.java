package com.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import com.sun.jersey.api.view.Viewable;
import com.rest.dao.MySQLDAO;

@Path("/db")
public class FoodSwapPost {
	@Context
	HttpServletRequest request;

	@GET 
	@Produces(MediaType.TEXT_HTML)
	public Viewable getDBPage() {
		
		return new Viewable("/db.jsp");
	}

	@GET
	@Path("/submitQuery")
	@Produces(MediaType.TEXT_HTML)
	public Viewable submitQuery(@QueryParam("query") String query) {
	
		Map<String, Object> result = null;
		String statusMsg = "SUCCESS";
		String statusCode = "0000";
		try{
			if(query != null && query.trim().length() > 0){
				MySQLDAO dao = new MySQLDAO();
				result = dao.executeQuery(query);
			}else{
				result = new HashMap<String, Object>();
				result.put("message", "Enter valid SQL query to execute.");
				result.put("queryValid", false);
			}
		}catch(Exception e){
			 e.printStackTrace();
	        
	         statusMsg = "FAILURE: "+e.getMessage();
	 		 statusCode = "0006";
		}
		request.setAttribute("query", query);
		request.setAttribute("response", result);
	
		return new Viewable("/db.jsp");
	}
	
	
	@GET
	@Path("/postFood")
	@Produces(MediaType.TEXT_HTML)
	public Viewable postFood(@QueryParam("foodType") String foodType, @QueryParam("additionalInfo") String additionalInfo) {
	
		Map<String, Object> result = null;
		String statusMsg = "SUCCESS";
		String statusCode = "0000";
		try{
			if(foodType != null && additionalInfo!=null ){
				MySQLDAO dao = new MySQLDAO();
				
				String insertQuery="INSERT INTO food_swap (food_type,additional_info,submission_date) VALUES ('"+foodType+ "','"+additionalInfo+"',SYSDATE())";
				result = dao.executeQuery(insertQuery);
			}else{
				result = new HashMap<String, Object>();
				result.put("message", "Enter valid SQL query to execute.");
				result.put("queryValid", false);
			}
		}catch(Exception e){
			 e.printStackTrace();
	        
	         statusMsg = "FAILURE: "+e.getMessage();
	 		 statusCode = "0006";
		}
		request.setAttribute("foodType", foodType);
		request.setAttribute("additionalInfo", additionalInfo);
		request.setAttribute("response", result);
		return new Viewable("/givers.html");
	}
	
	@GET
	@Path("/pickFood")
	@Produces(MediaType.TEXT_HTML)
	public Viewable pickFood() {
	
		Map<String, Object> result = null;
		String statusMsg = "SUCCESS";
		String statusCode = "0000";
	
		try{
				MySQLDAO dao = new MySQLDAO();
				String insertQuery="SELECT food_swap_id as CODE, food_type as FOOD_ITEM, additional_info as ADDRESS, picked_by as PICKED_BY from food_swap where submission_date > DATE_SUB(CURDATE(), INTERVAL 1 DAY) ";
				result = dao.executeQuery(insertQuery);
	
		}catch(Exception e){
			 e.printStackTrace();
	        
	         statusMsg = "FAILURE: "+e.getMessage();
	 		 statusCode = "0006";
		}
		
		request.setAttribute("response", result);
	
		return new Viewable("/takers.jsp");
	}
	
}
