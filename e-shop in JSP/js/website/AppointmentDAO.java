package website;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointmentDAO {

	private Connection con = null;

	private	PreparedStatement stmt1 = null, stmt = null;

	private ResultSet rs1 = null;

	private final String makeAnAppointment = "insert into appointment (cus_id, description, date, time ) values (?,?,?,?);";




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

	public List<Appointment> getAppointments() throws SQLException {

		try {
			 String selectCustomerQuery = "select * from appointment;";

			ResultSet rs;
			stmt1 = con.prepareStatement(selectCustomerQuery);

			rs = stmt1.executeQuery();

			List<Appointment> appointmentsList = new ArrayList<Appointment>();

			while(rs.next()) {
			appointmentsList.add(new Appointment(rs.getInt("appo_id"),rs.getInt("cus_id"),rs.getString("description"),rs.getString("date"),rs.getString("time")) );
		}

			return appointmentsList;

			} catch (SQLException e) {

					throw new SQLException("An error occured while getting customers from database: " + e.getMessage());
			}

	}

	public List<Appointment> cusAppointments(int cus_id) throws SQLException {

		List<Appointment> customersAppointments =  getAppointments();
		List<Appointment> customerAppointments = new ArrayList<Appointment>();

		for(Appointment appo: customersAppointments) {

			if ( appo.getCus_id() == cus_id ){
				customerAppointments.add(new Appointment(appo.getAppo_id(), appo.getCus_id(), appo.getDescription(),appo.getDate(),appo.getTime()));
			}
		}

		return customerAppointments;
	}



	public boolean makeAppointment(int cus_id, String date, String hour, String text) throws SQLException {

		if (con == null) {
				  String errorMessages = "You must establish a connection first!";
				  throw new SQLException(errorMessages);
		}




		try {
					stmt = con.prepareStatement(makeAnAppointment);
					stmt.setInt(1, cus_id);
					stmt.setString(2, text);
					stmt.setString(3, date);
					stmt.setString(4, hour);
					// execute query
					stmt.executeUpdate();

				return true;

					} catch (SQLException e) {

						throw new SQLException("An error occured while setting appointment in database: " + e.getMessage());
					}


	}
	public boolean deleteAppointment(int appo_id, int cus_id) throws SQLException{
		if (con == null) {
						  String errorMessages = "You must establish a connection first!";
						  throw new SQLException(errorMessages);
				}

			 String deleteAppointment = "delete from appointment where appo_id = ? and cus_id = ?";
			 String resetAuto_increment = "ALTER TABLE APPOINTMENT AUTO_INCREMENT = 1";




				try {
							stmt = con.prepareStatement(deleteAppointment);
							stmt.setInt(1, appo_id);
							stmt.setInt(2, cus_id);
							// execute query
							stmt.executeUpdate();
							stmt1 = con.prepareStatement(resetAuto_increment);
							stmt1.executeUpdate();

						return true;

							} catch (SQLException e) {

								throw new SQLException("An error occured while deletting appointment in database: " + e.getMessage());
							}



	}



}