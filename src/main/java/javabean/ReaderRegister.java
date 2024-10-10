package javabean;

import java.sql.*;

public class ReaderRegister {

    public String login(String user, String psw,String name) throws ClassNotFoundException, SQLException {

        if (user == null || user.trim().equals("")) {
            return "账号不能为空";
        } else if (psw == null || psw.trim().equals("")) {
            return "密码不能为空";
        }else if(name == null || name.trim().equals("")){
            return "姓名不能为空";
        }
        Connection connection = Base.getConnection();
        Statement stmt = connection.createStatement();
        String sqlhava = "INSERT INTO borrow_card(id,password,reader,rule_id,status) VALUE("+user+","+psw+","+name+",1,1)";
        int n = stmt.executeUpdate(sqlhava);
        if (n>=1) {
            return "1";
        }
        return "借阅证已存在！";
    }

}
