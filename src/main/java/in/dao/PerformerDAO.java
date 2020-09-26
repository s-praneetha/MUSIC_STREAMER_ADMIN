package in.dao;

import java.util.List;

import in.entity.Performer;

public interface PerformerDAO {
	List<Performer> get();
	
	boolean save(Performer ep);
	
	Performer get(int id);
	
	boolean update(Performer p);
	
	boolean delete(int id);
}
