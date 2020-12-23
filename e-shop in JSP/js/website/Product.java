package website;

public class Product {

	private String code;

	private String name;

	private double price;

	private String image;

	private String category;

	private int quantity;

	private double totalprice;

	public Product() {
	}

	public Product(String code,String category, String name, double price, String image, int quantity) {
		this.code = code;
		this.category = category;
		this.name = name;
		this.price = price;
		this.image = image;
		this.quantity = quantity;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCategory() {
		return category;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public double getPrice() {
		return price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
		this.totalprice = quantity * price;
		return totalprice;
	}

}