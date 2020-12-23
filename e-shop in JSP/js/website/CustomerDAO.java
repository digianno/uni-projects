package website;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * UserDAO provides all the necessary methods related to user's.
 * In further lessons we will change all the code of the body of the methods and use
 * JDBC API in order to connect the the database and store/retrieve users etc.
 *
 * @author sofos@aueb.gr
 *
 */
public class CustomerDAO {

	private Connection con = null;

	private	PreparedStatement stmt1 = null, stmt = null;

	private ResultSet rs1 = null;

	private final String insertCustomerQuery = "insert into customer (namecus, surname, email , passwordcus, dateOfBirth, gender, phoneNumber, adress, postcode, city,country) values (?,?,?,?,?,?,?,?,?,?,?);";

	private final String selectCustomerQuery = "select * from customer where email=?;";

	/**
	 * This method returns a List with all Users
	 *
	 * @return List<User>
	 */

	public List<Customer> getAllCustomers() throws SQLException {

		try {

					String sqlquery= "SELECT * FROM customer;";

					ResultSet rs;
					stmt1 = con.prepareStatement(sqlquery);

					rs = stmt1.executeQuery();

					List<Customer> customerList = new ArrayList<Customer>();
					//Product product = new Product();

					while(rs.next()) {

						customerList.add( new Customer(rs.getInt("cus_id"),
								rs.getString("namecus"), rs.getString("surname"), rs.getString("dateOfBirth"), rs.getString ("gender"),
								rs.getString("email"), rs.getString("phoneNumber"), rs.getString("passwordcus"), rs.getString("adress"),
								rs.getString("postcode"), rs.getString("city"), rs.getString("country")));

					}

					return customerList;

				} catch (SQLException e) {

					throw new SQLException("An error occured while getting customers from database: " + e.getMessage());
				}

	}
	 //End of getUsers

	/**
	 * Search user by username
	 *
	 * @param username, String
	 * @return User, the User object
	 * @throws Exception, if user not found
	 */
	public Customer findCustomer(String email) throws Exception {

		List<Customer> custs = getAllCustomers();

		for (Customer cust : custs) {

			if ( cust.getEmail().equals(email) ) {
				return cust;
			}

		}

		throw new Exception("User with username: " + email + " does not exist");

	} //End of findUser

	/**
	 * This method is used to authenticate a user.
	 *
	 * @param username, String
	 * @param password, String
	 * @return User, the User object that represents the authenticated user.
	 * @throws Exception, if the credentials are not valid
	 */
	public Customer authenticate(String email, String password) throws Exception {

		List<Customer> custs = getAllCustomers();

		for (Customer cus : custs) {

			if (cus.getEmail().equals(email) && cus.getPswd().equals(password)) {
				return cus; // credentials are valid, so return the User object
			}

		}
		//credentials are Wrong, so throw an error
		throw new Exception("Wrong username or password");

	} //End of authenticate


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
				con = DriverManager.getConnection("jdbc:mysql://195.251.249.131:3306/ismgroup10?useUnicode=yes&characterEncoding=UTF-8", "ismgroup10", "o3db0w");
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

	//Finds if Customer is already register

	public boolean isCustomerRegistered(String email) {

		String errorMessages;
	    if (con == null) {
	      errorMessages = "You must establish a connection first!";
	      return true;
	    }

	    try {
	      stmt1 = con.prepareStatement(selectCustomerQuery);
	      // replacing the first ? with userName and the second ? with
	      // userPassword
	      stmt1.setString(1, email);

	      // execute query
	      rs1 = stmt1.executeQuery();

	      if (rs1.next()) {
	        stmt1.close();
	        rs1.close();
	        errorMessages = "The Student with Email " + email
	            + " is already registered!";
	        return true;
	      } else {
	        stmt1.close();
	        rs1.close();
	        return false;
	      }

	    } catch (Exception e4) {
	      errorMessages = "Error while executing selection query: <br>"
	          + e4.getMessage();
	      //throw new SQLException(errorMessages);
	      return true;
	    }
  }

	//This method save a user in data base

	public void setCustomer(String name, String surname, String birthday, String gender, String email, String tel, String password, String address, String postal, String city, String country) throws SQLException {

		if (con == null) {
		  String errorMessages = "You must establish a connection first!";
		  throw new SQLException(errorMessages);
		}


		try {
				stmt = con.prepareStatement(insertCustomerQuery);
				stmt.setString(1, name);
				stmt.setString(2, surname);
				stmt.setString(3, email);
				stmt.setString(4, password);
				stmt.setString(5, birthday);
				stmt.setString(6, gender);
				stmt.setString(7, tel);
				stmt.setString(8, address);
				stmt.setString(9, postal);
				stmt.setString(10, city);
				stmt.setString(11, country);
				// execute query
				stmt.executeUpdate();


				} catch (SQLException e) {

					throw new SQLException("An error occured while setting customer in database: " + e.getMessage());
				}

	}


} //End of class


