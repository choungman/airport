package model;

public class MemberBean {
	private String ID;
	private String password;
	private String name;
	private String ssn;
	private boolean blackList;
	
	public MemberBean() {
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String isBlackList() {
		String black;
		if(blackList = true) {
			black = "O";
		}
		else {
			black = "X";
		}
		return black;
	}
	public void setBlackList(String black) {
		if(black.equals("O")) {
			blackList = true;
		}
		else {
			blackList = false;
		}
	}
}