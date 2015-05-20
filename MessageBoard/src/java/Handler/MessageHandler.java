package Handler;

import Bean.Message;
import Database.MessageDAO;
import java.sql.SQLException;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author yanyanzhou
 */
public class MessageHandler {

    private static final MessageHandler MessageHandler = new MessageHandler();

    private MessageHandler() {

    }

    public static MessageHandler getMessageHandler() {
        return MessageHandler;
    }

    public List<Message> getAllMessages() throws SQLException {
        MessageDAO dao = new MessageDAO();
        List<Message> list = dao.getAllMessages();
        return list;
    }

    public boolean insertMessage(Message newMessage) throws SQLException {
        MessageDAO dao = new MessageDAO();
        return dao.insertMessage(newMessage);
    }
}
