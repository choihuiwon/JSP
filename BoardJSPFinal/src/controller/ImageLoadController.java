package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelAndView;

public class ImageLoadController implements Controller {

	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) {
		String writer = request.getParameter("writer");
		String file = request.getParameter("file");
		String type = file.substring(file.lastIndexOf(".")+1);
		response.setContentType("image/"+type);
		File path = new File("c:\\fileupload\\" + writer + "\\" + file);
		try {
			FileInputStream fis = new FileInputStream(path);
			ServletOutputStream sos = response.getOutputStream();
			
			byte[] buffer = new byte[1024*1024];
			while(true){
				int size = fis.read(buffer);//읽어온 바이트수
				if(size == -1) break;//더이상 읽을 내용이 없음
				sos.write(buffer,0,size);
				sos.flush();		
			}
			 
			sos.close();
			fis.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
