package com.king.common.utils;

import java.io.File;
import java.io.IOException;

import javax.swing.JFileChooser;

public class ExPortUtilTools {

	 /**
     * 保存文件的时候指定文件名和文件的保存路径
     * @param filename
     * @param path
     * @return
     */
    public static String getDirPath(String filename, File path) {
        JFileChooser parseDir = new JFileChooser();
        parseDir.setCurrentDirectory(path);
        parseDir.setAcceptAllFileFilterUsed(false);
        parseDir.setSelectedFile(new File(filename));
        int result = parseDir.showSaveDialog(null);
        if (result == JFileChooser.APPROVE_OPTION) {
            return parseDir.getSelectedFile().getAbsolutePath();
        } else {
            return "";
        }
    }
    /**
     * 打开文件所在的目录
     *
     * @param destFileName
     * @throws IOException
     */
    public static void openDirFile(String destFileName) throws IOException {
        File file = new File(destFileName);
        java.awt.Desktop.getDesktop().open(file);
        //

    }

}
