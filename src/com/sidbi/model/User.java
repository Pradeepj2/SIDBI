package com.sidbi.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "refid")
	private int refid;

	@Column(name="username")
	private String username;

	@Column(name="password")
	private String password;
	
	@Column(name="is_active")
	private int is_active;

	@Column(name="email")
	private String email;

	@Column(name="mobileno")
	private String mobileno;

	@Column(name="usertype")
	private String usertype;


	@Column (name = "roleId")
	private int roleId;
	
	@Column(name="roles_name")
	private String roles_name;
	
	@Column(name="role_type")
	private String role_type;

	public User() {

	}

	public String getRole_type() {
		return role_type;
	}

	public void setRole_type(String role_type) {
		this.role_type = role_type;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public int getRefid() {
		return refid;
	}

	public void setRefid(int refid) {
		this.refid = refid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getIs_active() {
		return is_active;
	}

	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getUsertype() {
		return usertype;
	}

	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}

	
	public void add(User userRegistration) {
		// TODO Auto-generated method stub
		
	}

	public String getRoles_name() {
		return roles_name;
	}

	public void setRoles_name(String roles_name) {
		this.roles_name = roles_name;
	}

	@Override
	public String toString() {
		return "UserRegistrationModel [refid=" + refid + ", username=" + username + ", password=" + password
				+ ", is_active="
				+ is_active + ", email="
				+ email + ", mobileno=" + mobileno + ", usertype=" + usertype + ", roleId=" + roleId + ", roles_name=" + roles_name
				+ ", role_type=" + role_type + "]";
	}

	public User(int refid, String username, String password,
			int is_active,   String email, String mobileno, String usertype, int roleId, String roles_name,
			String role_type) {
		super();
		this.refid = refid;
		this.username = username;
		this.password = password;
		this.is_active = is_active;
		this.email = email;
		this.mobileno = mobileno;
		this.usertype = usertype;
		this.roleId = roleId;
		this.roles_name = roles_name;
		this.role_type = role_type;
	}



}
