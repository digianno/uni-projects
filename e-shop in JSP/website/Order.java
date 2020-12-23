package website;

public class Order {

	public double sum;
	public String date;
	public int cus_id;
	public int order_id;
	public String status;
	public String method;

	public Order(int order_id,int cus_id,String date,double sum,String status,String method){
		this.order_id = order_id;
		this.cus_id = cus_id;
		this.date = date;
		this.sum = sum;
		this.status = status;
		this.method = method;
	}

	public int getOrder_id(){
		return this.order_id;
	}
	public void setOrder_id(int order_id){
		this.order_id = order_id;
	}

	public int getCus_id(){
		return this.cus_id;
	}
	public void setCus_id(int cus_id){
		this.cus_id = cus_id;
	}


	public String getDate(){
		return this.date;
	}
	public void setDate(String date){
		this.date = date;
	}


	public double getSum(){
		return this.sum;
	}
	public void setSum(double sum){
		this.sum = sum;
	}


	public String getStatus(){
		return this.status;
	}
	public void setStatus(String status){
		this.status = status;
	}

	public String getMethod(){
		return this.method;
	}
	public void setMethod(String method){
		this.method = method;
	}
}