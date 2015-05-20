/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.sql.Timestamp;

/**
 *
 * @author yanyanzhou
 */
public class Message {

    private int messageID;
    private String authorIP;
    private Timestamp time;
    private String content;

    public int getMessageID() {
        return messageID;
    }

    public void setMessageID(int messageID) {
        this.messageID = messageID;
    }

    public String getAuthorIP() {
        return authorIP;
    }

    public void setAuthorIP(String authorIP) {
        this.authorIP = authorIP;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
