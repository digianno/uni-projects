package website;

public class Test {
	public static void main(String [ ] args) {
		CustomerDAO cus = new CustomerDAO() ;

		try {
		cus.getAllCustomers();
		} catch (Exception SQLException) {
		System.out.println("Wrong");
		}
	}
}
