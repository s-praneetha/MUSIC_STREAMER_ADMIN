package in.dao;

import java.util.List;

import in.entity.AlbumType;



public interface AlbumTypeDAO {
	List<AlbumType> get();
	
	boolean save(AlbumType at);

	AlbumType get(int id);
	
	boolean update(AlbumType p);
	
	boolean delete(int id);
}
