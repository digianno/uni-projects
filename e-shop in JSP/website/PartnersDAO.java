package website;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PartnersDAO{

		public List<Partners> getAllPartners() throws Exception {
				DB temp = new DB();
				Connection con = temp.getConnection();
				PreparedStatement stmt = null;
				ResultSet rs;
				try {

							String findPartners= "SELECT * FROM partners;";

							stmt = con.prepareStatement(findPartners);
							rs = stmt.executeQuery();

							List<Partners> partnersList = new ArrayList<Partners>();

							while(rs.next()) {

								partnersList.add( new Partners(rs.getString("part_id"),
										rs.getString("name"), rs.getString("tel"), rs.getString("kind"), rs.getString ("city"),rs.getString("url")));

							}

							return partnersList;

						} catch (Exception e) {

							throw new SQLException("An error occured while getting partners from database: " + e.getMessage());
						}

	}


}