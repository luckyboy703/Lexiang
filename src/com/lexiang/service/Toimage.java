package com.lexiang.service;
import java.io.IOException;

public class Toimage {

	public static void main(String[] args){

			//��Ƶ�ļ�

	       String videoRealPath=args[0];

	       //��ͼ��·�������·����

	       String imageRealPath=args[1];

	       try{

	           //�����������ļ�

	           Runtime.getRuntime().exec("cmd /c start G:\\ffmpeg\\ffmpeg.bat \""+ videoRealPath + "\" \"" + imageRealPath + "\"");

	       }catch(IOException e){

	           //TODOAuto-generatedcatchblock

	           e.printStackTrace();  

	       }

	}

}