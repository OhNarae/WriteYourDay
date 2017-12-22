package bizUtil;
import java.sql.*;

public class JDBCUtil {
	
	public static Connection getConnection() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
            System.out.println("===> JDBC Connection 성공  ===");
            return DriverManager.getConnection(url,"system","oracle");
        } catch (Exception e) {
        	 System.out.println("===> JDBC Connection 실패  ===");
            e.printStackTrace();
        }
        return null;
    } // getConnection()

    public static void close(PreparedStatement pst, Connection cn) {
        if(pst != null) {                    
            try {
            	pst.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
            	pst = null;
            }
        }
        
        if(cn != null) {                    
            try {
            	cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                cn = null;
            }
        }
    }
    
    public static void close(Statement st, Connection cn) {
        if(st != null) {                    
            try {
                st.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                st = null;
            }
        }
        
        if(cn != null) {                    
            try {
            	cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                cn = null;
            }
        }
    }
    
    public static void close(ResultSet rs, PreparedStatement pst) {
        if(rs != null) {                    
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                rs = null;
            }
        }
        
        if(pst != null) {                    
            try {
            	pst.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
            	pst = null;
            }
        }
    }
    
    public static void close(ResultSet rs, Statement st) {
        if(rs != null) {                    
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                rs = null;
            }
        }
        
        if(st != null) {                    
            try {
            	st.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
            	st = null;
            }
        }
    }
    
    public static void close(ResultSet rs, PreparedStatement pst, Connection cn) {
        if(rs != null) {                    
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                rs = null;
            }
        }
        
        if(pst != null) {                    
            try {
            	pst.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
            	pst = null;
            }
        }
        
        if(cn != null) {                    
            try {
                cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                cn = null;
            }
        }
    }

    public static void close(ResultSet rs, Statement st, Connection cn) {
        if(rs != null) {                    
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                rs = null;
            }
        }
        
        if(st != null) {                    
            try {
                st.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                st = null;
            }
        }
        
        if(cn != null) {                    
            try {
                cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                cn = null;
            }
        }
    }    
    
    public static void close(ResultSet rs, PreparedStatement pst, Statement st, Connection cn) {
        if(rs != null) {                    
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                rs = null;
            }
        }
        
        if(pst != null) {                    
            try {
            	pst.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
            	pst = null;
            }
        }
        
        if(st != null) {                    
            try {
                st.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                st = null;
            }
        }
        
        if(cn != null) {                    
            try {
                cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                cn = null;
            }
        }
    }    
    
} // class
