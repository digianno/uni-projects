package website;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO{


	//Creating Order so we can add orderitems
	public void createOrder(int cus_id, String date, double sum,String choice) throws Exception {
		DB temp = new DB();
		Connection con = temp.getConnection();

		try{
				String insertQuery= "INSERT INTO Order1 (cus_id,orderDate,totalsum,status,payment) VALUES(?,?,?,?,?);";
				PreparedStatement stmt = null;

				stmt = con.prepareStatement(insertQuery);
				stmt.setInt(1, cus_id);
				stmt.setString(2, date);
				stmt.setDouble(3,sum);
				stmt.setString(4,"new");
				stmt.setString(5,choice);
				stmt.executeUpdate();

				con.close();
		} catch (Exception e) {
			con.close();
			throw new Exception("An error occured while making new Order: " + e.getMessage());
		}
	}


	//Find new Order that created from cus_id on date

	public Order findOrder(int cus_id,double sum, String status, String date) throws Exception {

		DB temp = new DB();
		Connection con = temp.getConnection();
		ResultSet rs1;
		PreparedStatement stmt = null;
		Order found = null;
		try {
			if (status.equals("new")) {
				String findQuery= "SELECT * FROM Order1 WHERE cus_id= (?) AND totalsum = (?) AND orderdate = (?) AND status = (?);";
				stmt = con.prepareStatement(findQuery);
				stmt.setInt(1,cus_id);
				stmt.setDouble(2,sum);
				stmt.setString(3,date);
				stmt.setString(4,"new");
				rs1 = stmt.executeQuery();
				if(rs1.next()){
					found = new Order(rs1.getInt("order_id"),rs1.getInt("cus_id"),rs1.getString("orderDate"),rs1.getDouble("totalsum"),rs1.getString("status"),rs1.getString("payment"));
				}
				rs1.close();
				return found;
			}

		} catch (Exception e) {

			con.close();
			throw new Exception("An error occured while finding the Order: " + e.getMessage());
		}
		return found;
	}

	//Find orders with cus_id
	public List<Order> getOrders(int cus_id,String status) throws Exception {

			DB temp = new DB();
			Connection con = temp.getConnection();
			ResultSet rs2;
			PreparedStatement stmt = null;
			List<Order> found = new ArrayList<Order>();
			try {
					String findOrders= "SELECT * FROM Order1 WHERE cus_id= (?) AND status = (?);";
					stmt = con.prepareStatement(findOrders);
					stmt.setInt(1,cus_id);
					stmt.setString(2,status);
					rs2 = stmt.executeQuery();
					while(rs2.next()){
						found.add( new Order(rs2.getInt("order_id"),rs2.getInt("cus_id"),rs2.getString("orderDate"),rs2.getDouble("totalsum"),rs2.getString("status"),rs2.getString("payment")));
					}
					rs2.close();
					return found;
			} catch (Exception e) {

				con.close();
				throw new Exception("An error occured while getting the Orders: " + e.getMessage());
			}
		}


	//Insert in orderitems the cart

	public void insertProducts(int order_id,String product_id,int quantity) throws Exception{
		DB temp = new DB();
		Connection con = temp.getConnection();
		PreparedStatement stmt = null;
		try {
			String insertQuery= "INSERT INTO orderitems (OrderCode,product_id,quantity) VALUES(?,?,?);";
			stmt = con.prepareStatement(insertQuery);
			stmt.setInt(1, order_id);
			stmt.setString(2, product_id);
			stmt.setDouble(3,quantity);
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			con.close();
			throw new Exception("An error occured while inserting Products: " + e.getMessage());
		}
	}

	public void closeOrder(int order_id) throws Exception{
		DB temp = new DB();
		Connection con = temp.getConnection();
		PreparedStatement stmt = null;
		try {
			String alertOrder= "UPDATE order1 SET status = 'close' WHERE order_id =(?); ";
			stmt = con.prepareStatement(alertOrder);
			stmt.setInt(1, order_id);
			stmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			con.close();
			throw new Exception("An error occured while closing the order: " + e.getMessage());
		}
	}

}