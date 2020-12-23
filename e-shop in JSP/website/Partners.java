package website;

public class Partners{

	String code;
	String name;
	String tel;
	String kind;
	String city;
	String url;

	public Partners(String code,String name,String tel,String kind,String city,String url){
		this.code = code;
		this.name = name;
		this.tel = tel;
		this.kind = kind;
		this.city = city;
		this.url = url;
	}

	public String getCode(){
		return this.code;
	}
	public void setCode(String code){
		this.code = code;
	}
	public String getName(){
			return this.name;
	}
	public void getName(String name){
			this.name = name;
	}
	public String getKind(){
			return this.kind;
	}
	public void setKind(String kind){
			this.kind = kind;
	}
	public String getTel(){
			return this.tel;
	}
	public void setTel(String tel){
			this.tel = tel;
	}
	public String getCity(){
			return this.city;
	}
	public void setCity(String city){
			this.city = city;
	}
	public String getURL(){
			return this.url;
	}
	public void setURL(String url){
			this.url = url;
	}
}