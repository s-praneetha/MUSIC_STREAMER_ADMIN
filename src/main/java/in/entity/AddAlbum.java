package in.entity;

import java.io.FileInputStream;

public class AddAlbum {
	
	private String album_id;
	private String album_name;
	private String album_type_id;
	private FileInputStream album_image;
	private String album_description;
	private String language;
	
	public String getAlbum_id() {
		return album_id;
	}
	public void setAlbum_id(String album_id) {
		this.album_id = album_id;
	}
	public String getAlbum_name() {
		return album_name;
	}
	public void setAlbum_name(String album_name) {
		this.album_name = album_name;
	}
	public String getAlbum_type_id() {
		return album_type_id;
	}
	public void setAlbum_type_id(String album_type_id) {
		this.album_type_id = album_type_id;
	}

	public FileInputStream getAlbum_image() {
		return album_image;
	}
	public void setAlbum_image(FileInputStream album_image) {
		this.album_image = album_image;
	}
	public String getAlbum_description() {
		return album_description;
	}
	public void setAlbum_description(String album_description) {
		this.album_description = album_description;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	
	@Override
	public String toString() {
		return "AddAlbum [album_id=" + album_id + ", album_name=" + album_name + ", album_type_id=" + album_type_id
				+ ", album_image=" + album_image + ", album_description=" + album_description + ", language=" + language
				+ "]";
	}
	

	

}
