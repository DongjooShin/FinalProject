package kosta.apt.domain.vote;


import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.awt.Graphics2D;

import java.io.File;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;


public class ImageUtil {
	public static final int SAME = -1;
    public static final int RATIO = 0;

    public static void resize(File src, File dest,
                              int width, int height) throws IOException {
        FileInputStream srcIs = null;
        try {
            srcIs = new FileInputStream(src);
            System.out.println("resize:"+src.getAbsolutePath());
            ImageUtil.resize(srcIs, dest, width, height);
        } finally {
            if (srcIs != null) try { srcIs.close(); } catch(IOException ex) {}
        }
    }

    public static void resize(InputStream src, File dest,
                              int width, int height) throws IOException {        //원본파일, 썸네잉로만들 파일이름,크기,크기
        BufferedImage srcImg = ImageIO.read(src);
        int srcWidth = srcImg.getWidth();
        int srcHeight = srcImg.getHeight();

        int destWidth = -1, destHeight = -1;
        System.out.println("resize2:"+dest.getAbsolutePath());
        if (width == SAME) {
            destWidth = srcWidth;
        } else if (width > 0) {
            destWidth = width;
        }

        if (height == SAME) {
            destHeight = srcHeight;
        } else if (height > 0) {
            destHeight = height;
        }

        if (width == RATIO && height == RATIO) {
            destWidth = srcWidth;
            destHeight = srcHeight;
        } else if (width == RATIO) {
            double ratio = ((double)destHeight) / ((double)srcHeight);
            destWidth = (int)((double)srcWidth * ratio);
        } else if (height == RATIO) {
            double ratio = ((double)destWidth) / ((double)srcWidth);
            destHeight = (int)((double)srcHeight * ratio);
        }

        BufferedImage destImg = new BufferedImage(
             destWidth, destHeight, BufferedImage.TYPE_3BYTE_BGR);
        Graphics2D g = destImg.createGraphics();
        g.drawImage(srcImg, 0, 0, destWidth, destHeight, null);

        ImageIO.write(destImg, "jpg", dest);
    }

}
