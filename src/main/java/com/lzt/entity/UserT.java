package com.lzt.entity;

public class UserT {
    private Integer id;
    /**
     * �˺�
     */
    private String userName;
    /**
     * ����
     */
    private String password;
    /**
     * ����
     */
    private Integer age;
    /**
     * �Ա�
     */
    private Integer sex;
     /**
      * ����
      */
    private String aihao;
    /**
     * ����
     */
    private String minzu;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getaihao() {
		return aihao;
	}

	public void setaihao(String aihao) {
		this.aihao = aihao;
	}

	public String getminzu() {
		return minzu;
	}

	public void setminzu(String minzu) {
		this.minzu = minzu;
	}

	@Override
	public String toString() {
		return "UserT [id=" + id + ", userName=" + userName + ", password=" + password + ", age=" + age + ", sex=" + sex
				+ ", aihao=" + aihao + ", minzu=" + minzu + "]";
	}
    
}