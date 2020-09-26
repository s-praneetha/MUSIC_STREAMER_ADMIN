package in.dao;

import java.util.List;

import in.entity.Admin;

public interface AdminDAO {
	
	List<Admin> get();
	
	boolean save(Admin e);
	
	boolean update(String email,String password);
	 
}
