/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AuthorizedSearch.files;

import AuthorizedSearch.FTPcon;
import AuthorizedSearch.PKE.CipherData;
import static AuthorizedSearch.PKE.CipherData.encrypt;
import AuthorizedSearch.PKE.KEYGEN;
import AuthorizedSearch.SQLconnection;
import com.oreilly.servlet.MultipartRequest;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Murthi
 */
@MultipartConfig(maxFileSize = 1048576)
public class Upload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    File file;
    final String filepath = "D:/";
    File file1;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            MultipartRequest m = new MultipartRequest(request, filepath);
            File file = m.getFile("upfile");

            HttpSession user = request.getSession(true);
            String oid = user.getAttribute("oid").toString();
            String oname = user.getAttribute("oname").toString();
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            System.out.println("current Date " + time);
            String key1 = m.getParameter("key1");
            String key2 = m.getParameter("key2");
            String key3 = m.getParameter("key3");
            String filename = file.getName();
            String path = file.getPath();
            String extension = "";

            int f = filename.lastIndexOf('.');
            if (f > 0) {
                extension = filename.substring(f + 1);
            }
            String ftype = extension;
            System.out.println("path " + path);
            InputStream inputStream = new FileInputStream(file);

            Random RANDOM = new SecureRandom();
            int PASSWORD_LENGTH = 8;
            String letters = "ABCD12EFGHIJ34KLMN89OPQRST67UVXYZ5";
            String ENKEY1 = "";
            for (int i = 0; i < PASSWORD_LENGTH; i++) {
                int index = (int) (RANDOM.nextDouble() * letters.length());
                ENKEY1 += letters.substring(index, index + 1);
            }
            String ENKEY = ENKEY1;
            FileOutputStream fos = new FileOutputStream("D:\\Enc_" + file.getName());
            FileInputStream fis = new FileInputStream(new File("D:\\Enc_" + file.getName()));
            CipherData s = new CipherData();
            CipherData.encrypt(ENKEY1, inputStream, fos);
            KEYGEN keyen = new KEYGEN();
            Connection conn = SQLconnection.getconnection();
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            
             File f1 =new File("D:\\Enc_" + file.getName());
             boolean status1 = new FTPcon().upload(f1);
             System.out.println("file.getName() : "+ f1.getName());
             System.out.println("Cloud Status : "+status1);

            try {
                String sql = "insert into uploads(oid, oname, key1, key2, key3, upfile, time,enkey,fname,ftype) values (?, ?, ?, ?, ?, ?,?,?,?,?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, oid);
                statement.setString(2, oname);
                statement.setString(3, key1);
                statement.setString(4, key2);
                statement.setString(5, key3);
                if (fos != null) {
                    statement.setBlob(6, fis);
                }
                statement.setString(7, time);
                statement.setString(8, ENKEY);
                statement.setString(9, filename);
                statement.setString(10, ftype);
                int row = statement.executeUpdate();
                System.out.println("AuthorizedSearch.files.Upload.processRequest()" +row );
                if (row > 0) {

                    ResultSet rs = st.executeQuery("Select * from uploads where oid ='" + oid + "' and time='" + time + "'");
                    rs.next();
                    String fid = rs.getString("id");
                    System.out.println("Fid "+fid);
                    String sql1 = "insert into encindex(oid, fid, key1, key2, key3, fname) values (?, ?, ?, ?, ?, ?)";
                    PreparedStatement statement1 = conn.prepareStatement(sql1);
                    statement1.setString(1, oid);
                    statement1.setString(2, fid);
                    statement1.setString(3, keyen.encrypt(key1.toLowerCase()));
                    statement1.setString(4, keyen.encrypt(key2.toLowerCase()));
                    statement1.setString(5, keyen.encrypt(key3.toLowerCase()));
                    statement1.setString(6, filename);
                    int row1 = statement1.executeUpdate();

                    response.sendRedirect("Upload.jsp?Success");

                } else {
                    response.sendRedirect("Upload.jsp?Failed");

                }
            } catch (SQLException ex) {
                Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (Exception e) {
            out.println(e);
        } catch (Throwable ex) {
            Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public static void encrypt(String key, InputStream is, OutputStream os) throws Throwable {
        encryptOrDecrypt(key, Cipher.ENCRYPT_MODE, is, os);
    }

    public static void decrypt(String key, InputStream is, OutputStream os) throws Throwable {
        encryptOrDecrypt(key, Cipher.DECRYPT_MODE, is, os);
    }

    public static void encryptOrDecrypt(String key, int mode, InputStream is, OutputStream os) throws Throwable {

        DESKeySpec dks = new DESKeySpec(key.getBytes());
        SecretKeyFactory skf = SecretKeyFactory.getInstance("DES");
        SecretKey desKey = skf.generateSecret(dks);
        Cipher cipher = Cipher.getInstance("DES"); // DES/ECB/PKCS5Padding for SunJCE

        if (mode == Cipher.ENCRYPT_MODE) {
            cipher.init(Cipher.ENCRYPT_MODE, desKey);
            CipherInputStream cis = new CipherInputStream(is, cipher);
            doCopy(cis, os);
        } else if (mode == Cipher.DECRYPT_MODE) {
            cipher.init(Cipher.DECRYPT_MODE, desKey);
            CipherOutputStream cos = new CipherOutputStream(os, cipher);
            doCopy(is, cos);
        }
    }

    public static void doCopy(InputStream is, OutputStream os) throws IOException {
        byte[] bytes = new byte[64];
        int numBytes;
        while ((numBytes = is.read(bytes)) != -1) {
            os.write(bytes, 0, numBytes);
        }
        os.flush();
        os.close();
        is.close();
    }

}
