package in.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import in.entity.Performer;
import in.util.AdminDBConnectionUtil;

public class PerformerDAOImpl implements PerformerDAO {
	
	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;
	
	@Override
	public List<Performer> get() {
		
		List<Performer> list = null;
		Performer performer = null;
		try {
			list = new ArrayList<Performer>();
			String sql = "SELECT * FROM tbl_addperformer";
			connection = AdminDBConnectionUtil.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			
			while(resultSet.next()) {
				performer = new Performer();
				performer.setPerformer_id(resultSet.getString("performer_id"));
				performer.setPerformer_name(resultSet.getString("performer_name"));
				performer.setPerformer_description(resultSet.getString("performer_description"));
				list.add(performer);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	@Override
	public boolean save(Performer ep) {
		boolean flag = false;
		try {
			String sql = "INSERT INTO tbl_addperformer(performer_name,performer_description)VALUES"
					+ "('"+ep.getPerformer_name()+"', '"+ep.getPerformer_description()+"')";
			//System.out.println(ep.getPerformer_name());
			connection = AdminDBConnectionUtil.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
			
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
		
	}

	@Override
	public Performer get(int id) {
		
		Performer performer = null;
		try {
			performer = new Performer();
			String sql = "SELECT * from tbl_addperformer WHERE performer_id="+id;
			connection = AdminDBConnectionUtil.openConnection();
			statement  = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()) {
				performer.setPerformer_id(resultSet.getString("performer_id"));
				performer.setPerformer_name(resultSet.getString("performer_name"));
				performer.setPerformer_description(resultSet.getString("performer_description"));
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		System.out.println(performer.getPerformer_name());
		return performer;
		
		
	}

	@Override
	public boolean update(Performer p) {
		
		boolean flag = false;
		try {
			String sql = "update tbl_addperformer set performer_name='"+p.getPerformer_name()+"', "
					+ "performer_description='"+p.getPerformer_description()+"' where performer_id="+p.getPerformer_id();
			connection = AdminDBConnectionUtil.openConnection();
			preparedStatement =  connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;		
	}

	@Override
	public boolean delete(int id) {
		boolean flag = false;
		try {
			String sql = "DELETE from tbl_addperformer where performer_id="+id;
			connection = AdminDBConnectionUtil.openConnection();
			preparedStatement =  connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	
}
