package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.entity.Institute;

public class CodeDAO {

    // Method to retrieve Institute Codes from the database
	public static List<Institute> getInstituteCodes() {
	    List<Institute> instituteCodes = new ArrayList<>();
        String query = "SELECT InstituteCode, InstituteName FROM institutes"; // Modify this query according to your database structure

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String code = rs.getString("InstituteCode");
                String name = rs.getString("InstituteName");
                Institute institute = new Institute(code, name);
                instituteCodes.add(institute);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return instituteCodes;
    }
}