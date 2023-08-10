package com.lec.member;

/*
 	자바빈(Java Bean)
 	Java Bean은 속성(필드, 데이터), 변경이벤트, 객체질렬화를 위한 표준이다. 자바빈 규약에 따르는 
 	자바 클래스를 자바빈이라고 한다. 자바빈클래스는 데이터를 저장하는 필드, 데이터를 읽거나 저장할 때 사용하는 메서드등으로 구성된다.
 	
 	자바프로퍼티
 	
 	프로퍼티는 자바빈에 저장되는 값을 말한다. 메서드 이름은 사용해서 프러퍼티의 이름을 결정하게 된다. 프로퍼티의 값을 변경하는 메서드는 프로퍼티 이름중에 첫 문자는 대문자로
 	변환한 문자열 앞에 set(즉, setter)를 붙이고 프로퍼티의 값을 읽어 오는 메서드는 프로퍼티 이름중에 첫 문자 를 대문자로 뱐환(즉, getter)후에 get을 붙인다.
 	
 	읽기 전용 프로퍼티는: getXxx(), isXxx()메서드만 존재하는 프로퍼티
 	읽기/쓰기 프로퍼티는 : get/set/is메서드가 존재하는 프로퍼티
 */

public class Member {
	private static final long seialVersionUID = 8520951597479695593L;
	
	private String id;
	   private String password;
	   private String name;
	   private String registerDate;
	   private String email;
	   
	   
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
	   public String getRegisterDate() {
	      return registerDate;
	   }
	   public void setRegisterDate(String registerDate) {
	      this.registerDate = registerDate;
	   }
	   public String getEmail() {
	      return email;
	   }
	   public void setEmail(String email) {
	      this.email = email;
	   }
}
