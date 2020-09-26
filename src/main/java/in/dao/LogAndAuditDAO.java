package in.dao;

public interface LogAndAuditDAO {
	boolean save(String event,String source,String userid);
}
