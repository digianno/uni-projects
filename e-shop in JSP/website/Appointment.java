

package website;

public class Appointment
{
	public int appo_id;
	public int cus_id;
    public String Description;
    public String Date;
    public String Time;

    public Appointment(final int appo_id, final int cus_id, final String description, final String date, final String time) {
		this.appo_id = appo_id;
        this.cus_id = cus_id;
        this.Description = description;
        this.Date = date;
        this.Time = time;
    }

	public int getAppo_id() {
	        return this.appo_id;
	    }

	 public void setAppo_id(final int appo_id) {
	        this.appo_id = appo_id;
    }

    public int getCus_id() {
		        return this.cus_id;
	}

	public void setCus_id(final int cus_id) {
		        this.cus_id = cus_id;
    }


    public String getDescription() {
        return this.Description;
    }

    public void setDescription(final String description) {
        this.Description = description;
    }

    public String getDate() {
        return this.Date;
    }

    public void setDate(final String date) {
        this.Date = date;
    }

    public String getTime() {
        return this.Time;
    }

    public void setTime(final String time) {
        this.Time = time;
    }


}
