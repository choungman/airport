package beans;

public class CustomerBean {
	private String number;
	private String id;
	private String name;
	private int customerGrade;
	private String birthday;
	
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getCustomerGrade() {
		return customerGrade;
	}
	public void setCustomerGrade(int customerGrade) {
		this.customerGrade = customerGrade;
	}
}