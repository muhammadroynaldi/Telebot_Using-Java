/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.roynaldi.telegram_bot;

import datechooser.beans.PermanentBean;
import java.sql.*;
import java.util.ArrayList;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;
import org.telegram.telegrambots.meta.TelegramBotsApi;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.updatesreceivers.DefaultBotSession;
import org.telegram.telegrambots.meta.api.objects.Message;

/**
 *
 * @author m_roynaldi30
 */
public class MrBots extends TelegramLongPollingBot {

    private KoneksiMysql databaseConnector;

    public MrBots() {
        try {
            databaseConnector = new KoneksiMysql();
            run();
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

//    Override
    public void onUpdateReceived(Update update) {
        String messageText = update.getMessage().getText();
        Message message = update.getMessage();
        String username = message.getFrom().getUserName();
        String firstName = message.getFrom().getFirstName();
        String lastName = message.getFrom().getLastName();
        long userId = message.getFrom().getId();
        String tipe_pesan = "Masuk";
        String pesan = message.getText();

        if (!isUserExists(username)) {
            saveUserToDatabase(userId, username, firstName, lastName);
        }
        saveMessagelogmasuk(userId, tipe_pesan, pesan);
        if (messageText.equals("/start")) {
            long chatId = update.getMessage().getChatId();
            String welcomeMessage = getWelcomeMessageFromDatabase();
            saveMessagelogkeluarStart(welcomeMessage);
            sendResponse(chatId, welcomeMessage);
        } else if (messageText.equals("/key")) {
            long chatId = update.getMessage().getChatId();
            String keyMessage = getKeymessage();
            saveMessagelogkeluarKey(keyMessage);
            sendResponse(chatId, keyMessage);
        } else if (!isRecognizedMessage(messageText)) {
            long chatId = update.getMessage().getChatId();
            String keyMessage = getWelcomeMessageById(3);
            sendResponse(chatId, keyMessage);
            saveMessagelogkeluarDefault(keyMessage);
        } else {
            long chatId = update.getMessage().getChatId();
            String response = getMessageByKeyword(messageText);
            saveMessagelogkeluar(chatId, response);
            sendResponse(chatId, response);
        }
    }

    private boolean isRecognizedMessage(String messageText) {
        // Daftar pesan yang dikenali
        String[] recognizedMessages = getMessageKeywords();

        // Memeriksa apakah pesan termasuk dalam daftar pesan yang dikenali
        for (String recognizedMessage : recognizedMessages) {
            if (messageText.equals(recognizedMessage)) {
                return true;
            }
        }

        return false;
    }

    //    Override
    public String getBotUsername() {
        // TODO
        return "your_bots_Username";
    }

    //    Override
    public String getBotToken() {
        // TODO
        return "your_token_bots";
    }

    public void onClosing() {
        databaseConnector.closeConnection();
    }

    public void run() throws TelegramApiException {
        try {
            TelegramBotsApi botsApi = new TelegramBotsApi(DefaultBotSession.class);
            botsApi.registerBot(this);
            System.out.println("Bot telah berhasil dijalankan");
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    private void saveUserToDatabase(long userId, String username, String firstName, String lastName) {
        PreparedStatement stmt = null;

        try {
            Connection connection = databaseConnector.getConnection();
            String query = "INSERT INTO member (userId,username, firstname, lastname) VALUES (?, ?, ?,?)";
            stmt = connection.prepareStatement(query);
            stmt.setLong(1, userId);
            stmt.setString(2, username);
            stmt.setString(3, firstName);
            stmt.setString(4, lastName);

            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
//        } finally {
//            try {
//                if (stmt != null) {
//                    stmt.close();
//                }
//                if (connection != null) {
//                    connection.close();
//                }
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        }
    }

    private boolean isUserExists(String username) {
        boolean exists = false;

        try {
            // Mengecek apakah pengguna sudah ada di database berdasarkan username
            Connection connection = databaseConnector.getConnection();
            String query = "SELECT COUNT(*) FROM member WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                exists = (count > 0);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return exists;
    }

    private void sendResponse(Long chatId, String response) {
        SendMessage message = new SendMessage(Long.toString(chatId), response);
        try {
            // Mengirim pesan keluar
            execute(message);

            // Menyimpan pesan keluar ke dalam log
//            String messageType = "Keluar";
//            saveMessagelogkeluar(chatId, response);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    private void saveMessagelogmasuk(long userId, String tipe_pesan, String pesan) {
        try {
            // Membuat perintah INSERT
            Connection connection = databaseConnector.getConnection();
            String query = "INSERT INTO log ( userId, tipe_pesan, pesan) VALUES ( ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, userId);
            preparedStatement.setString(2, tipe_pesan);
            preparedStatement.setString(3, pesan);
//            preparedStatement.setTimestamp(3,new Timestamp(waktu.getTime()));

            // Menjalankan perintah INSERT
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void saveMessagelogkeluar(Long chatId, String messageText) {
        try {
            // Membuat perintah INSERT
            Connection connection = databaseConnector.getConnection();
            String query = "INSERT INTO log (welcome_message_id, tipe_pesan, pesan) VALUES ((SELECT id FROM keywords WHERE id = ?),?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, chatId);
            preparedStatement.setString(2, "Keluar");
            preparedStatement.setString(3, messageText);

            // Menjalankan perintah INSERT
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void saveMessagelogkeluarStart(String messageText) {
        try {
            // Membuat perintah INSERT
            Connection connection = databaseConnector.getConnection();
            String query = "INSERT INTO log (welcome_message_id, tipe_pesan, pesan) VALUES (?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, 1);
            preparedStatement.setString(2, "Keluar");
            preparedStatement.setString(3, messageText);

            // Menjalankan perintah INSERT
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void saveMessagelogkeluarKey(String messageText) {
        try {
            // Membuat perintah INSERT
            Connection connection = databaseConnector.getConnection();
            String query = "INSERT INTO log (welcome_message_id, tipe_pesan, pesan) VALUES (?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, 2);
            preparedStatement.setString(2, "Keluar");
            preparedStatement.setString(3, messageText);

            // Menjalankan perintah INSERT
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void saveMessagelogkeluarDefault(String messageText) {
        try {
            // Membuat perintah INSERT
            Connection connection = databaseConnector.getConnection();
            String query = "INSERT INTO log (welcome_message_id, tipe_pesan, pesan) VALUES (?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setLong(1, 3);
            preparedStatement.setString(2, "Keluar");
            preparedStatement.setString(3, messageText);

            // Menjalankan perintah INSERT
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private String getWelcomeMessageById(int messageId) {
        String welcomeMessage = "";
        Connection connection = databaseConnector.getConnection();
        try {
            String query = "SELECT message FROM welcome_message WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, messageId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                welcomeMessage = resultSet.getString("message");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return welcomeMessage;
    }

    private String getWelcomeMessageFromDatabase() {
        String welcomeMessage = "";
        Connection connection = databaseConnector.getConnection();
        try {
            String query = "SELECT message FROM welcome_message WHERE id = 1";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                welcomeMessage = resultSet.getString("message");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return welcomeMessage;
    }

    private String getKeymessage() {
        String welcomeMessage = "";
        Connection connection = databaseConnector.getConnection();
        try {
            String query = "SELECT message FROM welcome_message WHERE id = 2";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                welcomeMessage = resultSet.getString("message");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return welcomeMessage;
    }

    private String getDefaultmessage() {
        String welcomeMessage = "";
        Connection connection = databaseConnector.getConnection();
        try {
            String query = "SELECT message FROM welcome_message WHERE id = 3";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                welcomeMessage = resultSet.getString("message");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return welcomeMessage;
    }

    private String[] getMessageKeywords() {
        String[] keywords = null;
        String sql = "SELECT keyword FROM keywords";
        Connection connection = databaseConnector.getConnection();

        try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {

            ArrayList<String> keywordList = new ArrayList<>();
            while (resultSet.next()) {
                String keyword = resultSet.getString("keyword");
                keywordList.add(keyword);
            }

            keywords = keywordList.toArray(new String[0]);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return keywords;
    }

    private String getMessageByKeyword(String keyword) {
        String message = null;
        String sql = "SELECT response FROM keywords WHERE keyword = ?";
        Connection connection = databaseConnector.getConnection();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, keyword);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    message = resultSet.getString("response");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return message;
    }
}
