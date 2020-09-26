package in.entity;

public class Admin {

	
	//Defining fields
	private String AdminId;
	private String username;
	private String email;
	private String password;
	private String code;
	
	//Get getters and setters
	public Admin() {}
	
	public Admin(String AdminId,String username,String email,String code) {
		this.AdminId = AdminId;
		this.username = username;
		this.email=email;
		this.code=code;
				
	}
	
	public Admin(String email,String code) {
		this.email=email;
		this.code=code;
				
	}
	public String getUsername() {
		return username;
	}
	public String getAdminId() {
		return AdminId;
	}
	public void setAdminId(String adminId) {
		AdminId = adminId;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	//toSTring Generation
	@Override
	public String toString() {
		return "Admin [AdminId=" + AdminId + ", username=" + username + ", email=" + email + ", password=" + password
				+ ", code=" + code + "]";
	}
	
	
	
}
