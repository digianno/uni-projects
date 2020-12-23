package website;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class ProductDAO {

	private Connection con = null;

	PreparedStatement stmt1 = null;

	public List<Product> getAllProducts() throws SQLException {

		try {

			String sqlquery= "SELECT * FROM product;";

			ResultSet rs;
			stmt1 = con.prepareStatement(sqlquery);

			rs = stmt1.executeQuery();

			List<Product> productList = new ArrayList<Product>();
			//Product product = new Product();

			while(rs.next()) {

				productList.add( new Product(rs.getString("product_id"),rs.getString("category"),
						rs.getString("productName"), rs.getDouble("price"), rs.getString("image"),1) );

			}

			return productList;

		} catch (SQLException e) {

			throw new SQLException("An error occured while getting products from database: " + e.getMessage());
		}

	}

	/**
	 * Default Constructor.
	 */
	public ProductDAO() {
	}


	public void open() throws SQLException {
		try {
			// dynamically load the driver's class file into memory
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {

			throw new SQLException("MySQL Driver error: " + e.getMessage());
		}

		try {
			// establish a connection with the database and creates a Connection
			// object (con)
			con = DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup10", "ismgroup10", "o3db0w");
		} catch (Exception e) {
			con = null;
			// throw SQLException if a database access error occurs
			throw new SQLException("Could not establish connection with the Database Server: " + e.getMessage());
		}

	} // End of open

	public void close() throws SQLException {
		try {
			// if connection is open
			if (con != null)
				con.close(); // close the connection to the database to end database session

			if (stmt1 != null)
				stmt1.close();

		} catch (Exception e3) {

			throw new SQLException("Could not close connection with the Database Server: " + e3.getMessage());
		}

	}// end of close
}