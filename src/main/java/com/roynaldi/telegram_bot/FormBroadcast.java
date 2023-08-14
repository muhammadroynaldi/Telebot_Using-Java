/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.roynaldi.telegram_bot;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

/**
 *
 * @author m_roynaldi30
 */
public class FormBroadcast extends javax.swing.JFrame {

    private KoneksiMysql koneksi = new KoneksiMysql();
    private MrBots bot = new MrBots();

    public FormBroadcast() throws SQLException {
        initComponents();
        tblBroadcast.getColumnModel().getColumn(0).setMaxWidth(30);
        tblBroadcast.getColumnModel().getColumn(1).setMaxWidth(700);
        tblBroadcast.getColumnModel().getColumn(2).setMaxWidth(100);
        loadId();
        showDataFromDatabase();
        this.setLocationRelativeTo(null);
    }

    void loadId() throws SQLException {
        Connection connection = koneksi.getConnection();
        Statement statement = connection.createStatement();
        String query = "SELECT username FROM member"; // Mengganti "userId" menjadi "username"
        ResultSet resultSet = statement.executeQuery(query);
        while (resultSet.next()) {
            cmbIdMember.addItem(resultSet.getString("username")); // Menggunakan "username" sebagai nilai item ComboBox
        }
    }

//    void loadUserData(String selectedId) {
//        Connection connection = koneksi.getConnection();
//
//        try {
//            String query = "SELECT * FROM member WHERE userId = ?";
//            PreparedStatement statement = connection.prepareStatement(query);
//            statement.setString(1, selectedId);
//            ResultSet resultSet = statement.executeQuery();
//
//            if (resultSet.next()) {
//                // Ambil data yang ingin Anda tampilkan di JTextField
//                String userName = resultSet.getString("username");
//
//                // Setel nilai ke JTextField
//                txtUsername.setText(userName);
//            }
//
//            statement.close();
//            resultSet.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            JOptionPane.showMessageDialog(this, "Terjadi kesalahan saat memuat data pengguna.");
//        }
//    }
    private void showDataFromDatabase() {
        Connection connection = koneksi.getConnection();
        DefaultTableModel model = (DefaultTableModel) tblBroadcast.getModel();
        model.setRowCount(0);

        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM broadcast");

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String message = resultSet.getString("message");
                String username = resultSet.getString("username");
                model.addRow(new Object[]{id, message, username});
            }

            statement.close();
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        tblBroadcast.setModel(model);
    }

    private void saveBroadcastMessage() {
        PreparedStatement stmt;

        try {
            Connection connection = koneksi.getConnection();
            String message = txtMessage.getText();
            String id_member = (String) cmbIdMember.getSelectedItem();
            String query = "INSERT INTO broadcast (message, username) VALUES (?, ?)";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, message);
            stmt.setString(2, id_member);
            stmt.executeUpdate();
            JOptionPane.showMessageDialog(this, "Pesan Broadcast berhasil disimpan ke database");
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Terjadi kesalahan");
        }
    }

    public void sendBroadcast() {
        Connection connection = koneksi.getConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        String message = txtMessage.getText();

        try {
            statement = connection.createStatement();
            String query = "SELECT userId FROM member";
            resultSet = statement.executeQuery(query);

            ArrayList<Long> memberIds = new ArrayList<Long>();
            while (resultSet.next()) {
                long memberId = resultSet.getLong("userId");
                memberIds.add(memberId);
            }

            // Mengirim pesan broadcast ke setiap ID member
            for (long memberId : memberIds) {
                sendMessage(memberId, message);
            }

            JOptionPane.showMessageDialog(this, "Pesan broadcast berhasil dikirim ke semua member.");
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(this, "Terjadi kesalahan saat mengirim pesan broadcast.");
        }
    }
    
//    public void sendBroadcastone() {
//        String message = txtMessage.getText(); // Mendapatkan teks pesan dari JTextField
////        String id_member = (String) cmbIdMember.getSelectedItem();
//
//        Connection connection = koneksi.getConnection();
//        Statement statement = null;
//        ResultSet resultSet = null;
//
//        try {
//            statement = connection.createStatement();
//            String query = "SELECT DISTINCT userId FROM broadcast LIMIT 1";
//            resultSet = statement.executeQuery(query);
//
//            if (resultSet.next()) {
//                long memberId = resultSet.getLong("userId");
//                sendMessage(memberId, message); // Mengirim pesan dengan teks yang diperoleh ke member dengan ID yang ditentukan
//
//                JOptionPane.showMessageDialog(this, "Pesan berhasil dikirim ke member dengan ID " + memberId + ".");
//            } else {
//                JOptionPane.showMessageDialog(this, "Tidak ada member yang tersedia.");
//            }
//        } catch (SQLException ex) {
//            ex.printStackTrace();
//            JOptionPane.showMessageDialog(this, "Terjadi kesalahan saat mengirim pesan.");
//        }
//    }

    public void sendBroadcastone() {
        String message = txtMessage.getText(); // Mendapatkan teks pesan dari JTextField
        String username = (String) cmbIdMember.getSelectedItem(); // Mengambil nilai username dari ComboBox

        Connection connection = koneksi.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            String query = "SELECT userId FROM member WHERE username = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                long memberId = resultSet.getLong("userId");
                sendMessage(memberId, message); // Mengirim pesan dengan teks yang diperoleh ke member dengan ID yang ditentukan

                JOptionPane.showMessageDialog(this, "Pesan berhasil dikirim ke member dengan ID " + memberId + ".");
            } else {
                JOptionPane.showMessageDialog(this, "Tidak ada member yang tersedia.");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Terjadi kesalahan saat mengirim pesan.");
        }
    }

    public void sendMessage(long userId, String message) {
        SendMessage sendMessage = new SendMessage();
        sendMessage.setChatId(String.valueOf(userId));
        sendMessage.setText(message);

        try {
            bot.execute(sendMessage);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    private void deleteDataFromDatabase(int row) {
        DefaultTableModel model = (DefaultTableModel) tblBroadcast.getModel();
        String message = (String) model.getValueAt(row, 1);

        // Tuliskan kode untuk menghapus data dari database berdasarkan keyword
        Connection connection = koneksi.getConnection();
        try {
            String query = "DELETE FROM broadcast WHERE message = ? ";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, message);
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        model.removeRow(row);
        btnHapus.setEnabled(false); // Menonaktifkan tombol "Delete" setelah penghapusan berhasil
    }

    public void deleteAllBroadcastData() {
        Connection connection = koneksi.getConnection();
        Statement statement = null;

        try {
            statement = connection.createStatement();
            String query = "DELETE FROM broadcast";
            int rowsDeleted = statement.executeUpdate(query);

            if (rowsDeleted > 0) {
                JOptionPane.showMessageDialog(this, "Semua data pada kolom broadcast telah dihapus.");
            } else {
                JOptionPane.showMessageDialog(this, "Tidak ada data yang dihapus pada kolom broadcast.");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Terjadi kesalahan saat menghapus data pada kolom broadcast.");
        }
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblBroadcast = new javax.swing.JTable();
        btnSimpanKirim = new javax.swing.JButton();
        btnHapus = new javax.swing.JButton();
        btnHapusSemua = new javax.swing.JButton();
        txtKirim = new javax.swing.JButton();
        btnReload = new javax.swing.JButton();
        btnKeluar = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        cmbIdMember = new javax.swing.JComboBox<>();
        jScrollPane2 = new javax.swing.JScrollPane();
        txtMessage = new javax.swing.JTextArea();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Rockwell", 0, 36)); // NOI18N
        jLabel1.setText("Data Broadcast");

        jLabel3.setText("Broadcast");

        tblBroadcast.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null},
                {null, null, null},
                {null, null, null},
                {null, null, null}
            },
            new String [] {
                "Id_broadcast", "Message", "Username"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblBroadcast.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblBroadcastMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblBroadcast);

        btnSimpanKirim.setBackground(new java.awt.Color(255, 204, 204));
        btnSimpanKirim.setText("Simpan&Kirim");
        btnSimpanKirim.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSimpanKirimActionPerformed(evt);
            }
        });

        btnHapus.setBackground(new java.awt.Color(255, 0, 255));
        btnHapus.setText("Hapus");
        btnHapus.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnHapusActionPerformed(evt);
            }
        });

        btnHapusSemua.setBackground(new java.awt.Color(0, 255, 204));
        btnHapusSemua.setText("Hapus Semua");
        btnHapusSemua.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnHapusSemuaActionPerformed(evt);
            }
        });

        txtKirim.setBackground(new java.awt.Color(255, 102, 102));
        txtKirim.setText("Kirim Semua");
        txtKirim.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtKirimActionPerformed(evt);
            }
        });

        btnReload.setBackground(new java.awt.Color(255, 255, 51));
        btnReload.setText("Reload");
        btnReload.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnReloadActionPerformed(evt);
            }
        });

        btnKeluar.setBackground(new java.awt.Color(255, 0, 0));
        btnKeluar.setText("Keluar");
        btnKeluar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnKeluarActionPerformed(evt);
            }
        });

        jLabel2.setText("Username");

        cmbIdMember.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { " " }));
        cmbIdMember.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                cmbIdMemberMouseClicked(evt);
            }
        });
        cmbIdMember.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                cmbIdMemberActionPerformed(evt);
            }
        });

        txtMessage.setColumns(20);
        txtMessage.setRows(5);
        jScrollPane2.setViewportView(txtMessage);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jScrollPane1)
                        .addContainerGap())
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(jLabel1)
                        .addGap(295, 295, 295))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(13, 13, 13)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jLabel3)
                            .addComponent(jLabel2))
                        .addGap(56, 56, 56)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(cmbIdMember, javax.swing.GroupLayout.PREFERRED_SIZE, 113, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 441, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(btnHapus, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(btnSimpanKirim, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(txtKirim, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(18, 18, 18)
                                        .addComponent(btnReload, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(18, 18, 18)
                                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                            .addComponent(btnKeluar, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                            .addComponent(btnHapusSemua, javax.swing.GroupLayout.DEFAULT_SIZE, 116, Short.MAX_VALUE))))))
                        .addGap(10, 10, 10))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(9, 9, 9)
                .addComponent(jLabel1)
                .addGap(41, 41, 41)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel3)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnSimpanKirim)
                            .addComponent(btnReload))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(txtKirim)
                            .addComponent(btnHapusSemua))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnHapus)
                            .addComponent(btnKeluar))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel2)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(cmbIdMember, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(15, 15, 15))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnHapusActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnHapusActionPerformed
        int selectedRow = tblBroadcast.getSelectedRow();
        if (selectedRow != -1) {
            int confirm = JOptionPane.showConfirmDialog(null, "Apakah Anda yakin ingin menghapus data ini?", "Konfirmasi", JOptionPane.YES_NO_OPTION);
            if (confirm == JOptionPane.YES_OPTION) {
                deleteDataFromDatabase(selectedRow);
            }
        }
    }//GEN-LAST:event_btnHapusActionPerformed

    private void btnSimpanKirimActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSimpanKirimActionPerformed
        saveBroadcastMessage();
        sendBroadcastone();
    }//GEN-LAST:event_btnSimpanKirimActionPerformed

    private void txtKirimActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txtKirimActionPerformed
        sendBroadcast();
    }//GEN-LAST:event_txtKirimActionPerformed

    private void cmbIdMemberMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_cmbIdMemberMouseClicked

    }//GEN-LAST:event_cmbIdMemberMouseClicked

    private void tblBroadcastMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblBroadcastMouseClicked
        int selectedRow = tblBroadcast.getSelectedRow();
        if (selectedRow != -1) {
            btnHapus.setEnabled(true); // Mengaktifkan tombol "Delete" jika ada data terpilih
        } else {
            btnHapus.setEnabled(false); // Menonaktifkan tombol "Delete" jika tidak ada data terpilih
        }
    }//GEN-LAST:event_tblBroadcastMouseClicked

    private void btnReloadActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnReloadActionPerformed
        showDataFromDatabase();
        tblBroadcast.repaint(); //efek refresh
    }//GEN-LAST:event_btnReloadActionPerformed

    private void btnKeluarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnKeluarActionPerformed
        new FormAdmin().setVisible(true);
        dispose();
    }//GEN-LAST:event_btnKeluarActionPerformed

    private void btnHapusSemuaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnHapusSemuaActionPerformed
        int confirm = JOptionPane.showConfirmDialog(null, "Apakah Anda yakin ingin menghapus semua data ini?", "Konfirmasi", JOptionPane.YES_NO_OPTION);
        if (confirm == JOptionPane.YES_OPTION) {
            deleteAllBroadcastData();
        }
    }//GEN-LAST:event_btnHapusSemuaActionPerformed

    private void cmbIdMemberActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_cmbIdMemberActionPerformed
//        // Dapatkan nilai terpilih dari JComboBox
//        String selectedId = (String) cmbIdMember.getSelectedItem();
//
//        // Panggil metode untuk mengisi JTextField dengan data dari database berdasarkan nilai terpilih
//        loadUserData(selectedId);
    }//GEN-LAST:event_cmbIdMemberActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FormBroadcast.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FormBroadcast.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FormBroadcast.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FormBroadcast.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    new FormBroadcast().setVisible(true);
                } catch (SQLException ex) {
                    Logger.getLogger(FormBroadcast.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnHapus;
    private javax.swing.JButton btnHapusSemua;
    private javax.swing.JButton btnKeluar;
    private javax.swing.JButton btnReload;
    private javax.swing.JButton btnSimpanKirim;
    private javax.swing.JComboBox<String> cmbIdMember;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable tblBroadcast;
    private javax.swing.JButton txtKirim;
    private javax.swing.JTextArea txtMessage;
    // End of variables declaration//GEN-END:variables
}
