---
title: Passwortbasierte AES-Verschlüsselung in Java
tags:
    - til
lang: de
date: 2023-12-22
---

Hier ein Weg wie man die AES-Verschlüsselung mit Javas hauseigenen Klassen umsetzten kann. Zur Verschlüsselung wird ein IvParameterSpec und ein Salt benötigt. Da diese beim ver- und entschlüsseln identisch sein müssen, müssen diese in Programm gespeichert oder direkt im verschlüsselten Text gespeichert werden.

Der nachfolgende Quelltext nutzt die ersten 16-bits für die IvParameterSpec, die zweiten 16-bits für den Salt und die restlichen Bits für den verschlüsselten Text. So wird nur noch das Password zum Entschlüsseln benötigt.

```java
import javax.crypto.*;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.Scanner;

public class Cipher {

    private static SecretKey getKeyFromPassword(String password, byte[] salt)
            throws NoSuchAlgorithmException, InvalidKeySpecException {
        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
        KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, 65536, 256);
        SecretKey secret = new SecretKeySpec(factory.generateSecret(spec)
                                                    .getEncoded(), "AES");
        return secret;
    }

    public static String encrypt(String plainText, String password)
            throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidAlgorithmParameterException,
            InvalidKeyException, BadPaddingException, IllegalBlockSizeException, InvalidKeySpecException, UnsupportedEncodingException {
        SecureRandom secureRandom = new SecureRandom();

        byte[] iv = new byte[16];
        secureRandom.nextBytes(iv);
        IvParameterSpec ivSpec = new IvParameterSpec(iv);

        byte[] salt = new byte[16];
        secureRandom.nextBytes(salt);

        SecretKey key = getKeyFromPassword(password, salt);
        javax.crypto.Cipher cipher = javax.crypto.Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(javax.crypto.Cipher.ENCRYPT_MODE, key, ivSpec);
        byte[] cipherText = cipher.doFinal(plainText.getBytes("UTF-8"));

        byte[] encryptedData = new byte[iv.length + salt.length + cipherText.length];
        System.arraycopy(iv, 0, encryptedData, 0, iv.length);
        System.arraycopy(salt, 0, encryptedData, iv.length, salt.length);
        System.arraycopy(cipherText, 0, encryptedData, iv.length + salt.length, cipherText.length);
        return Base64.getEncoder()
                     .encodeToString(encryptedData);
    }

    public static String decrypt(String encryptedText, String password)
            throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidAlgorithmParameterException,
            InvalidKeyException, BadPaddingException, IllegalBlockSizeException, InvalidKeySpecException, UnsupportedEncodingException {
        byte[] encryptedData = Base64.getDecoder().decode(encryptedText);

        byte[] iv = new byte[16];
        System.arraycopy(encryptedData, 0, iv, 0, iv.length);
        IvParameterSpec ivSpec = new IvParameterSpec(iv);

        byte[] salt = new byte[16];
        System.arraycopy(encryptedData, iv.length, salt, 0, salt.length);

        SecretKey key = getKeyFromPassword(password, salt);
        javax.crypto.Cipher cipher = javax.crypto.Cipher.getInstance("AES/CBC/PKCS5PADDING");
        cipher.init(javax.crypto.Cipher.DECRYPT_MODE, key, ivSpec);

        byte[] cipherText = new byte[encryptedData.length - 16 - 16];
        System.arraycopy(encryptedData, 32, cipherText, 0, cipherText.length);

        byte[] decryptedText = cipher.doFinal(cipherText);
        return new String(decryptedText, "UTF-8");
    }

    public static void main(String[] args) throws InvalidAlgorithmParameterException, NoSuchPaddingException, IllegalBlockSizeException, UnsupportedEncodingException, NoSuchAlgorithmException, BadPaddingException, InvalidKeySpecException, InvalidKeyException {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Schlüssel:");
        String password = scanner.nextLine().trim();
        System.out.println();

        while(true) {
            System.out.println("Klartext:");
            String text = scanner.nextLine()
                                 .trim();

            if (text.isEmpty()) {
                break;
            }

            System.out.println("Verschlüsselter Text:");
            System.out.println(encrypt(text, password));

            System.out.println();
        }
    }

}
```
