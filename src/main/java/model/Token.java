/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author pratha
 */
public final class Token {

    String key = "37879801743341235475887701929";
    String userID, userName, userType;
    boolean status;

    public Token() {
        ;
    }

    public Token(String Authorization) {
        status = false;
        try {
            String Token = Authorization.substring(9);
            Claims cl = Jwts.parser().setSigningKey(key).parseClaimsJws(Token).getBody();
            setStatus(true);
            setUserID(cl.getId());
            setUserName(cl.getSubject());
            setUserType(cl.getAudience());
        } catch (Exception e) {
            setUserID("");
            setUserName("");
            setUserType("");
        }
    }

    public String get(String userID, String userName, String userType) {
        Date d = new Date();
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        c.add(Calendar.DATE, 1);
        Date expDate = c.getTime();
        String token = Jwts.builder()
                .setId(userID)
                .setSubject(userName)
                .setAudience(userType)
                .claim("roles", "user")
                .setIssuedAt(d)
                .setExpiration(expDate)
                .signWith(SignatureAlgorithm.HS256, key).compact();
        return token;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
