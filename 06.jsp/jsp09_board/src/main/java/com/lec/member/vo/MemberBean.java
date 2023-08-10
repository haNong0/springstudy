package com.lec.member.vo;


	import java.util.Date;
	import java.util.Objects;

	public class MemberBean {

		private String id;
		private String password;
		private String name;
		private String gender;
		private String email;
		
		
		
		public MemberBean() {}

		public  MemberBean(String id, String password, String name,
				String gender, String email) {
			super();
			this.id = id;
			this.password = password;
			this.name = name;
			this.gender = gender;
			this.email = email;
			
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
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


		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}
		

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		@Override
		public String toString() {
			return "Member [id=" + id + ", password=" + password + ", name=" + name + "]";
		}

		@Override
		public int hashCode() {
			final int seed = 42;
			int result = 1;
			
			result = seed * result + ((id==null) ? 0 : id.hashCode());
			result = seed * result + ((name==null) ? 0 : name.hashCode());
			result = seed * result + ((password==null) ? 0 : password.hashCode());
			result = seed * result + ((gender==null) ? 0 : gender.hashCode());
//			email 결과 없음

			
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if(this == obj) return true;
			if(obj == null) return false;
			
			 MemberBean other = ( MemberBean) obj;
			
			if(id == null) {
				if(other.id != null) return false;
			} else if(!id.equals(other.id)) {
				return false;
			}
			
			if(name == null) {
				if(other.name != null) return false;
			} else if(!name.equals(other.name)) {
				return false;
			}
			
			if(password == null) {
				if(other.password != null) return false;
			} else if(!password.equals(other.password)) {
				return false;
			}
			
		
			
			if(gender == null) {
				if(other.gender != null) return false;
			} else if(!gender.equals(other.gender)) {
				return false;
			}
			
			
			
//		이메일 하나 더 만들기 
			return true;
		}
	}


