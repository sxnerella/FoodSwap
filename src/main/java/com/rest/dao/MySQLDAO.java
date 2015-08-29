package com.rest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MySQLDAO {
	public Map<String, Object> executeQuery(String query){
	
		Map<String, Object> result = new HashMap<String, Object>();
		String statusMsg = "SUCCESS";
		String statusCode = "0000";
	
		try {
			Connection connection = null;
		
				connection = getCludConnection();
		
			Statement st = connection.createStatement();
		
			result.put("query", query);
			result.put("connectionStatus", "Connection Retrieved successfully");
			if(query.startsWith("select") || query.startsWith("show") || query.startsWith("desc")){
				ResultSet rs = st.executeQuery(query);
				result.put("queryExecutionStatus", "success");
				ResultSetMetaData meta = rs.getMetaData();
				int colsCount = meta.getColumnCount();
				ArrayList<String> colList = new ArrayList<String>();
				HashMap<String, Object> row = null;
				ArrayList<HashMap<String, Object>> rowList = new ArrayList<HashMap<String, Object>>();
				for(int i=1; i<=colsCount; i++){
					colList.add(meta.getColumnLabel(i));
				}
				while(rs.next()){
					row = new HashMap<String, Object>();
					rowList.add(row);
					for(String columnName: colList){
						row.put(columnName, rs.getObject(columnName));
					}
				}
				result.put("message", rs + ": Query executed successfully...");
				result.put("result", rowList);
				result.put("columnList", colList);
			}else{
				int rs = st.executeUpdate(query);
				result.put("queryExecutionStatus", "success");
				result.put("message", rs + " Rows affected with this query");
			}
			connection.close();
		} catch (Exception e) {
            e.printStackTrace();
          
            result.put("queryExecutionStatus", "failue");
            result.put("message", e.getMessage());
            statusMsg = "FAILURE: "+e.getMessage();
	 		statusCode = "0006";
        }
	
		return result;
	}
	

	
    public Connection getCludConnection() {
    
        String url = "jdbc:mysql://us-cdbr-iron-east-02.cleardb.net/ad_e478b9b27b88eb3";
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url,"bf6d9c8ad4c17","55744819");
           
        } catch (Exception e) {
            e.printStackTrace();
           
        }
      
        return connection;
    }
}
