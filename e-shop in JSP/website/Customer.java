
package website;
public class Customer
{
	public int id;
    public String Name;
    public String Surname;
    public String Birthday;
    public String Gender;
    public String Email;
    public String Tel;
    public String Pswd;
    public String Address;
    public String postal_Code;
    public String City;
    public String Country;

    public Customer(final int id, final String name, final String surname, final String birthday, final String gender, final String email, final String tel, final String pswd, final String address, final String postal_Code, final String city, final String country) {
		this.id =id;
        this.Name = name;
        this.Surname = surname;
        this.Birthday = birthday;
        this.Gender = gender;
        this.Email = email;
        this.Tel = tel;
        this.Pswd = pswd;
        this.Address = address;
        this.postal_Code = postal_Code;
        this.City = city;
        this.Country = country;

    }

     public int getID() {
	        return this.id;
	    }
	    public void setID(final int id) {
	        this.id = id;
    }

    public String getName() {
        return this.Name;
    }
    public void setName(final String name) {
        this.Name = name;
    }
    public String getSurname() {
        return this.Surname;
    }
    public void setSurname(final String surname) {
        this.Surname = surname;
    }
    public String getBirthday() {
        return this.Birthday;
    }
    public void setBirthday(final String birthday) {
        this.Birthday = birthday;
    }
    public String getGender() {
        return this.Gender;
    }
    public void setGender(final String gender) {
        this.Gender = gender;
    }
    public String getEmail() {
        return this.Email;
    }
    public void setEmail(final String email) {
        this.Email = email;
    }
    public String getTel() {
        return this.Tel;
    }
    public void setTel(final String tel) {
        this.Tel = tel;
    }
    public String getPswd() {
        return this.Pswd;
    }
    public void setPswd(final String pswd) {
        this.Pswd = pswd;
    }
    public String getAddress() {
        return this.Address;
    }
    public void setAddress(final String address) {
        this.Address = address;
    }
    public String getPostal_Code() {
        return this.postal_Code;
    }
    public void setPostal_Code(final String postal_Code) {
        this.postal_Code = postal_Code;
    }
    public String getCity() {
        return this.City;
    }
    public void setCity(final String city) {
        this.City = city;
    }
    public String getCountry() {
        return this.Country;
    }
    public void setCountry(final String country) {
        this.Country = country;
    }

}
