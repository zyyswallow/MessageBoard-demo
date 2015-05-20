/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import Bean.Message;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

/**
 *
 * @author yanyanzhou
 */
public class MessageDAO {

    private String url;

    public MessageDAO() {
        try {
            String driverName = "com.mysql.jdbc.Driver";
            String userName = "root";
            String userPasswd = "root";
            String dbName = "messageBoard";
            url = "jdbc:mysql://localhost:8889/" + dbName
                    + "?" + "&user=" + userName
                    + "&password=" + userPasswd 
                    + "&useUnicode=true&characterEncoding=utf8";
            System.out.println("url=" + url);
            Class.forName(driverName).newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // search all messages in the databse
    public List<Message> getAllMessages() throws SQLException {
        List<Message> list = new ArrayList<Message>();
        PreparedStatement stmt = null;
        String sqlSelect = "SELECT * From message order by mTime desc";
        System.out.println("sql=" + sqlSelect);
        Connection conn = DriverManager.getConnection(url);
        if (conn == null) {
            System.out.println("conn==null");
            return null;
        }

        stmt = conn.prepareStatement(sqlSelect);
        if (stmt == null) {
            System.out.println("stmt==null");
            return null;
        }
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Message message = new Message();
            message.setMessageID(rs.getInt(1));
            message.setAuthorIP(rs.getString(2));
            message.setTime(rs.getTimestamp(3));
            message.setContent(rs.getString(4));
            list.add(message);
        }
        stmt.close();
        conn.close();
        return list;
    }

    // insert a new message
    public boolean insertMessage(Message newMessage) throws SQLException {
        int ID;
        String IP = newMessage.getAuthorIP();
        Date date = new Date();
        Timestamp time = new Timestamp(date.getTime());
        String content = newMessage.getContent();
        System.out.println("content=" + content);

        PreparedStatement stmt = null;
        Connection conn = DriverManager.getConnection(url);
        if (conn == null) {
            System.out.println("conn==null");
            return false;
        }

        // get the max message ID to generate a ID for the new message
        String getID = new String("SELECT MAX(mID) AS maxID FROM message");
        System.out.println("sql=" + getID);
        stmt = conn.prepareStatement(getID);
        ResultSet rs = stmt.executeQuery();
        if (rs == null) {
            System.out.println("re==null");
        }
        if (rs.next()) {
            ID = rs.getInt("maxID") + 1;
        } else {
            ID = 1;
        }
        System.out.println("ID=" + ID);

        // insert the new message
        String sqlSelect = "INSERT INTO message(mID,IP,mTime,mContent) VALUES ("
                + ID + ",'" + IP + "','" + time + "','" + content + "')";
        System.out.println("sql=" + sqlSelect);

        stmt = conn.prepareStatement(sqlSelect);
        if (stmt == null) {
            System.out.println("stmt==null");
            return false;
        }
        stmt.executeUpdate();
        stmt.close();
        conn.close();
        return true;
    }

}
