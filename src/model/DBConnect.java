package model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnect {
	private DataSource datasource;
	
	public DataSource getDataSource(){
		Context initCtx = null;
		Context envCtx = null;
		
		try {
			initCtx = new InitialContext();
			envCtx = (Context) initCtx.lookup("java:comp/env");
			
			datasource = (DataSource)envCtx.lookup("jdbc/WebDB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return datasource;
	}
}
