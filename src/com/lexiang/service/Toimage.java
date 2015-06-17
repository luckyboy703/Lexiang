package com.lexiang.service;
import java.io.IOException;

public class Toimage {

	public static void main(String[] args){

			//视频文件

	       String videoRealPath=args[0];

	       //截图的路径（输出路径）

	       String imageRealPath=args[1];

	       try{

	           //调用批处理文件

	           Runtime.getRuntime().exec("cmd /c start G:\\ffmpeg\\ffmpeg.bat \""+ videoRealPath + "\" \"" + imageRealPath + "\"");

	       }catch(IOException e){

	           //TODOAuto-generatedcatchblock

	           e.printStackTrace();  

	       }

	}

}
