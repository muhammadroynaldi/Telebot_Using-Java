/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.roynaldi.telegram_bot;

import java.sql.*;
import java.text.DateFormat;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

/**
 *
 * @author m_roynaldi30
 */
public class FormHistory extends javax.swing.JFrame {

    private KoneksiMysql koneksi = new KoneksiMysql();
//    private MrBots bot = new MrBots();

    /**
     * Creates new form FormHistory
     */
    public FormHistory() {
        initComponents();
        tblLog.getColumnModel().getColumn(0).setMaxWidth(30);
        tblLog.getColumnModel().getColumn(1).setMaxWidth(80);
        tblLog.getColumnModel().getColumn(2).setMaxWidth(430);
        tblLog.getColumnModel().getColumn(3).setMaxWidth(150);
        dateFromLog.setDateFormatString("yyyy-MM-dd");
        dateToLog.setDateFormatString("yyyy-MM-dd");
        this.setLocationRelativeTo(null);
        displayMemberMessages();
    }

    private void displayMemberMessages() {

        try {
            Connection connection = koneksi.getConnection();
            // Query untuk mengambil pesan-pesan dari member
            String query = "SELECT * FROM log";

            // Membuat Statement dan mengeksekusi query
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            // Menghapus data yang ada di JTable
            DefaultTableModel tableModel = (DefaultTableModel) tblLog.getModel();
            tableModel.setRowCount(0);

            // Menampilkan pesan-pesan yang sudah dikirim oleh member di JTable
            while (resultSet.next()) {
                int logId = resultSet.getInt("id");
//                long memberId = resultSet.getLong("userId");
//                int keyId = resultSet.getInt("keyword_id");
//                int WmId = resultSet.getInt("welcome_message_id");
                String typeMessage = resultSet.getString("tipe_pesan");
                String logMessage = resultSet.getString("pesan");
                Timestamp logTimestamp = resultSet.getTimestamp("waktu");

                Object[] rowData = {logId, typeMessage, logMessage, logTimestamp};
                tableModel.addRow(rowData);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    void filterLog() {
        DefaultTableModel tableModel = (DefaultTableModel) tblLog.getModel();
        tableModel.setRowCount(0); //reset data
        SimpleDateFormat inputFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.ENGLISH);
        inputFormat.setTimeZone(TimeZone.getTimeZone("WIB"));
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

        Date dateFrom = dateFromLog.getDate();
        Date dateTo = dateToLog.getDate();
        String stringFrom = outputFormat.format(dateFrom);
        String stringTo = outputFormat.format(dateTo);

        try {
            Connection connection = koneksi.getConnection();
            // Query untuk mengambil data log berdasarkan rentang tanggal
            String query = "SELECT * FROM log WHERE waktu >= ? AND waktu <= ?";

            // Membuat PreparedStatement dan mengeksekusi query
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setTimestamp(1, new Timestamp(dateFrom.getTime()));
            statement.setTimestamp(2, new Timestamp(dateTo.getTime()));

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String typeMessage = resultSet.getString("tipe_pesan");
                String logMessage = resultSet.getString("pesan");
                Timestamp logTimestamp = resultSet.getTimestamp("waktu");

                Object[] rowData = {id, typeMessage, logMessage, logTimestamp};
                tableModel.addRow(rowData);
            }
        } catch (SQLException e) {
        }
    }

    public void deleteAllBroadcastData() {
        Connection connection = koneksi.getConnection();
        Statement statement = null;

        try {
            statement = connection.createStatement();
            String query = "DELETE FROM log";
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
        btnHapusSemua = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblLog = new javax.swing.JTable();
        btnKeluar = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        btnCari = new javax.swing.JButton();
        dateFromLog = new com.toedter.calendar.JDateChooser();
        dateToLog = new com.toedter.calendar.JDateChooser();
        jLabel3 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabel1.setFont(new java.awt.Font("Rockwell", 0, 36)); // NOI18N
        jLabel1.setText("History Message");

        btnHapusSemua.setBackground(new java.awt.Color(255, 0, 255));
        btnHapusSemua.setText("Hapus Semua");
        btnHapusSemua.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnHapusSemuaActionPerformed(evt);
            }
        });

        tblLog.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "id", "Tipe Pesan", "Pesan", "waktu"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(tblLog);

        btnKeluar.setBackground(new java.awt.Color(255, 0, 0));
        btnKeluar.setText("Keluar");
        btnKeluar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnKeluarActionPerformed(evt);
            }
        });

        jLabel2.setText("To");

        btnCari.setBackground(new java.awt.Color(204, 204, 0));
        btnCari.setText("Cari");
        btnCari.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCariActionPerformed(evt);
            }
        });

        jLabel3.setText("Filter From");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 63, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(dateFromLog, javax.swing.GroupLayout.PREFERRED_SIZE, 129, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(dateToLog, javax.swing.GroupLayout.PREFERRED_SIZE, 131, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(24, 24, 24)
                        .addComponent(btnCari))
                    .addComponent(btnHapusSemua, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(btnKeluar, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(0, 226, Short.MAX_VALUE)
                .addComponent(jLabel1)
                .addGap(219, 219, 219))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jLabel1)
                .addGap(23, 23, 23)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(btnCari)
                        .addGap(1, 1, 1))
                    .addComponent(dateFromLog, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addComponent(dateToLog, javax.swing.GroupLayout.PREFERRED_SIZE, 22, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(19, 19, 19)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 275, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(btnHapusSemua)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 16, Short.MAX_VALUE)
                .addComponent(btnKeluar)
                .addGap(25, 25, 25))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnHapusSemuaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnHapusSemuaActionPerformed
        deleteAllBroadcastData();
        displayMemberMessages();
        tblLog.repaint();
    }//GEN-LAST:event_btnHapusSemuaActionPerformed

    private void btnKeluarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnKeluarActionPerformed
        new FormAdmin().setVisible(true);
        dispose();
    }//GEN-LAST:event_btnKeluarActionPerformed

    private void btnCariActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCariActionPerformed
        filterLog();
    }//GEN-LAST:event_btnCariActionPerformed

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
            java.util.logging.Logger.getLogger(FormHistory.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FormHistory.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FormHistory.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FormHistory.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FormHistory().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCari;
    private javax.swing.JButton btnHapusSemua;
    private javax.swing.JButton btnKeluar;
    private com.toedter.calendar.JDateChooser dateFromLog;
    private com.toedter.calendar.JDateChooser dateToLog;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblLog;
    // End of variables declaration//GEN-END:variables

    private void getLogEntriesByDateRange(DateFormat startDate, DateFormat endDate) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
